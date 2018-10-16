load("@io_bazel_rules_go//go:def.bzl", "go_library")

go_library(
    name = "go_default_library",
    srcs = ["mock.go"],
    importpath = "sigs.k8s.io/cluster-api-provider-aws/pkg/cloud/aws/actuators/machine/mock_machineiface",
    visibility = ["//visibility:public"],
    deps = [
        "@com_github_golang_mock//gomock:go_default_library",
        "@io_k8s_apimachinery//pkg/apis/meta/v1:go_default_library",
        "@io_k8s_apimachinery//pkg/types:go_default_library",
        "@io_k8s_apimachinery//pkg/watch:go_default_library",
        "@io_k8s_sigs_cluster_api//pkg/apis/cluster/v1alpha1:go_default_library",
    ],
)
