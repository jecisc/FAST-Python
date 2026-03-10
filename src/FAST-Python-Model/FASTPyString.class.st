"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `pairKeyOwner` | `FASTTExpression` | `key` | `FASTPyPair` | |
| `pairValueOwner` | `FASTTExpression` | `value` | `FASTPyPair` | |
| `parentConditional` | `FASTTExpression` | `condition` | `FASTTWithCondition` | Optional condition statement/expression where this expression is used|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `interpolations` | `FASTPyString` | `parentString` | `FASTPyInterpolation` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `primitiveValue` | `String` | nil | The literal itself as found in the source code. We use primitiveValue in order to override value from Object|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyString',
	#superclass : 'FASTPyLiteral',
	#traits : 'FASTTStringLiteral',
	#classTraits : 'FASTTStringLiteral classTrait',
	#instVars : [
		'#interpolations => FMMany type: #FASTPyInterpolation opposite: #parentString'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyString class >> annotation [

	<FMClass: #String super: #FASTPyLiteral>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyString >> addInterpolation: anObject [
	<generated>
	^ self interpolations add: anObject
]

{ #category : 'accessing' }
FASTPyString >> interpolations [
	"Relation named: #interpolations type: #FASTPyInterpolation opposite: #parentString"

	<generated>
	<derived>
	^ interpolations
]

{ #category : 'accessing' }
FASTPyString >> interpolations: anObject [

	<generated>
	interpolations value: anObject
]

{ #category : 'navigation' }
FASTPyString >> interpolationsGroup [
	<generated>
	<navigation: 'Interpolations'>
	^ MooseSpecializedGroup withAll: self interpolations asSet
]
