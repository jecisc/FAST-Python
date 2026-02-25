Class {
	#name : 'TSFASTPythonImporter',
	#superclass : 'TSFASTCustomizableImporter',
	#category : 'FAST-Python-Tools',
	#package : 'FAST-Python-Tools'
}

{ #category : 'initialization' }
TSFASTPythonImporter >> initialize [

	super initialize.
	self languageName: 'Py'
]

{ #category : 'private' }
TSFASTPythonImporter >> manageBinaryOperator: aTSNode ofKind: aClass [

	| fastEntity |
	self onNextContextDo: [ :contextEntry |
			contextEntry
				add: 'leftOperand' asAliasOfField: 'left';
				add: 'rightOperand' asAliasOfField: 'right' ].

	fastEntity := self createEntityForNode: aTSNode.
	
	"TreeSitter does not seems to manage operator. See: https://github.com/tree-sitter/tree-sitter-python/issues/328
	So I try to het this property manually."
	fastEntity operator: (fastEntity sourceText copyFrom: fastEntity leftOperand endPos + 1 to: fastEntity rightOperand startPos - 1) trim.

	^ fastEntity
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitAssignment: aTSNode [

	self onNextContextDo: [ :contextEntry |
			contextEntry
				add: 'variable' asAliasOfField: 'left';
				add: 'expression' asAliasOfField: 'right' ].

	^ self createEntityForNode: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitBinaryOperator: aTSNode [

	^ self manageBinaryOperator: aTSNode ofKind: FASTPyBinaryOperator
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitBooleanOperator: aTSNode [

	^ self manageBinaryOperator: aTSNode ofKind: FASTPyBooleanOperator
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitComparisonOperator: aTSNode [

	| fastEntity |
	self onNextContextDo: [ :contextEntry | contextEntry add: 'operands' asAliasOfField: '<unnamedChild>' ].
	
	fastEntity := self createEntityForNode: aTSNode.
	
	"The node does not gives us the operators so we try to get them ourselves."
	fastEntity operators:
		(fastEntity operands overlappingPairsCollect: [ :operand1 :operand2 | (fastEntity sourceText copyFrom: operand1 endPos + 1 to: operand2 startPos - 1) trim ]).

	^ fastEntity
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitFalse: aNode [

	^ self createEntityForNode: aNode kind: FASTPyBoolean
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitFunctionDefinition: aNode [
	"TreeSitter has the same nodes for method and function definitions but in FAST we want to disambiguate."

	| definition |
	definition := (context anySatisfy: [ :entry | entry fastEntity isClassDefinition ])
		  ifTrue: [ self createEntityForNode: aNode kind: FASTPyMethodDefinition ]
		  ifFalse: [ self createEntityForNode: aNode kind: FASTPyFunctionDefinition ]
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitIdentifier: aNode [

	"If we are in a field `name` then we are probably in a definition of an entity and we set my content as a name."
	(context anySatisfy: [ :entry |
			 entry field = #name and: [
					 { FASTPyMethodDefinition. FASTPyClassDefinition. FASTPyFunctionDefinition } anySatisfy: [ :class | entry isOfFASTType: class ] ] ]) ifTrue: [ ^ self topFastEntity name: (self sourceCodeOf: aNode) ].
				
	 "If I am on the left side of an assignation then I am a variable."
	(context anySatisfy: [ :entry | entry field = #left and: [ entry isOfFASTType: FASTPyAssignment ] ]) ifTrue: [
		^ self createEntityForNode: aNode kind: FASTPyVariable ].

	^ self createEntityForNode: aNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitParameters: aNode [
	"For parameters we want one by parameter. Not one node for multiple ones."

	aNode collectNamedChild do: [ :parameterNode |
			| parameter |
			parameter := self createEntityForNode: parameterNode kind: FASTPyParameter parentManagementBlock: [ :entity | self topFastEntity addParameter: entity ].
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

	^ self createEntityForNode: aNode kind: FASTPyBoolean
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitUnaryOperator: aTSNode [

	| fastEntity |
	fastEntity := self createEntityForNode: aTSNode.
	
	"TreeSitter does not seems to manage operator. See: https://github.com/tree-sitter/tree-sitter-python/issues/328"
	fastEntity operator: (fastEntity sourceText copyFrom: fastEntity startPos to: fastEntity argument startPos - 1) trim.

	^ fastEntity
]
