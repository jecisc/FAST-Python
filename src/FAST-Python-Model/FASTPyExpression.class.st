"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `attributeObjectOwner` | `FASTPyExpression` | `value` | `FASTPyAttributeAccess` | My parent if I define the object of an attribute access (if it's the case).|
| `caller` | `FASTPyExpression` | `callee` | `FASTPyCall` | The call entity calling me (if it's the case)|
| `collectionInitializer` | `FASTPyExpression` | `initializers` | `FASTPyCollectionInitializer` | The owner of the expression|
| `conditionalExpressionElseOwner` | `FASTPyExpression` | `elseExpression` | `FASTPyConditionalExpression` | |
| `conditionalExpressionThenOwner` | `FASTPyExpression` | `thenExpression` | `FASTPyConditionalExpression` | |
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `forInClauseLeftOwner` | `FASTPyExpression` | `left` | `FASTPyForInClause` | |
| `forInClauseRightOwner` | `FASTPyExpression` | `right` | `FASTPyForInClause` | |
| `forStatementLeftOwner` | `FASTPyExpression` | `right` | `FASTPyForStatement` | The for statement owner (if possible)|
| `forStatementRightOwner` | `FASTPyExpression` | `left` | `FASTPyForStatement` | The for statement owner (if possible)|
| `ifClauseOwner` | `FASTPyExpression` | `expression` | `FASTPyIfClause` | |
| `keywordArgumentOwner` | `FASTPyExpression` | `value` | `FASTPyKeywordArgument` | Keyword argument from which I am the value (if it's the case)|
| `lambdaOwner` | `FASTPyExpression` | `expression` | `FASTPyLambda` | |
| `pairKeyOwner` | `FASTPyExpression` | `key` | `FASTPyPair` | |
| `pairValueOwner` | `FASTPyExpression` | `value` | `FASTPyPair` | |
| `parentAssertStatement` | `FASTPyExpression` | `expressions` | `FASTPyAssertStatement` | The assert statement that own the expression (if it's the case)|
| `parentAssignmentRight` | `FASTPyExpression` | `right` | `FASTPyAssignment` | |
| `parentAwait` | `FASTPyExpression` | `expression` | `FASTPyAwait` | |
| `parentChevron` | `FASTPyExpression` | `expression` | `FASTPyChevron` | |
| `parentComparisonOperator` | `FASTPyExpression` | `operands` | `FASTPyComparisonOperator` | Parent comparison expression of which I am.|
| `parentComprehensionBody` | `FASTPyExpression` | `body` | `FASTPyComprehension` | |
| `parentComprehensionCondition` | `FASTPyExpression` | `conditions` | `FASTPyComprehension` | |
| `parentComprehensionForClause` | `FASTPyExpression` | `forClauses` | `FASTPyComprehension` | |
| `parentConditional` | `FASTTExpression` | `condition` | `FASTTWithCondition` | Optional condition statement/expression where this expression is used|
| `parentDefaultParameterValue` | `FASTPyExpression` | `defaultValue` | `FASTPyParameter` | |
| `parentExceptClause` | `FASTPyExpression` | `expressions` | `FASTPyExceptClause` | |
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentInterpolation` | `FASTPyExpression` | `expression` | `FASTPyInterpolation` | |
| `parentMatchStatement` | `FASTPyExpression` | `subject` | `FASTPyMatchStatement` | |
| `parentType` | `FASTPyTTypeContent` | `content` | `FASTPyType` | |
| `parentUnaryOperator` | `FASTPyExpression` | `argument` | `FASTPyTUnaryOperator` | Parent unary operator in which I am.|
| `parentWalrus` | `FASTPyExpression` | `value` | `FASTPyWalrus` | |
| `prarentPrintStatement` | `FASTPyExpression` | `expressions` | `FASTPyPrintStatement` | |
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|
| `sliceOwner` | `FASTPyExpression` | `components` | `FASTPySlice` | Slice in which I am a component (start, end or step) (If it's the case)'|
| `subscriptIndiceOwner` | `FASTPyExpression` | `indices` | `FASTPySubscript` | My parent if I am defining an index to select of a subscript (if it's the case)|
| `subscriptValueOwner` | `FASTPyExpression` | `value` | `FASTPySubscript` | My parent if I define the receiver of a subscript (if it's the case).|


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
	#traits : 'FASTPyTTypeContent + FASTTExpression',
	#classTraits : 'FASTPyTTypeContent classTrait + FASTTExpression classTrait',
	#instVars : [
		'#attributeObjectOwner => FMOne type: #FASTPyAttributeAccess opposite: #value',
		'#caller => FMOne type: #FASTPyCall opposite: #callee',
		'#collectionInitializer => FMOne type: #FASTPyCollectionInitializer opposite: #initializers',
		'#conditionalExpressionElseOwner => FMOne type: #FASTPyConditionalExpression opposite: #elseExpression',
		'#conditionalExpressionThenOwner => FMOne type: #FASTPyConditionalExpression opposite: #thenExpression',
		'#forInClauseLeftOwner => FMOne type: #FASTPyForInClause opposite: #left',
		'#forInClauseRightOwner => FMOne type: #FASTPyForInClause opposite: #right',
		'#forStatementLeftOwner => FMOne type: #FASTPyForStatement opposite: #right',
		'#forStatementRightOwner => FMOne type: #FASTPyForStatement opposite: #left',
		'#ifClauseOwner => FMOne type: #FASTPyIfClause opposite: #expression',
		'#keywordArgumentOwner => FMOne type: #FASTPyKeywordArgument opposite: #value',
		'#lambdaOwner => FMOne type: #FASTPyLambda opposite: #expression',
		'#pairKeyOwner => FMOne type: #FASTPyPair opposite: #key',
		'#pairValueOwner => FMOne type: #FASTPyPair opposite: #value',
		'#parentAssertStatement => FMOne type: #FASTPyAssertStatement opposite: #expressions',
		'#parentAssignmentRight => FMOne type: #FASTPyAssignment opposite: #right',
		'#parentAwait => FMOne type: #FASTPyAwait opposite: #expression',
		'#parentChevron => FMOne type: #FASTPyChevron opposite: #expression',
		'#parentComparisonOperator => FMOne type: #FASTPyComparisonOperator opposite: #operands',
		'#parentComprehensionBody => FMOne type: #FASTPyComprehension opposite: #body',
		'#parentComprehensionCondition => FMOne type: #FASTPyComprehension opposite: #conditions',
		'#parentComprehensionForClause => FMOne type: #FASTPyComprehension opposite: #forClauses',
		'#parentDefaultParameterValue => FMOne type: #FASTPyParameter opposite: #defaultValue',
		'#parentExceptClause => FMOne type: #FASTPyExceptClause opposite: #expressions',
		'#parentInterpolation => FMOne type: #FASTPyInterpolation opposite: #expression',
		'#parentMatchStatement => FMOne type: #FASTPyMatchStatement opposite: #subject',
		'#parentUnaryOperator => FMOne type: #FASTPyTUnaryOperator opposite: #argument',
		'#parentWalrus => FMOne type: #FASTPyWalrus opposite: #value',
		'#prarentPrintStatement => FMOne type: #FASTPyPrintStatement opposite: #expressions',
		'#sliceOwner => FMOne type: #FASTPySlice opposite: #components',
		'#subscriptIndiceOwner => FMOne type: #FASTPySubscript opposite: #indices',
		'#subscriptValueOwner => FMOne type: #FASTPySubscript opposite: #value'
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
FASTPyExpression >> attributeObjectOwner [
	"Relation named: #attributeObjectOwner type: #FASTPyAttributeAccess opposite: #value"

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
FASTPyExpression >> pairKeyOwner [
	"Relation named: #pairKeyOwner type: #FASTPyPair opposite: #key"

	<generated>
	<container>
	<derived>
	^ pairKeyOwner
]

{ #category : 'accessing' }
FASTPyExpression >> pairKeyOwner: anObject [

	<generated>
	pairKeyOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> pairKeyOwnerGroup [
	<generated>
	<navigation: 'PairKeyOwner'>
	^ MooseSpecializedGroup with: self pairKeyOwner
]

{ #category : 'accessing' }
FASTPyExpression >> pairValueOwner [
	"Relation named: #pairValueOwner type: #FASTPyPair opposite: #value"

	<generated>
	<container>
	<derived>
	^ pairValueOwner
]

{ #category : 'accessing' }
FASTPyExpression >> pairValueOwner: anObject [

	<generated>
	pairValueOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> pairValueOwnerGroup [
	<generated>
	<navigation: 'PairValueOwner'>
	^ MooseSpecializedGroup with: self pairValueOwner
]

{ #category : 'accessing' }
FASTPyExpression >> parentAssertStatement [
	"Relation named: #parentAssertStatement type: #FASTPyAssertStatement opposite: #expressions"

	<generated>
	<FMComment: 'The assert statement that own the expression (if it''s the case)'>
	<container>
	^ parentAssertStatement
]

{ #category : 'accessing' }
FASTPyExpression >> parentAssertStatement: anObject [

	<generated>
	parentAssertStatement := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentAssertStatementGroup [
	<generated>
	<navigation: 'ParentAssertStatement'>
	^ MooseSpecializedGroup with: self parentAssertStatement
]

{ #category : 'accessing' }
FASTPyExpression >> parentAssignmentRight [
	"Relation named: #parentAssignmentRight type: #FASTPyAssignment opposite: #right"

	<generated>
	<container>
	<derived>
	^ parentAssignmentRight
]

{ #category : 'accessing' }
FASTPyExpression >> parentAssignmentRight: anObject [

	<generated>
	parentAssignmentRight := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentAssignmentRightGroup [
	<generated>
	<navigation: 'ParentAssignmentRight'>
	^ MooseSpecializedGroup with: self parentAssignmentRight
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
FASTPyExpression >> parentChevron [
	"Relation named: #parentChevron type: #FASTPyChevron opposite: #expression"

	<generated>
	<container>
	<derived>
	^ parentChevron
]

{ #category : 'accessing' }
FASTPyExpression >> parentChevron: anObject [

	<generated>
	parentChevron := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentChevronGroup [
	<generated>
	<navigation: 'ParentChevron'>
	^ MooseSpecializedGroup with: self parentChevron
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
FASTPyExpression >> parentComprehensionBody [
	"Relation named: #parentComprehensionBody type: #FASTPyComprehension opposite: #body"

	<generated>
	<container>
	<derived>
	^ parentComprehensionBody
]

{ #category : 'accessing' }
FASTPyExpression >> parentComprehensionBody: anObject [

	<generated>
	parentComprehensionBody := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentComprehensionBodyGroup [
	<generated>
	<navigation: 'ParentComprehensionBody'>
	^ MooseSpecializedGroup with: self parentComprehensionBody
]

{ #category : 'accessing' }
FASTPyExpression >> parentComprehensionCondition [
	"Relation named: #parentComprehensionCondition type: #FASTPyComprehension opposite: #conditions"

	<generated>
	<container>
	^ parentComprehensionCondition
]

{ #category : 'accessing' }
FASTPyExpression >> parentComprehensionCondition: anObject [

	<generated>
	parentComprehensionCondition := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentComprehensionConditionGroup [
	<generated>
	<navigation: 'ParentComprehensionCondition'>
	^ MooseSpecializedGroup with: self parentComprehensionCondition
]

{ #category : 'accessing' }
FASTPyExpression >> parentComprehensionForClause [
	"Relation named: #parentComprehensionForClause type: #FASTPyComprehension opposite: #forClauses"

	<generated>
	<container>
	^ parentComprehensionForClause
]

{ #category : 'accessing' }
FASTPyExpression >> parentComprehensionForClause: anObject [

	<generated>
	parentComprehensionForClause := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentComprehensionForClauseGroup [
	<generated>
	<navigation: 'ParentComprehensionForClause'>
	^ MooseSpecializedGroup with: self parentComprehensionForClause
]

{ #category : 'accessing' }
FASTPyExpression >> parentDefaultParameterValue [
	"Relation named: #parentDefaultParameterValue type: #FASTPyParameter opposite: #defaultValue"

	<generated>
	<container>
	<derived>
	^ parentDefaultParameterValue
]

{ #category : 'accessing' }
FASTPyExpression >> parentDefaultParameterValue: anObject [

	<generated>
	parentDefaultParameterValue := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentDefaultParameterValueGroup [
	<generated>
	<navigation: 'ParentDefaultParameterValue'>
	^ MooseSpecializedGroup with: self parentDefaultParameterValue
]

{ #category : 'accessing' }
FASTPyExpression >> parentExceptClause [
	"Relation named: #parentExceptClause type: #FASTPyExceptClause opposite: #expressions"

	<generated>
	<container>
	^ parentExceptClause
]

{ #category : 'accessing' }
FASTPyExpression >> parentExceptClause: anObject [

	<generated>
	parentExceptClause := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentExceptClauseGroup [
	<generated>
	<navigation: 'ParentExceptClause'>
	^ MooseSpecializedGroup with: self parentExceptClause
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
FASTPyExpression >> parentMatchStatement [
	"Relation named: #parentMatchStatement type: #FASTPyMatchStatement opposite: #subject"

	<generated>
	<container>
	<derived>
	^ parentMatchStatement
]

{ #category : 'accessing' }
FASTPyExpression >> parentMatchStatement: anObject [

	<generated>
	parentMatchStatement := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentMatchStatementGroup [
	<generated>
	<navigation: 'ParentMatchStatement'>
	^ MooseSpecializedGroup with: self parentMatchStatement
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
FASTPyExpression >> parentWalrus [
	"Relation named: #parentWalrus type: #FASTPyWalrus opposite: #value"

	<generated>
	<container>
	<derived>
	^ parentWalrus
]

{ #category : 'accessing' }
FASTPyExpression >> parentWalrus: anObject [

	<generated>
	parentWalrus := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentWalrusGroup [
	<generated>
	<navigation: 'ParentWalrus'>
	^ MooseSpecializedGroup with: self parentWalrus
]

{ #category : 'accessing' }
FASTPyExpression >> prarentPrintStatement [
	"Relation named: #prarentPrintStatement type: #FASTPyPrintStatement opposite: #expressions"

	<generated>
	<container>
	^ prarentPrintStatement
]

{ #category : 'accessing' }
FASTPyExpression >> prarentPrintStatement: anObject [

	<generated>
	prarentPrintStatement := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> prarentPrintStatementGroup [
	<generated>
	<navigation: 'PrarentPrintStatement'>
	^ MooseSpecializedGroup with: self prarentPrintStatement
]

{ #category : 'accessing' }
FASTPyExpression >> sliceOwner [
	"Relation named: #sliceOwner type: #FASTPySlice opposite: #components"

	<generated>
	<FMComment: 'Slice in which I am a component (start, end or step) (If it''s the case)'''>
	<container>
	^ sliceOwner
]

{ #category : 'accessing' }
FASTPyExpression >> sliceOwner: anObject [

	<generated>
	sliceOwner := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> sliceOwnerGroup [
	<generated>
	<navigation: 'SliceOwner'>
	^ MooseSpecializedGroup with: self sliceOwner
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
