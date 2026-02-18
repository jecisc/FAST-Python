Class {
	#name : 'FASTPythonImporter',
	#superclass : 'Object',
	#instVars : [
		'tsParser'
	],
	#category : 'FAST-Python-Tools',
	#package : 'FAST-Python-Tools'
}

{ #category : 'parsing' }
FASTPythonImporter >> deleteTreeSitterParser [

	self tsParser delete
]

{ #category : 'as yet unclassified' }
FASTPythonImporter >> initialiseTreeSitterParser [ 

	self tsParser: TSParser new.
	self tsParser language: TSLanguage python
]

{ #category : 'parsing' }
FASTPythonImporter >> parse: aString [

	| tsTree fastTree |
	self initialiseTreeSitterParser.

	tsTree := self tsParser parseString: aString.
	fastTree := TSFASTPythonImporter new
		            originString: aString;
		            import: tsTree rootNode.

	self deleteTreeSitterParser.

	^ fastTree
]

{ #category : 'accessing' }
FASTPythonImporter >> tsParser [
	^ tsParser
]

{ #category : 'accessing' }
FASTPythonImporter >> tsParser: anObject [
	tsParser := anObject
]
