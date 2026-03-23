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
| `keywords` | `FASTPyClassDefinition` | `parentClassDefinition` | `FASTPyKeywordArgument` | |
| `statementBlock` | `FASTTWithStatements` | `fastBehaviouralParent` | `FASTTStatementBlock` | Statements block of the behavioural entity|
| `superclasses` | `FASTPyClassDefinition` | `parentClassDefinition` | `FASTPyTSuperclass` | |
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
		'#keywords => FMMany type: #FASTPyKeywordArgument opposite: #parentClassDefinition',
		'#superclasses => FMMany type: #FASTPyTSuperclass opposite: #parentClassDefinition'
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
FASTPyClassDefinition >> addKeyword: anObject [
	<generated>
	^ self keywords add: anObject
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
FASTPyClassDefinition >> keywords [
	"Relation named: #keywords type: #FASTPyKeywordArgument opposite: #parentClassDefinition"

	<generated>
	<derived>
	^ keywords
]

{ #category : 'accessing' }
FASTPyClassDefinition >> keywords: anObject [

	<generated>
	keywords value: anObject
]

{ #category : 'navigation' }
FASTPyClassDefinition >> keywordsGroup [
	<generated>
	<navigation: 'Keywords'>
	^ MooseSpecializedGroup withAll: self keywords asSet
]

{ #category : 'accessing' }
FASTPyClassDefinition >> superclasses [
	"Relation named: #superclasses type: #FASTPyTSuperclass opposite: #parentClassDefinition"

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
