"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `parameterOwner` | `FASTTVariableEntity` | `parameters` | `FASTTWithParameters` | parameterOwner|
| `parentAssignmentExpression` | `FASTTVariableEntity` | `variable` | `FASTTAssignment` | Optional assignment to the variable|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPythonParameter',
	#superclass : 'FASTPythonEntity',
	#traits : 'FASTTVariableEntity',
	#classTraits : 'FASTTVariableEntity classTrait',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPythonParameter class >> annotation [

	<FMClass: #Parameter super: #FASTPythonEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]
