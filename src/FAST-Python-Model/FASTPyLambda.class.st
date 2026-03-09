"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentDeclarator` | `FASTPyTDecoratorExpression` | `expression` | `FASTPyDecorator` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTPyLambda` | `lambdaOwner` | `FASTPyExpression` | |
| `parameters` | `FASTTWithParameters` | `parameterOwner` | `FASTTVariableEntity` | My parameters|



"
Class {
	#name : 'FASTPyLambda',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTDecoratorExpression + FASTTWithParameters',
	#classTraits : 'FASTPyTDecoratorExpression classTrait + FASTTWithParameters classTrait',
	#instVars : [
		'#expression => FMOne type: #FASTPyExpression opposite: #lambdaOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyLambda class >> annotation [

	<FMClass: #Lambda super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyLambda >> expression [
	"Relation named: #expression type: #FASTPyExpression opposite: #lambdaOwner"

	<generated>
	^ expression
]

{ #category : 'accessing' }
FASTPyLambda >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : 'navigation' }
FASTPyLambda >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
