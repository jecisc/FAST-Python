"
My users are expressions that can be in a collection splat. For example in `[ *getList(), 3 ]`, we have a list splat on the call `getList()`. Get list, is the expression of the splat.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentSplat` | `FASTPyTSplatExpression` | `expression` | `FASTPyCollectionSplat` | |



"
Trait {
	#name : 'FASTPyTSplatExpression',
	#instVars : [
		'#parentSplat => FMOne type: #FASTPyCollectionSplat opposite: #expression'
	],
	#category : 'FAST-Python-Model-Traits',
	#package : 'FAST-Python-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTPyTSplatExpression classSide >> annotation [

	<FMClass: #TSplatExpression super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyTSplatExpression >> parentSplat [
	"Relation named: #parentSplat type: #FASTPyCollectionSplat opposite: #expression"

	<generated>
	<container>
	<derived>
	^ parentSplat
]

{ #category : 'accessing' }
FASTPyTSplatExpression >> parentSplat: anObject [

	<generated>
	parentSplat := anObject
]

{ #category : 'navigation' }
FASTPyTSplatExpression >> parentSplatGroup [
	<generated>
	<navigation: 'ParentSplat'>
	^ MooseSpecializedGroup with: self parentSplat
]
