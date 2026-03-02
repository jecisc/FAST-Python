"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `condition` | `FASTTConditionalStatement` | `parentConditionalStatement` | `FASTTExpression` | The boolean condition tested|
| `elifClauses` | `FASTPyIfStatement` | `ifStatementOwner` | `FASTPyElifClause` | |
| `elseClause` | `FASTPyIfStatement` | `ifStatementOwner` | `FASTPyElseClause` | |
| `thenClause` | `FASTPyIfStatement` | `ifStatementOwner` | `FASTPyThenClause` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyIfStatement',
	#superclass : 'FASTPyEntity',
	#traits : 'FASTTConditionalStatement + FASTTStatement',
	#classTraits : 'FASTTConditionalStatement classTrait + FASTTStatement classTrait',
	#instVars : [
		'#elifClauses => FMMany type: #FASTPyElifClause opposite: #ifStatementOwner',
		'#elseClause => FMOne type: #FASTPyElseClause opposite: #ifStatementOwner',
		'#thenClause => FMOne type: #FASTPyThenClause opposite: #ifStatementOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyIfStatement class >> annotation [

	<FMClass: #IfStatement super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyIfStatement >> addElifClause: anObject [
	<generated>
	^ self elifClauses add: anObject
]

{ #category : 'accessing' }
FASTPyIfStatement >> elifClauses [
	"Relation named: #elifClauses type: #FASTPyElifClause opposite: #ifStatementOwner"

	<generated>
	<derived>
	^ elifClauses
]

{ #category : 'accessing' }
FASTPyIfStatement >> elifClauses: anObject [

	<generated>
	elifClauses value: anObject
]

{ #category : 'navigation' }
FASTPyIfStatement >> elifClausesGroup [
	<generated>
	<navigation: 'ElifClauses'>
	^ MooseSpecializedGroup withAll: self elifClauses asSet
]

{ #category : 'accessing' }
FASTPyIfStatement >> elseClause [
	"Relation named: #elseClause type: #FASTPyElseClause opposite: #ifStatementOwner"

	<generated>
	^ elseClause
]

{ #category : 'accessing' }
FASTPyIfStatement >> elseClause: anObject [

	<generated>
	elseClause := anObject
]

{ #category : 'navigation' }
FASTPyIfStatement >> elseClauseGroup [
	<generated>
	<navigation: 'ElseClause'>
	^ MooseSpecializedGroup with: self elseClause
]

{ #category : 'accessing' }
FASTPyIfStatement >> thenClause [
	"Relation named: #thenClause type: #FASTPyThenClause opposite: #ifStatementOwner"

	<generated>
	^ thenClause
]

{ #category : 'accessing' }
FASTPyIfStatement >> thenClause: anObject [

	<generated>
	thenClause := anObject
]

{ #category : 'navigation' }
FASTPyIfStatement >> thenClauseGroup [
	<generated>
	<navigation: 'ThenClause'>
	^ MooseSpecializedGroup with: self thenClause
]
