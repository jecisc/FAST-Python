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

{ #category : 'parsing' }
FASTPythonImporter >> importToFAST: tsTree usingSourceCode: aString [

	| tsLanguage importer |
	tsLanguage := TSLanguage python.
	importer := TSFASTImporter new.
	importer tsLanguage: tsLanguage.
	importer languageName: 'Python'.
	importer originString: aString.

	^ importer import: tsTree
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
	fastTree := self importToFAST: tsTree rootNode usingSourceCode: aString.

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
