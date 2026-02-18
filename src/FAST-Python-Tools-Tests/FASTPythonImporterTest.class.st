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
