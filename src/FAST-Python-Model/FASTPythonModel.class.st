Class {
	#name : 'FASTPythonModel',
	#superclass : 'MooseModel',
	#traits : 'FASTPythonTEntityCreator + FASTTEntityCreator',
	#classTraits : 'FASTPythonTEntityCreator classTrait + FASTTEntityCreator classTrait',
	#category : 'FAST-Python-Model-Model',
	#package : 'FAST-Python-Model',
	#tag : 'Model'
}

{ #category : 'accessing' }
FASTPythonModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' #'FAST-Core-Model')
]

{ #category : 'meta' }
FASTPythonModel class >> annotation [
	<FMClass: #FASTPythonModel super: #MooseModel>
	<package: #'FAST-Python-Model'>
	<generated>
]
