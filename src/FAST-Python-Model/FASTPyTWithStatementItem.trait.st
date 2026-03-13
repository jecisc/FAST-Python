"
I represent an entity that can be the item of a with_statement.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentWithClauseItem` | `FASTPyTWithStatementItem` | `items` | `FASTPyWithStatement` | |



"
Trait {
	#name : 'FASTPyTWithStatementItem',
	#instVars : [
		'#parentWithClauseItem => FMOne type: #FASTPyWithStatement opposite: #items'
	],
	#category : 'FAST-Python-Model-Traits',
	#package : 'FAST-Python-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTPyTWithStatementItem classSide >> annotation [

	<FMClass: #TWithStatementItem super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyTWithStatementItem >> parentWithClauseItem [
	"Relation named: #parentWithClauseItem type: #FASTPyWithStatement opposite: #items"

	<generated>
	<container>
	^ parentWithClauseItem
]

{ #category : 'accessing' }
FASTPyTWithStatementItem >> parentWithClauseItem: anObject [

	<generated>
	parentWithClauseItem := anObject
]

{ #category : 'navigation' }
FASTPyTWithStatementItem >> parentWithClauseItemGroup [
	<generated>
	<navigation: 'ParentWithClauseItem'>
	^ MooseSpecializedGroup with: self parentWithClauseItem
]
