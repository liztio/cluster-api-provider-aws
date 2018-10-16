load("@io_bazel_rules_go//go:def.bzl", "go_library")

go_library(
    name = "go_default_library",
    srcs = [
        "ec2.go",
        "elb.go",
    ],
    importpath = "sigs.k8s.io/cluster-api-provider-aws/pkg/cloud/aws/services/mocks",
    visibility = ["//visibility:public"],
    deps = [
        "//pkg/apis/awsproviderconfig/v1alpha1:go_default_library",
        "@com_github_golang_mock//gomock:go_default_library",
        "@io_k8s_sigs_cluster_api//pkg/apis/cluster/v1alpha1:go_default_library",
    ],
)
