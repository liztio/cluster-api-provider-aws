# Copyright 2018 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

GOFLAGS += -ldflags '-extldflags "-static"'
GOREBUILD :=
PLATFORM_PREFIX := --platforms=@io_bazel_rules_go//go/toolchain

.PHONY: gendeepcopy

all: generate build images

ifndef FASTBUILD
# If FASTBUILD isn't defined, fully rebuild Go binaries, and always
# run dep ensure
GOREBUILD += -a
.PHONY: vendor
endif

.PHONY: gazelle
gazelle:
	bazel run //:gazelle

vendor:
	dep version || go get -u github.com/golang/dep/cmd/dep
	dep ensure
	./hack/update-bazel.sh

.PHONY: depend-update
depend-update:
	dep version || go get -u github.com/golang/dep/cmd/dep
	dep ensure -update
	./hack/update-bazel.sh

.PHONY: generate
generate: gendeepcopy

.PHONY: gendeepcopy
gendeepcopy: vendor
	go build -o $$GOPATH/bin/deepcopy-gen sigs.k8s.io/cluster-api-provider-aws/vendor/k8s.io/code-generator/cmd/deepcopy-gen
	$$GOPATH/bin/deepcopy-gen \
	  -i ./cloud/aws/providerconfig,./cloud/aws/providerconfig/v1alpha1 \
	  -O zz_generated.deepcopy \
	  -h boilerplate.go.txt

.PHONY: genmocks
genmocks: vendor
	hack/generate-mocks.sh "github.com/aws/aws-sdk-go/service/ec2/ec2iface EC2API" "cloud/aws/services/ec2/mock_ec2iface/mock.go"
	hack/generate-mocks.sh "github.com/aws/aws-sdk-go/service/elb/elbiface ELBAPI" "cloud/aws/services/elb/mock_elbiface/mock.go"
	hack/generate-mocks.sh "sigs.k8s.io/cluster-api/pkg/client/clientset_generated/clientset/typed/cluster/v1alpha1 MachineInterface" "cloud/aws/actuators/machine/mock_machineiface/mock.go"
	hack/generate-mocks.sh "sigs.k8s.io/cluster-api/pkg/client/clientset_generated/clientset/typed/cluster/v1alpha1 ClusterInterface" "cloud/aws/actuators/cluster/mock_clusteriface/mock.go"
	hack/generate-mocks.sh "sigs.k8s.io/cluster-api/pkg/client/clientset_generated/clientset/typed/cluster/v1alpha1 ClusterInterface" "cloud/aws/actuators/cluster/mock_clusteriface/mock.go"
	hack/generate-mocks.sh "sigs.k8s.io/cluster-api-provider-aws/cloud/aws/services EC2Interface" "cloud/aws/services/mocks/ec2.go"
	hack/generate-mocks.sh "sigs.k8s.io/cluster-api-provider-aws/cloud/aws/services ELBInterface" "cloud/aws/services/mocks/elb.go"

.PHONY: build
build: vendor
	bazel build $(PLATFORM_PREFIX):linux_amd64 //cmd/cluster-controller:cluster-controller //cmd/machine-controller:machine-controller
	bazel build //clusterctl:clusterctl //cmd/clusterawsadm

.PHONY: multiarch
multiarch: vendor
	$(MAKE) build_clis_for_arch ARCH=linux_amd64
	$(MAKE) build_clis_for_arch ARCH=darwin_amd64
	$(MAKE) build_clis_for_arch ARCH=windows_amd64
	$(MAKE) build_clis_for_arch ARCH=linux_arm
	$(MAKE) build_clis_for_arch ARCH=linux_arm64

.PHONY: build_clis_for_arch
build_clis_for_arch: vendor
	bazel build --platforms=@io_bazel_rules_go//go/toolchain:$(ARCH) //clusterctl:clusterctl //cmd/clusterawsadm

.PHONY: images
images: vendor
	bazel build $(PLATFORM_PREFIX):linux_amd64  //cmd/cluster-controller:cluster-controller-image
	bazel build $(PLATFORM_PREFIX):linux_amd64  //cmd/machine-controller:machine-controller-image

.PHONY: dev_push
dev_push: vendor cluster-controller-dev-push machine-controller-dev-push

.PHONY: image_dev_push_with_registry
image_dev_push_with_registry: vendor
	bazel run $(PLATFORM_PREFIX):linux_amd64 \
	  //cmd/$(IMAGE):$(IMAGE)-push-dev \
		--define=dev_registry=$(DEV_REGISTRY)  \
		--define=dev_repository=$(IMAGE) \
		--define=dev_repo_prefix=$(DEV_REPO_PREFIX)

.PHONY: image_dev_push
ifeq ($(DEV_REPO_TYPE),GCR)
image_dev_push: vendor
	make image_dev_push_with_registry \
		DEV_REGISTRY=gcr.io \
		DEV_REPO_PREFIX=$(shell gcloud config get-value project)/ \
		IMAGE=$(IMAGE)
endif

ifeq ($(DEV_REPO_TYPE),ECR)
image_dev_push: vendor
	make image_dev_push_with_registry \
		DEV_REGISTRY=$(shell aws sts get-caller-identity | jq .Account -r).dkr.ecr.$(AWS_REGION).amazonaws.com \
		DEV_REPO_PREFIX="" \
		IMAGE=$(IMAGE)
endif

.PHONY: cluster-controller-dev-push
cluster-controller-dev-push:
	$(MAKE) image_dev_push IMAGE=cluster-controller

.PHONY: machine-controller-dev-push
machine-controller-dev-push:
	$(MAKE) image_dev_push IMAGE=machine-controller

check: fmt vet

test: vendor
	go test -race -cover ./cmd/... ./cloud/... ./clusterctl/...

fmt: vendor
	hack/verify-gofmt.sh

vet: vendor
	go vet ./...

lint:
	golint || go get -u golang.org/x/lint/golint
	golint -set_exit_status ./cmd/... ./cloud/... ./clusterctl/...

examples = clusterctl/examples/aws/out/cluster.yaml clusterctl/examples/aws/out/machines.yaml clusterctl/examples/aws/out/provider-components.yaml
templates = clusterctl/examples/aws/cluster.yaml.template clusterctl/examples/aws/machines.yaml.template clusterctl/examples/aws/provider-components.yaml.template
example: $(examples)
$(examples) : envfile $(templates)
	source ./envfile && cd ./clusterctl/examples/aws && ./generate-yaml.sh

envfile: envfile.example
	# create the envfile and exit if the envfile doesn't already exist
	cp -n envfile.example envfile
	echo "\033[0;31mPlease fill out your envfile!\033[0m"
	exit 1

clean:
	rm -rf clusterctl/examples/aws/out

# These should become unnecessary after Bazelification

minikube_build: cluster-controller-minikube-build machine-controller-minikube-build

cluster-controller-minikube-build: vendor
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build $(GOFLAGS) -o cmd/cluster-controller/cluster-controller sigs.k8s.io/cluster-api-provider-aws/cmd/cluster-controller
	$(MAKE) -C cmd/cluster-controller minikube_build

machine-controller-minikube-build: vendor
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build $(GOFLAGS) -o cmd/machine-controller/machine-controller sigs.k8s.io/cluster-api-provider-aws/cmd/machine-controller
	$(MAKE) -C cmd/machine-controller minikube_build
