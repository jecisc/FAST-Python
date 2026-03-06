"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTPyIfClause` | `ifClauseOwner` | `FASTPyExpression` | |



"
Class {
	#name : 'FASTPyIfClause',
	#superclass : 'FASTPyExpression',
	#instVars : [
		'#expression => FMOne type: #FASTPyExpression opposite: #ifClauseOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyIfClause class >> annotation [

	<FMClass: #IfClause super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyIfClause >> expression [
	"Relation named: #expression type: #FASTPyExpression opposite: #ifClauseOwner"

	<generated>
	^ expression
]

{ #category : 'accessing' }
FASTPyIfClause >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : 'navigation' }
FASTPyIfClause >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
