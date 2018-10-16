load("@io_bazel_rules_go//go:def.bzl", "go_library", "go_test")

go_library(
    name = "go_default_library",
    srcs = [
        "awsclusterproviderconfig_types.go",
        "awsclusterproviderstatus_types.go",
        "awsmachineproviderconfig_types.go",
        "awsmachineproviderstatus_types.go",
        "doc.go",
        "register.go",
        "types.go",
        "zz_generated.deepcopy.go",
    ],
    importpath = "sigs.k8s.io/cluster-api-provider-aws/pkg/apis/awsprovider/v1alpha1",
    visibility = ["//visibility:public"],
    deps = [
        "@io_k8s_api//core/v1:go_default_library",
        "@io_k8s_apimachinery//pkg/apis/meta/v1:go_default_library",
        "@io_k8s_apimachinery//pkg/runtime:go_default_library",
        "@io_k8s_apimachinery//pkg/runtime/schema:go_default_library",
        "@io_k8s_sigs_controller_runtime//pkg/runtime/scheme:go_default_library",
    ],
)

go_test(
    name = "go_default_test",
    srcs = [
        "awsclusterproviderconfig_types_test.go",
        "awsclusterproviderstatus_types_test.go",
        "awsmachineproviderconfig_types_test.go",
        "awsmachineproviderstatus_types_test.go",
        "v1alpha1_suite_test.go",
    ],
    embed = [":go_default_library"],
    deps = [
        "@com_github_onsi_gomega//:go_default_library",
        "@io_k8s_apimachinery//pkg/apis/meta/v1:go_default_library",
        "@io_k8s_apimachinery//pkg/types:go_default_library",
        "@io_k8s_client_go//kubernetes/scheme:go_default_library",
        "@io_k8s_client_go//rest:go_default_library",
        "@io_k8s_sigs_controller_runtime//pkg/client:go_default_library",
        "@io_k8s_sigs_controller_runtime//pkg/envtest:go_default_library",
        "@org_golang_x_net//context:go_default_library",
    ],
)
