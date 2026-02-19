"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPythonClassDefinition',
	#superclass : 'FASTPythonEntity',
	#traits : 'FASTTNamedEntity',
	#classTraits : 'FASTTNamedEntity classTrait',
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
