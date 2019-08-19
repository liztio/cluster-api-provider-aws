package main

import (
	"context"
	"fmt"

	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/client-go/tools/clientcmd"
	capav1a1 "sigs.k8s.io/cluster-api-provider-aws/pkg/apis/awsprovider/v1alpha1"
	"sigs.k8s.io/cluster-api/pkg/apis/deprecated/v1alpha1"
	capiv1a1 "sigs.k8s.io/cluster-api/pkg/apis/deprecated/v1alpha1"
	"sigs.k8s.io/controller-runtime/pkg/client"
)

func main() {
	cmd := clientcmd.NewDefaultClientConfigLoadingRules()
	cfg, err := cmd.Load()
	if err != nil {
		panic(err)
	}

	restConfig, err := clientcmd.NewDefaultClientConfig(*cfg, &clientcmd.ConfigOverrides{}).ClientConfig()
	if err != nil {
		panic(err)
	}

	oldscheme := runtime.NewScheme()
	capiv1a1.SchemeBuilder.AddToScheme(oldscheme)
	capav1a1.SchemeBuilder.AddToScheme(oldscheme)

	var cluster v1alpha1.Cluster

	c, err := client.New(restConfig, client.Options{Scheme: oldscheme})

	if err := c.Get(context.Background(), client.ObjectKey{Name: "ponyville", Namespace: "equestria"}, &cluster); err != nil {
		panic(err)
	}

	fmt.Printf("%+v\n", cluster)

}
