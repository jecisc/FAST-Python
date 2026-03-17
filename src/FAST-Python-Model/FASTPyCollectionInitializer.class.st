"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentCaseClause` | `FASTPyTPattern` | `pattern` | `FASTPyCaseClause` | |
| `parentKeywordPatternValue` | `FASTPyTPattern` | `value` | `FASTPyKeywordPattern` | |
| `parentSplat` | `FASTPyTSplatExpression` | `expression` | `FASTPyCollectionSplat` | |
| `parentUnionPattern` | `FASTPyTPattern` | `members` | `FASTPyUnionPattern` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `initializers` | `FASTPyCollectionInitializer` | `collectionInitializer` | `FASTPyExpression` | Each initializer defines one element.|



"
Class {
	#name : 'FASTPyCollectionInitializer',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTPattern + FASTPyTSplatExpression',
	#classTraits : 'FASTPyTPattern classTrait + FASTPyTSplatExpression classTrait',
	#instVars : [
		'#initializers => FMMany type: #FASTPyExpression opposite: #collectionInitializer'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyCollectionInitializer class >> annotation [

	<FMClass: #CollectionInitializer super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyCollectionInitializer >> addInitializer: anObject [
	<generated>
	^ self initializers add: anObject
]

{ #category : 'accessing' }
FASTPyCollectionInitializer >> initializers [
	"Relation named: #initializers type: #FASTPyExpression opposite: #collectionInitializer"

	<generated>
	<FMComment: 'Each initializer defines one element.'>
	<derived>
	^ initializers
]

{ #category : 'accessing' }
FASTPyCollectionInitializer >> initializers: anObject [

	<generated>
	initializers value: anObject
]

{ #category : 'navigation' }
FASTPyCollectionInitializer >> initializersGroup [
	<generated>
	<navigation: 'Initializers'>
	^ MooseSpecializedGroup withAll: self initializers asSet
]
