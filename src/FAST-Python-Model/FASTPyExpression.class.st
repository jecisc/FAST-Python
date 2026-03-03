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
| `forStatementLeftOwner` | `FASTPyExpression` | `right` | `FASTPyForStatement` | The for statement owner (if possible)|
| `forStatementRightOwner` | `FASTPyExpression` | `left` | `FASTPyForStatement` | The for statement owner (if possible)|
| `pairKeyOwner` | `FASTTExpression` | `key` | `FASTPyPair` | |
| `pairValueOwner` | `FASTTExpression` | `value` | `FASTPyPair` | |
| `parentComparisonOperator` | `FASTTExpression` | `operands` | `FASTPyComparisonOperator` | Parent comparison expression of which I am.|
| `parentConditionalStatement` | `FASTTExpression` | `condition` | `FASTTConditionalStatement` | Optional condition statement where this expression is used|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `parentUnaryOperator` | `FASTTExpression` | `argument` | `FASTPyTUnaryOperator` | Parent unary operator in which I am.|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyExpression',
	#superclass : 'FASTPyEntity',
	#traits : 'FASTTExpression + FASTTStatement',
	#classTraits : 'FASTTExpression classTrait + FASTTStatement classTrait',
	#instVars : [
		'#forStatementLeftOwner => FMOne type: #FASTPyForStatement opposite: #right',
		'#forStatementRightOwner => FMOne type: #FASTPyForStatement opposite: #left'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyExpression class >> annotation [

	<FMClass: #Expression super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyExpression >> forStatementLeftOwner [
	"Relation named: #forStatementLeftOwner type: #FASTPyForStatement opposite: #right"

	<generated>
	<FMComment: 'The for statement owner (if possible)'>
	<container>
	<derived>
	^ forStatementLeftOwner
]

{ #category : 'accessing' }
FASTPyExpression >> forStatementLeftOwner: anObject [

	<generated>
	forStatementLeftOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> forStatementLeftOwnerGroup [
	<generated>
	<navigation: 'ForStatementLeftOwner'>
	^ MooseSpecializedGroup with: self forStatementLeftOwner
]

{ #category : 'accessing' }
FASTPyExpression >> forStatementRightOwner [
	"Relation named: #forStatementRightOwner type: #FASTPyForStatement opposite: #left"

	<generated>
	<FMComment: 'The for statement owner (if possible)'>
	<container>
	<derived>
	^ forStatementRightOwner
]

{ #category : 'accessing' }
FASTPyExpression >> forStatementRightOwner: anObject [

	<generated>
	forStatementRightOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> forStatementRightOwnerGroup [
	<generated>
	<navigation: 'ForStatementRightOwner'>
	^ MooseSpecializedGroup with: self forStatementRightOwner
]
