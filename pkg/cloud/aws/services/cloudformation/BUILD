load("@io_bazel_rules_go//go:def.bzl", "go_library")

go_library(
    name = "go_default_library",
    srcs = [
        "bootstrap.go",
        "cloudformation.go",
        "service.go",
    ],
    importpath = "sigs.k8s.io/cluster-api-provider-aws/pkg/cloud/aws/services/cloudformation",
    visibility = ["//visibility:public"],
    deps = [
        "//pkg/cloud/aws/services/awserrors:go_default_library",
        "//pkg/cloud/aws/services/iam:go_default_library",
        "@com_github_aws_aws_sdk_go//aws:go_default_library",
        "@com_github_aws_aws_sdk_go//service/cloudformation:go_default_library",
        "@com_github_aws_aws_sdk_go//service/cloudformation/cloudformationiface:go_default_library",
        "@com_github_awslabs_goformation//cloudformation:go_default_library",
        "@com_github_golang_glog//:go_default_library",
        "@com_github_pkg_errors//:go_default_library",
    ],
)
