package conversion

import (
	corev1 "k8s.io/api/core/v1"

	"github.com/pkg/errors"
	capav1a2 "sigs.k8s.io/cluster-api-provider-aws/api/v1alpha2"
	capav1a1 "sigs.k8s.io/cluster-api-provider-aws/pkg/apis/awsprovider/v1alpha1"
	capiv1a2 "sigs.k8s.io/cluster-api/api/v1alpha2"
	capiv1a1 "sigs.k8s.io/cluster-api/pkg/apis/deprecated/v1alpha1"
	"sigs.k8s.io/yaml"
)

func convertCluster(in *capiv1a1.Cluster) (*capiv1a2.Cluster, *capav1a2.AWSCluster, error) {
	var (
		out    capiv1a2.Cluster
		awsIn  capav1a1.AWSClusterProviderSpec
		awsOut capav1a2.AWSCluster
	)

	if err := capiv1a2.Convert_v1alpha1_Cluster_To_v1alpha2_Cluster(in, &out, nil); err != nil {
		return nil, nil, err
	}

	if in.Spec.ProviderSpec.Value == nil {
		return &out, nil, nil
	}

	if err := yaml.Unmarshal(in.Spec.ProviderSpec.Value.Raw, &awsIn); err != nil {
		return nil, nil, errors.Wrap(err, "couldn't decode ProviderSpec")
	}

	if err := capav1a2.Convert_v1alpha1_AWSClusterProviderSpec_To_v1alpha2_AWSClusterSpec(&awsIn, &awsOut.Spec, nil); err != nil {
		return nil, nil, errors.Wrap(err, "couldn't convert ProviderSpec")
	}

	awsOut.Name = in.Name
	awsOut.Namespace = in.Namespace

	ref := corev1.ObjectReference{
		Name:       awsOut.Name,
		Namespace:  awsOut.Namespace,
		APIVersion: capav1a2.GroupVersion.String(),
		Kind:       "AWSCluster",
	}

	out.Spec.InfrastructureRef = &ref

	return &out, &awsOut, nil
}
