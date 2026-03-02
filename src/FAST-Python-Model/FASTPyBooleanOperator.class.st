"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `assertOwner` | `FASTTExpression` | `expression` | `FASTPyAssertStatement` | The assert statement that own the expression (if it's the case)|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `collectionInitializer` | `FASTTExpression` | `initializers` | `FASTPyCollectionInitializer` | The owner of the expression|
| `deleteOwner` | `FASTTExpression` | `expression` | `FASTPyDeleteStatement` | The delete statement that own the expression (if it's the case)|
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `parentComparisonOperator` | `FASTTExpression` | `operands` | `FASTPyComparisonOperator` | Parent comparison expression of which I am.|
| `parentConditionalStatement` | `FASTTExpression` | `condition` | `FASTTConditionalStatement` | Optional condition statement where this expression is used|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentUnaryOperator` | `FASTTExpression` | `argument` | `FASTPyTUnaryOperator` | Parent unary operator in which I am.|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `leftOperand` | `FASTTBinaryExpression` | `parentExpressionLeft` | `FASTTExpression` | left part of a binary expression|
| `rightOperand` | `FASTTBinaryExpression` | `parentExpressionRight` | `FASTTExpression` | left part of the expression|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `operator` | `String` | nil | Binary expression operator|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyBooleanOperator',
	#superclass : 'FASTPyOperator',
	#traits : 'FASTTBinaryExpression',
	#classTraits : 'FASTTBinaryExpression classTrait',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyBooleanOperator class >> annotation [

	<FMClass: #BooleanOperator super: #FASTPyOperator>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]
