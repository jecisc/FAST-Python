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

	startBlock := builder buildCFGForModel: (self parse: aString) rootEntities anyOne
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
FASTPythonCFGTest >> testFunctionWithOneStatement [

	self buildCFGFor: 'def funct():
	return 3'.

	self halt
]
