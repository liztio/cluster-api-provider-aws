load("@io_bazel_rules_go//go:def.bzl", "go_library")

go_library(
    name = "go_default_library",
    srcs = ["interfaces.go"],
    importpath = "sigs.k8s.io/cluster-api-provider-aws/pkg/cloud/aws/services",
    visibility = ["//visibility:public"],
    deps = [
        "//pkg/apis/awsproviderconfig/v1alpha1:go_default_library",
        "@com_github_aws_aws_sdk_go//aws/session:go_default_library",
        "@io_k8s_sigs_cluster_api//pkg/apis/cluster/v1alpha1:go_default_library",
    ],
)
