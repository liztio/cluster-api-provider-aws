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

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "7519e9e1c716ae3c05bd2d984a42c3b02e690c5df728dc0a84b23f90c355c5a1",
    urls = ["https://github.com/bazelbuild/rules_go/releases/download/0.15.4/rules_go-0.15.4.tar.gz"],
)

load("@io_bazel_rules_go//go:def.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

http_archive(
    name = "bazel_gazelle",
    sha256 = "c0a5739d12c6d05b6c1ad56f2200cb0b57c5a70e03ebd2f7b87ce88cabf09c7b",
    urls = ["https://github.com/bazelbuild/bazel-gazelle/releases/download/0.14.0/bazel-gazelle-0.14.0.tar.gz"],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "git_repository", "go_repository")

gazelle_dependencies()

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "29d109605e0d6f9c892584f07275b8c9260803bf0c6fcb7de2623b2bedc910bd",
    strip_prefix = "rules_docker-0.5.1",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/v0.5.1.tar.gz"],
)

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
    container_repositories = "repositories",
)

container_repositories()

load(
    "@bazel_tools//tools/build_defs/repo:git.bzl",
    "git_repository",
)

container_pull(
    name = "golang-image",
    registry = "registry.hub.docker.com",
    repository = "library/golang",
    tag = "1.10-alpine",
)

go_repository(
    name = "com_github_aws_aws_sdk_go",
    commit = "46fe04784968cd7b54e859fcce45753456f736ac",
    importpath = "github.com/aws/aws-sdk-go",
)

go_repository(
    name = "com_github_awslabs_goformation",
    commit = "d42502ef32a8892bf380256e2f57c6f69190d802",
    importpath = "github.com/awslabs/goformation",
)

go_repository(
    name = "com_github_davecgh_go_spew",
    commit = "8991bc29aa16c548c550c7ff78260e27b9ab7c73",
    importpath = "github.com/davecgh/go-spew",
)

go_repository(
    name = "com_github_emicklei_go_restful",
    commit = "3eb9738c1697594ea6e71a7156a9bb32ed216cf0",
    importpath = "github.com/emicklei/go-restful",
)

go_repository(
    name = "com_github_ghodss_yaml",
    commit = "0ca9ea5df5451ffdf184b4428c902747c2c11cd7",
    importpath = "github.com/ghodss/yaml",
)

go_repository(
    name = "com_github_go_ini_ini",
    commit = "7b294651033cd7d9e7f0d9ffa1b75ed1e198e737",
    importpath = "github.com/go-ini/ini",
)

go_repository(
    name = "com_github_go_logr_logr",
    commit = "9fb12b3b21c5415d16ac18dc5cd42c1cfdd40c4e",
    importpath = "github.com/go-logr/logr",
)

go_repository(
    name = "com_github_go_logr_zapr",
    commit = "7536572e8d55209135cd5e7ccf7fce43dca217ab",
    importpath = "github.com/go-logr/zapr",
)

go_repository(
    name = "com_github_gobuffalo_envy",
    commit = "047ecc927cd0b7d27bab83eb948e120fb7d1ea68",
    importpath = "github.com/gobuffalo/envy",
)

go_repository(
    name = "com_github_gogo_protobuf",
    commit = "636bf0302bc95575d69441b25a2603156ffdddf1",
    importpath = "github.com/gogo/protobuf",
)

go_repository(
    name = "com_github_golang_glog",
    commit = "23def4e6c14b4da8ac2ed8007337bc5eb5007998",
    importpath = "github.com/golang/glog",
)

go_repository(
    name = "com_github_golang_groupcache",
    commit = "6f2cf27854a4a29e3811b0371547be335d411b8b",
    importpath = "github.com/golang/groupcache",
)

go_repository(
    name = "com_github_golang_mock",
    commit = "600781dde9cca80734169b9e969d9054ccc57937",
    importpath = "github.com/golang/mock",
)

go_repository(
    name = "com_github_golang_protobuf",
    commit = "aa810b61a9c79d51363740d207bb46cf8e620ed5",
    importpath = "github.com/golang/protobuf",
)

go_repository(
    name = "com_github_google_btree",
    commit = "4030bb1f1f0c35b30ca7009e9ebd06849dd45306",
    importpath = "github.com/google/btree",
)

go_repository(
    name = "com_github_google_gofuzz",
    commit = "24818f796faf91cd76ec7bddd72458fbced7a6c1",
    importpath = "github.com/google/gofuzz",
)

go_repository(
    name = "com_github_google_uuid",
    commit = "d460ce9f8df2e77fb1ba55ca87fafed96c607494",
    importpath = "github.com/google/uuid",
)

go_repository(
    name = "com_github_googleapis_gnostic",
    commit = "7c663266750e7d82587642f65e60bc4083f1f84e",
    importpath = "github.com/googleapis/gnostic",
)

go_repository(
    name = "com_github_gregjones_httpcache",
    commit = "9cad4c3443a7200dd6400aef47183728de563a38",
    importpath = "github.com/gregjones/httpcache",
)

go_repository(
    name = "com_github_hashicorp_golang_lru",
    commit = "20f1fb78b0740ba8c3cb143a61e86ba5c8669768",
    importpath = "github.com/hashicorp/golang-lru",
)

go_repository(
    name = "com_github_hpcloud_tail",
    commit = "a30252cb686a21eb2d0b98132633053ec2f7f1e5",
    importpath = "github.com/hpcloud/tail",
)

go_repository(
    name = "com_github_imdario_mergo",
    commit = "9f23e2d6bd2a77f959b2bf6acdbefd708a83a4a4",
    importpath = "github.com/imdario/mergo",
)

go_repository(
    name = "com_github_inconshreveable_mousetrap",
    commit = "76626ae9c91c4f2a10f34cad8ce83ea42c93bb75",
    importpath = "github.com/inconshreveable/mousetrap",
)

go_repository(
    name = "com_github_jmespath_go_jmespath",
    commit = "0b12d6b5",
    importpath = "github.com/jmespath/go-jmespath",
)

go_repository(
    name = "com_github_joho_godotenv",
    commit = "23d116af351c84513e1946b527c88823e476be13",
    importpath = "github.com/joho/godotenv",
)

go_repository(
    name = "com_github_json_iterator_go",
    commit = "1624edc4454b8682399def8740d46db5e4362ba4",
    importpath = "github.com/json-iterator/go",
)

go_repository(
    name = "com_github_markbates_inflect",
    commit = "28bf78dadb0f64748ff13a0b6547e4972a5cea64",
    importpath = "github.com/markbates/inflect",
)

go_repository(
    name = "com_github_mattbaird_jsonpatch",
    commit = "81af80346b1a01caae0cbc27fd3c1ba5b11e189f",
    importpath = "github.com/mattbaird/jsonpatch",
)

go_repository(
    name = "com_github_mitchellh_mapstructure",
    commit = "3536a929edddb9a5b34bd6861dc4a9647cb459fe",
    importpath = "github.com/mitchellh/mapstructure",
)

go_repository(
    name = "com_github_modern_go_concurrent",
    commit = "bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94",
    importpath = "github.com/modern-go/concurrent",
)

go_repository(
    name = "com_github_modern_go_reflect2",
    commit = "4b7aa43c6742a2c18fdef89dd197aaae7dac7ccd",
    importpath = "github.com/modern-go/reflect2",
)

go_repository(
    name = "com_github_onsi_ginkgo",
    commit = "3774a09d95489ccaa16032e0770d08ea77ba6184",
    importpath = "github.com/onsi/ginkgo",
)

go_repository(
    name = "com_github_onsi_gomega",
    commit = "7615b9433f86a8bdf29709bf288bc4fd0636a369",
    importpath = "github.com/onsi/gomega",
)

go_repository(
    name = "com_github_pborman_uuid",
    commit = "adf5a7427709b9deb95d29d3fa8a2bf9cfd388f1",
    importpath = "github.com/pborman/uuid",
)

go_repository(
    name = "com_github_petar_gollrb",
    commit = "53be0d36a84c2a886ca057d34b6aa4468df9ccb4",
    importpath = "github.com/petar/GoLLRB",
)

go_repository(
    name = "com_github_peterbourgon_diskv",
    commit = "5f041e8faa004a95c88a202771f4cc3e991971e6",
    importpath = "github.com/peterbourgon/diskv",
)

go_repository(
    name = "com_github_pkg_errors",
    commit = "645ef00459ed84a119197bfb8d8205042c6df63d",
    importpath = "github.com/pkg/errors",
)

go_repository(
    name = "com_github_sanathkr_go_yaml",
    commit = "ed9d249f429b3f5a69f80a7abef6bfce81fef894",
    importpath = "github.com/sanathkr/go-yaml",
)

go_repository(
    name = "com_github_sanathkr_yaml",
    commit = "0ca9ea5df5451ffdf184b4428c902747c2c11cd7",
    importpath = "github.com/sanathkr/yaml",
)

go_repository(
    name = "com_github_spf13_afero",
    commit = "d40851caa0d747393da1ffb28f7f9d8b4eeffebd",
    importpath = "github.com/spf13/afero",
)

go_repository(
    name = "com_github_spf13_cobra",
    commit = "ef82de70bb3f60c65fb8eebacbb2d122ef517385",
    importpath = "github.com/spf13/cobra",
)

go_repository(
    name = "com_github_spf13_pflag",
    commit = "298182f68c66c05229eb03ac171abe6e309ee79a",
    importpath = "github.com/spf13/pflag",
)

go_repository(
    name = "in_gopkg_fsnotify_v1",
    commit = "c2828203cd70a50dcccfb2761f8b1f8ceef9a8e9",
    importpath = "gopkg.in/fsnotify.v1",
    remote = "https://github.com/fsnotify/fsnotify.git",
)

go_repository(
    name = "in_gopkg_inf_v0",
    commit = "d2d2541c53f18d2a059457998ce2876cc8e67cbf",
    importpath = "gopkg.in/inf.v0",
)

go_repository(
    name = "in_gopkg_tomb_v1",
    commit = "dd632973f1e7218eb1089048e0798ec9ae7dceb8",
    importpath = "gopkg.in/tomb.v1",
)

go_repository(
    name = "in_gopkg_yaml_v2",
    commit = "5420a8b6744d3b0345ab293f6fcba19c978f1183",
    importpath = "gopkg.in/yaml.v2",
)

go_repository(
    name = "io_k8s_api",
    build_file_proto_mode = "disable_global",
    commit = "2d6f90ab1293a1fb871cf149423ebb72aa7423aa",
    importpath = "k8s.io/api",
)

go_repository(
    name = "io_k8s_apiextensions_apiserver",
    commit = "408db4a50408e2149acbd657bceb2480c13cb0a4",
    importpath = "k8s.io/apiextensions-apiserver",
)

go_repository(
    name = "io_k8s_apimachinery",
    build_file_proto_mode = "disable_global",
    commit = "103fd098999dc9c0c88536f5c9ad2e5da39373ae",
    importpath = "k8s.io/apimachinery",
)

go_repository(
    name = "io_k8s_client_go",
    commit = "1f13a808da65775f22cbf47862c4e5898d8f4ca1",
    importpath = "k8s.io/client-go",
)

go_repository(
    name = "io_k8s_code_generator",
    commit = "6a2840f5b572addf60da1f63db87e5f03dadd95e",
    importpath = "k8s.io/code-generator",
)

go_repository(
    name = "io_k8s_gengo",
    commit = "4242d8e6c5dba56827bb7bcf14ad11cda38f3991",
    importpath = "k8s.io/gengo",
)

go_repository(
    name = "io_k8s_kube_openapi",
    commit = "9dfdf9be683f61f82cda12362c44c784e0778b56",
    importpath = "k8s.io/kube-openapi",
)

go_repository(
    name = "io_k8s_sigs_cluster_api",
    commit = "c06dd269d1f1927ea3027a0493db4d108199248a",
    importpath = "sigs.k8s.io/cluster-api",
)

# TODO: hack because there's both a bazel directory and a vendor directory
# revisit once https://github.com/bazelbuild/bazel-gazelle/issues/300https://github.com/bazelbuild/bazel-gazelle/issues/300 is complete.
git_repository(
    name = "io_k8s_sigs_controller_runtime",
    commit = "53fc44b56078cd095b11bd44cfa0288ee4cf718f",
    patch_args = ["-p1"],
    # overlay = {
    #     "third_party/BUILD.in": "BUILD.bazel",
    # },
    patches = ["//:third_party/gazelle.patch"],
    remote = "https://github.com/kubernetes-sigs/controller-runtime",
)

go_repository(
    name = "io_k8s_sigs_controller_tools",
    commit = "38b2f3f497ed6b8ea5d2844ecf00c28ac4b5c2c4",
    importpath = "sigs.k8s.io/controller-tools",
)

go_repository(
    name = "io_k8s_sigs_testing_frameworks",
    commit = "5818a3a284a11812aaed11d5ca0bcadec2c50e83",
    importpath = "sigs.k8s.io/testing_frameworks",
)

go_repository(
    name = "org_golang_x_crypto",
    commit = "7c1a557ab941a71c619514f229f0b27ccb0c27cf",
    importpath = "golang.org/x/crypto",
)

go_repository(
    name = "org_golang_x_net",
    commit = "49bb7cea24b1df9410e1712aa6433dae904ff66a",
    importpath = "golang.org/x/net",
)

go_repository(
    name = "org_golang_x_sys",
    commit = "fa43e7bc11baaae89f3f902b2b4d832b68234844",
    importpath = "golang.org/x/sys",
)

go_repository(
    name = "org_golang_x_text",
    commit = "f21a4dfb5e38f5895301dc265a8def02365cc3d0",
    importpath = "golang.org/x/text",
)

go_repository(
    name = "org_golang_x_time",
    commit = "fbb02b2291d28baffd63558aa44b4b56f178d650",
    importpath = "golang.org/x/time",
)

go_repository(
    name = "org_golang_x_tools",
    commit = "a398e557df606a73ba39c8fd09a1b392b2a7ab59",
    importpath = "golang.org/x/tools",
)

go_repository(
    name = "org_uber_go_atomic",
    commit = "1ea20fb1cbb1cc08cbd0d913a96dead89aa18289",
    importpath = "go.uber.org/atomic",
)

go_repository(
    name = "org_uber_go_multierr",
    commit = "3c4937480c32f4c13a875a1829af76c98ca3d40a",
    importpath = "go.uber.org/multierr",
)

go_repository(
    name = "org_uber_go_zap",
    commit = "ff33455a0e382e8a81d14dd7c922020b6b5e7982",
    importpath = "go.uber.org/zap",
)
