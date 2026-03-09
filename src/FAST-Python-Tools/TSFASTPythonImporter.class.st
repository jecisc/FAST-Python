Class {
	#name : 'TSFASTPythonImporter',
	#superclass : 'TSFASTCustomizableImporter',
	#category : 'FAST-Python-Tools',
	#package : 'FAST-Python-Tools'
}

{ #category : 'class initialization' }
TSFASTPythonImporter class >> initialize [
	"For now we use the bleeding edge"

	TSLibrariesPython gitBranchToUse: 'master'
]

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

	fastEntity := self handleNode: aTSNode.
	
	"TreeSitter does not seems to manage operator. See: https://github.com/tree-sitter/tree-sitter-python/issues/328
	So I try to het this property manually."
	fastEntity operator: (fastEntity sourceText copyFrom: fastEntity leftOperand endPos + 1 to: fastEntity rightOperand startPos - 1) trim.

	^ fastEntity
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitAliasedImport: aTSNode [
	"Nothing to do. The visit of my children will take care of things. I use the #raw version since it is what should be used to skip a context level."

	self rawVisitChildren: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitArgumentList: aTSNode [
	"We skip this node and visit the children directly."

	self rawVisitChildren: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitAssertStatement: aTSNode [

	^ self visitStatement: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitAssignment: aTSNode [

	self onNextContextDo: [ :contextEntry |
		self flag: #todo.
			contextEntry
				"add: 'variable' asAliasOfField: 'left';" 
				add: 'expression' asAliasOfField: 'right' ].

	^ self handleNode: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitAttribute: aTSNode [

	^ self handleNode: aTSNode kind: FASTPyAttributeAccess
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitBinaryOperator: aTSNode [

	^ self manageBinaryOperator: aTSNode ofKind: FASTPyBinaryOperator
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitBlock: aTSNode [

	self onNextContextDo: [ :contextEntry | contextEntry add: 'statements' asAliasOfField: '<unnamedChild>' ].

	aTSNode parent type = #else_clause ifTrue: [
		^ self handleNode: aTSNode kind: FASTPyElseClause parentBlock: [ :entity | self topFastEntity elseClause: entity ] ].

	((context top isOfFASTType: FASTPyIfStatement) and: [ context top field = #consequence ]) ifTrue: [ ^ self handleNode: aTSNode kind: FASTPyThenClause ].

	(context top isOfFASTType: FASTPyElifClause) ifTrue: [ self setTopFieldTo: #statements. "We manually update the field to bypass the block and" ^ self rawVisitChildren: aTSNode ].

	^ self handleNode: aTSNode kind: FASTPyBlock
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitBooleanOperator: aTSNode [

	^ self manageBinaryOperator: aTSNode ofKind: FASTPyBooleanOperator
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitCall: aTSNode [

	self onNextContextDo: [ :entry | entry add: 'callee' asAliasOfField: 'function' ].

	^ self handleNode: aTSNode kind: FASTPyCall
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitCollection: aTSNode [

	self onNextContextDo: [ :entry | entry add: #initializers asAliasOfField: '<unnamedChild>' ].

	^ self handleNode: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitComment: aTSNode [

	self flag: #todo. "Manage to put the right trait on entities containing me and change the block."
	^ self handleNode: aTSNode parentBlock: [ :entity | self topFastEntity addGenericChild: entity ]
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitComparisonOperator: aTSNode [

	| fastEntity |
	self onNextContextDo: [ :contextEntry | contextEntry add: 'operands' asAliasOfField: '<unnamedChild>' ].
	
	fastEntity := self handleNode: aTSNode.
	
	"The node does not gives us the operators so we try to get them ourselves."
	fastEntity operators:
		(fastEntity operands overlappingPairsCollect: [ :operand1 :operand2 | (fastEntity sourceText copyFrom: operand1 endPos + 1 to: operand2 startPos - 1) trim ]) asArray.

	^ fastEntity
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitComprehension: aTSNode [

	self onNextContextDo: [ :entry | entry add: 'clauses' asAliasOfField: '<unnamedChild>' ].

	^ self handleNode: aTSNode 
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitConditionalExpression: aTSNode [

	| fastEntity |
	fastEntity := self instantiateFastEntity: FASTPyConditionalExpression from: aTSNode.

	self setParentOf: fastEntity.

	self
		pushContext: fastEntity
		node: aTSNode
		during: [ "The TS node has no field for this node but we have 3 concepts in the nodes: the first is the #thenExpression, the second the #condition and the third the #elseExpression. None is optional and in FAST we want to distinguish them. So we set a field by hand."
				self setTopFieldTo: 'thenExpression'.
				(aTSNode namedChildAt: 1) accept: self.
				self setTopFieldTo: 'condition'.
				(aTSNode namedChildAt: 2) accept: self.
				self setTopFieldTo: 'elseExpression'.
				(aTSNode namedChildAt: 3) accept: self ].

	^ fastEntity
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitDeleteStatement: aTSNode [

	self onNextContextDo: [ :entry | entry add: #expression asAliasOfField: '<unnamedChild>' ].

	^ self handleNode: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitDictionary: aTSNode [

	^ self visitCollection: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitDictionaryComprehension: aTSNode [

	^ self visitComprehension: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitDottedName: aTSNode [

	"In case it is in the `name` field of an import, we create an ImportedEntity."
	(context anySatisfy: [ :entry | entry field = #name and: [ entry isOfFASTType: FASTPyImport ] ]) ifTrue: [
			| fastEntity |
			"For the souce anchor, if the parent is an alias, we want to include it in the imported entity source."
			fastEntity := self instantiateFastEntity: FASTPyImportedEntity from: (aTSNode parent type = #aliased_import
					               ifTrue: [ aTSNode parent ]
					               ifFalse: [ aTSNode ]).
			self setParentOf: fastEntity.
			
			"Instead of saving a collection of FASTPyIdentifier, we save in a property the segments of the imported entity."
			fastEntity segments: (aTSNode namedChildren collect: [ :child | self sourceCodeOf: child ]).
			^ fastEntity ].
		
		
	"In a relative import, I add my parts in the list of segments."
	(aTSNode parent type = #relative_import) ifTrue: [  ^ self topFastEntity fromModule addSegments: ((self sourceCodeOf: aTSNode) splitOn: $.) ].
	
	"In case it is in the `module_name` field of an import, we create a FromImportModule."
	(context anySatisfy: [ :entry | (entry isOfFASTType: FASTPyImportFromStatement) and: [ entry field = #module_name ] ]) ifTrue: [
			| fastEntity |
			"For the souce anchor, if the parent is an alias, we want to include it in the imported entity source."
			fastEntity := self instantiateFastEntity: FASTPyFromModule from: aTSNode.
			self setParentOf: fastEntity.
			
			"Instead of saving a collection of FASTPyIdentifier, we save in a property the segments of the imported entity."
			fastEntity segments: (aTSNode namedChildren collect: [ :child | self sourceCodeOf: child ]).
			^ fastEntity ].

	^ self handleNode: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitElifClause: aTSNode [

	^ self handleNode: aTSNode kind: FASTPyElifClause parentBlock: [ :entity | self topFastEntity addElifClause: entity ]
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitElseClause: aTSNode [

	self rawVisitChildren: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitExpressionList: aTSNode [

	self onNextContextDo: [ :entry | entry add: 'expressions' asAliasOfField: '<unnamedChild>' ].

	^ self handleNode: aTSNode kind: FASTPyExpressionList
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitFalse: aNode [

	^ self handleNode: aNode kind: FASTPyBoolean
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitFunctionDefinition: aNode [
	"TreeSitter has the same nodes for method and function definitions but in FAST we want to disambiguate."

	| definition |
	self onNextContextDo: [ :contextEntry | contextEntry add: 'statementBlock' asAliasOfField: 'body' ].

	definition := (context anySatisfy: [ :entry | entry fastEntity isClassDefinition ])
		              ifTrue: [ self handleNode: aNode kind: FASTPyMethodDefinition ]
		              ifFalse: [ self handleNode: aNode kind: FASTPyFunctionDefinition ]
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitFutureImportStatement: aTSNode [
	"We treat future import as an import from statement"

	| fastEntity |
	fastEntity := self visitImportFromStatement: aTSNode.

	fastEntity fromModule: ((self instantiateFastEntity: FASTPyFromModule from: aTSNode)
			 segments: { '__future__' };
			 yourself).

	^ fastEntity
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitGeneratorExpression: aTSNode [

	^ self visitComprehension: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitGlobalStatement: aTSNode [

	self onNextContextDo: [ :contextEntry | contextEntry add: 'variable' asAliasOfField: '<unnamedChild>' ].

	^ self handleNode: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitIdentifier: aNode [

	"If we are in a field `name` then we are probably in a definition of an entity and we set my content as a name."
	(context anySatisfy: [ :entry |
			 entry field = #name and: [
					 { FASTPyMethodDefinition. FASTPyClassDefinition. FASTPyFunctionDefinition. FASTPyKeywordArgument } anySatisfy: [ :class | entry isOfFASTType: class ] ] ]) ifTrue: [ ^ self topFastEntity name: (self sourceCodeOf: aNode) ].
				
	 "If I am on the left side of an assignation then I am a variable."
	(context anySatisfy: [ :entry | entry field = #left and: [ entry isOfFASTType: FASTPyAssignment ] ]) ifTrue: [
		^ self handleNode: aNode kind: FASTPyVariable ].
	
	"In case we are in an alias, we edit the property alias of the last imported entity"
	(aNode parent type = #aliased_import) ifTrue: [ ^ self topFastEntity importedEntities last alias: (self sourceCodeOf: aNode) ].

	"Those statements points a variable"
	((context top isOfFASTType: FASTPyGlobalStatement) or: [ context top isOfFASTType: FASTPyNonlocalStatement ])
		 ifTrue:  [ ^self handleNode: aNode kind: FASTPyVariable ].
		
	(context top field = #attribute and: [ context top isOfFASTType: FASTPyAttributeAccess ]) ifTrue: [ ^ self handleNode: aNode kind: FASTPyVariable ].
	
	^ self handleNode: aNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitIfClause: aTSNode [

	self onNextContextDo: [ :entry | entry add: 'expression' asAliasOfField: '<unnamedChild>' ].

	^ self handleNode: aTSNode kind: FASTPyIfClause
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitIfStatement: aTSNode [

	self onNextContextDo: [ :contextEntry | contextEntry add: 'thenClause' asAliasOfField: 'consequence' ].

	^ self handleNode: aTSNode kind: FASTPyIfStatement
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitImportFromStatement: aTSNode [

	self onNextContextDo: [ :contextEntry |
			contextEntry
				add: 'importedEntities' asAliasOfField: 'name';
				add: 'fromModule' asAliasOfField: 'module_name' ].

	^ self handleNode: aTSNode kind: FASTPyImportFromStatement
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitImportPrefix: aTSNode [

	| fastEntity |
	fastEntity := self handleNode: aTSNode kind: FASTPyFromModule.
	fastEntity segments: { (self sourceCodeOf: aTSNode) }.
	^ fastEntity
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitImportStatement: aTSNode [

	self onNextContextDo: [ :contextEntry | contextEntry add: 'importedEntities' asAliasOfField: 'name' ].

	^ self handleNode: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitInteger: aTSNode [
	"In python we have integers and complex numbers.
	A Complex ends with a j"

	^ self handleNode: aTSNode kind: ((self sourceCodeOf: aTSNode) last isLetter
			   ifTrue: [ FASTPyComplex ]
			   ifFalse: [ FASTPyInteger ])
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitLambda: aTSNode [

	self onNextContextDo: [ :entry | entry add: 'expression' asAliasOfField: 'body' ].

	^ self handleNode: aTSNode kind: FASTPyLambda
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitLambdaParameters: aNode [

	^ self visitParameters: aNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitLineContinuation: aTSNode [
	"We do not represent that in FAST, at least for the moment. So I skip this node and act as if the children were in my parent."

	^ self rawVisitChildren: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitList: aTSNode [

	^ self visitCollection: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitListComprehension: aTSNode [

	^ self visitComprehension: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitListSplat: aTSNode [

	self onNextContextDo: [ :entry | entry add: #iterable asAliasOfField: '<unnamedChild>' ].

	^ self handleNode: aTSNode kind: FASTPyListSplat
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitModule: aTSNode [

	self onNextContextDo: [ :entry | entry add: 'statements' asAliasOfField: '<unnamedChild>' ].

	^ self handleNode: aTSNode kind: FASTPyModule
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitNonlocalStatement: aTSNode [

	self onNextContextDo: [ :contextEntry | contextEntry add: 'variable' asAliasOfField: '<unnamedChild>' ].

	^ self handleNode: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitParameters: aNode [
	"For parameters we want one by parameter. Not one node for multiple ones.
	
	Maybe we should manage it in the children? TODO: Manage other kind of parameters."

	aNode collectNamedChild do: [ :parameterNode |
			| parameter |
			parameter := self handleNode: parameterNode kind: FASTPyParameter parentBlock: [ :entity | self topFastEntity addParameter: entity ].
			parameter name: parameter sourceCode "This case is pretty straightforward since names are the source code of the parameter." ]
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitParenthesizedExpression: aTSNode [
	"We do not represent that in FAST, at least for the moment. So I skip this node and act as if the children were in my parent."

	^ self rawVisitChildren: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitPatternList: aTSNode [

	self onNextContextDo: [ :entry | entry add: 'elements' asAliasOfField: '<unnamedChild>' ].

	^ self handleNode: aTSNode kind: FASTPyPatternList
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitRelativeImport: aTSNode [
	"Nothing to do. The visit of my children will take care of things. I use the #raw version since it is what should be used to skip a context level."

	self rawVisitChildren: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitReturnStatement: aTSNode [

	^ self visitStatement: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitSet: aTSNode [

	^ self visitCollection: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitSetComprehension: aTSNode [

	^ self visitComprehension: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitSlice: aTSNode [

	self onNextContextDo: [ :entry | entry add: 'components' asAliasOfField: '<unnamedChild>' ].

	^ self handleNode: aTSNode kind: FASTPySlice
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitStatement: aTSNode [

	self onNextContextDo: [ :entry | entry add: #expression asAliasOfField: '<unnamedChild>' ].

	^ self handleNode: aTSNode
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
TSFASTPythonImporter >> visitSubscript: aTSNode [

	self onNextContextDo: [ :entry | entry add: #indices asAliasOfField: 'subscript' ].

	^ self handleNode: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitTrue: aNode [

	^ self handleNode: aNode kind: FASTPyBoolean
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitTuple: aTSNode [

	^ self visitCollection: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitTupleExpression: aTSNode [

	self onNextContextDo: [ :entry | entry add: #initializers asAliasOfField: '<unnamedChild>' ].

	^ self handleNode: aTSNode kind: FASTPyTuple
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitTuplePattern: aTSNode [

	self onNextContextDo: [ :entry | entry add: 'patterns' asAliasOfField: '<unnamedChild>' ].

	^ self handleNode: aTSNode kind: FASTPyTuplePattern
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitUnaryOperator: aTSNode [

	| fastEntity |
	fastEntity := self handleNode: aTSNode.
	
	"TreeSitter does not seems to manage operator. See: https://github.com/tree-sitter/tree-sitter-python/issues/328"
	fastEntity operator: (fastEntity sourceText copyFrom: fastEntity startPos to: fastEntity argument startPos - 1) trim.

	^ fastEntity
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitWildcardImport: aTSNode [

	| fastEntity |
	fastEntity := self instantiateFastEntity: FASTPyImportedEntity from: aTSNode.
	self topFastEntity addImportedEntity: fastEntity.
	fastEntity segments: { '*' }.
	^ fastEntity
]
