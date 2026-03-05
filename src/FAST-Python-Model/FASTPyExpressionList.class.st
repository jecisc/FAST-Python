"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expressions` | `FASTPyExpressionList` | `expressionListOwner` | `FASTPyExpression` | |



"
Class {
	#name : 'FASTPyExpressionList',
	#superclass : 'FASTPyExpression',
	#instVars : [
		'#expressions => FMMany type: #FASTPyExpression opposite: #expressionListOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyExpressionList class >> annotation [

	<FMClass: #ExpressionList super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyExpressionList >> addExpression: anObject [
	<generated>
	^ self expressions add: anObject
]

{ #category : 'accessing' }
FASTPyExpressionList >> expressions [
	"Relation named: #expressions type: #FASTPyExpression opposite: #expressionListOwner"

	<generated>
	<derived>
	^ expressions
]

{ #category : 'accessing' }
FASTPyExpressionList >> expressions: anObject [

	<generated>
	expressions value: anObject
]

{ #category : 'navigation' }
FASTPyExpressionList >> expressionsGroup [
	<generated>
	<navigation: 'Expressions'>
	^ MooseSpecializedGroup withAll: self expressions asSet
]
