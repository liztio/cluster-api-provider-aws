load("@io_bazel_rules_go//go:def.bzl", "go_library")

go_library(
    name = "go_default_library",
    srcs = [
        "actuator.go",
        "interfaces.go",
    ],
    importpath = "sigs.k8s.io/cluster-api-provider-aws/cloud/aws/actuators/cluster",
    visibility = ["//visibility:public"],
    deps = [
        "//cloud/aws/providerconfig/v1alpha1:go_default_library",
        "//cloud/aws/services/ec2:go_default_library",
        "//cloud/aws/services/elb:go_default_library",
        "//vendor/github.com/aws/aws-sdk-go/aws:go_default_library",
        "//vendor/github.com/aws/aws-sdk-go/aws/session:go_default_library",
        "//vendor/github.com/aws/aws-sdk-go/service/ec2:go_default_library",
        "//vendor/github.com/aws/aws-sdk-go/service/ec2/ec2iface:go_default_library",
        "//vendor/github.com/aws/aws-sdk-go/service/elb:go_default_library",
        "//vendor/github.com/aws/aws-sdk-go/service/elb/elbiface:go_default_library",
        "//vendor/github.com/golang/glog:go_default_library",
        "//vendor/github.com/pkg/errors:go_default_library",
        "//vendor/k8s.io/apimachinery/pkg/runtime:go_default_library",
        "//vendor/sigs.k8s.io/cluster-api/pkg/apis/cluster/v1alpha1:go_default_library",
        "//vendor/sigs.k8s.io/cluster-api/pkg/client/clientset_generated/clientset/typed/cluster/v1alpha1:go_default_library",
        "//vendor/sigs.k8s.io/cluster-api/pkg/controller/error:go_default_library",
    ],
)
