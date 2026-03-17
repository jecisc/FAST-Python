"
In Python a collection (list or dictionary) splat is the unpacking of a collection in a call or in the definition of another definition like `[ *list , 4 ]` or `func(*list)`

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentCaseClause` | `FASTPyTPattern` | `pattern` | `FASTPyCaseClause` | |
| `parentKeywordPatternValue` | `FASTPyTPattern` | `value` | `FASTPyKeywordPattern` | |
| `parentUnionPattern` | `FASTPyTPattern` | `members` | `FASTPyUnionPattern` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTPyCollectionSplat` | `parentSplat` | `FASTPyTSplatExpression` | |



"
Class {
	#name : 'FASTPyCollectionSplat',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTPattern',
	#classTraits : 'FASTPyTPattern classTrait',
	#instVars : [
		'#expression => FMOne type: #FASTPyTSplatExpression opposite: #parentSplat'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyCollectionSplat class >> annotation [

	<FMClass: #CollectionSplat super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyCollectionSplat >> expression [
	"Relation named: #expression type: #FASTPyTSplatExpression opposite: #parentSplat"

	<generated>
	^ expression
]

{ #category : 'accessing' }
FASTPyCollectionSplat >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : 'navigation' }
FASTPyCollectionSplat >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
