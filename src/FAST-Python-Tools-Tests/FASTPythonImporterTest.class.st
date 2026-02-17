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

	fast := importer parse: '#There is only one comment' withPlatformLineEndings
]

{ #category : 'running' }
FASTPythonImporterTest >> setUp [

	super setUp.

	importer := FASTPythonImporter new
]

{ #category : 'tests' }
FASTPythonImporterTest >> testFileWithOneComment [

	self parse: '#There is only one comment'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonComment) size equals: 1
]
