Class {
	#name : 'FASTPythonCFGVisitor',
	#superclass : 'FASTPythonVisitor',
	#traits : 'FASTTCFGVisitor',
	#classTraits : 'FASTTCFGVisitor classTrait',
	#category : 'FAST-Python-Tools-CFG/DataFlow',
	#package : 'FAST-Python-Tools',
	#tag : 'CFG/DataFlow'
}

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTPyExpression: aFASTPyExpression [
	"We ignore expressions that are not in a statement block"

	aFASTPyExpression isExpressionStatement ifTrue: [ ^ super visitFASTPyExpression: aFASTPyExpression ]
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTPyFunctionDefinition: aFunction [
	"We do not manage the function in itself only its content"

	(aFunction containedEntities sorted: #endPos ascending) do: [ :child | child accept: self ].

	cfgBuilder basicBlocks first isStart: true.

	"If an if ends without having an else part and without having further statements, we add a null block."
	cfgBuilder basicBlocks
		detect: [ :block | block isConditional and: [ block nextFalseBlock isNil ] ]
		ifFound: [ cfgBuilder newBasicBlock: FASTNullBlock ]
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTPyIfStatement: anIfStatement [
	"We do not want to apply the visit statement in the case of the if"

	| conditionalBlock |
	self visitFASTTConditionalStatement: anIfStatement.
	conditionalBlock := cfgBuilder currentBlock.

	self visitEntity: anIfStatement thenClause.

	"adding a new pending action, either for the new else block or following code if no elsePart"
	cfgBuilder addPendingNextBlockAction: [ :elseOrNextBlock | conditionalBlock nextBlock: elseOrNextBlock onValue: false ].

	self visitCollection: anIfStatement elifClauses.

	self visitFASTPyTWithElseClause: anIfStatement
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTPyThenClause: aThenClause [

	| conditionalBlock |
	conditionalBlock := cfgBuilder currentBlock.
	cfgBuilder addPendingNextBlockAction: [ :thenBlock | conditionalBlock nextBlock: thenBlock onValue: true ].
	cfgBuilder closeCurrentBlock.

	super visitFASTPyThenClause: aThenClause
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTTStatement: aStatement [

	| currentBlock |
	cfgBuilder currentBlock ifNil: [
			| newBlock |
			newBlock := cfgBuilder newBasicBlock: FASTBasicBlock.
			cfgBuilder addPendingNextBlockAction: [ :nextBlock | newBlock nextBlock: nextBlock ] ].

	currentBlock := cfgBuilder currentBlock.

	super visitFASTTStatement: aStatement.

	"only adding statement if no expression made changes to the CFG"
	currentBlock = cfgBuilder currentBlock ifTrue: [ cfgBuilder currentBlock addStatement: aStatement ]
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTTStatementBlock: aFASTTStatementBlock [
	"We do not consider the block as a statemert."

	self visitCollection: aFASTTStatementBlock statements
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTTWithCondition: aStatement [

	cfgBuilder newConditionalBlock: aStatement condition.

	super visitFASTTWithCondition: aStatement
]
