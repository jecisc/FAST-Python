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
| `statementBlock` | `FASTTWithStatements` | `fastBehaviouralParent` | `FASTTStatementBlock` | Statements block of the behavioural entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : 'FASTPyTDefinition',
	#instVars : [
		'#decorators => FMMany type: #FASTPyDecorator opposite: #definitionOwner'
	],
	#traits : 'FASTTNamedEntity + FASTTWithStatements',
	#classTraits : 'FASTTNamedEntity classTrait + FASTTWithStatements classTrait',
	#category : 'FAST-Python-Model-Traits',
	#package : 'FAST-Python-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTPyTDefinition classSide >> annotation [

	<FMClass: #TDefinition super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyTDefinition >> addDecorator: anObject [
	<generated>
	^ self decorators add: anObject
]

{ #category : 'accessing' }
FASTPyTDefinition >> decorators [
	"Relation named: #decorators type: #FASTPyDecorator opposite: #definitionOwner"

	<generated>
	<derived>
	^ decorators
]

{ #category : 'accessing' }
FASTPyTDefinition >> decorators: anObject [

	<generated>
	decorators value: anObject
]

{ #category : 'navigation' }
FASTPyTDefinition >> decoratorsGroup [
	<generated>
	<navigation: 'Decorators'>
	^ MooseSpecializedGroup withAll: self decorators asSet
]
