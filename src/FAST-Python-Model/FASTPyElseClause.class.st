"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `ifStatementOwner` | `FASTPyElseClause` | `elseClause` | `FASTPyTWithElseClause` | |



"
Class {
	#name : 'FASTPyElseClause',
	#superclass : 'FASTPyBlock',
	#instVars : [
		'#ifStatementOwner => FMOne type: #FASTPyTWithElseClause opposite: #elseClause'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyElseClause class >> annotation [

	<FMClass: #ElseClause super: #FASTPyBlock>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyElseClause >> ifStatementOwner [
	"Relation named: #ifStatementOwner type: #FASTPyTWithElseClause opposite: #elseClause"

	<generated>
	<container>
	<derived>
	^ ifStatementOwner
]

{ #category : 'accessing' }
FASTPyElseClause >> ifStatementOwner: anObject [

	<generated>
	ifStatementOwner := anObject
]

{ #category : 'navigation' }
FASTPyElseClause >> ifStatementOwnerGroup [
	<generated>
	<navigation: 'IfStatementOwner'>
	^ MooseSpecializedGroup with: self ifStatementOwner
]
