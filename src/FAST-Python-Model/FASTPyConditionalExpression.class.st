"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `condition` | `FASTTWithCondition` | `parentConditional` | `FASTTExpression` | The boolean condition tested|
| `elseExpression` | `FASTPyConditionalExpression` | `conditionalExpressionElseOwner` | `FASTPyExpression` | |
| `thenExpression` | `FASTPyConditionalExpression` | `conditionalExpressionThenOwner` | `FASTPyExpression` | |



"
Class {
	#name : 'FASTPyConditionalExpression',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTTWithCondition',
	#classTraits : 'FASTTWithCondition classTrait',
	#instVars : [
		'#elseExpression => FMOne type: #FASTPyExpression opposite: #conditionalExpressionElseOwner',
		'#thenExpression => FMOne type: #FASTPyExpression opposite: #conditionalExpressionThenOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyConditionalExpression class >> annotation [

	<FMClass: #ConditionalExpression super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyConditionalExpression >> elseExpression [
	"Relation named: #elseExpression type: #FASTPyExpression opposite: #conditionalExpressionElseOwner"

	<generated>
	^ elseExpression
]

{ #category : 'accessing' }
FASTPyConditionalExpression >> elseExpression: anObject [

	<generated>
	elseExpression := anObject
]

{ #category : 'navigation' }
FASTPyConditionalExpression >> elseExpressionGroup [
	<generated>
	<navigation: 'ElseExpression'>
	^ MooseSpecializedGroup with: self elseExpression
]

{ #category : 'accessing' }
FASTPyConditionalExpression >> thenExpression [
	"Relation named: #thenExpression type: #FASTPyExpression opposite: #conditionalExpressionThenOwner"

	<generated>
	^ thenExpression
]

{ #category : 'accessing' }
FASTPyConditionalExpression >> thenExpression: anObject [

	<generated>
	thenExpression := anObject
]

{ #category : 'navigation' }
FASTPyConditionalExpression >> thenExpressionGroup [
	<generated>
	<navigation: 'ThenExpression'>
	^ MooseSpecializedGroup with: self thenExpression
]
