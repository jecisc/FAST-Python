"
I am a visitor for FASTPyEntities. 
I am generated with the metamodel.
"
Trait {
	#name : 'FASTPyTVisitor',
	#traits : 'FASTTVisitor + FamixTVisitor',
	#classTraits : 'FASTTVisitor classTrait + FamixTVisitor classTrait',
	#category : 'FAST-Python-Visitor-Visitor',
	#package : 'FAST-Python-Visitor',
	#tag : 'Visitor'
}

{ #category : 'meta' }
FASTPyTVisitor classSide >> annotation [

	<FMClass: #TVisitor super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyAsPattern: aFASTPyAsPattern [

	<generated>
	self visitFASTPyTWithStatementItem: aFASTPyAsPattern.

	self visitEntity: aFASTPyAsPattern target.
	self visitEntity: aFASTPyAsPattern source
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyAssertStatement: aFASTPyAssertStatement [

	<generated>
	self visitFASTPyStatement: aFASTPyAssertStatement.

	self visitCollection: aFASTPyAssertStatement expressions
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyAssignment: aFASTPyAssignment [

	<generated>
	self visitFASTPyTAssignable: aFASTPyAssignment.
	self visitFASTPyExpression: aFASTPyAssignment.

	self visitEntity: aFASTPyAssignment left.
	self visitEntity: aFASTPyAssignment right.
	self visitEntity: aFASTPyAssignment type
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyAttributeAccess: aFASTPyAttributeAccess [

	<generated>
	self visitFASTPyTAsPatternTarget: aFASTPyAttributeAccess.
	self visitFASTPyTReturnReferenceable: aFASTPyAttributeAccess.
	self visitFASTPyTSplatParameterTarget: aFASTPyAttributeAccess.
	self visitFASTTNamedEntity: aFASTPyAttributeAccess.
	self visitFASTPyExpression: aFASTPyAttributeAccess.

	self visitEntity: aFASTPyAttributeAccess value
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyAugmentedAssignment: aFASTPyAugmentedAssignment [

	<generated>
	self visitFASTPyAssignment: aFASTPyAugmentedAssignment
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyAwait: aFASTPyAwait [

	<generated>
	self visitFASTPyExpression: aFASTPyAwait.

	self visitEntity: aFASTPyAwait expression
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyBinaryOperator: aFASTPyBinaryOperator [

	<generated>
	self visitFASTPyTPattern: aFASTPyBinaryOperator.
	self visitFASTPyTSplatExpression: aFASTPyBinaryOperator.
	self visitFASTTBinaryExpression: aFASTPyBinaryOperator.
	self visitFASTPyOperator: aFASTPyBinaryOperator
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyBoolean: aFASTPyBoolean [

	<generated>
	self visitFASTTBooleanLiteral: aFASTPyBoolean.
	self visitFASTPyLiteral: aFASTPyBoolean
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyBooleanOperator: aFASTPyBooleanOperator [

	<generated>
	self visitFASTPyTRaised: aFASTPyBooleanOperator.
	self visitFASTPyTSplatExpression: aFASTPyBooleanOperator.
	self visitFASTTBinaryExpression: aFASTPyBooleanOperator.
	self visitFASTPyOperator: aFASTPyBooleanOperator
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyBreakStatement: aFASTPyBreakStatement [

	<generated>
	self visitFASTPyStatement: aFASTPyBreakStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyCall: aFASTPyCall [

	<generated>
	self visitFASTPyTReturnReferenceable: aFASTPyCall.
	self visitFASTPyTWithStatementItem: aFASTPyCall.
	self visitFASTTInvocation: aFASTPyCall.
	self visitFASTPyExpression: aFASTPyCall.

	self visitEntity: aFASTPyCall callee
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyCaseClause: aFASTPyCaseClause [

	<generated>
	self visitFASTTStatementBlock: aFASTPyCaseClause.
	self visitFASTTWithCondition: aFASTPyCaseClause.

	self visitEntity: aFASTPyCaseClause pattern.
	self visitEntity: aFASTPyCaseClause parentMatchStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyChevron: aFASTPyChevron [

	<generated>
	self visitEntity: aFASTPyChevron expression.
	self visitEntity: aFASTPyChevron parentPrintStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyClassDefinition: aFASTPyClassDefinition [

	<generated>
	self visitFASTPyTDefinition: aFASTPyClassDefinition.
	self visitFASTPyTWithTypeParameters: aFASTPyClassDefinition.
	self visitFASTPyStatement: aFASTPyClassDefinition.

	self visitCollection: aFASTPyClassDefinition superclasses.
	self visitCollection: aFASTPyClassDefinition keywords
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyClassPattern: aFASTPyClassPattern [

	<generated>
	self visitFASTPyTPattern: aFASTPyClassPattern.

	self visitCollection: aFASTPyClassPattern elements
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyCollectionInitializer: aFASTPyCollectionInitializer [

	<generated>
	self visitFASTPyTPattern: aFASTPyCollectionInitializer.
	self visitFASTPyTSplatExpression: aFASTPyCollectionInitializer.
	self visitFASTPyExpression: aFASTPyCollectionInitializer.

	self visitCollection: aFASTPyCollectionInitializer initializers
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyComment: aFASTPyComment [

	<generated>
	self visitFASTTComment: aFASTPyComment
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyComparisonOperator: aFASTPyComparisonOperator [

	<generated>
	self visitFASTPyOperator: aFASTPyComparisonOperator.

	self visitCollection: aFASTPyComparisonOperator operands
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyComplex: aFASTPyComplex [

	<generated>
	self visitFASTTNumericalLiteral: aFASTPyComplex.
	self visitFASTPyLiteral: aFASTPyComplex
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyComprehension: aFASTPyComprehension [

	<generated>
	self visitFASTPyTSplatExpression: aFASTPyComprehension.
	self visitFASTPyExpression: aFASTPyComprehension.

	self visitEntity: aFASTPyComprehension body.
	self visitCollection: aFASTPyComprehension forClauses.
	self visitCollection: aFASTPyComprehension conditions
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyConcatenatedString: aFASTPyConcatenatedString [

	<generated>
	self visitFASTPyExpression: aFASTPyConcatenatedString.

	self visitCollection: aFASTPyConcatenatedString strings
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyConditionalExpression: aFASTPyConditionalExpression [

	<generated>
	self visitFASTPyTCallable: aFASTPyConditionalExpression.
	self visitFASTPyTExecutable: aFASTPyConditionalExpression.
	self visitFASTPyTSuperclass: aFASTPyConditionalExpression.
	self visitFASTTWithCondition: aFASTPyConditionalExpression.
	self visitFASTPyExpression: aFASTPyConditionalExpression.

	self visitEntity: aFASTPyConditionalExpression thenExpression.
	self visitEntity: aFASTPyConditionalExpression elseExpression
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyConstrainedType: aFASTPyConstrainedType [

	<generated>
	self visitFASTPyTTypeContent: aFASTPyConstrainedType.

	self visitEntity: aFASTPyConstrainedType type.
	self visitEntity: aFASTPyConstrainedType bound
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyContinueStatement: aFASTPyContinueStatement [

	<generated>
	self visitFASTPyStatement: aFASTPyContinueStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyDecorator: aFASTPyDecorator [

	<generated>
	self visitEntity: aFASTPyDecorator expression.
	self visitEntity: aFASTPyDecorator parentDefinition
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyDeleteStatement: aFASTPyDeleteStatement [

	<generated>
	self visitFASTPyStatement: aFASTPyDeleteStatement.

	self visitEntity: aFASTPyDeleteStatement expression
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyDictionary: aFASTPyDictionary [

	<generated>
	self visitFASTPyCollectionInitializer: aFASTPyDictionary
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyDictionaryComprehension: aFASTPyDictionaryComprehension [

	<generated>
	self visitFASTPyComprehension: aFASTPyDictionaryComprehension
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyDottedName: aFASTPyDottedName [

	<generated>
	self visitFASTPyTClassPatternElement: aFASTPyDottedName.
	self visitFASTPyTPattern: aFASTPyDottedName.
	self visitFASTPyExpression: aFASTPyDottedName
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyERROR: aFASTPyERROR [

	<generated>
	self visitFASTPyExpression: aFASTPyERROR
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyElifClause: aFASTPyElifClause [

	<generated>
	self visitFASTTConditionalStatement: aFASTPyElifClause.
	self visitFASTTStatementBlock: aFASTPyElifClause.

	self visitEntity: aFASTPyElifClause parentIfStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyEllipsis: aFASTPyEllipsis [

	<generated>
	self visitFASTPyLiteral: aFASTPyEllipsis
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyElseClause: aFASTPyElseClause [

	<generated>
	self visitFASTTStatementBlock: aFASTPyElseClause.

	self visitEntity: aFASTPyElseClause parentIfStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyEntity: aFASTPyEntity [

	<generated>
	self visitFASTTEntity: aFASTPyEntity.
	self visitFASTTWithComments: aFASTPyEntity
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyEscapeInterpolation: aFASTPyEscapeInterpolation [

	<generated>

]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyEscapeSequence: aFASTPyEscapeSequence [

	<generated>

]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyExceptClause: aFASTPyExceptClause [

	<generated>
	self visitFASTTStatementBlock: aFASTPyExceptClause.

	self visitCollection: aFASTPyExceptClause expressions.
	self visitEntity: aFASTPyExceptClause parentTryStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyExecStatement: aFASTPyExecStatement [

	<generated>
	self visitFASTPyStatement: aFASTPyExecStatement.

	self visitEntity: aFASTPyExecStatement code.
	self visitCollection: aFASTPyExecStatement scopes
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyExpression: aFASTPyExpression [

	<generated>
	self visitFASTPyTSliceIndex: aFASTPyExpression.
	self visitFASTPyTTypeContent: aFASTPyExpression.
	self visitFASTTExpression: aFASTPyExpression.
	self visitFASTPyStatement: aFASTPyExpression.

	self visitEntity: aFASTPyExpression parentAssignmentRight.
	self visitEntity: aFASTPyExpression parentAssertStatement.
	self visitEntity: aFASTPyExpression parentAttributeObject.
	self visitEntity: aFASTPyExpression parentChevron.
	self visitEntity: aFASTPyExpression collectionInitializer.
	self visitEntity: aFASTPyExpression parentComparisonOperator.
	self visitEntity: aFASTPyExpression parentComprehensionBody.
	self visitEntity: aFASTPyExpression parentComprehensionForClause.
	self visitEntity: aFASTPyExpression parentComprehensionCondition.
	self visitEntity: aFASTPyExpression parentConditionalExpressionThen.
	self visitEntity: aFASTPyExpression parentConditionalExpressionElse.
	self visitEntity: aFASTPyExpression parentExceptClause.
	self visitEntity: aFASTPyExpression parentExecStatementScopes.
	self visitEntity: aFASTPyExpression parentForInClauseLeft.
	self visitEntity: aFASTPyExpression parentForInClauseRight.
	self visitEntity: aFASTPyExpression parentForStatementLeft.
	self visitEntity: aFASTPyExpression parentForStatementRight.
	self visitEntity: aFASTPyExpression parentIfClause.
	self visitEntity: aFASTPyExpression parentInterpolation.
	self visitEntity: aFASTPyExpression parentKeywordArgument.
	self visitEntity: aFASTPyExpression parentLambda.
	self visitEntity: aFASTPyExpression parentMatchStatement.
	self visitEntity: aFASTPyExpression parentWalrus.
	self visitEntity: aFASTPyExpression parentPairKey.
	self visitEntity: aFASTPyExpression parentPairValuer.
	self visitEntity: aFASTPyExpression parentDefaultParameterValue.
	self visitEntity: aFASTPyExpression prarentPrintStatement.
	self visitEntity: aFASTPyExpression parentSlice.
	self visitEntity: aFASTPyExpression parentSubscriptValue.
	self visitEntity: aFASTPyExpression parentUnaryOperator.
	self visitEntity: aFASTPyExpression parentYield
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyFinallyClause: aFASTPyFinallyClause [

	<generated>
	self visitFASTTStatementBlock: aFASTPyFinallyClause.

	self visitEntity: aFASTPyFinallyClause parentTryStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyFloat: aFASTPyFloat [

	<generated>
	self visitFASTTNumericalLiteral: aFASTPyFloat.
	self visitFASTPyLiteral: aFASTPyFloat
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyForInClause: aFASTPyForInClause [

	<generated>
	self visitFASTPyExpression: aFASTPyForInClause.

	self visitEntity: aFASTPyForInClause left.
	self visitEntity: aFASTPyForInClause right
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyForStatement: aFASTPyForStatement [

	<generated>
	self visitFASTPyTWithElseClause: aFASTPyForStatement.
	self visitFASTTStatementBlock: aFASTPyForStatement.
	self visitFASTPyStatement: aFASTPyForStatement.

	self visitEntity: aFASTPyForStatement right.
	self visitEntity: aFASTPyForStatement left
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyFormatExpression: aFASTPyFormatExpression [

	<generated>

]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyFromModule: aFASTPyFromModule [

	<generated>
	self visitEntity: aFASTPyFromModule import
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyFunctionDefinition: aFASTPyFunctionDefinition [

	<generated>
	self visitFASTPyTDefinition: aFASTPyFunctionDefinition.
	self visitFASTPyTWithTypeParameters: aFASTPyFunctionDefinition.
	self visitFASTTWithParameters: aFASTPyFunctionDefinition.
	self visitFASTPyStatement: aFASTPyFunctionDefinition.

	self visitEntity: aFASTPyFunctionDefinition returnType
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyGeneratorExpression: aFASTPyGeneratorExpression [

	<generated>
	self visitFASTPyComprehension: aFASTPyGeneratorExpression
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyGenericType: aFASTPyGenericType [

	<generated>
	self visitFASTPyTTypeContent: aFASTPyGenericType.
	self visitFASTPyTWithTypeParameters: aFASTPyGenericType.
	self visitFASTTNamedEntity: aFASTPyGenericType.

	self visitCollection: aFASTPyGenericType arguments
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyGlobalStatement: aFASTPyGlobalStatement [

	<generated>
	self visitFASTPyStatement: aFASTPyGlobalStatement.

	self visitCollection: aFASTPyGlobalStatement variables
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyIdentifier: aFASTPyIdentifier [

	<generated>
	self visitFASTPyTAsPatternTarget: aFASTPyIdentifier.
	self visitFASTPyTReturnReferenceable: aFASTPyIdentifier.
	self visitFASTPyTSplatParameterTarget: aFASTPyIdentifier.
	self visitFASTPyExpression: aFASTPyIdentifier
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyIfClause: aFASTPyIfClause [

	<generated>
	self visitFASTPyExpression: aFASTPyIfClause.

	self visitEntity: aFASTPyIfClause expression
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyIfStatement: aFASTPyIfStatement [

	<generated>
	self visitFASTPyTWithElseClause: aFASTPyIfStatement.
	self visitFASTTConditionalStatement: aFASTPyIfStatement.
	self visitFASTPyStatement: aFASTPyIfStatement.

	self visitEntity: aFASTPyIfStatement thenClause.
	self visitCollection: aFASTPyIfStatement elifClauses
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyImport: aFASTPyImport [

	<generated>
	self visitFASTPyStatement: aFASTPyImport.

	self visitCollection: aFASTPyImport importedEntities
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyImportFromStatement: aFASTPyImportFromStatement [

	<generated>
	self visitFASTPyImport: aFASTPyImportFromStatement.

	self visitEntity: aFASTPyImportFromStatement fromModule
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyImportStatement: aFASTPyImportStatement [

	<generated>
	self visitFASTPyImport: aFASTPyImportStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyImportedEntity: aFASTPyImportedEntity [

	<generated>
	self visitEntity: aFASTPyImportedEntity import
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyInteger: aFASTPyInteger [

	<generated>
	self visitFASTTNumericalLiteral: aFASTPyInteger.
	self visitFASTPyLiteral: aFASTPyInteger
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyInterpolation: aFASTPyInterpolation [

	<generated>
	self visitEntity: aFASTPyInterpolation expression.
	self visitEntity: aFASTPyInterpolation parentString
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyKeywordArgument: aFASTPyKeywordArgument [

	<generated>
	self visitFASTTNamedEntity: aFASTPyKeywordArgument.
	self visitFASTPyExpression: aFASTPyKeywordArgument.

	self visitEntity: aFASTPyKeywordArgument parentClassDefinition.
	self visitEntity: aFASTPyKeywordArgument value
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyKeywordPattern: aFASTPyKeywordPattern [

	<generated>
	self visitFASTPyTClassPatternElement: aFASTPyKeywordPattern.
	self visitFASTPyTPattern: aFASTPyKeywordPattern.
	self visitFASTTNamedEntity: aFASTPyKeywordPattern.

	self visitEntity: aFASTPyKeywordPattern value
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyKeywordSeparator: aFASTPyKeywordSeparator [

	<generated>
	self visitFASTTVariableEntity: aFASTPyKeywordSeparator
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyLambda: aFASTPyLambda [

	<generated>
	self visitFASTPyTCallable: aFASTPyLambda.
	self visitFASTPyTDecoratorExpression: aFASTPyLambda.
	self visitFASTTWithParameters: aFASTPyLambda.
	self visitFASTPyExpression: aFASTPyLambda.

	self visitEntity: aFASTPyLambda expression
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyLambdaParameters: aFASTPyLambdaParameters [

	<generated>

]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyList: aFASTPyList [

	<generated>
	self visitFASTPyTAsPatternTarget: aFASTPyList.
	self visitFASTPyTAssignable: aFASTPyList.
	self visitFASTPyCollectionInitializer: aFASTPyList
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyListComprehension: aFASTPyListComprehension [

	<generated>
	self visitFASTPyComprehension: aFASTPyListComprehension
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyLiteral: aFASTPyLiteral [

	<generated>
	self visitFASTPyTPattern: aFASTPyLiteral.
	self visitFASTTLiteral: aFASTPyLiteral.
	self visitFASTPyExpression: aFASTPyLiteral
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyMatchStatement: aFASTPyMatchStatement [

	<generated>
	self visitFASTPyStatement: aFASTPyMatchStatement.

	self visitEntity: aFASTPyMatchStatement subject.
	self visitCollection: aFASTPyMatchStatement cases
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyMemberType: aFASTPyMemberType [

	<generated>

]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyMethodDefinition: aFASTPyMethodDefinition [

	<generated>
	self visitFASTPyTDefinition: aFASTPyMethodDefinition.
	self visitFASTPyTWithTypeParameters: aFASTPyMethodDefinition.
	self visitFASTTWithParameters: aFASTPyMethodDefinition.
	self visitFASTPyStatement: aFASTPyMethodDefinition
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyModule: aFASTPyModule [

	<generated>
	self visitFASTTStatementBlock: aFASTPyModule.
	self visitFamixTHasImmediateSource: aFASTPyModule
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyNone: aFASTPyNone [

	<generated>
	self visitFASTPyLiteral: aFASTPyNone
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyNonlocalStatement: aFASTPyNonlocalStatement [

	<generated>
	self visitFASTPyStatement: aFASTPyNonlocalStatement.

	self visitCollection: aFASTPyNonlocalStatement variables
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyNotOperator: aFASTPyNotOperator [

	<generated>
	self visitFASTPyTUnaryOperator: aFASTPyNotOperator.
	self visitFASTPyOperator: aFASTPyNotOperator
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyOperator: aFASTPyOperator [

	<generated>
	self visitFASTPyExpression: aFASTPyOperator
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyPair: aFASTPyPair [

	<generated>
	self visitFASTPyExpression: aFASTPyPair.

	self visitEntity: aFASTPyPair key.
	self visitEntity: aFASTPyPair value
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyParameter: aFASTPyParameter [

	<generated>
	self visitFASTTVariableEntity: aFASTPyParameter.

	self visitEntity: aFASTPyParameter type.
	self visitEntity: aFASTPyParameter defaultValue
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyParenthesizedListSplat: aFASTPyParenthesizedListSplat [

	<generated>

]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyPassStatement: aFASTPyPassStatement [

	<generated>
	self visitFASTPyStatement: aFASTPyPassStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyPositionalSeparator: aFASTPyPositionalSeparator [

	<generated>
	self visitFASTTVariableEntity: aFASTPyPositionalSeparator
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyPrintStatement: aFASTPyPrintStatement [

	<generated>
	self visitFASTPyStatement: aFASTPyPrintStatement.

	self visitCollection: aFASTPyPrintStatement expressions.
	self visitEntity: aFASTPyPrintStatement redirection
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyRaiseStatement: aFASTPyRaiseStatement [

	<generated>
	self visitFASTPyStatement: aFASTPyRaiseStatement.

	self visitEntity: aFASTPyRaiseStatement exception
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyReturnStatement: aFASTPyReturnStatement [

	<generated>
	self visitFASTTReturnStatement: aFASTPyReturnStatement.
	self visitFASTPyStatement: aFASTPyReturnStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPySet: aFASTPySet [

	<generated>
	self visitFASTPyCollectionInitializer: aFASTPySet
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPySetComprehension: aFASTPySetComprehension [

	<generated>
	self visitFASTPyComprehension: aFASTPySetComprehension
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPySlice: aFASTPySlice [

	<generated>
	self visitFASTPyTSliceIndex: aFASTPySlice.

	self visitCollection: aFASTPySlice components
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPySplat: aFASTPySplat [

	<generated>
	self visitFASTPyTPattern: aFASTPySplat.
	self visitFASTPyTSuperclass: aFASTPySplat.
	self visitFASTPyExpression: aFASTPySplat.

	self visitEntity: aFASTPySplat expression
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPySplatParameter: aFASTPySplatParameter [

	<generated>
	self visitFASTPyParameter: aFASTPySplatParameter.

	self visitEntity: aFASTPySplatParameter target
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPySplatType: aFASTPySplatType [

	<generated>
	self visitFASTPyTTypeContent: aFASTPySplatType.
	self visitFASTTNamedEntity: aFASTPySplatType
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyStatement: aFASTPyStatement [

	<generated>
	self visitFASTTStatement: aFASTPyStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyString: aFASTPyString [

	<generated>
	self visitFASTPyTExecutable: aFASTPyString.
	self visitFASTPyTSplatExpression: aFASTPyString.
	self visitFASTTStringLiteral: aFASTPyString.
	self visitFASTPyLiteral: aFASTPyString.

	self visitEntity: aFASTPyString parentConcatenatedString.
	self visitCollection: aFASTPyString interpolations
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPySubscript: aFASTPySubscript [

	<generated>
	self visitFASTPyTAsPatternTarget: aFASTPySubscript.
	self visitFASTPyTReturnReferenceable: aFASTPySubscript.
	self visitFASTPyExpression: aFASTPySubscript.

	self visitEntity: aFASTPySubscript value.
	self visitCollection: aFASTPySubscript indices
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTAsPatternSource: aFASTPyTAsPatternSource [

	<generated>
	self visitEntity: aFASTPyTAsPatternSource parentAsPatternSource
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTAsPatternTarget: aFASTPyTAsPatternTarget [

	<generated>
	self visitFASTPyTAsPatternSource: aFASTPyTAsPatternTarget.

	self visitEntity: aFASTPyTAsPatternTarget parentAsPatternTarget
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTAssignable: aFASTPyTAssignable [

	<generated>
	self visitEntity: aFASTPyTAssignable parentAssignmentLeft
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTAwaitable: aFASTPyTAwaitable [

	<generated>
	self visitEntity: aFASTPyTAwaitable parentAwait
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTCallable: aFASTPyTCallable [

	<generated>
	self visitEntity: aFASTPyTCallable caller
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTClassPatternElement: aFASTPyTClassPatternElement [

	<generated>
	self visitEntity: aFASTPyTClassPatternElement parentClassPattern
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTDecoratorExpression: aFASTPyTDecoratorExpression [

	<generated>
	self visitEntity: aFASTPyTDecoratorExpression parentDeclarator
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTDefinition: aFASTPyTDefinition [

	<generated>
	self visitFASTTNamedEntity: aFASTPyTDefinition.
	self visitFASTTStatementBlock: aFASTPyTDefinition.

	self visitCollection: aFASTPyTDefinition decorators
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTDeletable: aFASTPyTDeletable [

	<generated>
	self visitEntity: aFASTPyTDeletable parentDeleteStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTExecutable: aFASTPyTExecutable [

	<generated>
	self visitEntity: aFASTPyTExecutable parentExecStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTPattern: aFASTPyTPattern [

	<generated>
	self visitEntity: aFASTPyTPattern parentCaseClause.
	self visitEntity: aFASTPyTPattern parentKeywordPatternValue.
	self visitEntity: aFASTPyTPattern parentUnionPattern
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTRaised: aFASTPyTRaised [

	<generated>
	self visitEntity: aFASTPyTRaised parentRaiseStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTReturnReferenceable: aFASTPyTReturnReferenceable [

	<generated>
	self visitFASTPyTAsPatternSource: aFASTPyTReturnReferenceable.
	self visitFASTPyTAssignable: aFASTPyTReturnReferenceable.
	self visitFASTPyTAwaitable: aFASTPyTReturnReferenceable.
	self visitFASTPyTCallable: aFASTPyTReturnReferenceable.
	self visitFASTPyTDecoratorExpression: aFASTPyTReturnReferenceable.
	self visitFASTPyTDeletable: aFASTPyTReturnReferenceable.
	self visitFASTPyTExecutable: aFASTPyTReturnReferenceable.
	self visitFASTPyTRaised: aFASTPyTReturnReferenceable.
	self visitFASTPyTSplatExpression: aFASTPyTReturnReferenceable.
	self visitFASTPyTSuperclass: aFASTPyTReturnReferenceable
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTSliceIndex: aFASTPyTSliceIndex [

	<generated>
	self visitEntity: aFASTPyTSliceIndex parentSubscriptIndex
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTSplatExpression: aFASTPyTSplatExpression [

	<generated>
	self visitEntity: aFASTPyTSplatExpression parentSplat
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTSplatParameterTarget: aFASTPyTSplatParameterTarget [

	<generated>
	self visitEntity: aFASTPyTSplatParameterTarget parentSplatParameter
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTSuperclass: aFASTPyTSuperclass [

	<generated>
	self visitEntity: aFASTPyTSuperclass parentClassDefinition
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTTypeContent: aFASTPyTTypeContent [

	<generated>
	self visitEntity: aFASTPyTTypeContent parentType
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTUnaryOperator: aFASTPyTUnaryOperator [

	<generated>
	self visitEntity: aFASTPyTUnaryOperator argument
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTWithElseClause: aFASTPyTWithElseClause [

	<generated>
	self visitEntity: aFASTPyTWithElseClause elseClause
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTWithStatementItem: aFASTPyTWithStatementItem [

	<generated>
	self visitEntity: aFASTPyTWithStatementItem parentWithStatementItem
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTWithTypeParameters: aFASTPyTWithTypeParameters [

	<generated>
	self visitCollection: aFASTPyTWithTypeParameters typeParameters
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyThenClause: aFASTPyThenClause [

	<generated>
	self visitFASTTStatementBlock: aFASTPyThenClause.

	self visitEntity: aFASTPyThenClause parentIfStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTryStatement: aFASTPyTryStatement [

	<generated>
	self visitFASTPyTWithElseClause: aFASTPyTryStatement.
	self visitFASTTStatementBlock: aFASTPyTryStatement.
	self visitFASTPyStatement: aFASTPyTryStatement.

	self visitCollection: aFASTPyTryStatement excepts.
	self visitEntity: aFASTPyTryStatement finally
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTuple: aFASTPyTuple [

	<generated>
	self visitFASTPyTAsPatternTarget: aFASTPyTuple.
	self visitFASTPyTAssignable: aFASTPyTuple.
	self visitFASTPyTDeletable: aFASTPyTuple.
	self visitFASTPyCollectionInitializer: aFASTPyTuple
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyType: aFASTPyType [

	<generated>
	self visitEntity: aFASTPyType parentAssignment.
	self visitEntity: aFASTPyType parentContrainedType.
	self visitEntity: aFASTPyType parentContrainedTypeBound.
	self visitEntity: aFASTPyType parentFunctionDefinition.
	self visitEntity: aFASTPyType parentGenericTypeArgument.
	self visitEntity: aFASTPyType parentParameter.
	self visitEntity: aFASTPyType content.
	self visitEntity: aFASTPyType parentyTypeAliasStatementAlias.
	self visitEntity: aFASTPyType parentyTypeAliasStatementType.
	self visitEntity: aFASTPyType parentWithTypeParameters.
	self visitEntity: aFASTPyType parentUnionType
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTypeAliasStatement: aFASTPyTypeAliasStatement [

	<generated>
	self visitFASTPyStatement: aFASTPyTypeAliasStatement.

	self visitEntity: aFASTPyTypeAliasStatement left.
	self visitEntity: aFASTPyTypeAliasStatement right
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTypeConversion: aFASTPyTypeConversion [

	<generated>

]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyTypeParameter: aFASTPyTypeParameter [

	<generated>
	self visitFASTPyTTypeContent: aFASTPyTypeParameter
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyUnaryOperator: aFASTPyUnaryOperator [

	<generated>
	self visitFASTPyTUnaryOperator: aFASTPyUnaryOperator.
	self visitFASTPyOperator: aFASTPyUnaryOperator
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyUnionPattern: aFASTPyUnionPattern [

	<generated>
	self visitFASTPyTPattern: aFASTPyUnionPattern.

	self visitCollection: aFASTPyUnionPattern members
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyUnionType: aFASTPyUnionType [

	<generated>
	self visitFASTPyTTypeContent: aFASTPyUnionType.

	self visitCollection: aFASTPyUnionType types
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyVariable: aFASTPyVariable [

	<generated>
	self visitFASTPyTAssignable: aFASTPyVariable.
	self visitFASTTVariableEntity: aFASTPyVariable.
	self visitFASTPyIdentifier: aFASTPyVariable.

	self visitEntity: aFASTPyVariable parentGlobalStatement.
	self visitEntity: aFASTPyVariable parentNonlocalStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyWalrus: aFASTPyWalrus [

	<generated>
	self visitFASTTNamedEntity: aFASTPyWalrus.
	self visitFASTPyExpression: aFASTPyWalrus.

	self visitEntity: aFASTPyWalrus value
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyWhileStatement: aFASTPyWhileStatement [

	<generated>
	self visitFASTPyTWithElseClause: aFASTPyWhileStatement.
	self visitFASTTConditionalStatement: aFASTPyWhileStatement.
	self visitFASTTStatementBlock: aFASTPyWhileStatement.
	self visitFASTPyStatement: aFASTPyWhileStatement
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyWithStatement: aFASTPyWithStatement [

	<generated>
	self visitFASTTStatementBlock: aFASTPyWithStatement.
	self visitFASTPyStatement: aFASTPyWithStatement.

	self visitCollection: aFASTPyWithStatement items
]

{ #category : 'visiting' }
FASTPyTVisitor >> visitFASTPyYield: aFASTPyYield [

	<generated>
	self visitFASTPyExpression: aFASTPyYield.

	self visitEntity: aFASTPyYield expression
]
