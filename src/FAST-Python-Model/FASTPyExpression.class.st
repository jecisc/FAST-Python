"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `attributeObjectOwner` | `FASTPyExpression` | `value` | `FASTPyAttributeAccess` | My parent if I define the object of an attribute access (if it's the case).|
| `collectionInitializer` | `FASTPyExpression` | `initializers` | `FASTPyCollectionInitializer` | The owner of the expression|
| `conditionalExpressionElseOwner` | `FASTPyExpression` | `elseExpression` | `FASTPyConditionalExpression` | |
| `conditionalExpressionThenOwner` | `FASTPyExpression` | `thenExpression` | `FASTPyConditionalExpression` | |
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `forInClauseLeftOwner` | `FASTPyExpression` | `left` | `FASTPyForInClause` | |
| `forInClauseRightOwner` | `FASTPyExpression` | `right` | `FASTPyForInClause` | |
| `keywordArgumentOwner` | `FASTPyExpression` | `value` | `FASTPyKeywordArgument` | Keyword argument from which I am the value (if it's the case)|
| `parentAssertStatement` | `FASTPyExpression` | `expressions` | `FASTPyAssertStatement` | The assert statement that own the expression (if it's the case)|
| `parentAssignmentRight` | `FASTPyExpression` | `right` | `FASTPyAssignment` | |
| `parentChevron` | `FASTPyExpression` | `expression` | `FASTPyChevron` | |
| `parentComparisonOperator` | `FASTPyExpression` | `operands` | `FASTPyComparisonOperator` | Parent comparison expression of which I am.|
| `parentComprehensionBody` | `FASTPyExpression` | `body` | `FASTPyComprehension` | |
| `parentComprehensionCondition` | `FASTPyExpression` | `conditions` | `FASTPyComprehension` | |
| `parentComprehensionForClause` | `FASTPyExpression` | `forClauses` | `FASTPyComprehension` | |
| `parentConditional` | `FASTTExpression` | `condition` | `FASTTWithCondition` | Optional condition statement/expression where this expression is used|
| `parentDefaultParameterValue` | `FASTPyExpression` | `defaultValue` | `FASTPyParameter` | |
| `parentExceptClause` | `FASTPyExpression` | `expressions` | `FASTPyExceptClause` | |
| `parentExecStatementScopes` | `FASTPyExpression` | `scopes` | `FASTPyExecStatement` | |
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentForStatementLeft` | `FASTPyExpression` | `right` | `FASTPyForStatement` | The for statement owner (if possible)|
| `parentForStatementRight` | `FASTPyExpression` | `left` | `FASTPyForStatement` | The for statement owner (if possible)|
| `parentIfClause` | `FASTPyExpression` | `expression` | `FASTPyIfClause` | |
| `parentInterpolation` | `FASTPyExpression` | `expression` | `FASTPyInterpolation` | |
| `parentLambda` | `FASTPyExpression` | `expression` | `FASTPyLambda` | |
| `parentMatchStatement` | `FASTPyExpression` | `subject` | `FASTPyMatchStatement` | |
| `parentPairKey` | `FASTPyExpression` | `key` | `FASTPyPair` | |
| `parentPairValuer` | `FASTPyExpression` | `value` | `FASTPyPair` | |
| `parentSlice` | `FASTPyExpression` | `components` | `FASTPySlice` | Slice in which I am a component (start, end or step) (If it's the case)'|
| `parentSubscriptIndex` | `FASTPyTSliceIndex` | `indices` | `FASTPySubscript` | My parent if I am defining an index to select of a subscript (if it's the case)|
| `parentSubscriptValue` | `FASTPyExpression` | `value` | `FASTPySubscript` | My parent if I define the receiver of a subscript (if it's the case).|
| `parentType` | `FASTPyTTypeContent` | `content` | `FASTPyType` | |
| `parentUnaryOperator` | `FASTPyExpression` | `argument` | `FASTPyTUnaryOperator` | Parent unary operator in which I am.|
| `parentWalrus` | `FASTPyExpression` | `value` | `FASTPyWalrus` | |
| `prarentPrintStatement` | `FASTPyExpression` | `expressions` | `FASTPyPrintStatement` | |
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|


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
	#traits : 'FASTPyTSliceIndex + FASTPyTTypeContent + FASTTExpression',
	#classTraits : 'FASTPyTSliceIndex classTrait + FASTPyTTypeContent classTrait + FASTTExpression classTrait',
	#instVars : [
		'#attributeObjectOwner => FMOne type: #FASTPyAttributeAccess opposite: #value',
		'#collectionInitializer => FMOne type: #FASTPyCollectionInitializer opposite: #initializers',
		'#conditionalExpressionElseOwner => FMOne type: #FASTPyConditionalExpression opposite: #elseExpression',
		'#conditionalExpressionThenOwner => FMOne type: #FASTPyConditionalExpression opposite: #thenExpression',
		'#forInClauseLeftOwner => FMOne type: #FASTPyForInClause opposite: #left',
		'#forInClauseRightOwner => FMOne type: #FASTPyForInClause opposite: #right',
		'#keywordArgumentOwner => FMOne type: #FASTPyKeywordArgument opposite: #value',
		'#parentAssertStatement => FMOne type: #FASTPyAssertStatement opposite: #expressions',
		'#parentAssignmentRight => FMOne type: #FASTPyAssignment opposite: #right',
		'#parentChevron => FMOne type: #FASTPyChevron opposite: #expression',
		'#parentComparisonOperator => FMOne type: #FASTPyComparisonOperator opposite: #operands',
		'#parentComprehensionBody => FMOne type: #FASTPyComprehension opposite: #body',
		'#parentComprehensionCondition => FMOne type: #FASTPyComprehension opposite: #conditions',
		'#parentComprehensionForClause => FMOne type: #FASTPyComprehension opposite: #forClauses',
		'#parentDefaultParameterValue => FMOne type: #FASTPyParameter opposite: #defaultValue',
		'#parentExceptClause => FMOne type: #FASTPyExceptClause opposite: #expressions',
		'#parentExecStatementScopes => FMOne type: #FASTPyExecStatement opposite: #scopes',
		'#parentForStatementLeft => FMOne type: #FASTPyForStatement opposite: #right',
		'#parentForStatementRight => FMOne type: #FASTPyForStatement opposite: #left',
		'#parentIfClause => FMOne type: #FASTPyIfClause opposite: #expression',
		'#parentInterpolation => FMOne type: #FASTPyInterpolation opposite: #expression',
		'#parentLambda => FMOne type: #FASTPyLambda opposite: #expression',
		'#parentMatchStatement => FMOne type: #FASTPyMatchStatement opposite: #subject',
		'#parentPairKey => FMOne type: #FASTPyPair opposite: #key',
		'#parentPairValuer => FMOne type: #FASTPyPair opposite: #value',
		'#parentSlice => FMOne type: #FASTPySlice opposite: #components',
		'#parentSubscriptValue => FMOne type: #FASTPySubscript opposite: #value',
		'#parentUnaryOperator => FMOne type: #FASTPyTUnaryOperator opposite: #argument',
		'#parentWalrus => FMOne type: #FASTPyWalrus opposite: #value',
		'#prarentPrintStatement => FMOne type: #FASTPyPrintStatement opposite: #expressions'
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
FASTPyExpression >> parentExecStatementScopes [
	"Relation named: #parentExecStatementScopes type: #FASTPyExecStatement opposite: #scopes"

	<generated>
	<container>
	^ parentExecStatementScopes
]

{ #category : 'accessing' }
FASTPyExpression >> parentExecStatementScopes: anObject [

	<generated>
	parentExecStatementScopes := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentExecStatementScopesGroup [
	<generated>
	<navigation: 'ParentExecStatementScopes'>
	^ MooseSpecializedGroup with: self parentExecStatementScopes
]

{ #category : 'accessing' }
FASTPyExpression >> parentForStatementLeft [
	"Relation named: #parentForStatementLeft type: #FASTPyForStatement opposite: #right"

	<generated>
	<FMComment: 'The for statement owner (if possible)'>
	<container>
	<derived>
	^ parentForStatementLeft
]

{ #category : 'accessing' }
FASTPyExpression >> parentForStatementLeft: anObject [

	<generated>
	parentForStatementLeft := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentForStatementLeftGroup [
	<generated>
	<navigation: 'ParentForStatementLeft'>
	^ MooseSpecializedGroup with: self parentForStatementLeft
]

{ #category : 'accessing' }
FASTPyExpression >> parentForStatementRight [
	"Relation named: #parentForStatementRight type: #FASTPyForStatement opposite: #left"

	<generated>
	<FMComment: 'The for statement owner (if possible)'>
	<container>
	<derived>
	^ parentForStatementRight
]

{ #category : 'accessing' }
FASTPyExpression >> parentForStatementRight: anObject [

	<generated>
	parentForStatementRight := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentForStatementRightGroup [
	<generated>
	<navigation: 'ParentForStatementRight'>
	^ MooseSpecializedGroup with: self parentForStatementRight
]

{ #category : 'accessing' }
FASTPyExpression >> parentIfClause [
	"Relation named: #parentIfClause type: #FASTPyIfClause opposite: #expression"

	<generated>
	<container>
	<derived>
	^ parentIfClause
]

{ #category : 'accessing' }
FASTPyExpression >> parentIfClause: anObject [

	<generated>
	parentIfClause := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentIfClauseGroup [
	<generated>
	<navigation: 'ParentIfClause'>
	^ MooseSpecializedGroup with: self parentIfClause
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
FASTPyExpression >> parentLambda [
	"Relation named: #parentLambda type: #FASTPyLambda opposite: #expression"

	<generated>
	<container>
	<derived>
	^ parentLambda
]

{ #category : 'accessing' }
FASTPyExpression >> parentLambda: anObject [

	<generated>
	parentLambda := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentLambdaGroup [
	<generated>
	<navigation: 'ParentLambda'>
	^ MooseSpecializedGroup with: self parentLambda
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
FASTPyExpression >> parentPairKey [
	"Relation named: #parentPairKey type: #FASTPyPair opposite: #key"

	<generated>
	<container>
	<derived>
	^ parentPairKey
]

{ #category : 'accessing' }
FASTPyExpression >> parentPairKey: anObject [

	<generated>
	parentPairKey := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentPairKeyGroup [
	<generated>
	<navigation: 'ParentPairKey'>
	^ MooseSpecializedGroup with: self parentPairKey
]

{ #category : 'accessing' }
FASTPyExpression >> parentPairValuer [
	"Relation named: #parentPairValuer type: #FASTPyPair opposite: #value"

	<generated>
	<container>
	<derived>
	^ parentPairValuer
]

{ #category : 'accessing' }
FASTPyExpression >> parentPairValuer: anObject [

	<generated>
	parentPairValuer := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentPairValuerGroup [
	<generated>
	<navigation: 'ParentPairValuer'>
	^ MooseSpecializedGroup with: self parentPairValuer
]

{ #category : 'accessing' }
FASTPyExpression >> parentSlice [
	"Relation named: #parentSlice type: #FASTPySlice opposite: #components"

	<generated>
	<FMComment: 'Slice in which I am a component (start, end or step) (If it''s the case)'''>
	<container>
	^ parentSlice
]

{ #category : 'accessing' }
FASTPyExpression >> parentSlice: anObject [

	<generated>
	parentSlice := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentSliceGroup [
	<generated>
	<navigation: 'ParentSlice'>
	^ MooseSpecializedGroup with: self parentSlice
]

{ #category : 'accessing' }
FASTPyExpression >> parentSubscriptValue [
	"Relation named: #parentSubscriptValue type: #FASTPySubscript opposite: #value"

	<generated>
	<FMComment: 'My parent if I define the receiver of a subscript (if it''s the case).'>
	<container>
	<derived>
	^ parentSubscriptValue
]

{ #category : 'accessing' }
FASTPyExpression >> parentSubscriptValue: anObject [

	<generated>
	parentSubscriptValue := anObject
]

{ #category : 'navigation' }
FASTPyExpression >> parentSubscriptValueGroup [
	<generated>
	<navigation: 'ParentSubscriptValue'>
	^ MooseSpecializedGroup with: self parentSubscriptValue
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
