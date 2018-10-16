load("@io_bazel_rules_go//go:def.bzl", "go_library")

go_library(
    name = "go_default_library",
    srcs = ["certificates.go"],
    importpath = "sigs.k8s.io/cluster-api-provider-aws/pkg/cloud/aws/services/certificates",
    visibility = ["//visibility:public"],
    deps = [
        "@com_github_pkg_errors//:go_default_library",
        "@io_k8s_client_go//tools/clientcmd/api:go_default_library",
    ],
)
