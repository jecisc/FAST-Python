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
| `returnType` | `FASTPyFunctionDefinition` | `parentFunctionDefinition` | `FASTPyType` | |
| `statementBlock` | `FASTTWithStatements` | `fastBehaviouralParent` | `FASTTStatementBlock` | Statements block of the behavioural entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyFunctionDefinition',
	#superclass : 'FASTPyStatement',
	#traits : 'FASTPyTDefinition',
	#classTraits : 'FASTPyTDefinition classTrait',
	#instVars : [
		'#returnType => FMOne type: #FASTPyType opposite: #parentFunctionDefinition'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyFunctionDefinition class >> annotation [

	<FMClass: #FunctionDefinition super: #FASTPyStatement>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyFunctionDefinition >> returnType [
	"Relation named: #returnType type: #FASTPyType opposite: #parentFunctionDefinition"

	<generated>
	^ returnType
]

{ #category : 'accessing' }
FASTPyFunctionDefinition >> returnType: anObject [

	<generated>
	returnType := anObject
]

{ #category : 'navigation' }
FASTPyFunctionDefinition >> returnTypeGroup [
	<generated>
	<navigation: 'ReturnType'>
	^ MooseSpecializedGroup with: self returnType
]
