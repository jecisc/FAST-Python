Class {
	#name : 'TSFASTPythonImporter',
	#superclass : 'TSFASTCustomizableImporter',
	#category : 'FAST-Python-Tools',
	#package : 'FAST-Python-Tools'
}

{ #category : 'initialization' }
TSFASTPythonImporter >> initialize [

	super initialize.
	self languageName: 'Python'
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitFalse: aNode [

	^ self createEntityForNode: aNode kind: FASTPythonBoolean
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitFunctionDefinition: aNode [
	"TreeSitter has the same nodes for method and function definitions but in FAST we want to disambiguate."

	| definition |
	definition := (context anySatisfy: [ :entry | entry fastEntity isClassDefinition ])
		  ifTrue: [ self createEntityForNode: aNode kind: FASTPythonMethodDefinition ]
		  ifFalse: [ self createEntityForNode: aNode kind: FASTPythonFunctionDefinition ]
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitIdentifier: aNode [

	"If we are in a field `name` then we are probably in a definition of an entity and we set my content as a name."
	(context anySatisfy: [ :entry | entry field = #name and: [ #( 'function_definition' 'class_definition' ) includes: entry tsNode type ] ]) ifTrue: [
		^ context top fastEntity name: (self sourceCodeOf: aNode) ].

	^ self createEntityForNode: aNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitParameters: aNode [
	"For parameters we want one by parameter. Not one node for multiple ones."

	aNode collectNamedChild do: [ :parameterNode |
			| parameter |
			parameter := self createEntityForNode: parameterNode kind: FASTPythonParameter parentManagementBlock: [ :entity :parent | parent addParameter: entity ].
			parameter name: parameter sourceCode "This case is pretty straightforward since names are the source code of the parameter." ]
]

{ #category : 'visiting - noop' }
TSFASTPythonImporter >> visitStringContent: aNode [
	"We only want one node for the string, my parent."

	
]

{ #category : 'visiting - noop' }
TSFASTPythonImporter >> visitStringEnd: aNode [
	"We only want one node for the string, my parent."

	
]

{ #category : 'visiting - noop' }
TSFASTPythonImporter >> visitStringStart: aNode [
	"We only want one node for the string, my parent."

	
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitTrue: aNode [

	^ self createEntityForNode: aNode kind: FASTPythonBoolean
]
