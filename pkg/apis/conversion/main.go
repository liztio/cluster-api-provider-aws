package conversion

// func main() {
// 	oldscheme := runtime.NewScheme()
// 	capiv1a1.SchemeBuilder.AddToScheme(oldscheme)
// 	capav1a1.SchemeBuilder.AddToScheme(oldscheme)
// 	oldscheme.AddConversionFuncs(runtime.DefaultEmbeddedConversions()...)

// 	codec := serializer.NewCodecFactory(oldscheme)

// 	ds := codec.UniversalDeserializer()

// 	d := streaming.NewDecoder(os.Stdin, ds)

// 	var (
// 		cluster      capiv1a1.Cluster
// 		providerspec capav1a1.AWSClusterProviderSpec
// 	)

// 	if _, _, err := d.Decode(nil, &cluster); err != nil {
// 		panic(err)
// 	}

// 	fmt.Printf("%s\n", cluster.Spec.ProviderSpec.Value.Raw)

// 	_, _, err := ds.Decode(cluster.Spec.ProviderSpec.Value.Raw, nil, &providerspec)
// 	if runtime.IsNotRegisteredError(err) {
// 		if err := yaml.Unmarshal(cluster.Spec.ProviderSpec.Value.Raw, &providerspec); err != nil {
// 			panic(err)
// 		}
// 	} else if err != nil {
// 		panic(err)
// 	}

// 	fmt.Printf("%+v\n", providerspec)
// }
