"
A FASTPythonImporterTest is a test class for testing the behavior of FASTPythonImporter
"
Class {
	#name : 'FASTPythonImporterTest',
	#superclass : 'TestCase',
	#instVars : [
		'importer',
		'fast'
	],
	#category : 'FAST-Python-Tools-Tests',
	#package : 'FAST-Python-Tools-Tests'
}

{ #category : 'running' }
FASTPythonImporterTest >> parse: aString [

	fast := importer parse: aString withPlatformLineEndings
]

{ #category : 'running' }
FASTPythonImporterTest >> setUp [

	super setUp.

	importer := FASTPythonImporter new
]

{ #category : 'tests' }
FASTPythonImporterTest >> testFileWithAFunctionDefinition [

	self parse: 'def test():
	return 1'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonFunctionDefinition) size equals: 1
]

{ #category : 'tests' }
FASTPythonImporterTest >> testFileWithAFunctionDefinitionAndParameters [

	| function |
	self parse: 'def add(a, b):
	return a + b'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonFunctionDefinition) size equals: 1.
	function := (fast allWithType: FASTPythonFunctionDefinition) anyOne.

	self assert: (fast allWithType: FASTPythonParameter) size equals: 2.
	self assertCollection: (fast allWithType: FASTPythonParameter) hasSameElements: function parameters.
	function parameters do: [ :parameter | self assert: (parameter isOfType: FASTPythonParameter) ]
]

{ #category : 'tests' }
FASTPythonImporterTest >> testFileWithOneComment [

	| entity |
	self parse: '#There is only one comment'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	entity := (fast allWithType: FASTPythonModule) anyOne.
	self assert: entity sourceCode equals: '#There is only one comment'.

	self assert: (fast allWithType: FASTPythonComment) size equals: 1.
	entity := (fast allWithType: FASTPythonComment) anyOne.
	self assert: entity sourceCode equals: '#There is only one comment'
]

{ #category : 'tests' }
FASTPythonImporterTest >> testFileWithTwoComments [

	| entity |
	self parse: '# Comment 1
	
# Comment 2'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	entity := (fast allWithType: FASTPythonModule) anyOne.
	self assert: entity sourceCode equals: '# Comment 1
	
# Comment 2' withPlatformLineEndings.

	self assert: (fast allWithType: FASTPythonComment) size equals: 2.
	self assertCollection: ((fast allWithType: FASTPythonComment) collect: #sourceCode as: Array) hasSameElements: { '# Comment 1'. '# Comment 2' }
]
