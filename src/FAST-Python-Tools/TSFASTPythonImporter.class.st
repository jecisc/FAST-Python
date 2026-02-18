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
TSFASTPythonImporter >> visitParameters: aNode [
	"For parameters we want one by parameter. Not one node for multiple ones."

	aNode collectNamedChild do: [ :parameterNode | self createEntityForNode: parameterNode kind: FASTPythonParameter parentManagementBlock: [ :entity :parent | parent addParameter: entity ] ]
]
