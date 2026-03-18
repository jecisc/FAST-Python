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

{ #category : 'private' }
TSFASTPythonImporter >> handleBinaryOperator: aTSNode ofKind: aClass [

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

{ #category : 'private' }
TSFASTPythonImporter >> handleCollectionNode: aTSNode kind: aFASTClass [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: #initializers ].

	^ self handleNode: aTSNode kind: aFASTClass
]

{ #category : 'private' }
TSFASTPythonImporter >> handleParameterNode: aTSNode name: aString [

	| parameter |
	parameter := self handleNode: aTSNode kind: FASTPyParameter parentBlock: [ :entity | self topFastEntity addParameter: entity ].
	parameter name: aString.
	^ parameter
]

{ #category : 'initialization' }
TSFASTPythonImporter >> initialize [

	super initialize.
	self languageName: 'Py'
]

{ #category : 'testing' }
TSFASTPythonImporter >> isInParameter: aNode [

	^ #( parameters lambda_parameters typed_parameter typed_default_parameter default_parameter ) includes: aNode parent type
]

{ #category : 'visiting - skip' }
TSFASTPythonImporter >> visitAliasedImport: aTSNode [
	"Nothing to do. The visit of my children will take care of things. I use the #raw version since it is what should be used to skip a context level."

	self rawVisitChildren: aTSNode
]

{ #category : 'visiting - skip' }
TSFASTPythonImporter >> visitArgumentList: aTSNode [
	"We skip this node and visit the children directly."

	self rawVisitChildren: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitAsPattern: aTSNode [

	aTSNode parent type = #case_pattern ifTrue: [
			"We are the alias of a case clause."
			| fastEntity children |
			children := aTSNode collectNamedChild.
			"This is ugly code because I skip the case_pattern but I don't have time to do better for now."
			fastEntity := children first collectNamedChild first accept: self.
			fastEntity parentCaseClause alias: (self sourceCodeOf: children second).
			^ fastEntity ].

	self onNextContextDo: [ :entry |
			entry
				add: 'target' asAliasOfField: 'alias';
				aliasUnnamedFieldAs: 'source' ].

	^ self handleNode: aTSNode kind: FASTPyAsPattern
]

{ #category : 'visiting - skip' }
TSFASTPythonImporter >> visitAsPatternTarget: aTSNode [
	"Nothing to do. The visit of my child will take care of things. I use the #raw version since it is what should be used to skip a context level."

	self rawVisitChildren: aTSNode
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitAssertStatement: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: #expressions ].

	^ self handleNode: aTSNode kind: FASTPyAssertStatement
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitAttribute: aTSNode [

	^ self handleNode: aTSNode kind: FASTPyAttributeAccess
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitAwait: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: #expression ].

	^ self handleNode: aTSNode kind: FASTPyAwait
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitBinaryOperator: aTSNode [

	^ self handleBinaryOperator: aTSNode ofKind: FASTPyBinaryOperator
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitBlock: aTSNode [
	"I should be simplified a little bit when the importer will be stable."

	(context top isOfFASTType: FASTPyMatchStatement) ifTrue: [
		^ self rawVisitChildren: aTSNode "In case of a match, we only have case_clause inside and nothing else so we skip the block node." ].

	self onNextContextDo: [ :contextEntry | contextEntry aliasUnnamedFieldAs: 'statements' ].

	aTSNode parent type = #else_clause ifTrue: [
		^ self handleNode: aTSNode kind: FASTPyElseClause parentBlock: [ :entity | self topFastEntity elseClause: entity ] ].

	((context top isOfFASTType: FASTPyIfStatement) and: [ context top field = #consequence ]) ifTrue: [ ^ self handleNode: aTSNode kind: FASTPyThenClause ].

	({
		 FASTPyElifClause.
		 FASTPyWithStatement.
		 FASTPyTryStatement.
		 FASTPyExceptClause.
		 FASTPyCaseClause } anySatisfy: [ :type | context top isOfFASTType: type ]) ifTrue: [
			self setTopFieldTo: #statements. "We manually update the field to bypass the block and"
			^ self rawVisitChildren: aTSNode ].

	^ self handleNode: aTSNode kind: FASTPyBlock
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitBooleanOperator: aTSNode [

	^ self handleBinaryOperator: aTSNode ofKind: FASTPyBooleanOperator
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitCall: aTSNode [

	self onNextContextDo: [ :entry | entry add: 'callee' asAliasOfField: 'function' ].

	^ self handleNode: aTSNode kind: FASTPyCall
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitCaseClause: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: 'pattern' ].

	^ self handleNode: aTSNode kind: FASTPyCaseClause parentBlock: [ :entity | self topFastEntity addCase: entity ]
]

{ #category : 'visiting - skip' }
TSFASTPythonImporter >> visitCasePattern: aTSNode [
	"We skip this node to put the content in the case_clause."

	^ self rawVisitChildren: aTSNode
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitClassDefinition: aNode [

	self onNextContextDo: [ :entry | entry add: 'statementBlock' asAliasOfField: 'body' ].

	^ self handleNode: aNode kind: FASTPyClassDefinition
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitClassPattern: aNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: #elements ].

	^ self handleNode: aNode kind: FASTPyClassPattern
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitComment: aTSNode [

	^ self handleNode: aTSNode parentBlock: [ :entity | self topFastEntity addComment: entity ]
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitComparisonOperator: aTSNode [

	| fastEntity |
	self onNextContextDo: [ :contextEntry | contextEntry aliasUnnamedFieldAs: 'operands' ].

	fastEntity := self handleNode: aTSNode. "The node does not gives us the operators so we try to get them ourselves."
	fastEntity operators:
		(fastEntity operands overlappingPairsCollect: [ :operand1 :operand2 | (fastEntity sourceText copyFrom: operand1 endPos + 1 to: operand2 startPos - 1) trim ])
			asArray.

	^ fastEntity
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitComplexPattern: aTSNode [

	| fastEntity |
	fastEntity := self instantiateFastEntity: FASTPyBinaryOperator from: aTSNode.

	self setParentOf: fastEntity.

	self pushContext: fastEntity node: aTSNode during: [
			"The TS node has no field for this node but we have 2 concepts in the nodes: the left and the right."
			self setTopFieldTo: 'leftOperand'.
			(aTSNode namedChildAt: 1) accept: self.
			self setTopFieldTo: 'rightOperand'.
			(aTSNode namedChildAt: 2) accept: self ].
		
	fastEntity operator: (fastEntity sourceText copyFrom: fastEntity leftOperand endPos + 1 to: fastEntity rightOperand startPos - 1) trim.

	^ fastEntity
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitComprehension: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: 'clauses' ].

	^ self handleNode: aTSNode
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitConcatenatedString: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: #strings ].

	^ self handleNode: aTSNode kind: FASTPyConcatenatedString
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
TSFASTPythonImporter >> visitDecoratedDefinition: aTSNode [
	"We do not wish to create a node for a decorated_definition. The node will always have an unnamed field containing the decorators and a definition field with the definition."

	| fastEntity definitionNode |
	definitionNode := aTSNode detectChildWithFieldName: 'definition'.
	fastEntity := definitionNode accept: self.

	self pushContext: fastEntity node: definitionNode during: [
			self setTopFieldTo: 'decorators'.
			(aTSNode collectFieldNameOfNamedChild at: '<unnamedChild>') asTSNodes do: [ :node | node accept: self ] ].

	^ fastEntity
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitDecorator: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: #expression ].

	^ self handleNode: aTSNode kind: FASTPyDecorator
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitDefaultParameter: aTSNode [

	| children parameter |
	children := aTSNode collectNamedChild.
	parameter := children first accept: self.
	
	"We want the positions of the full parameter."
	parameter startPos: (self characterPositionAtByte: aTSNode startByte) + 1.
	parameter endPos: (self characterPositionAtByte: aTSNode endByte).

	self pushContext: parameter node: aTSNode during: [
			self setTopFieldTo: 'defaultValue'.
			children second accept: self ].

	^ parameter
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitDeleteStatement: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: #expression ].

	^ self handleNode: aTSNode kind: FASTPyDeleteStatement
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitDictPattern: aTSNode [
	"We do not want something specific for dict pattern, we just want to create a dictionary."

	| fastEntity |
	fastEntity := self instantiateFastEntity: FASTPyDictionary from: aTSNode.
	self setParentOf: fastEntity.

	self pushContext: fastEntity node: aTSNode during: [
			| children |
			children := aTSNode collectFieldNameOfNamedChild.
			self setTopFieldTo: 'initializers'.
			children at: #key ifPresent: [ :keys |
					children at: #value ifPresent: [ :values |
							keys asTSNodes with: values asTSNodes do: [ :key :value |
									| pair |
									pair := self instantiateFastEntity: FASTPyPair from: key.
									pair endPos: (self characterPositionAtByte: value endByte).
									fastEntity addInitializer: pair.
									self pushContext: pair node: key during: [
											self setTopFieldTo: 'key'.
											key accept: self.
											self setTopFieldTo: 'value'.
											value accept: self ] ] ] ].
			children at: '<unnamedChild>' ifPresent: [ :splats | splats asTSNodes do: [ :node | node accept: self ] ] ].

	^ fastEntity
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitDictionary: aTSNode [

	^ self handleCollectionNode: aTSNode kind: FASTPyDictionary
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitDictionaryComprehension: aTSNode [

	^ self visitComprehension: aTSNode
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitDictionarySplat: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: 'expression' ].

	^ self handleNode: aTSNode kind: FASTPyDictionarySplat
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitDictionarySplatPattern: aTSNode [
	"In case we are a parameter we skip the children because it always is an identifier"

	(self isInParameter: aTSNode) ifTrue: [
			| fastEntity |
			fastEntity := self instantiateFastEntity: FASTPyDictionarySplatParameter from: aTSNode.
			self topFastEntity addParameter: fastEntity.
			fastEntity name: (self sourceCodeOf: aTSNode collectNamedChild anyOne).
			^ fastEntity ].

	^ self handleNode: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitDottedName: aTSNode [

	| fastEntity |

	"In case it is in the `name` field of an import, we create an ImportedEntity."
	(context anySatisfy: [ :entry | entry field = #name and: [ entry isOfFASTType: FASTPyImport ] ]) ifTrue: [
			"For the souce anchor, if the parent is an alias, we want to include it in the imported entity source."
			fastEntity := self instantiateFastEntity: FASTPyImportedEntity from: (aTSNode parent type = #aliased_import
					               ifTrue: [ aTSNode parent ]
					               ifFalse: [ aTSNode ]).
			self topFastEntity addImportedEntity: fastEntity.
			
			"Instead of saving a collection of FASTPyIdentifier, we save in a property the segments of the imported entity."
			fastEntity segments: (aTSNode namedChildren collect: [ :child | self sourceCodeOf: child ]).
			^ fastEntity ].
		
	"In a relative import, I add my parts in the list of segments."
	(aTSNode parent type = #relative_import) ifTrue: [  ^ self topFastEntity fromModule addSegments: ((self sourceCodeOf: aTSNode) splitOn: $.) ].
	
	"In case it is in the `module_name` field of an import, we create a FromImportModule."
	(context anySatisfy: [ :entry | (entry isOfFASTType: FASTPyImportFromStatement) and: [ entry field = #module_name ] ]) ifTrue: [
			"For the souce anchor, if the parent is an alias, we want to include it in the imported entity source."
			fastEntity := self instantiateFastEntity: FASTPyFromModule from: aTSNode.
			self topFastEntity fromModule: fastEntity.
			
			"Instead of saving a collection of FASTPyIdentifier, we save in a property the segments of the imported entity."
			fastEntity segments: (aTSNode namedChildren collect: [ :child | self sourceCodeOf: child ]).
			^ fastEntity ].
		
	"In the general case, I do not create children nodes. Only having a collection of the names is enought I think."
	fastEntity := self instantiateFastEntity: FASTPyDottedName from: aTSNode.
	self setParentOf: fastEntity.
	fastEntity identifiers: (aTSNode namedChildren collect: [ :child | self sourceCodeOf: child ]).

	^ fastEntity 
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitElifClause: aTSNode [

	^ self handleNode: aTSNode kind: FASTPyElifClause parentBlock: [ :entity | self topFastEntity addElifClause: entity ]
]

{ #category : 'visiting - skip' }
TSFASTPythonImporter >> visitElseClause: aTSNode [

	self rawVisitChildren: aTSNode
]

{ #category : 'visiting - error' }
TSFASTPythonImporter >> visitEscapedInterpolation: aTSNode [

	self error: 'We sould never finish here because we took the decision of not representing them and the node visit should be skipped in #visitStringContent:.'
]

{ #category : 'visiting - error' }
TSFASTPythonImporter >> visitEscapedSequence: aTSNode [

	self error: 'We sould never finish here because we took the decision of not representing them and the node visit should be skipped in #visitStringContent:.'
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitExceptClause: aTSNode [

	^ self handleNode: aTSNode kind: FASTPyExceptClause parentBlock: [ :entity | self topFastEntity addExcept: entity ]
]

{ #category : 'visiting - redirect' }
TSFASTPythonImporter >> visitExpressionList: aTSNode [
	"We considere expression lists are tuples."

	^ self visitTuple: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitFalse: aNode [

	^ self handleNode: aNode kind: FASTPyBoolean
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitFormatSpecifier: aTSNode [

	^ self topFastEntity formatSpecifier: (self sourceCodeOf: aTSNode) allButFirst "We skip the $: character"
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitFunctionDefinition: aNode [
	"TreeSitter has the same nodes for method and function definitions but in FAST we want to disambiguate."

	self onNextContextDo: [ :contextEntry |
			contextEntry
				add: 'statementBlock' asAliasOfField: 'body';
				add: 'returnType' asAliasOfField: 'return_type' ].

	^ (context anySatisfy: [ :entry | entry fastEntity isClassDefinition ])
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

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitGlobalStatement: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: 'variables' ].

	^ self handleNode: aTSNode kind: FASTPyGlobalStatement
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitIdentifier: aNode [

	(self isInParameter: aNode) ifTrue: [ ^ self handleParameterNode: aNode name: (self sourceCodeOf: aNode) ]. "If we are in a field `name` then we are probably in a definition of an entity and we set my content as a name."
	(context anySatisfy: [ :entry |
			 entry field = #name and: [
					 {
						 FASTPyMethodDefinition.
						 FASTPyClassDefinition.
						 FASTPyFunctionDefinition.
						 FASTPyKeywordArgument } anySatisfy: [ :class | entry isOfFASTType: class ] ] ]) ifTrue: [ ^ self topFastEntity name: (self sourceCodeOf: aNode) ]. "If I am on the left side of an assignation then I am a variable."
	(context top field = #left and: [ context top isOfFASTType: FASTPyAssignment ]) ifTrue: [ ^ self handleNode: aNode kind: FASTPyVariable ]. "In case we are in an alias, we edit the property alias of the last imported entity"
	aNode parent type = #aliased_import ifTrue: [ ^ self topFastEntity importedEntities last alias: (self sourceCodeOf: aNode) ]. "Those statements points a variable"
	((context top isOfFASTType: FASTPyGlobalStatement) or: [ context top isOfFASTType: FASTPyNonlocalStatement ]) ifTrue: [
		^ self handleNode: aNode kind: FASTPyVariable ].

	^ self handleNode: aNode
]

{ #category : 'visiting - skip' }
TSFASTPythonImporter >> visitIfClause: aTSNode [
	"The condition always goes in the condition property."

	| oldField |
	oldField := context top field.
	self setTopFieldTo: 'condition'.
	self rawVisitChildren: aTSNode.
	self setTopFieldTo: oldField
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitIfStatement: aTSNode [

	self onNextContextDo: [ :entry | entry add: 'thenClause' asAliasOfField: 'consequence' ].

	^ self handleNode: aTSNode kind: FASTPyIfStatement
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitImportFromStatement: aTSNode [

	self onNextContextDo: [ :entry |
			entry
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

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitImportStatement: aTSNode [

	self onNextContextDo: [ :entry | entry add: 'importedEntities' asAliasOfField: 'name' ].

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
TSFASTPythonImporter >> visitKeywordPattern: aTSNode [

	| fastEntity |
	fastEntity := self instantiateFastEntity: FASTPyKeywordPattern from: aTSNode.

	self setParentOf: fastEntity.

	self pushContext: fastEntity node: aTSNode during: [
			| children |
			children := aTSNode collectNamedChild.
			fastEntity name: (self sourceCodeOf: children first).
			self setTopFieldTo: 'value'.
			children second accept: self ].

	^ fastEntity
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitLambda: aTSNode [

	self onNextContextDo: [ :entry | entry add: 'expression' asAliasOfField: 'body' ].

	^ self handleNode: aTSNode kind: FASTPyLambda
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitLambdaParameters: aNode [

	^ self visitParameters: aNode
]

{ #category : 'visiting - skip' }
TSFASTPythonImporter >> visitLineContinuation: aTSNode [
	"We do not represent that in FAST, at least for the moment. So I skip this node and act as if the children were in my parent."

	^ self rawVisitChildren: aTSNode
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitList: aTSNode [

	^ self handleCollectionNode: aTSNode kind: FASTPyList
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitListComprehension: aTSNode [

	^ self visitComprehension: aTSNode
]

{ #category : 'visiting - redirect' }
TSFASTPythonImporter >> visitListPattern: aTSNode [

	^ self visitList: aTSNode
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitListSplat: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: 'expression' ].

	^ self handleNode: aTSNode kind: FASTPyListSplat
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitListSplatPattern: aTSNode [
	"In case we are a parameter we skip the children because it always is an identifier"

	(self isInParameter: aTSNode) ifTrue: [
			| fastEntity |
			fastEntity := self instantiateFastEntity: FASTPyListSplatParameter from: aTSNode.
			self topFastEntity addParameter: fastEntity.
			fastEntity name: (self sourceCodeOf: aTSNode collectNamedChild anyOne).
			^ fastEntity ].

	^ self handleNode: aTSNode
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitModule: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: 'statements' ].

	^ self handleNode: aTSNode kind: FASTPyModule
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitNonlocalStatement: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: 'variables' ].

	^ self handleNode: aTSNode kind: FASTPyNonlocalStatement
]

{ #category : 'visiting - skip' }
TSFASTPythonImporter >> visitParameters: aNode [
	"For parameters we want one by parameter. Not one node for multiple ones."

	^ self rawVisitChildren: aNode
]

{ #category : 'visiting - skip' }
TSFASTPythonImporter >> visitParenthesizedExpression: aTSNode [
	"We do not represent that in FAST, at least for the moment. So I skip this node and act as if the children were in my parent."

	^ self rawVisitChildren: aTSNode
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitPatternList: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: 'elements' ].

	^ self handleNode: aTSNode kind: FASTPyPatternList
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitPrintStatement: aTSNode [

	self onNextContextDo: [ :entry | entry add: #expressions asAliasOfField: 'argument' ].

	^ self handleNode: aTSNode kind: FASTPyPrintStatement
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitRaiseStatement: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: #exception ].

	^ self handleNode: aTSNode kind: FASTPyRaiseStatement
]

{ #category : 'visiting - skip' }
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

	^ self handleCollectionNode: aTSNode kind: FASTPySet
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitSetComprehension: aTSNode [

	^ self visitComprehension: aTSNode
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitSlice: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: 'components' ].

	^ self handleNode: aTSNode kind: FASTPySlice
]

{ #category : 'visiting - redirect' }
TSFASTPythonImporter >> visitSplatPattern: aTSNode [

	^ ((self sourceCodeOf: aTSNode) beginsWith: '**')
		  ifTrue: [ self visitDictionarySplat: aTSNode ]
		  ifFalse: [ self visitListSplat: aTSNode ]
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitStatement: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: #expression ].

	^ self handleNode: aTSNode
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitString: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: #interpolations ].

	^ self handleNode: aTSNode kind: FASTPyString
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

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitSubscript: aTSNode [

	self onNextContextDo: [ :entry | entry add: #indices asAliasOfField: 'subscript' ].

	^ self handleNode: aTSNode kind: FASTPySubscript
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitTrue: aNode [

	^ self handleNode: aNode kind: FASTPyBoolean
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitTuple: aTSNode [

	^ self handleCollectionNode: aTSNode kind: FASTPyTuple
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitTupleExpression: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: #initializers ].

	^ self handleNode: aTSNode kind: FASTPyTuple
]

{ #category : 'visiting - redirect' }
TSFASTPythonImporter >> visitTuplePattern: aTSNode [

	^ self visitTuple: aTSNode
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitType: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: #expression ].

	^ self handleNode: aTSNode kind: FASTPyType
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitTypedDefaultParameter: aTSNode [

	| children parameter |
	children := aTSNode collectNamedChild.
	parameter := children first accept: self.
	
	"We want the positions of the full parameter."
	parameter startPos: (self characterPositionAtByte: aTSNode startByte) + 1.
	parameter endPos: (self characterPositionAtByte: aTSNode endByte).

	self pushContext: parameter node: aTSNode during: [
			self setTopFieldTo: 'type'.
			children second accept: self.
			self setTopFieldTo: 'defaultValue'.
			children third accept: self ].

	^ parameter
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitTypedParameter: aTSNode [

	| children parameter |
	children := aTSNode collectNamedChild.
	parameter := children first accept: self.
	
	"We want the positions of the full parameter."
	parameter startPos: (self characterPositionAtByte: aTSNode startByte) + 1.
	parameter endPos: (self characterPositionAtByte: aTSNode endByte).

	self pushContext: parameter node: aTSNode during: [
			self setTopFieldTo: 'type'.
			children second accept: self ].

	^ parameter
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitUnaryOperator: aTSNode [

	| fastEntity |
	fastEntity := self handleNode: aTSNode.
	
	"TreeSitter does not seems to manage operator. See: https://github.com/tree-sitter/tree-sitter-python/issues/328"
	fastEntity operator: (fastEntity sourceText copyFrom: fastEntity startPos to: fastEntity argument startPos - 1) trim.

	^ fastEntity
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitUnionPattern: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: #members ].

	^ self handleNode: aTSNode kind: FASTPyUnionPattern
]

{ #category : 'visiting' }
TSFASTPythonImporter >> visitWildcardImport: aTSNode [

	| fastEntity |
	fastEntity := self instantiateFastEntity: FASTPyImportedEntity from: aTSNode.
	self topFastEntity addImportedEntity: fastEntity.
	fastEntity segments: { '*' }.
	^ fastEntity
]

{ #category : 'visiting - skip' }
TSFASTPythonImporter >> visitWithClause: aTSNode [
	"Nothing to do. The visit of my child will take care of things. I use the #raw version since it is what should be used to skip a context level."

	self rawVisitChildren: aTSNode
]

{ #category : 'visiting - skip' }
TSFASTPythonImporter >> visitWithItem: aTSNode [
	"Nothing to do. The visit of my child will take care of things. I use the #raw version since it is what should be used to skip a context level."

	self rawVisitChildren: aTSNode
]

{ #category : 'visiting - alias' }
TSFASTPythonImporter >> visitWithStatement: aTSNode [

	self onNextContextDo: [ :entry | entry aliasUnnamedFieldAs: 'items' ].

	^ self handleNode: aTSNode kind: FASTPyWithStatement
]
