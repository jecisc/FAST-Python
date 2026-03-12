"
My users are expressions that can be in a collection splat. For example in `[ *getList(), 3 ]`, we have a list splat on the call `getList()`. Get list, is the expression of the splat.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentSplat` | `FASTPyTCanBeSplatExpression` | `expression` | `FASTPyCollectionSplat` | |



"
Trait {
	#name : 'FASTPyTCanBeSplatExpression',
	#instVars : [
		'#parentSplat => FMOne type: #FASTPyCollectionSplat opposite: #expression'
	],
	#category : 'FAST-Python-Model-Traits',
	#package : 'FAST-Python-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTPyTCanBeSplatExpression classSide >> annotation [

	<FMClass: #TCanBeSplatExpression super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyTCanBeSplatExpression >> parentSplat [
	"Relation named: #parentSplat type: #FASTPyCollectionSplat opposite: #expression"

	<generated>
	<container>
	<derived>
	^ parentSplat
]

{ #category : 'accessing' }
FASTPyTCanBeSplatExpression >> parentSplat: anObject [

	<generated>
	parentSplat := anObject
]

{ #category : 'navigation' }
FASTPyTCanBeSplatExpression >> parentSplatGroup [
	<generated>
	<navigation: 'ParentSplat'>
	^ MooseSpecializedGroup with: self parentSplat
]
