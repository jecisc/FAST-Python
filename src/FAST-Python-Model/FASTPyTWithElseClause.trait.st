"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `elseClause` | `FASTPyTWithElseClause` | `ifStatementOwner` | `FASTPyElseClause` | |



"
Trait {
	#name : 'FASTPyTWithElseClause',
	#instVars : [
		'#elseClause => FMOne type: #FASTPyElseClause opposite: #ifStatementOwner'
	],
	#category : 'FAST-Python-Model-Traits',
	#package : 'FAST-Python-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTPyTWithElseClause classSide >> annotation [

	<FMClass: #TWithElseClause super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyTWithElseClause >> elseClause [
	"Relation named: #elseClause type: #FASTPyElseClause opposite: #ifStatementOwner"

	<generated>
	^ elseClause
]

{ #category : 'accessing' }
FASTPyTWithElseClause >> elseClause: anObject [

	<generated>
	elseClause := anObject
]

{ #category : 'navigation' }
FASTPyTWithElseClause >> elseClauseGroup [
	<generated>
	<navigation: 'ElseClause'>
	^ MooseSpecializedGroup with: self elseClause
]
