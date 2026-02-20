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
FASTPythonImporter class >> parse: aString [

	^ self new parse: aString
]

{ #category : 'parsing' }
FASTPythonImporter class >> parseFile: aFileReference [
	"We could optimize by using the binary read stream of the file, but that means we would have to manage the encoding and the importer is not managing that yet.
	
	This implementation only accept utf8 for now. Next step would be to detect the encoding of the file before reading the contents."

	^ self parse: aFileReference asFileReference contents
]

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
