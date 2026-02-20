Class {
	#name : 'FASTPythonImporter',
	#superclass : 'Object',
	#instVars : [
		'tsParser'
	],
	#category : 'FAST-Python-Tools',
	#package : 'FAST-Python-Tools'
}

{ #category : 'development support' }
FASTPythonImporter class >> devParseAll [
	"Command specific to help me develop. this is useful to know the file to parse everything and detect if this raises any error.
	We do not save the models to not flood the memory and allow their GC."

	<script>
	self devParseFiles: ('/Users/cyril/marius/selected_notebooks_converted' asFileReference allFiles select: [ :f | f extension = 'py' ])
]

{ #category : 'development support' }
FASTPythonImporter class >> devParseBatch1 [

	<script>
	self devParseBatchNumber: '001'
]

{ #category : 'development support' }
FASTPythonImporter class >> devParseBatchNumber: aString [
	"Command specific to help me develop. this is useful to know the file to parse everything and detect if this raises any error.
	We do not save the models to not flood the memory and allow their GC."

	<script>
	self devParseFiles: (('/Users/cyril/marius/selected_notebooks_converted/batch_' , aString) asFileReference files select: [ :f | f extension = 'py' ])
]

{ #category : 'development support' }
FASTPythonImporter class >> devParseFiles: aCollection [
	"Command specific to help me develop. this is useful to know the file to parse everything and detect if this raises any error.
	We do not save the models to not flood the memory and allow their GC..
	
	I save as last element the time it took to run on the full batch."

	| result |
	result := OrderedCollection new.

	result add: [
			aCollection
				do: [ :file |
						| timeToRun |
						timeToRun := [ self parseFile: file ] millisecondsToRun.
						result add: file -> timeToRun ]
				displayingProgress: [ :file | file pathString ] ] millisecondsToRun.

	result inspect
]

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
