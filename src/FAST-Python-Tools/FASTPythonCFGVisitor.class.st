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

	super visitFASTPyFunctionDefinition: aFunction.

	cfgBuilder basicBlocks first isStart: true.

	"case where method has no return instruction (void signature)"
	cfgBuilder currentBlock ifNotNil: [ cfgBuilder chainPendingBlocksTo: FASTNullBlock new ]
]

{ #category : 'visiting' }
FASTPythonCFGVisitor >> visitFASTTStatement: aStatement [

	| currentBlock |
	cfgBuilder currentBlock ifNil: [ cfgBuilder newBasicBlock: FASTBasicBlock ].

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
