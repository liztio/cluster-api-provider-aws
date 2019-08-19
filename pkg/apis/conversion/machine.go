/*
Copyright 2019 The Kubernetes Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package conversion

import (
	"github.com/pkg/errors"

	capav1a2 "sigs.k8s.io/cluster-api-provider-aws/api/v1alpha2"
	capav1a1 "sigs.k8s.io/cluster-api-provider-aws/pkg/apis/awsprovider/v1alpha1"
	capiv1a2 "sigs.k8s.io/cluster-api/api/v1alpha2"
	capiv1a1 "sigs.k8s.io/cluster-api/pkg/apis/deprecated/v1alpha1"
	"sigs.k8s.io/yaml"
)

func convertMachine(in *capiv1a1.Machine) (*capiv1a2.Machine, *capav1a2.AWSMachine, error) {
	var (
		out    capiv1a2.Machine
		awsIn  capav1a1.AWSMachineProviderSpec
		awsOut capav1a2.AWSMachine
	)

	if err := capiv1a2.Convert_v1alpha1_Machine_To_v1alpha2_Machine(in, &out, nil); err != nil {
		return nil, nil, errors.Wrap(err, "failed to CAPI machine")
	}

	if in.Spec.ProviderSpec.Value == nil {
		return &out, nil, nil
	}

	if err := yaml.Unmarshal(in.Spec.ProviderSpec.Value.Raw, &awsIn); err != nil {
		return nil, nil, errors.Wrap(err, "couldn't decode providerSpec")
	}

	if err := capav1a2.Convert_v1alpha1_AWSMachineProviderSpec_To_v1alpha2_AWSMachineSpec(&awsIn, &awsOut.Spec, nil); err != nil {
		return nil, nil, errors.Wrap(err, "couldn't convert ProviderSpec")
	}

	awsOut.Spec.ProviderID = out.Spec.ProviderID

	return &out, &awsOut, nil
}
