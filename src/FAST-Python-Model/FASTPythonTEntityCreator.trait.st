"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FASTPythonTEntityCreator',
	#category : 'FAST-Python-Model-Model',
	#package : 'FAST-Python-Model',
	#tag : 'Model'
}

{ #category : 'meta' }
FASTPythonTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newAliasedImport [

	<generated>
	^ self add: FASTPythonAliasedImport new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newArgumentList [

	<generated>
	^ self add: FASTPythonArgumentList new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newAsPattern [

	<generated>
	^ self add: FASTPythonAsPattern new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newAsPatternTarget [

	<generated>
	^ self add: FASTPythonAsPatternTarget new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newAssertStatement [

	<generated>
	^ self add: FASTPythonAssertStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newAssignment [

	<generated>
	^ self add: FASTPythonAssignment new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newAttribute [

	<generated>
	^ self add: FASTPythonAttribute new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newAugmentedAssignment [

	<generated>
	^ self add: FASTPythonAugmentedAssignment new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newAwait [

	<generated>
	^ self add: FASTPythonAwait new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newBinaryOperator [

	<generated>
	^ self add: FASTPythonBinaryOperator new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newBlock [

	<generated>
	^ self add: FASTPythonBlock new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newBoolean [

	<generated>
	^ self add: FASTPythonBoolean new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newBooleanOperator [

	<generated>
	^ self add: FASTPythonBooleanOperator new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newBreakStatement [

	<generated>
	^ self add: FASTPythonBreakStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newCall [

	<generated>
	^ self add: FASTPythonCall new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newCaseClause [

	<generated>
	^ self add: FASTPythonCaseClause new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newCasePattern [

	<generated>
	^ self add: FASTPythonCasePattern new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newChevron [

	<generated>
	^ self add: FASTPythonChevron new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newClassDefinition [

	<generated>
	^ self add: FASTPythonClassDefinition new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newClassPattern [

	<generated>
	^ self add: FASTPythonClassPattern new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newComment [

	<generated>
	^ self add: FASTPythonComment new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newComparisonOperator [

	<generated>
	^ self add: FASTPythonComparisonOperator new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newComplexPattern [

	<generated>
	^ self add: FASTPythonComplexPattern new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newConcatenatedString [

	<generated>
	^ self add: FASTPythonConcatenatedString new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newConditionalExpression [

	<generated>
	^ self add: FASTPythonConditionalExpression new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newConstrainedType [

	<generated>
	^ self add: FASTPythonConstrainedType new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newContinueStatement [

	<generated>
	^ self add: FASTPythonContinueStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newDecoratedDefinition [

	<generated>
	^ self add: FASTPythonDecoratedDefinition new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newDecorator [

	<generated>
	^ self add: FASTPythonDecorator new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newDefaultParameter [

	<generated>
	^ self add: FASTPythonDefaultParameter new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newDeleteStatement [

	<generated>
	^ self add: FASTPythonDeleteStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newDictPattern [

	<generated>
	^ self add: FASTPythonDictPattern new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newDictionary [

	<generated>
	^ self add: FASTPythonDictionary new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newDictionaryComprehension [

	<generated>
	^ self add: FASTPythonDictionaryComprehension new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newDictionarySplat [

	<generated>
	^ self add: FASTPythonDictionarySplat new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newDictionarySplatPattern [

	<generated>
	^ self add: FASTPythonDictionarySplatPattern new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newDottedName [

	<generated>
	^ self add: FASTPythonDottedName new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newERROR [

	<generated>
	^ self add: FASTPythonERROR new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newElifClause [

	<generated>
	^ self add: FASTPythonElifClause new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newEllipsis [

	<generated>
	^ self add: FASTPythonEllipsis new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newElseClause [

	<generated>
	^ self add: FASTPythonElseClause new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newEscapeInterpolation [

	<generated>
	^ self add: FASTPythonEscapeInterpolation new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newEscapeSequence [

	<generated>
	^ self add: FASTPythonEscapeSequence new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newExceptClause [

	<generated>
	^ self add: FASTPythonExceptClause new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newExecStatement [

	<generated>
	^ self add: FASTPythonExecStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newExpressionList [

	<generated>
	^ self add: FASTPythonExpressionList new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newFinallyClause [

	<generated>
	^ self add: FASTPythonFinallyClause new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newFloat [

	<generated>
	^ self add: FASTPythonFloat new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newForInClause [

	<generated>
	^ self add: FASTPythonForInClause new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newForStatement [

	<generated>
	^ self add: FASTPythonForStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newFormatExpression [

	<generated>
	^ self add: FASTPythonFormatExpression new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newFormatSpecifier [

	<generated>
	^ self add: FASTPythonFormatSpecifier new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newFunctionDefinition [

	<generated>
	^ self add: FASTPythonFunctionDefinition new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newFutureImportStatement [

	<generated>
	^ self add: FASTPythonFutureImportStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newGeneratorExpression [

	<generated>
	^ self add: FASTPythonGeneratorExpression new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newGenericType [

	<generated>
	^ self add: FASTPythonGenericType new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newGlobalStatement [

	<generated>
	^ self add: FASTPythonGlobalStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newIdentifier [

	<generated>
	^ self add: FASTPythonIdentifier new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newIfClause [

	<generated>
	^ self add: FASTPythonIfClause new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newIfStatement [

	<generated>
	^ self add: FASTPythonIfStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newImportFromStatement [

	<generated>
	^ self add: FASTPythonImportFromStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newImportPrefix [

	<generated>
	^ self add: FASTPythonImportPrefix new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newImportStatement [

	<generated>
	^ self add: FASTPythonImportStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newInteger [

	<generated>
	^ self add: FASTPythonInteger new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newInterpolation [

	<generated>
	^ self add: FASTPythonInterpolation new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newKeywordArgument [

	<generated>
	^ self add: FASTPythonKeywordArgument new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newKeywordPattern [

	<generated>
	^ self add: FASTPythonKeywordPattern new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newKeywordSeparator [

	<generated>
	^ self add: FASTPythonKeywordSeparator new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newLambda [

	<generated>
	^ self add: FASTPythonLambda new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newLambdaParameters [

	<generated>
	^ self add: FASTPythonLambdaParameters new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newLineContinuation [

	<generated>
	^ self add: FASTPythonLineContinuation new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newList [

	<generated>
	^ self add: FASTPythonList new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newListComprehension [

	<generated>
	^ self add: FASTPythonListComprehension new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newListPattern [

	<generated>
	^ self add: FASTPythonListPattern new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newListSplat [

	<generated>
	^ self add: FASTPythonListSplat new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newListSplatPattern [

	<generated>
	^ self add: FASTPythonListSplatPattern new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newLiteral [

	<generated>
	^ self add: FASTPythonLiteral new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newMatchStatement [

	<generated>
	^ self add: FASTPythonMatchStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newMemberType [

	<generated>
	^ self add: FASTPythonMemberType new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newMethodDefinition [

	<generated>
	^ self add: FASTPythonMethodDefinition new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newModule [

	<generated>
	^ self add: FASTPythonModule new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newNamedExpression [

	<generated>
	^ self add: FASTPythonNamedExpression new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newNone [

	<generated>
	^ self add: FASTPythonNone new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newNonlocalStatement [

	<generated>
	^ self add: FASTPythonNonlocalStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newNotOperator [

	<generated>
	^ self add: FASTPythonNotOperator new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newPair [

	<generated>
	^ self add: FASTPythonPair new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newParameter [

	<generated>
	^ self add: FASTPythonParameter new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newParenthesizedExpression [

	<generated>
	^ self add: FASTPythonParenthesizedExpression new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newParenthesizedListSplat [

	<generated>
	^ self add: FASTPythonParenthesizedListSplat new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newPassStatement [

	<generated>
	^ self add: FASTPythonPassStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newPatternList [

	<generated>
	^ self add: FASTPythonPatternList new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newPositionalSeparator [

	<generated>
	^ self add: FASTPythonPositionalSeparator new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newPrintStatement [

	<generated>
	^ self add: FASTPythonPrintStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newRaiseStatement [

	<generated>
	^ self add: FASTPythonRaiseStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newRelativeImport [

	<generated>
	^ self add: FASTPythonRelativeImport new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newReturnStatement [

	<generated>
	^ self add: FASTPythonReturnStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newSet [

	<generated>
	^ self add: FASTPythonSet new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newSetComprehension [

	<generated>
	^ self add: FASTPythonSetComprehension new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newSlice [

	<generated>
	^ self add: FASTPythonSlice new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newSplatPattern [

	<generated>
	^ self add: FASTPythonSplatPattern new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newSplatType [

	<generated>
	^ self add: FASTPythonSplatType new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newString [

	<generated>
	^ self add: FASTPythonString new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newSubscript [

	<generated>
	^ self add: FASTPythonSubscript new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newTryStatement [

	<generated>
	^ self add: FASTPythonTryStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newTuple [

	<generated>
	^ self add: FASTPythonTuple new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newTupleExpression [

	<generated>
	^ self add: FASTPythonTupleExpression new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newTuplePattern [

	<generated>
	^ self add: FASTPythonTuplePattern new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newType [

	<generated>
	^ self add: FASTPythonType new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newTypeAliasStatement [

	<generated>
	^ self add: FASTPythonTypeAliasStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newTypeConversion [

	<generated>
	^ self add: FASTPythonTypeConversion new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newTypeParameter [

	<generated>
	^ self add: FASTPythonTypeParameter new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newTypedDefaultParameter [

	<generated>
	^ self add: FASTPythonTypedDefaultParameter new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newTypedParameter [

	<generated>
	^ self add: FASTPythonTypedParameter new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newUnaryOperator [

	<generated>
	^ self add: FASTPythonUnaryOperator new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newUnionPattern [

	<generated>
	^ self add: FASTPythonUnionPattern new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newUnionType [

	<generated>
	^ self add: FASTPythonUnionType new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newWhileStatement [

	<generated>
	^ self add: FASTPythonWhileStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newWildcardImport [

	<generated>
	^ self add: FASTPythonWildcardImport new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newWithClause [

	<generated>
	^ self add: FASTPythonWithClause new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newWithItem [

	<generated>
	^ self add: FASTPythonWithItem new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newWithStatement [

	<generated>
	^ self add: FASTPythonWithStatement new
]

{ #category : 'entity creation' }
FASTPythonTEntityCreator >> newYield [

	<generated>
	^ self add: FASTPythonYield new
]
