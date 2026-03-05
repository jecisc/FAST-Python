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
| `parentConditionalStatement` | `FASTTExpression` | `condition` | `FASTTConditionalStatement` | Optional condition statement where this expression is used|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTTWithArguments` | `argumentOwner` | `FASTTExpression` | My arguments|
| `callee` | `FASTPyCall` | `caller` | `FASTPyExpression` | I represent what is called. Can be a class for an instantiation. A function invocation. A method invocation. The call of the return of a call. The call of something invoked from an array access...|
| `invoked` | `FASTTInvocation` | `invokedIn` | `FASTTNamedEntity` | The name of the behavioural invoked|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyCall',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTTInvocation',
	#classTraits : 'FASTTInvocation classTrait',
	#instVars : [
		'#callee => FMOne type: #FASTPyExpression opposite: #caller'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyCall class >> annotation [

	<FMClass: #Call super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyCall >> callee [
	"Relation named: #callee type: #FASTPyExpression opposite: #caller"

	<generated>
	<FMComment: 'I represent what is called. Can be a class for an instantiation. A function invocation. A method invocation. The call of the return of a call. The call of something invoked from an array access...'>
	^ callee
]

{ #category : 'accessing' }
FASTPyCall >> callee: anObject [

	<generated>
	callee := anObject
]

{ #category : 'navigation' }
FASTPyCall >> calleeGroup [
	<generated>
	<navigation: 'Callee'>
	^ MooseSpecializedGroup with: self callee
]
