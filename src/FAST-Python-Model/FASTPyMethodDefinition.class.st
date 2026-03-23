"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `decorators` | `FASTPyTDefinition` | `definitionOwner` | `FASTPyDecorator` | |
| `parameters` | `FASTTWithParameters` | `parameterOwner` | `FASTTVariableEntity` | My parameters|
| `statementBlock` | `FASTTWithStatements` | `fastBehaviouralParent` | `FASTTStatementBlock` | Statements block of the behavioural entity|
| `typeParameters` | `FASTPyTWithTypeParameters` | `parentWithTypeParameters` | `FASTPyType` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyMethodDefinition',
	#superclass : 'FASTPyStatement',
	#traits : 'FASTPyTDefinition + FASTPyTWithTypeParameters + FASTTWithParameters',
	#classTraits : 'FASTPyTDefinition classTrait + FASTPyTWithTypeParameters classTrait + FASTTWithParameters classTrait',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyMethodDefinition class >> annotation [

	<FMClass: #MethodDefinition super: #FASTPyStatement>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]
