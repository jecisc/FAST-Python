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

	self buildCFGFor: 'def funct():
	print("Hello")'.
	self skip.
	self halt
]

{ #category : 'tests' }
FASTPythonCFGTest >> testFunctionWithOneStatement [

	self buildCFGFor: 'def funct():
	print("Hello")'.

	self halt
]
