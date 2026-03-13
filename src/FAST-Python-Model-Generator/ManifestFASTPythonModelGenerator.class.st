"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestFASTPythonModelGenerator',
	#superclass : 'PackageManifest',
	#category : 'FAST-Python-Model-Generator-Manifest',
	#package : 'FAST-Python-Model-Generator',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestFASTPythonModelGenerator class >> ruleLongMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'FAST-Python-Model-Generator')) #'2026-03-13T22:20:00.537523+01:00') )
]
