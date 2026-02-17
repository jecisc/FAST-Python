"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `container` | `FASTTComment` | `comments` | `FASTTWithComments` | Source code entity containing the comment|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `content` | `String` | nil | Content of the comment as a String|

"
Class {
	#name : 'FASTPythonComment',
	#superclass : 'FASTPythonEntity',
	#traits : 'FASTTComment',
	#classTraits : 'FASTTComment classTrait',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPythonComment class >> annotation [

	<FMClass: #Comment super: #FASTPythonEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]
