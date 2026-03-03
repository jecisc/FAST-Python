"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `assertOwner` | `FASTPyExpression` | `expression` | `FASTPyAssertStatement` | The assert statement that own the expression (if it's the case)|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `collectionInitializer` | `FASTPyExpression` | `initializers` | `FASTPyCollectionInitializer` | The owner of the expression|
| `deleteOwner` | `FASTPyExpression` | `expression` | `FASTPyDeleteStatement` | The delete statement that own the expression (if it's the case)|
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `forStatementLeftOwner` | `FASTPyExpression` | `right` | `FASTPyForStatement` | The for statement owner (if possible)|
| `forStatementRightOwner` | `FASTPyExpression` | `left` | `FASTPyForStatement` | The for statement owner (if possible)|
| `listSplatOwner` | `FASTPyExpression` | `iterable` | `FASTPyListSplat` | List splat unpacking me (if it's the case)|
| `pairKeyOwner` | `FASTTExpression` | `key` | `FASTPyPair` | |
| `pairValueOwner` | `FASTTExpression` | `value` | `FASTPyPair` | |
| `parentComparisonOperator` | `FASTPyExpression` | `operands` | `FASTPyComparisonOperator` | Parent comparison expression of which I am.|
| `parentConditionalStatement` | `FASTTExpression` | `condition` | `FASTTConditionalStatement` | Optional condition statement where this expression is used|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `parentUnaryOperator` | `FASTPyExpression` | `argument` | `FASTPyTUnaryOperator` | Parent unary operator in which I am.|
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
		'#assertOwner => FMOne type: #FASTPyAssertStatement opposite: #expression',
		'#collectionInitializer => FMOne type: #FASTPyCollectionInitializer opposite: #initializers',
		'#deleteOwner => FMOne type: #FASTPyDeleteStatement opposite: #expression',
		'#forStatementLeftOwner => FMOne type: #FASTPyForStatement opposite: #right',
		'#forStatementRightOwner => FMOne type: #FASTPyForStatement opposite: #left',
		'#listSplatOwner => FMOne type: #FASTPyListSplat opposite: #iterable',
		'#parentComparisonOperator => FMOne type: #FASTPyComparisonOperator opposite: #operands',
		'#parentUnaryOperator => FMOne type: #FASTPyTUnaryOperator opposite: #argument'
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
FASTPyExpression >> assertOwner [
	"Relation named: #assertOwner type: #FASTPyAssertStatement opposite: #expression"

	<generated>
	<FMComment: 'The assert statement that own the expression (if it''s the case)'>
	<container>
	<derived>
	^ assertOwner
]

{ #category : 'accessing' }
FASTPyExpression >> assertOwner: anObject [

	<generated>
	assertOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> assertOwnerGroup [
	<generated>
	<navigation: 'AssertOwner'>
	^ MooseSpecializedGroup with: self assertOwner
]

{ #category : 'accessing' }
FASTPyExpression >> collectionInitializer [
	"Relation named: #collectionInitializer type: #FASTPyCollectionInitializer opposite: #initializers"

	<generated>
	<FMComment: 'The owner of the expression'>
	<container>
	^ collectionInitializer
]

{ #category : 'accessing' }
FASTPyExpression >> collectionInitializer: anObject [

	<generated>
	collectionInitializer := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> collectionInitializerGroup [
	<generated>
	<navigation: 'CollectionInitializer'>
	^ MooseSpecializedGroup with: self collectionInitializer
]

{ #category : 'accessing' }
FASTPyExpression >> deleteOwner [
	"Relation named: #deleteOwner type: #FASTPyDeleteStatement opposite: #expression"

	<generated>
	<FMComment: 'The delete statement that own the expression (if it''s the case)'>
	<container>
	<derived>
	^ deleteOwner
]

{ #category : 'accessing' }
FASTPyExpression >> deleteOwner: anObject [

	<generated>
	deleteOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> deleteOwnerGroup [
	<generated>
	<navigation: 'DeleteOwner'>
	^ MooseSpecializedGroup with: self deleteOwner
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

{ #category : 'accessing' }
FASTPyExpression >> listSplatOwner [
	"Relation named: #listSplatOwner type: #FASTPyListSplat opposite: #iterable"

	<generated>
	<FMComment: 'List splat unpacking me (if it''s the case)'>
	<container>
	<derived>
	^ listSplatOwner
]

{ #category : 'accessing' }
FASTPyExpression >> listSplatOwner: anObject [

	<generated>
	listSplatOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> listSplatOwnerGroup [
	<generated>
	<navigation: 'ListSplatOwner'>
	^ MooseSpecializedGroup with: self listSplatOwner
]

{ #category : 'accessing' }
FASTPyExpression >> parentComparisonOperator [
	"Relation named: #parentComparisonOperator type: #FASTPyComparisonOperator opposite: #operands"

	<generated>
	<FMComment: 'Parent comparison expression of which I am.'>
	<container>
	^ parentComparisonOperator
]

{ #category : 'accessing' }
FASTPyExpression >> parentComparisonOperator: anObject [

	<generated>
	parentComparisonOperator := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentComparisonOperatorGroup [
	<generated>
	<navigation: 'ParentComparisonOperator'>
	^ MooseSpecializedGroup with: self parentComparisonOperator
]

{ #category : 'accessing' }
FASTPyExpression >> parentUnaryOperator [
	"Relation named: #parentUnaryOperator type: #FASTPyTUnaryOperator opposite: #argument"

	<generated>
	<FMComment: 'Parent unary operator in which I am.'>
	<container>
	<derived>
	^ parentUnaryOperator
]

{ #category : 'accessing' }
FASTPyExpression >> parentUnaryOperator: anObject [

	<generated>
	parentUnaryOperator := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentUnaryOperatorGroup [
	<generated>
	<navigation: 'ParentUnaryOperator'>
	^ MooseSpecializedGroup with: self parentUnaryOperator
]
