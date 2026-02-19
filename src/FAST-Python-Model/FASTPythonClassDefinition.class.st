Class {
	#name : 'FASTPythonClassDefinition',
	#superclass : 'FASTPythonEntity',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPythonClassDefinition class >> annotation [

	<FMClass: #ClassDefinition super: #FASTPythonEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'testing' }
FASTPythonClassDefinition >> isClassDefinition [

	<generated>
	^ true
]
