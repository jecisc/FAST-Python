Class {
	#name : 'FASTPythonCFGTest',
	#superclass : 'TestCase',
	#instVars : [
		'builder',
		'startBlock'
	],
	#category : 'FAST-Python-Tools-Tests',
	#package : 'FAST-Python-Tools-Tests'
}

{ #category : 'running' }
FASTPythonCFGTest >> buildCFGFor: aString [

	self flag: #todo. "What should be the entry point?"
	startBlock := builder buildCFGForModel: (self parse: aString) allFunctionDefinitions first
]

{ #category : 'running' }
FASTPythonCFGTest >> parse: aString [

	^ FASTPythonImporter new
		  errorReportBlock: [ :i | i errors ifNotEmpty: [ self fail: 'Errors happened during parsing. Errors: ' , i errors printString ] ];
		  parse: aString withPlatformLineEndings
]

{ #category : 'running' }
FASTPythonCFGTest >> setUp [

	super setUp.
	builder := FASTPythonCFGBuilder new
]

{ #category : 'tests' }
FASTPythonCFGTest >> testFunctionWithIf [

	| nextBlock |
	self skip.
	self flag: #todo. "Finish"
	self buildCFGFor: 'def f(i):
    if i > 3:
        print(i)'.

	self assert: startBlock isConditional.
	self assert: startBlock isFinal. "If the condition is false then the block is indeed final"
	self assert: startBlock statements size equals: 1.
	self assert: (startBlock statements first class isOfType: FASTPyComparisonOperator).
	self assert: startBlock nextBlocks size equals: 2.
	self assert: (startBlock nextBlock select: #isNullBlock) size equals: 1.

	nextBlock := startBlock nextBlockForValue: true.
	self assert: nextBlock isConditional not.
	self assert: nextBlock isFinal.
	self assertEmpty: nextBlock statements
]

{ #category : 'tests' }
FASTPythonCFGTest >> testFunctionWithOneStatement [

	self buildCFGFor: 'def funct():
	print("Hello")'.

	self assert: startBlock isStart.
	self assert: startBlock nextBlock isNullBlock.
	self assert: startBlock statements size equals: 1
]

{ #category : 'tests' }
FASTPythonCFGTest >> testFunctionWithSimpleReturn [

	self buildCFGFor: 'def funct():
	i = 0
	i += 4
	print(i)
	return i'.

	self assert: startBlock isStart.
	self assert: startBlock nextBlock isNullBlock.
	self assert: startBlock statements size equals: 4
]

{ #category : 'tests' }
FASTPythonCFGTest >> testFunctionWithSimpleStatements [

	self buildCFGFor: 'def funct():
	i = 0
	i += 4
	print(i)'.

	self assert: startBlock isStart.
	self assert: startBlock nextBlock isNullBlock.
	self assert: startBlock statements size equals: 3
]
