"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `ifStatementOwner` | `FASTPyThenClause` | `thenClause` | `FASTPyIfStatement` | |



"
Class {
	#name : 'FASTPyThenClause',
	#superclass : 'FASTPyBlock',
	#instVars : [
		'#ifStatementOwner => FMOne type: #FASTPyIfStatement opposite: #thenClause'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyThenClause class >> annotation [

	<FMClass: #ThenClause super: #FASTPyBlock>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyThenClause >> ifStatementOwner [
	"Relation named: #ifStatementOwner type: #FASTPyIfStatement opposite: #thenClause"

	<generated>
	<container>
	<derived>
	^ ifStatementOwner
]

{ #category : 'accessing' }
FASTPyThenClause >> ifStatementOwner: anObject [

	<generated>
	ifStatementOwner := anObject
]

{ #category : 'navigation' }
FASTPyThenClause >> ifStatementOwnerGroup [
	<generated>
	<navigation: 'IfStatementOwner'>
	^ MooseSpecializedGroup with: self ifStatementOwner
]
