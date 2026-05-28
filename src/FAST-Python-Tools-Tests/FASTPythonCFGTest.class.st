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

{ #category : 'tests - for' }
FASTPythonCFGTest >> testFunctionWithFor [

	| forBlock nullBlock |
	self buildCFGFor: 'def f(i):
    for x in i:
        print(x)'.

	self assert: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: startBlock statements size equals: 2.
	self assert: (startBlock statements first class isOfType: FASTPyIdentifier).
	self assert: (startBlock statements second class isOfType: FASTPyIdentifier).
	self assert: startBlock nextBlocks size equals: 2.
	self assert: (startBlock nextBlocks select: #isNullBlock) size equals: 1.

	forBlock := startBlock nextTrueBlock.
	self deny: forBlock isConditional.
	self deny: forBlock isFinal.
	self assert: forBlock statements size equals: 1.
	self assert: (forBlock statements first isOfType: FASTPyCall).
	self assert: forBlock nextBlock equals: startBlock.
	
	nullBlock := startBlock nextFalseBlock.
	self assert: nullBlock isNullBlock.
	self assert: nullBlock isFinal
]

{ #category : 'tests - for' }
FASTPythonCFGTest >> testFunctionWithForConditionDoesNotMixWithPreviousStatements [
	"Since the for loop, we should not mix its condition with previous statements. "

	| forCondition forBlock nullBlock |
	self buildCFGFor: 'def f(i):
    y()
    for x in i:
        print(x)'.

	self deny: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: startBlock statements size equals: 1.
	self assert: (startBlock statements first class isOfType: FASTPyCall).
	
	forCondition := startBlock nextBlock.
	self assert: forCondition isConditional.
	self deny: forCondition isFinal.
	self assert: forCondition statements size equals: 2.
	self assert: (forCondition statements first class isOfType: FASTPyIdentifier).
	self assert: (forCondition statements second class isOfType: FASTPyIdentifier).
	self assert: forCondition nextBlocks size equals: 2.
	self assert: (forCondition nextBlocks select: #isNullBlock) size equals: 1.

	forBlock := forCondition nextTrueBlock.
	self deny: forBlock isConditional.
	self deny: forBlock isFinal.
	self assert: forBlock statements size equals: 1.
	self assert: (forBlock statements first isOfType: FASTPyCall).
	self assert: forBlock nextBlock equals: forCondition.

	nullBlock := forCondition nextFalseBlock.
	self assert: nullBlock isNullBlock.
	self assert: nullBlock isFinal
]

{ #category : 'tests - if' }
FASTPythonCFGTest >> testFunctionWithIfThen [

	| thenBlock nextBlock |
	self buildCFGFor: 'def f(i):
    y()
    if i > 3:
        print(i)
    z()'.

	self assert: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: startBlock statements size equals: 2.
	self assert: (startBlock statements first class isOfType: FASTPyCall).
	self assert: (startBlock statements second class isOfType: FASTPyComparisonOperator).
	self assert: startBlock nextBlocks size equals: 2.
	self assertEmpty: (startBlock nextBlocks select: #isNullBlock).

	thenBlock := startBlock nextTrueBlock.
	self assert: thenBlock isConditional not.
	self deny: thenBlock isFinal.
	self assert: thenBlock statements size equals: 1.
	self assert: (thenBlock statements first isOfType: FASTPyCall).

	nextBlock := startBlock nextFalseBlock.
	self deny: nextBlock isNullBlock.
	self assert: nextBlock identicalTo: thenBlock nextBlock.
	self assert: nextBlock isFinal
]

{ #category : 'tests - if' }
FASTPythonCFGTest >> testFunctionWithIfThenAtEnd [

	| thenBlock nullBlock |
	self buildCFGFor: 'def f(i):
    y()
    if i > 3:
        print(i)'.

	self assert: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: startBlock statements size equals: 2.
	self assert: (startBlock statements first class isOfType: FASTPyCall).
	self assert: (startBlock statements second class isOfType: FASTPyComparisonOperator).
	self assert: startBlock nextBlocks size equals: 2.
	self assert: (startBlock nextBlocks select: #isNullBlock) size equals: 1.

	thenBlock := startBlock nextTrueBlock.
	self assert: thenBlock isConditional not.
	self deny: thenBlock isFinal.
	self assert: thenBlock statements size equals: 1.
	self assert: (thenBlock statements first isOfType: FASTPyCall).

	nullBlock := startBlock nextFalseBlock.
	self assert: nullBlock isNullBlock.
	self assert: nullBlock identicalTo: thenBlock nextBlock.
	self assert: nullBlock isFinal
]

{ #category : 'tests - if' }
FASTPythonCFGTest >> testFunctionWithIfThenAtStart [

	| thenBlock returnBlock |
	self buildCFGFor: 'def f(i):
    if i > 3:
        print(i)
    return True'.

	self assert: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: startBlock statements size equals: 1.
	self assert: (startBlock statements first class isOfType: FASTPyComparisonOperator).
	self assert: startBlock nextBlocks size equals: 2.
	self assertEmpty: (startBlock nextBlocks select: #isNullBlock).

	thenBlock := startBlock nextTrueBlock.
	self assert: thenBlock isConditional not.
	self deny: thenBlock isFinal.
	self assert: thenBlock statements size equals: 1.
	self assert: (thenBlock statements first isOfType: FASTPyCall).

	returnBlock := startBlock nextFalseBlock.
	self deny: returnBlock isNullBlock.
	self assert: returnBlock identicalTo: thenBlock nextBlock.
	self assert: returnBlock isFinal.
	self assert: returnBlock statements size equals: 1.
	self assert: (returnBlock statements first isOfType: FASTPyReturnStatement)
]

{ #category : 'tests - if' }
FASTPythonCFGTest >> testFunctionWithIfThenElif [

	| thenBlock elifConditionBlock elifBlock nullBlock |
	self buildCFGFor: 'def f(i):
    if i > 3:
        print(i)
    elif i < 8:
        pass'.

	self assert: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: startBlock statements size equals: 1.
	self assert: (startBlock statements first class isOfType: FASTPyComparisonOperator).
	self assert: startBlock nextBlocks size equals: 2.
	self assertEmpty: (startBlock nextBlocks select: #isNullBlock).

	thenBlock := startBlock nextTrueBlock.
	self deny: thenBlock isConditional.
	self deny: thenBlock isFinal.
	self assert: thenBlock statements size equals: 1.
	self assert: (thenBlock statements first isOfType: FASTPyCall).

	elifConditionBlock := startBlock nextFalseBlock.
	self assert: elifConditionBlock isConditional.
	self deny: elifConditionBlock isFinal.
	self assert: elifConditionBlock statements size equals: 1.
	self assert: (elifConditionBlock statements first isOfType: FASTPyComparisonOperator).

	elifBlock := elifConditionBlock nextTrueBlock.
	self deny: elifBlock isConditional.
	self deny: elifBlock isFinal.
	self assert: elifBlock statements size equals: 1.
	self assert: (elifBlock statements first isOfType: FASTPyPassStatement).

	nullBlock := elifBlock nextBlock.
	self assert: nullBlock isNullBlock.
	self assert: nullBlock identicalTo: thenBlock nextBlock.
	self assert: nullBlock identicalTo: elifConditionBlock nextFalseBlock.
	self assert: nullBlock identicalTo: elifBlock nextBlock.
	self assert: nullBlock isFinal
]

{ #category : 'tests - if' }
FASTPythonCFGTest >> testFunctionWithIfThenElse [

	| thenBlock elseBlock returnBlock |
	self buildCFGFor: 'def f(i):
    y()
    if i > 3:
        print(i)
    else:
        pass
    return True'.

	self assert: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: startBlock statements size equals: 2.
	self assert: (startBlock statements first class isOfType: FASTPyCall).
	self assert: (startBlock statements second class isOfType: FASTPyComparisonOperator).
	self assert: startBlock nextBlocks size equals: 2.
	self assertEmpty: (startBlock nextBlocks select: #isNullBlock).

	thenBlock := startBlock nextTrueBlock.
	self assert: thenBlock isConditional not.
	self deny: thenBlock isFinal.
	self assert: thenBlock statements size equals: 1.
	self assert: (thenBlock statements first isOfType: FASTPyCall).

	elseBlock := startBlock nextFalseBlock.
	self deny: elseBlock isNullBlock.
	self deny: elseBlock isFinal.
	self assert: elseBlock statements size equals: 1.
	self assert: (elseBlock statements first isOfType: FASTPyPassStatement).

	returnBlock := thenBlock nextBlock.
	self deny: returnBlock isNullBlock.
	self assert: returnBlock identicalTo: elseBlock nextBlock.
	self assert: returnBlock isFinal.
	self assert: returnBlock statements size equals: 1.
	self assert: (returnBlock statements first isOfType: FASTPyReturnStatement)
]

{ #category : 'tests - if' }
FASTPythonCFGTest >> testFunctionWithIfThenElseAtEnd [

	| thenBlock elseBlock nullBlock |
	self buildCFGFor: 'def f(i):
    y()
    if i > 3:
        print(i)
    else:
        pass'.

	self assert: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: startBlock statements size equals: 2.
	self assert: (startBlock statements first class isOfType: FASTPyCall).
	self assert: (startBlock statements second class isOfType: FASTPyComparisonOperator).
	self assert: startBlock nextBlocks size equals: 2.
	self assertEmpty: (startBlock nextBlocks select: #isNullBlock).

	thenBlock := startBlock nextTrueBlock.
	self assert: thenBlock isConditional not.
	self deny: thenBlock isFinal.
	self assert: thenBlock statements size equals: 1.
	self assert: (thenBlock statements first isOfType: FASTPyCall).

	elseBlock := startBlock nextFalseBlock.
	self deny: elseBlock isNullBlock.
	self deny: elseBlock isFinal.
	self assert: elseBlock statements size equals: 1.
	self assert: (elseBlock statements first isOfType: FASTPyPassStatement).

	nullBlock := thenBlock nextBlock.
	self assert: nullBlock isNullBlock.
	self assert: nullBlock identicalTo: elseBlock nextBlock.
	self assert: nullBlock isFinal
]

{ #category : 'tests - if' }
FASTPythonCFGTest >> testFunctionWithIfThenElseAtStart [

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
	self assert: (startBlock statements first class isOfType: FASTPyComparisonOperator).
	self assert: startBlock nextBlocks size equals: 2.
	self assertEmpty: (startBlock nextBlocks select: #isNullBlock).

	thenBlock := startBlock nextTrueBlock.
	self assert: thenBlock isConditional not.
	self deny: thenBlock isFinal.
	self assert: thenBlock statements size equals: 1.
	self assert: (thenBlock statements first isOfType: FASTPyCall).

	elseBlock := startBlock nextFalseBlock.
	self deny: elseBlock isNullBlock.
	self deny: elseBlock isFinal.
	self assert: elseBlock statements size equals: 1.
	self assert: (elseBlock statements first isOfType: FASTPyPassStatement).

	returnBlock := thenBlock nextBlock.
	self deny: returnBlock isNullBlock.
	self assert: returnBlock identicalTo: elseBlock nextBlock.
	self assert: returnBlock isFinal.
	self assert: returnBlock statements size equals: 1.
	self assert: (returnBlock statements first isOfType: FASTPyReturnStatement)
]

{ #category : 'tests - if' }
FASTPythonCFGTest >> testFunctionWithIfThenElseInIfThen [

	| thenBlock thenBlock2 elseBlock nullBlock |
	self buildCFGFor: 'def f(i):
    if i > 3:
	y()
        if i < 5:
            print(i)
        else:
            pass'.

	self assert: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: (startBlock statements first class isOfType: FASTPyComparisonOperator).
	self assert: startBlock nextBlocks size equals: 2.
	self assert: (startBlock nextBlocks select: #isNullBlock) size equals: 1.

	thenBlock := startBlock nextTrueBlock.
	self assert: thenBlock isConditional.
	self deny: thenBlock isFinal.
	self assert: thenBlock statements size equals: 2.
	self assert: (thenBlock statements first class isOfType: FASTPyCall).
	self assert: (thenBlock statements second class isOfType: FASTPyComparisonOperator).

	thenBlock2 := thenBlock nextTrueBlock.
	self deny: thenBlock2 isConditional.
	self deny: thenBlock2 isFinal.
	self assert: thenBlock2 statements size equals: 1.
	self assert: (thenBlock2 statements first isOfType: FASTPyCall).
	
	elseBlock := thenBlock nextFalseBlock.
	self deny: elseBlock isConditional.
	self deny: elseBlock isFinal.
	self assert: elseBlock statements size equals: 1.
	self assert: (elseBlock statements first isOfType: FASTPyPassStatement).

	nullBlock := startBlock nextFalseBlock.
	self assert: nullBlock isNullBlock.
	self assert: nullBlock identicalTo: thenBlock2 nextBlock.
	self assert: nullBlock identicalTo: elseBlock nextBlock.
	self assert: nullBlock isFinal
]

{ #category : 'tests - if' }
FASTPythonCFGTest >> testFunctionWithIfThenInIfThen [

	| thenBlock thenBlock2 nullBlock |
	self buildCFGFor: 'def f(i):
    if i > 3:
	y()
        if i < 5:
            print(i)'.

	self assert: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: (startBlock statements first class isOfType: FASTPyComparisonOperator).
	self assert: startBlock nextBlocks size equals: 2.
	self assert: (startBlock nextBlocks select: #isNullBlock) size equals: 1.

	thenBlock := startBlock nextTrueBlock.
	self assert: thenBlock isConditional.
	self deny: thenBlock isFinal.
	self assert: thenBlock statements size equals: 2.
	self assert: (thenBlock statements first class isOfType: FASTPyCall).
	self assert: (thenBlock statements second class isOfType: FASTPyComparisonOperator).

	thenBlock2 := thenBlock nextTrueBlock.
	self deny: thenBlock2 isConditional.
	self deny: thenBlock2 isFinal.
	self assert: thenBlock2 statements size equals: 1.
	self assert: (thenBlock2 statements first isOfType: FASTPyCall).

	nullBlock := startBlock nextFalseBlock.
	self assert: nullBlock isNullBlock.
	self assert: nullBlock identicalTo: thenBlock nextFalseBlock.
	self assert: nullBlock identicalTo: thenBlock2 nextBlock.
	self assert: nullBlock isFinal
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

{ #category : 'tests - while' }
FASTPythonCFGTest >> testFunctionWithWhile [

	| whileBlock nullBlock |
	self buildCFGFor: 'def f(i):
    while i < 4:
        i += 1
        print(i)'.

	self assert: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: startBlock statements size equals: 1.
	self assert: (startBlock statements first class isOfType: FASTPyComparisonOperator).
	self assert: startBlock nextBlocks size equals: 2.
	self assert: (startBlock nextBlocks select: #isNullBlock) size equals: 1.

	whileBlock := startBlock nextTrueBlock.
	self deny: whileBlock isConditional.
	self deny: whileBlock isFinal.
	self assert: whileBlock statements size equals: 2.
	self assert: (whileBlock statements first isOfType: FASTPyAugmentedAssignment).
	self assert: (whileBlock statements second isOfType: FASTPyCall).
	self assert: whileBlock nextBlock equals: startBlock.

	nullBlock := startBlock nextFalseBlock.
	self assert: nullBlock isNullBlock.
	self assert: nullBlock isFinal
]

{ #category : 'tests - while' }
FASTPythonCFGTest >> testFunctionWithWhileDoesNotMixWithPreviousStatements [
	"Since the while loop, we should not mix its condition with previous statements. "

	| whileCondition whileBlock nullBlock |
	self buildCFGFor: 'def f(i):
    y()
    while i < 4:
        i += 1
        print(i)'.

	self deny: startBlock isConditional.
	self deny: startBlock isFinal.
	self assert: startBlock statements size equals: 1.
	self assert: (startBlock statements first class isOfType: FASTPyCall).
	
	whileCondition := startBlock nextBlock.
	self assert: whileCondition isConditional.
	self deny: whileCondition isFinal.
	self assert: whileCondition statements size equals: 1.
	self assert: (whileCondition statements first class isOfType: FASTPyComparisonOperator).
	self assert: whileCondition nextBlocks size equals: 2.
	self assert: (whileCondition nextBlocks select: #isNullBlock) size equals: 1.

	whileBlock := whileCondition nextTrueBlock.
	self deny: whileBlock isConditional.
	self deny: whileBlock isFinal.
	self assert: whileBlock statements size equals: 2.
	self assert: (whileBlock statements first isOfType: FASTPyAugmentedAssignment).
	self assert: (whileBlock statements second isOfType: FASTPyCall).
	self assert: whileBlock nextBlock equals: whileCondition .

	nullBlock := whileCondition nextFalseBlock.
	self assert: nullBlock isNullBlock.
	self assert: nullBlock isFinal
]
