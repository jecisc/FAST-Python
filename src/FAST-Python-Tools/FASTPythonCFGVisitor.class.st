Class {
	#name : 'FASTPythonCFGVisitor',
	#superclass : 'FASTPythonVisitor',
	#traits : 'FASTTCFGUtility',
	#classTraits : 'FASTTCFGUtility classTrait',
	#category : 'FAST-Python-Tools-CFG/DataFlow',
	#package : 'FAST-Python-Tools',
	#tag : 'CFG/DataFlow'
}

{ #category : 'accessing' }
FASTPythonCFGVisitor >> currentStatements [
	^ currentStatements
]

{ #category : 'initialization' }
FASTPythonCFGVisitor >> initialize [

	super initialize.
	self initializeCFG
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTPyElifClause: anElifClause [

	self addStatement: anElifClause condition.

	self buildAndUseConditionalBlockDuring: [
			"The condition could be a conditional expression"
			self flag: #todo. "Add a test on this case"

			self visitFASTTStatementBlock: anElifClause.
			self buildBlockIfNeeded ]
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTPyExpression: aFASTPyExpression [
	"We ignore expressions that are not in a statement block"

	aFASTPyExpression isExpressionStatement ifTrue: [ ^ super visitFASTPyExpression: aFASTPyExpression ]
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTPyFunctionDefinition: aFunction [
	"We do not manage the function in itself only its content"

	(aFunction containedEntities sorted: #endPos ascending) do: [ :child | child accept: self ].

	self buildBlockIfNeeded
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTPyIfStatement: anIfStatement [

	self addStatement: anIfStatement condition.

	self buildAndUseConditionalBlockDuring: [
			"The condition could be a conditional expression"
			self flag: #todo. "Add a test on this case"

			self visitEntity: anIfStatement thenClause.

			self flag: #todo. "Elif not managed yet"
			self visitCollection: anIfStatement elifClauses.

			self visitFASTPyTWithElseClause: anIfStatement ]
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTPyTWithElseClause: anElseClause [

	super visitFASTPyTWithElseClause: anElseClause.
	self buildBlockIfNeeded
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTPyThenClause: aThenClause [

	super visitFASTPyThenClause: aThenClause.
	self buildBlockIfNeeded
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTTStatement: aStatement [
	"Register the statement in the list of statements to create the current block once we find a conditional or the end of a block"

	self addStatement: aStatement.

	super visitFASTTStatement: aStatement
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTTStatementBlock: aFASTTStatementBlock [
	"We do not consider the block as a statemert."

	self visitCollection: aFASTTStatementBlock statements
]
