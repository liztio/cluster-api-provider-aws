load("@io_bazel_rules_go//go:def.bzl", "go_library")

go_library(
    name = "go_default_library",
    srcs = [
        "actuator.go",
        "annotations.go",
        "security_groups.go",
        "tags.go",
    ],
    importpath = "sigs.k8s.io/cluster-api-provider-aws/pkg/cloud/aws/actuators/machine",
    visibility = ["//visibility:public"],
    deps = [
        "//pkg/apis/awsproviderconfig/v1alpha1:go_default_library",
        "//pkg/cloud/aws/services:go_default_library",
        "//pkg/cloud/aws/services/ec2:go_default_library",
        "//pkg/cloud/aws/services/elb:go_default_library",
        "@com_github_aws_aws_sdk_go//aws:go_default_library",
        "@com_github_aws_aws_sdk_go//aws/session:go_default_library",
        "@com_github_aws_aws_sdk_go//service/ec2:go_default_library",
        "@com_github_aws_aws_sdk_go//service/elb:go_default_library",
        "@com_github_golang_glog//:go_default_library",
        "@com_github_pkg_errors//:go_default_library",
        "@io_k8s_apimachinery//pkg/runtime:go_default_library",
        "@io_k8s_sigs_cluster_api//pkg/apis/cluster/v1alpha1:go_default_library",
        "@io_k8s_sigs_cluster_api//pkg/client/clientset_generated/clientset/typed/cluster/v1alpha1:go_default_library",
        "@io_k8s_sigs_cluster_api//pkg/controller/error:go_default_library",
    ],
)
