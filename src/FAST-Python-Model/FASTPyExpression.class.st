"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `assertOwner` | `FASTPyExpression` | `expression` | `FASTPyAssertStatement` | The assert statement that own the expression (if it's the case)|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `attributeObjectOwner` | `FASTPyExpression` | `object` | `FASTPyAttributeAccess` | My parent if I define the object of an attribute access (if it's the case).|
| `caller` | `FASTPyExpression` | `callee` | `FASTPyCall` | The call entity calling me (if it's the case)|
| `collectionInitializer` | `FASTPyExpression` | `initializers` | `FASTPyCollectionInitializer` | The owner of the expression|
| `comprehensionBodyOwner` | `FASTPyExpression` | `body` | `FASTPyTComprehension` | |
| `comprehensionClauseOwner` | `FASTPyExpression` | `clauses` | `FASTPyTComprehension` | |
| `conditionalExpressionElseOwner` | `FASTPyExpression` | `elseExpression` | `FASTPyConditionalExpression` | |
| `conditionalExpressionThenOwner` | `FASTPyExpression` | `thenExpression` | `FASTPyConditionalExpression` | |
| `deleteOwner` | `FASTPyExpression` | `expression` | `FASTPyDeleteStatement` | The delete statement that own the expression (if it's the case)|
| `expressionListOwner` | `FASTPyExpression` | `expressions` | `FASTPyExpressionList` | |
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `forInClauseLeftOwner` | `FASTPyExpression` | `left` | `FASTPyForInClause` | |
| `forInClauseRightOwner` | `FASTPyExpression` | `right` | `FASTPyForInClause` | |
| `forStatementLeftOwner` | `FASTPyExpression` | `right` | `FASTPyForStatement` | The for statement owner (if possible)|
| `forStatementRightOwner` | `FASTPyExpression` | `left` | `FASTPyForStatement` | The for statement owner (if possible)|
| `ifClauseOwner` | `FASTPyExpression` | `expression` | `FASTPyIfClause` | |
| `keywordArgumentOwner` | `FASTPyExpression` | `value` | `FASTPyKeywordArgument` | Keyword argument from which I am the value (if it's the case)|
| `lambdaOwner` | `FASTPyExpression` | `expression` | `FASTPyLambda` | |
| `listSplatOwner` | `FASTPyExpression` | `iterable` | `FASTPyListSplat` | List splat unpacking me (if it's the case)|
| `pairKeyOwner` | `FASTTExpression` | `key` | `FASTPyPair` | |
| `pairValueOwner` | `FASTTExpression` | `value` | `FASTPyPair` | |
| `parentAwait` | `FASTPyExpression` | `expression` | `FASTPyAwait` | |
| `parentComparisonOperator` | `FASTPyExpression` | `operands` | `FASTPyComparisonOperator` | Parent comparison expression of which I am.|
| `parentConditional` | `FASTTExpression` | `condition` | `FASTTWithCondition` | Optional condition statement/expression where this expression is used|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentInterpolation` | `FASTPyExpression` | `expression` | `FASTPyInterpolation` | |
| `parentUnaryOperator` | `FASTPyExpression` | `argument` | `FASTPyTUnaryOperator` | Parent unary operator in which I am.|
| `patternListOwner` | `FASTPyExpression` | `elements` | `FASTPyPatternList` | |
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|
| `subscriptIndiceOwner` | `FASTPyExpression` | `indices` | `FASTPySubscript` | My parent if I am defining an index to select of a subscript (if it's the case)|
| `subscriptValueOwner` | `FASTPyExpression` | `value` | `FASTPySubscript` | My parent if I define the receiver of a subscript (if it's the case).|
| `tuplePatternOwner` | `FASTPyExpression` | `patterns` | `FASTPyTuplePattern` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyExpression',
	#superclass : 'FASTPyStatement',
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#instVars : [
		'#assertOwner => FMOne type: #FASTPyAssertStatement opposite: #expression',
		'#attributeObjectOwner => FMOne type: #FASTPyAttributeAccess opposite: #object',
		'#caller => FMOne type: #FASTPyCall opposite: #callee',
		'#collectionInitializer => FMOne type: #FASTPyCollectionInitializer opposite: #initializers',
		'#comprehensionBodyOwner => FMOne type: #FASTPyTComprehension opposite: #body',
		'#comprehensionClauseOwner => FMOne type: #FASTPyTComprehension opposite: #clauses',
		'#conditionalExpressionElseOwner => FMOne type: #FASTPyConditionalExpression opposite: #elseExpression',
		'#conditionalExpressionThenOwner => FMOne type: #FASTPyConditionalExpression opposite: #thenExpression',
		'#deleteOwner => FMOne type: #FASTPyDeleteStatement opposite: #expression',
		'#expressionListOwner => FMOne type: #FASTPyExpressionList opposite: #expressions',
		'#forInClauseLeftOwner => FMOne type: #FASTPyForInClause opposite: #left',
		'#forInClauseRightOwner => FMOne type: #FASTPyForInClause opposite: #right',
		'#forStatementLeftOwner => FMOne type: #FASTPyForStatement opposite: #right',
		'#forStatementRightOwner => FMOne type: #FASTPyForStatement opposite: #left',
		'#ifClauseOwner => FMOne type: #FASTPyIfClause opposite: #expression',
		'#keywordArgumentOwner => FMOne type: #FASTPyKeywordArgument opposite: #value',
		'#lambdaOwner => FMOne type: #FASTPyLambda opposite: #expression',
		'#listSplatOwner => FMOne type: #FASTPyListSplat opposite: #iterable',
		'#parentAwait => FMOne type: #FASTPyAwait opposite: #expression',
		'#parentComparisonOperator => FMOne type: #FASTPyComparisonOperator opposite: #operands',
		'#parentInterpolation => FMOne type: #FASTPyInterpolation opposite: #expression',
		'#parentUnaryOperator => FMOne type: #FASTPyTUnaryOperator opposite: #argument',
		'#patternListOwner => FMOne type: #FASTPyPatternList opposite: #elements',
		'#subscriptIndiceOwner => FMOne type: #FASTPySubscript opposite: #indices',
		'#subscriptValueOwner => FMOne type: #FASTPySubscript opposite: #value',
		'#tuplePatternOwner => FMOne type: #FASTPyTuplePattern opposite: #patterns'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyExpression class >> annotation [

	<FMClass: #Expression super: #FASTPyStatement>
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
FASTPyExpression >> attributeObjectOwner [
	"Relation named: #attributeObjectOwner type: #FASTPyAttributeAccess opposite: #object"

	<generated>
	<FMComment: 'My parent if I define the object of an attribute access (if it''s the case).'>
	<container>
	<derived>
	^ attributeObjectOwner
]

{ #category : 'accessing' }
FASTPyExpression >> attributeObjectOwner: anObject [

	<generated>
	attributeObjectOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> attributeObjectOwnerGroup [
	<generated>
	<navigation: 'AttributeObjectOwner'>
	^ MooseSpecializedGroup with: self attributeObjectOwner
]

{ #category : 'accessing' }
FASTPyExpression >> caller [
	"Relation named: #caller type: #FASTPyCall opposite: #callee"

	<generated>
	<FMComment: 'The call entity calling me (if it''s the case)'>
	<container>
	<derived>
	^ caller
]

{ #category : 'accessing' }
FASTPyExpression >> caller: anObject [

	<generated>
	caller := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> callerGroup [
	<generated>
	<navigation: 'Caller'>
	^ MooseSpecializedGroup with: self caller
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
FASTPyExpression >> comprehensionBodyOwner [
	"Relation named: #comprehensionBodyOwner type: #FASTPyTComprehension opposite: #body"

	<generated>
	<container>
	<derived>
	^ comprehensionBodyOwner
]

{ #category : 'accessing' }
FASTPyExpression >> comprehensionBodyOwner: anObject [

	<generated>
	comprehensionBodyOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> comprehensionBodyOwnerGroup [
	<generated>
	<navigation: 'ComprehensionBodyOwner'>
	^ MooseSpecializedGroup with: self comprehensionBodyOwner
]

{ #category : 'accessing' }
FASTPyExpression >> comprehensionClauseOwner [
	"Relation named: #comprehensionClauseOwner type: #FASTPyTComprehension opposite: #clauses"

	<generated>
	<container>
	^ comprehensionClauseOwner
]

{ #category : 'accessing' }
FASTPyExpression >> comprehensionClauseOwner: anObject [

	<generated>
	comprehensionClauseOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> comprehensionClauseOwnerGroup [
	<generated>
	<navigation: 'ComprehensionClauseOwner'>
	^ MooseSpecializedGroup with: self comprehensionClauseOwner
]

{ #category : 'accessing' }
FASTPyExpression >> conditionalExpressionElseOwner [
	"Relation named: #conditionalExpressionElseOwner type: #FASTPyConditionalExpression opposite: #elseExpression"

	<generated>
	<container>
	<derived>
	^ conditionalExpressionElseOwner
]

{ #category : 'accessing' }
FASTPyExpression >> conditionalExpressionElseOwner: anObject [

	<generated>
	conditionalExpressionElseOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> conditionalExpressionElseOwnerGroup [
	<generated>
	<navigation: 'ConditionalExpressionElseOwner'>
	^ MooseSpecializedGroup with: self conditionalExpressionElseOwner
]

{ #category : 'accessing' }
FASTPyExpression >> conditionalExpressionThenOwner [
	"Relation named: #conditionalExpressionThenOwner type: #FASTPyConditionalExpression opposite: #thenExpression"

	<generated>
	<container>
	<derived>
	^ conditionalExpressionThenOwner
]

{ #category : 'accessing' }
FASTPyExpression >> conditionalExpressionThenOwner: anObject [

	<generated>
	conditionalExpressionThenOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> conditionalExpressionThenOwnerGroup [
	<generated>
	<navigation: 'ConditionalExpressionThenOwner'>
	^ MooseSpecializedGroup with: self conditionalExpressionThenOwner
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
FASTPyExpression >> expressionListOwner [
	"Relation named: #expressionListOwner type: #FASTPyExpressionList opposite: #expressions"

	<generated>
	<container>
	^ expressionListOwner
]

{ #category : 'accessing' }
FASTPyExpression >> expressionListOwner: anObject [

	<generated>
	expressionListOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> expressionListOwnerGroup [
	<generated>
	<navigation: 'ExpressionListOwner'>
	^ MooseSpecializedGroup with: self expressionListOwner
]

{ #category : 'accessing' }
FASTPyExpression >> forInClauseLeftOwner [
	"Relation named: #forInClauseLeftOwner type: #FASTPyForInClause opposite: #left"

	<generated>
	<container>
	<derived>
	^ forInClauseLeftOwner
]

{ #category : 'accessing' }
FASTPyExpression >> forInClauseLeftOwner: anObject [

	<generated>
	forInClauseLeftOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> forInClauseLeftOwnerGroup [
	<generated>
	<navigation: 'ForInClauseLeftOwner'>
	^ MooseSpecializedGroup with: self forInClauseLeftOwner
]

{ #category : 'accessing' }
FASTPyExpression >> forInClauseRightOwner [
	"Relation named: #forInClauseRightOwner type: #FASTPyForInClause opposite: #right"

	<generated>
	<container>
	<derived>
	^ forInClauseRightOwner
]

{ #category : 'accessing' }
FASTPyExpression >> forInClauseRightOwner: anObject [

	<generated>
	forInClauseRightOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> forInClauseRightOwnerGroup [
	<generated>
	<navigation: 'ForInClauseRightOwner'>
	^ MooseSpecializedGroup with: self forInClauseRightOwner
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
FASTPyExpression >> ifClauseOwner [
	"Relation named: #ifClauseOwner type: #FASTPyIfClause opposite: #expression"

	<generated>
	<container>
	<derived>
	^ ifClauseOwner
]

{ #category : 'accessing' }
FASTPyExpression >> ifClauseOwner: anObject [

	<generated>
	ifClauseOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> ifClauseOwnerGroup [
	<generated>
	<navigation: 'IfClauseOwner'>
	^ MooseSpecializedGroup with: self ifClauseOwner
]

{ #category : 'accessing' }
FASTPyExpression >> keywordArgumentOwner [
	"Relation named: #keywordArgumentOwner type: #FASTPyKeywordArgument opposite: #value"

	<generated>
	<FMComment: 'Keyword argument from which I am the value (if it''s the case)'>
	<container>
	<derived>
	^ keywordArgumentOwner
]

{ #category : 'accessing' }
FASTPyExpression >> keywordArgumentOwner: anObject [

	<generated>
	keywordArgumentOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> keywordArgumentOwnerGroup [
	<generated>
	<navigation: 'KeywordArgumentOwner'>
	^ MooseSpecializedGroup with: self keywordArgumentOwner
]

{ #category : 'accessing' }
FASTPyExpression >> lambdaOwner [
	"Relation named: #lambdaOwner type: #FASTPyLambda opposite: #expression"

	<generated>
	<container>
	<derived>
	^ lambdaOwner
]

{ #category : 'accessing' }
FASTPyExpression >> lambdaOwner: anObject [

	<generated>
	lambdaOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> lambdaOwnerGroup [
	<generated>
	<navigation: 'LambdaOwner'>
	^ MooseSpecializedGroup with: self lambdaOwner
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
FASTPyExpression >> parentAwait [
	"Relation named: #parentAwait type: #FASTPyAwait opposite: #expression"

	<generated>
	<container>
	<derived>
	^ parentAwait
]

{ #category : 'accessing' }
FASTPyExpression >> parentAwait: anObject [

	<generated>
	parentAwait := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentAwaitGroup [
	<generated>
	<navigation: 'ParentAwait'>
	^ MooseSpecializedGroup with: self parentAwait
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
FASTPyExpression >> parentInterpolation [
	"Relation named: #parentInterpolation type: #FASTPyInterpolation opposite: #expression"

	<generated>
	<container>
	<derived>
	^ parentInterpolation
]

{ #category : 'accessing' }
FASTPyExpression >> parentInterpolation: anObject [

	<generated>
	parentInterpolation := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentInterpolationGroup [
	<generated>
	<navigation: 'ParentInterpolation'>
	^ MooseSpecializedGroup with: self parentInterpolation
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

{ #category : 'accessing' }
FASTPyExpression >> patternListOwner [
	"Relation named: #patternListOwner type: #FASTPyPatternList opposite: #elements"

	<generated>
	<container>
	^ patternListOwner
]

{ #category : 'accessing' }
FASTPyExpression >> patternListOwner: anObject [

	<generated>
	patternListOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> patternListOwnerGroup [
	<generated>
	<navigation: 'PatternListOwner'>
	^ MooseSpecializedGroup with: self patternListOwner
]

{ #category : 'accessing' }
FASTPyExpression >> subscriptIndiceOwner [
	"Relation named: #subscriptIndiceOwner type: #FASTPySubscript opposite: #indices"

	<generated>
	<FMComment: 'My parent if I am defining an index to select of a subscript (if it''s the case)'>
	<container>
	^ subscriptIndiceOwner
]

{ #category : 'accessing' }
FASTPyExpression >> subscriptIndiceOwner: anObject [

	<generated>
	subscriptIndiceOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> subscriptIndiceOwnerGroup [
	<generated>
	<navigation: 'SubscriptIndiceOwner'>
	^ MooseSpecializedGroup with: self subscriptIndiceOwner
]

{ #category : 'accessing' }
FASTPyExpression >> subscriptValueOwner [
	"Relation named: #subscriptValueOwner type: #FASTPySubscript opposite: #value"

	<generated>
	<FMComment: 'My parent if I define the receiver of a subscript (if it''s the case).'>
	<container>
	<derived>
	^ subscriptValueOwner
]

{ #category : 'accessing' }
FASTPyExpression >> subscriptValueOwner: anObject [

	<generated>
	subscriptValueOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> subscriptValueOwnerGroup [
	<generated>
	<navigation: 'SubscriptValueOwner'>
	^ MooseSpecializedGroup with: self subscriptValueOwner
]

{ #category : 'accessing' }
FASTPyExpression >> tuplePatternOwner [
	"Relation named: #tuplePatternOwner type: #FASTPyTuplePattern opposite: #patterns"

	<generated>
	<container>
	^ tuplePatternOwner
]

{ #category : 'accessing' }
FASTPyExpression >> tuplePatternOwner: anObject [

	<generated>
	tuplePatternOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> tuplePatternOwnerGroup [
	<generated>
	<navigation: 'TuplePatternOwner'>
	^ MooseSpecializedGroup with: self tuplePatternOwner
]
