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
| `superclasses` | `FASTPyClassDefinition` | `parentClassSuperclass` | `FASTPyTSuperclass` | |
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
	#name : 'FASTPyClassDefinition',
	#superclass : 'FASTPyStatement',
	#traits : 'FASTPyTDefinition + FASTPyTWithTypeParameters',
	#classTraits : 'FASTPyTDefinition classTrait + FASTPyTWithTypeParameters classTrait',
	#instVars : [
		'#superclasses => FMMany type: #FASTPyTSuperclass opposite: #parentClassSuperclass'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyClassDefinition class >> annotation [

	<FMClass: #ClassDefinition super: #FASTPyStatement>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyClassDefinition >> addSuperclass: anObject [
	<generated>
	^ self superclasses add: anObject
]

{ #category : 'testing' }
FASTPyClassDefinition >> isClassDefinition [

	<generated>
	^ true
]

{ #category : 'accessing' }
FASTPyClassDefinition >> superclasses [
	"Relation named: #superclasses type: #FASTPyTSuperclass opposite: #parentClassSuperclass"

	<generated>
	<derived>
	^ superclasses
]

{ #category : 'accessing' }
FASTPyClassDefinition >> superclasses: anObject [

	<generated>
	superclasses value: anObject
]

{ #category : 'navigation' }
FASTPyClassDefinition >> superclassesGroup [
	<generated>
	<navigation: 'Superclasses'>
	^ MooseSpecializedGroup withAll: self superclasses asSet
]
