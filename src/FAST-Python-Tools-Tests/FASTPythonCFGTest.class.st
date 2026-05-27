Class {
	#name : 'FASTPythonCFGTest',
	#superclass : 'TestCase',
	#instVars : [
		'startBlock',
		'visitor'
	],
	#category : 'FAST-Python-Tools-Tests',
	#package : 'FAST-Python-Tools-Tests'
}

{ #category : 'running' }
FASTPythonCFGTest >> buildCFGFor: aString [

	self flag: #todo. "What should be the entry point?"
	startBlock := FASTPythonCFGVisitor buildCFGOf: (self parse: aString) allFunctionDefinitions first
]

{ #category : 'running' }
FASTPythonCFGTest >> parse: aString [

	^ FASTPythonImporter new
		  errorReportBlock: [ :i | i errors ifNotEmpty: [ self fail: 'Errors happened during parsing. Errors: ' , i errors printString ] ];
		  parse: aString withPlatformLineEndings
]

{ #category : 'tests' }
FASTPythonCFGTest >> testFunctionWithFinalIfThen [

	| thenBlock nullBlock |
	self buildCFGFor: 'def f(i):
    if i > 3:
        print(i)'.

	self assert: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: startBlock statements size equals: 1.
	self assert: (startBlock firstStatement class isOfType: FASTPyComparisonOperator).
	self assert: startBlock nextBlocks size equals: 2.
	self assert: (startBlock nextBlocks select: #isNullBlock) size equals: 1.

	thenBlock := startBlock nextTrueBlock.
	self assert: thenBlock isConditional not.
	self deny: thenBlock isFinal.
	self assert: thenBlock statements size equals: 1.
	self assert: (thenBlock firstStatement isOfType: FASTPyCall).

	nullBlock := startBlock nextFalseBlock.
	self assert: nullBlock isNullBlock.
	self assert: nullBlock identicalTo: thenBlock nextBlock.
	self assert: nullBlock isFinal
]

{ #category : 'tests' }
FASTPythonCFGTest >> testFunctionWithIfThen [

	| thenBlock returnBlock |
	self buildCFGFor: 'def f(i):
    if i > 3:
        print(i)
    return True'.

	self assert: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: startBlock statements size equals: 1.
	self assert: (startBlock firstStatement class isOfType: FASTPyComparisonOperator).
	self assert: startBlock nextBlocks size equals: 2.
	self assertEmpty: (startBlock nextBlocks select: #isNullBlock).

	thenBlock := startBlock nextTrueBlock.
	self assert: thenBlock isConditional not.
	self deny: thenBlock isFinal.
	self assert: thenBlock statements size equals: 1.
	self assert: (thenBlock firstStatement isOfType: FASTPyCall).

	returnBlock := startBlock nextFalseBlock.
	self deny: returnBlock isNullBlock.
	self assert: returnBlock identicalTo: thenBlock nextBlock.
	self assert: returnBlock isFinal.
	self assert: returnBlock statements size equals: 1.
	self assert: (returnBlock firstStatement isOfType: FASTPyReturnStatement)
]

{ #category : 'tests' }
FASTPythonCFGTest >> testFunctionWithIfThenElse [

	| thenBlock elseBlock returnBlock |
	self buildCFGFor: 'def f(i):
    if i > 3:
        print(i)
    else:
        pass
    return True'.

	self assert: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: startBlock statements size equals: 1.
	self assert: (startBlock firstStatement class isOfType: FASTPyComparisonOperator).
	self assert: startBlock nextBlocks size equals: 2.
	self assertEmpty: (startBlock nextBlocks select: #isNullBlock).

	thenBlock := startBlock nextTrueBlock.
	self assert: thenBlock isConditional not.
	self deny: thenBlock isFinal.
	self assert: thenBlock statements size equals: 1.
	self assert: (thenBlock firstStatement isOfType: FASTPyCall).

	elseBlock := startBlock nextFalseBlock.
	self deny: elseBlock isNullBlock.
	self deny: elseBlock isFinal.
	self assert: elseBlock statements size equals: 1.
	self assert: (elseBlock firstStatement isOfType: FASTPyPassStatement).

	returnBlock := thenBlock nextBlock.
	self deny: returnBlock isNullBlock.
	self assert: returnBlock identicalTo: elseBlock nextBlock.
	self assert: returnBlock isFinal.
	self assert: returnBlock statements size equals: 1.
	self assert: (returnBlock firstStatement isOfType: FASTPyReturnStatement)
]

{ #category : 'tests' }
FASTPythonCFGTest >> testFunctionWithOneStatement [

	self buildCFGFor: 'def funct():
	print("Hello")'.

	self assert: startBlock isStart.
	self assert: startBlock isFinal.
	self assert: startBlock statements size equals: 1.
	self assertEmpty: startBlock nextBlocks
]

{ #category : 'tests' }
FASTPythonCFGTest >> testFunctionWithSimpleReturn [

	self buildCFGFor: 'def funct():
	i = 0
	i += 4
	print(i)
	return i'.

	self assert: startBlock isStart.
	self assert: startBlock isFinal.
	self assert: startBlock statements size equals: 4.
	self assertEmpty: startBlock nextBlocks
]

{ #category : 'tests' }
FASTPythonCFGTest >> testFunctionWithSimpleStatements [

	self buildCFGFor: 'def funct():
	i = 0
	i += 4
	print(i)'.

	self assert: startBlock isStart.
	self assert: startBlock isFinal.
	self assert: startBlock statements size equals: 3.
	self assertEmpty: startBlock nextBlocks
]
