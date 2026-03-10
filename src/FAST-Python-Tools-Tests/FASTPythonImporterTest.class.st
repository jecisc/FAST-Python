"
A FASTPythonImporterTest is a test class for testing the behavior of FASTPythonImporter
"
Class {
	#name : 'FASTPythonImporterTest',
	#superclass : 'TestCase',
	#instVars : [
		'importer',
		'fast',
		'stack'
	],
	#category : 'FAST-Python-Tools-Tests',
	#package : 'FAST-Python-Tools-Tests'
}

{ #category : 'test generation' }
FASTPythonImporterTest class >> generateTestNamed: aString fromCode: code [

	^ self generateTestNamed: aString fromCode: code protocol: 'tests'
]

{ #category : 'test generation' }
FASTPythonImporterTest class >> generateTestNamed: aString fromCode: code protocol: protocol [

	(FASTPyImporterTestGenerator testCase: self) generateTestNamed: aString fromCode: code protocol: protocol
]

{ #category : 'class initialization' }
FASTPythonImporterTest class >> initialize [
	"We ensure the installation of the library before running the tests because it could cause a time limit to fails for the test installing the libraries."

	TSLibrariesPython new ensurePythonLibraryExists
]

{ #category : 'test generation' }
FASTPythonImporterTest class >> propertiesToExclude [

	^ #( source startPos endPos )
]

{ #category : 'test generation' }
FASTPythonImporterTest class >> regenerateAllTests [

	<script>
	self methods
		select: [ :method | method hasPragmaNamed: #generated ]
		thenDo: [ :method | self regenerateTest: method selector ]
]

{ #category : 'test generation' }
FASTPythonImporterTest class >> regenerateTest: aSymbol [

	(FASTPyImporterTestGenerator testCase: self) regenerateTest: self >> aSymbol
]

{ #category : 'test generation' }
FASTPythonImporterTest class >> traitsToIgnore [
	"Return a collection of traits to ignore in generated tests."

	^ {
		  FASTTEntity. "Too global."
		  FASTTScopableEntity. "Not used for now?"
		  FASTTBehaviouralEntity. "To Review"
		  FASTTNamedBehaviouralEntity. "To Review"
		  FASTTNamedEntity. "Only brings a property that is already tested."
		  FASTTStatement. "I need to enable this one later but for now I'm not sure how to manage expression statements"
		  TEntityMetaLevelDependency. "Too general"
		  FASTTExpression. "I need to enable this one later but I'm still unsure of how to manage expression statements"
		  FASTPyTDecoratorExpression "Adds too much noise in tests" }
]

{ #category : 'running' }
FASTPythonImporterTest >> importer [

	^ importer ifNil: [ importer := self importerClass new ]
]

{ #category : 'running' }
FASTPythonImporterTest >> importerClass [

	^ self class environment at: (self class name withoutSuffix: 'Test') asSymbol
]

{ #category : 'running' }
FASTPythonImporterTest >> parse: aString [

	^ fast := self importer
		          errorReportBlock: [ :i | i errors ifNotEmpty: [ self fail: 'Errors happened during parsing. Errors: ' , i errors printString ] ];
		          parse: aString withPlatformLineEndings
]

{ #category : 'private' }
FASTPythonImporterTest >> performTest [
	"If an error happens, dump the AST in the message text so that we can have an idea of what is the problem in the logs."

	"[ super performTest ]
		on: Error
		do: [ :failure |
				fast ifNotNil: [ failure messageText: failure messageText , ' FASTDump: ' , (RBParser parseExpression: fast rootEntities anyOne dump) formattedCode ].
				failure pass ]"

	super performTest
]

{ #category : 'running' }
FASTPythonImporterTest >> setUp [

	super setUp.

	stack := Stack new
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testAssertStatement [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testAssertStatement 	"

	self parse: 'def aFunction(a, b):
    assert b != 0'.

	self assert: (fast allWithType: FASTPyAssertStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyParameter) size equals: 2.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def aFunction(a, b):
    assert b != 0' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of multivalued relation parameters"
	self assert: self topEntity parameters size equals: 2.
	
		stack push: (stack top parameters at: 1).
		self assert: self topEntity sourceCode equals: 'a'.
		self assert: (self topEntity isOfType: FASTPyParameter).
		self assert: (self topEntity isOfType: FASTTVariableEntity).
		self assert: self topEntity name equals: 'a'.
		stack pop.
	
		stack push: (stack top parameters at: 2).
		self assert: self topEntity sourceCode equals: 'b'.
		self assert: (self topEntity isOfType: FASTPyParameter).
		self assert: (self topEntity isOfType: FASTTVariableEntity).
		self assert: self topEntity name equals: 'b'.
		stack pop.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'assert b != 0'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'assert b != 0'.
			self assert: (self topEntity isOfType: FASTPyAssertStatement).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: 'b != 0'.
				self assert: (self topEntity isOfType: FASTPyComparisonOperator).
				
				"Testing value of multivalued relation operands"
				self assert: self topEntity operands size equals: 2.
				
					stack push: (stack top operands at: 1).
					self assert: self topEntity sourceCode equals: 'b'.
					self assert: (self topEntity isOfType: FASTPyIdentifier).
					stack pop.
				
					stack push: (stack top operands at: 2).
					self assert: self topEntity sourceCode equals: '0'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					self assert: (self topEntity isOfType: FASTTLiteral).
					self assert: (self topEntity isOfType: FASTTNumericalLiteral).
					stack pop.
				self assert: self topEntity operators equals: #('!=')
]

{ #category : 'tests' }
FASTPythonImporterTest >> testAssignment [

	| assignment |
	self parse: 'x = 1'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyAssignment) size equals: 1.

	assignment := (fast allWithType: FASTPyAssignment) anyOne.
	self assert: assignment sourceCode equals: 'x = 1'.
	self assert: (assignment isOfType: FASTTAssignment).
	self skip. "TODO"
	self assert: assignment variable sourceCode equals: 'x'.
	self assert: assignment expression sourceCode equals: '1'.
	self assert: (assignment variable isOfType: FASTPyVariable).
	self assert: (assignment expression isOfType: FASTPyInteger)
]

{ #category : 'tests - accesses' }
FASTPythonImporterTest >> testAttributeAccess [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testAttributeAccess 	"

	self parse: 'obj.count'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'obj.count'.
	self assert: (self topEntity isOfType: FASTPyAttributeAccess).
	
	"Testing value of monovalue relation attribute"
	self assert: self topEntity attribute isNotNil.

		stack push: self topEntity attribute.
		self assert: self topEntity sourceCode equals: 'count'.
		self assert: (self topEntity isOfType: FASTPyVariable).
		self assert: (self topEntity isOfType: FASTTVariableEntity).
		stack pop.
	
	"Testing value of monovalue relation object"
	self assert: self topEntity object isNotNil.

		stack push: self topEntity object.
		self assert: self topEntity sourceCode equals: 'obj'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - accesses' }
FASTPythonImporterTest >> testAttributeAccessNested [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testAttributeAccessNested 	"

	self parse: 'obj.toto.count'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 2.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 2.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'obj.toto.count'.
	self assert: (self topEntity isOfType: FASTPyAttributeAccess).
	
	"Testing value of monovalue relation attribute"
	self assert: self topEntity attribute isNotNil.

		stack push: self topEntity attribute.
		self assert: self topEntity sourceCode equals: 'count'.
		self assert: (self topEntity isOfType: FASTPyVariable).
		self assert: (self topEntity isOfType: FASTTVariableEntity).
		stack pop.
	
	"Testing value of monovalue relation object"
	self assert: self topEntity object isNotNil.

		stack push: self topEntity object.
		self assert: self topEntity sourceCode equals: 'obj.toto'.
		self assert: (self topEntity isOfType: FASTPyAttributeAccess).
		
		"Testing value of monovalue relation attribute"
		self assert: self topEntity attribute isNotNil.

			stack push: self topEntity attribute.
			self assert: self topEntity sourceCode equals: 'toto'.
			self assert: (self topEntity isOfType: FASTPyVariable).
			self assert: (self topEntity isOfType: FASTTVariableEntity).
			stack pop.
		
		"Testing value of monovalue relation object"
		self assert: self topEntity object isNotNil.

			stack push: self topEntity object.
			self assert: self topEntity sourceCode equals: 'obj'.
			self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - accesses' }
FASTPythonImporterTest >> testAttributeAccessOnString [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testAttributeAccessOnString 	"

	self parse: ''' ''.join'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: ''' ''.join'.
	self assert: (self topEntity isOfType: FASTPyAttributeAccess).
	
	"Testing value of monovalue relation attribute"
	self assert: self topEntity attribute isNotNil.

		stack push: self topEntity attribute.
		self assert: self topEntity sourceCode equals: 'join'.
		self assert: (self topEntity isOfType: FASTPyVariable).
		self assert: (self topEntity isOfType: FASTTVariableEntity).
		stack pop.
	
	"Testing value of monovalue relation object"
	self assert: self topEntity object isNotNil.

		stack push: self topEntity object.
		self assert: self topEntity sourceCode equals: ''' '''.
		self assert: (self topEntity isOfType: FASTPyString).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTStringLiteral)
]

{ #category : 'tests - accesses' }
FASTPythonImporterTest >> testAttributeAccessWithReceiverParenthesised [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testAttributeAccessWithReceiverParenthesised 	"

	self parse: '(obj).attribute'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '(obj).attribute'.
	self assert: (self topEntity isOfType: FASTPyAttributeAccess).
	
	"Testing value of monovalue relation attribute"
	self assert: self topEntity attribute isNotNil.

		stack push: self topEntity attribute.
		self assert: self topEntity sourceCode equals: 'attribute'.
		self assert: (self topEntity isOfType: FASTPyVariable).
		self assert: (self topEntity isOfType: FASTTVariableEntity).
		stack pop.
	
	"Testing value of monovalue relation object"
	self assert: self topEntity object isNotNil.

		stack push: self topEntity object.
		self assert: self topEntity sourceCode equals: 'obj'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - await' }
FASTPythonImporterTest >> testAwait [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testAwait 	"

	self parse: 'await future'.

	self assert: (fast allWithType: FASTPyAwait) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'await future'.
	self assert: (self topEntity isOfType: FASTPyAwait).
	
	"Testing value of monovalue relation expression"
	self assert: self topEntity expression isNotNil.

		stack push: self topEntity expression.
		self assert: self topEntity sourceCode equals: 'future'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - await' }
FASTPythonImporterTest >> testAwaitCall [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testAwaitCall 	"

	self parse: 'await coro_func()'.

	self assert: (fast allWithType: FASTPyAwait) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'await coro_func()'.
	self assert: (self topEntity isOfType: FASTPyAwait).
	
	"Testing value of monovalue relation expression"
	self assert: self topEntity expression isNotNil.

		stack push: self topEntity expression.
		self assert: self topEntity sourceCode equals: 'coro_func()'.
		self assert: (self topEntity isOfType: FASTPyCall).
		self assert: (self topEntity isOfType: FASTTInvocation).
		self assert: (self topEntity isOfType: FASTTWithArguments).
		
		"Testing value of monovalue relation callee"
		self assert: self topEntity callee isNotNil.

			stack push: self topEntity callee.
			self assert: self topEntity sourceCode equals: 'coro_func'.
			self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - operators' }
FASTPythonImporterTest >> testBinaryOperator [

	| operator |
	self parse: '40 + 2'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 1.

	operator := (fast allWithType: FASTPyBinaryOperator) anyOne.
	self assert: operator sourceCode equals: '40 + 2'.
	self assert: (operator isOfType: FASTTBinaryExpression).
	self assert: operator leftOperand sourceCode equals: '40'.
	self assert: (operator leftOperand isOfType: FASTPyInteger).
	self assert: operator rightOperand sourceCode equals: '2'.
	self assert: (operator rightOperand isOfType: FASTPyInteger).
	self assert: operator operator equals: '+'
]

{ #category : 'tests - operators' }
FASTPythonImporterTest >> testBinaryOperatorInBinaryOperator [

	| operator left |
	self parse: '40 + 2 - 0'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 2.

	operator := (fast allWithType: FASTPyBinaryOperator) anyOne.
	self assert: operator sourceCode equals: '40 + 2 - 0'.
	self assert: (operator isOfType: FASTTBinaryExpression).

	self assert: operator operator equals: '-'.
	self assert: operator rightOperand sourceCode equals: '0'.
	self assert: (operator rightOperand isOfType: FASTPyInteger).

	left := operator leftOperand.
	self assert: left sourceCode equals: '40 + 2'.
	self assert: (left isOfType: FASTPyBinaryOperator).
	self assert: (left leftOperand isOfType: FASTPyInteger).
	self assert: (left leftOperand sourceCode) equals: '40'.
	self assert: (left rightOperand sourceCode) equals: '2'.
	self assert: left operator equals: '+'
]

{ #category : 'tests - operators' }
FASTPythonImporterTest >> testBitwiseOperator [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testBitwiseOperator 	"

	self parse: '0b00101101 & 0b00011011'.

	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '0b00101101 & 0b00011011'.
	self assert: (self topEntity isOfType: FASTPyBinaryOperator).
	self assert: (self topEntity isOfType: FASTTBinaryExpression).
	
	"Testing value of monovalue relation leftOperand"
	self assert: self topEntity leftOperand isNotNil.

		stack push: self topEntity leftOperand.
		self assert: self topEntity sourceCode equals: '0b00101101'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral).
		stack pop.
	self assert: self topEntity operator equals: '&'.
	
	"Testing value of monovalue relation rightOperand"
	self assert: self topEntity rightOperand isNotNil.

		stack push: self topEntity rightOperand.
		self assert: self topEntity sourceCode equals: '0b00011011'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - operators' }
FASTPythonImporterTest >> testBooleanOperator [

	| operator |
	self parse: 'True and False'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyBooleanOperator) size equals: 1.

	operator := (fast allWithType: FASTPyBooleanOperator) anyOne.
	self assert: operator sourceCode equals: 'True and False'.
	self assert: (operator isOfType: FASTTBinaryExpression).
	self assert: operator leftOperand sourceCode equals: 'True'.
	self assert: (operator leftOperand isOfType: FASTPyBoolean).
	self assert: operator rightOperand sourceCode equals: 'False'.
	self assert: (operator rightOperand isOfType: FASTPyBoolean).
	self assert: operator operator equals: 'and'
]

{ #category : 'tests - operators' }
FASTPythonImporterTest >> testBooleanOperatorInBooleanOperator [

	| operator left |
	self parse: 'True and True or False'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyBooleanOperator) size equals: 2.

	operator := (fast allWithType: FASTPyBooleanOperator) anyOne.
	self assert: operator sourceCode equals: 'True and True or False'.
	self assert: (operator isOfType: FASTTBinaryExpression).

	self assert: operator operator equals: 'or'.
	self assert: operator rightOperand sourceCode equals: 'False'.
	self assert: (operator rightOperand isOfType: FASTPyBoolean).

	left := operator leftOperand.
	self assert: left sourceCode equals: 'True and True'.
	self assert: (left isOfType: FASTPyBooleanOperator).
	self assert: (left leftOperand isOfType: FASTPyBoolean).
	self assert: (left leftOperand sourceCode) equals: 'True'.
	self assert: (left rightOperand sourceCode) equals: 'True'.
	self assert: left operator equals: 'and'
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testBreakStatement [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testBreakStatement 	"

	self parse: 'while True:
	break'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyBoolean) size equals: 1.
	self assert: (fast allWithType: FASTPyBreakStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyWhileStatement) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'while True:
	break' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyWhileStatement).
	self assert: (self topEntity isOfType: FASTTConditionalStatement).
	self assert: (self topEntity isOfType: FASTTLoopStatement).
	self assert: (self topEntity isOfType: FASTTWithCondition).
	
	"Testing value of monovalue relation body"
	self assert: self topEntity body isNotNil.

		stack push: self topEntity body.
		self assert: self topEntity sourceCode equals: 'break'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'break'.
			self assert: (self topEntity isOfType: FASTPyBreakStatement).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation condition"
	self assert: self topEntity condition isNotNil.

		stack push: self topEntity condition.
		self assert: self topEntity sourceCode equals: 'True'.
		self assert: (self topEntity isOfType: FASTPyBoolean).
		self assert: (self topEntity isOfType: FASTTBooleanLiteral).
		self assert: (self topEntity isOfType: FASTTLiteral)
]

{ #category : 'tests - calls' }
FASTPythonImporterTest >> testCall [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testCall 	"

	self parse: 'print("Hello")'.

	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'print("Hello")'.
	self assert: (self topEntity isOfType: FASTPyCall).
	self assert: (self topEntity isOfType: FASTTInvocation).
	self assert: (self topEntity isOfType: FASTTWithArguments).
	
	"Testing value of multivalued relation arguments"
	self assert: self topEntity arguments size equals: 1.
	
		stack push: (stack top arguments at: 1).
		self assert: self topEntity sourceCode equals: '"Hello"'.
		self assert: (self topEntity isOfType: FASTPyString).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTStringLiteral).
		stack pop.
	
	"Testing value of monovalue relation callee"
	self assert: self topEntity callee isNotNil.

		stack push: self topEntity callee.
		self assert: self topEntity sourceCode equals: 'print'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - calls' }
FASTPythonImporterTest >> testCallArgumentWithAttribute [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testCallArgumentWithAttribute 	"

	self parse: 'function(CFG.seed)'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'function(CFG.seed)'.
	self assert: (self topEntity isOfType: FASTPyCall).
	self assert: (self topEntity isOfType: FASTTInvocation).
	self assert: (self topEntity isOfType: FASTTWithArguments).
	
	"Testing value of multivalued relation arguments"
	self assert: self topEntity arguments size equals: 1.
	
		stack push: (stack top arguments at: 1).
		self assert: self topEntity sourceCode equals: 'CFG.seed'.
		self assert: (self topEntity isOfType: FASTPyAttributeAccess).
		
		"Testing value of monovalue relation attribute"
		self assert: self topEntity attribute isNotNil.

			stack push: self topEntity attribute.
			self assert: self topEntity sourceCode equals: 'seed'.
			self assert: (self topEntity isOfType: FASTPyVariable).
			self assert: (self topEntity isOfType: FASTTVariableEntity).
			stack pop.
		
		"Testing value of monovalue relation object"
		self assert: self topEntity object isNotNil.

			stack push: self topEntity object.
			self assert: self topEntity sourceCode equals: 'CFG'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation callee"
	self assert: self topEntity callee isNotNil.

		stack push: self topEntity callee.
		self assert: self topEntity sourceCode equals: 'function'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - calls' }
FASTPythonImporterTest >> testCallArgumentWithBinaryOperator [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testCallArgumentWithBinaryOperator 	"

	self parse: 'function(30000/train_bs*epochs)'.

	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 2.
	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 3.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'function(30000/train_bs*epochs)'.
	self assert: (self topEntity isOfType: FASTPyCall).
	self assert: (self topEntity isOfType: FASTTInvocation).
	self assert: (self topEntity isOfType: FASTTWithArguments).
	
	"Testing value of multivalued relation arguments"
	self assert: self topEntity arguments size equals: 1.
	
		stack push: (stack top arguments at: 1).
		self assert: self topEntity sourceCode equals: '30000/train_bs*epochs'.
		self assert: (self topEntity isOfType: FASTPyBinaryOperator).
		self assert: (self topEntity isOfType: FASTTBinaryExpression).
		
		"Testing value of monovalue relation leftOperand"
		self assert: self topEntity leftOperand isNotNil.

			stack push: self topEntity leftOperand.
			self assert: self topEntity sourceCode equals: '30000/train_bs'.
			self assert: (self topEntity isOfType: FASTPyBinaryOperator).
			self assert: (self topEntity isOfType: FASTTBinaryExpression).
			
			"Testing value of monovalue relation leftOperand"
			self assert: self topEntity leftOperand isNotNil.

				stack push: self topEntity leftOperand.
				self assert: self topEntity sourceCode equals: '30000'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			self assert: self topEntity operator equals: '/'.
			
			"Testing value of monovalue relation rightOperand"
			self assert: self topEntity rightOperand isNotNil.

				stack push: self topEntity rightOperand.
				self assert: self topEntity sourceCode equals: 'train_bs'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		self assert: self topEntity operator equals: '*'.
		
		"Testing value of monovalue relation rightOperand"
		self assert: self topEntity rightOperand isNotNil.

			stack push: self topEntity rightOperand.
			self assert: self topEntity sourceCode equals: 'epochs'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation callee"
	self assert: self topEntity callee isNotNil.

		stack push: self topEntity callee.
		self assert: self topEntity sourceCode equals: 'function'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - calls' }
FASTPythonImporterTest >> testCallArgumentWithCall [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testCallArgumentWithCall 	"

	self parse: 'function(data[0].replace(''case'',''''))'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 2.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 2.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 2.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'function(data[0].replace(''case'',''''))'.
	self assert: (self topEntity isOfType: FASTPyCall).
	self assert: (self topEntity isOfType: FASTTInvocation).
	self assert: (self topEntity isOfType: FASTTWithArguments).
	
	"Testing value of multivalued relation arguments"
	self assert: self topEntity arguments size equals: 1.
	
		stack push: (stack top arguments at: 1).
		self assert: self topEntity sourceCode equals: 'data[0].replace(''case'','''')'.
		self assert: (self topEntity isOfType: FASTPyCall).
		self assert: (self topEntity isOfType: FASTTInvocation).
		self assert: (self topEntity isOfType: FASTTWithArguments).
		
		"Testing value of multivalued relation arguments"
		self assert: self topEntity arguments size equals: 2.
		
			stack push: (stack top arguments at: 1).
			self assert: self topEntity sourceCode equals: '''case'''.
			self assert: (self topEntity isOfType: FASTPyString).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTStringLiteral).
			stack pop.
		
			stack push: (stack top arguments at: 2).
			self assert: self topEntity sourceCode equals: ''''''.
			self assert: (self topEntity isOfType: FASTPyString).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTStringLiteral).
			stack pop.
		
		"Testing value of monovalue relation callee"
		self assert: self topEntity callee isNotNil.

			stack push: self topEntity callee.
			self assert: self topEntity sourceCode equals: 'data[0].replace'.
			self assert: (self topEntity isOfType: FASTPyAttributeAccess).
			
			"Testing value of monovalue relation attribute"
			self assert: self topEntity attribute isNotNil.

				stack push: self topEntity attribute.
				self assert: self topEntity sourceCode equals: 'replace'.
				self assert: (self topEntity isOfType: FASTPyVariable).
				self assert: (self topEntity isOfType: FASTTVariableEntity).
				stack pop.
			
			"Testing value of monovalue relation object"
			self assert: self topEntity object isNotNil.

				stack push: self topEntity object.
				self assert: self topEntity sourceCode equals: 'data[0]'.
				self assert: (self topEntity isOfType: FASTPySubscript).
				
				"Testing value of multivalued relation indices"
				self assert: self topEntity indices size equals: 1.
				
					stack push: (stack top indices at: 1).
					self assert: self topEntity sourceCode equals: '0'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					self assert: (self topEntity isOfType: FASTTLiteral).
					self assert: (self topEntity isOfType: FASTTNumericalLiteral).
					stack pop.
				
				"Testing value of monovalue relation value"
				self assert: self topEntity value isNotNil.

					stack push: self topEntity value.
					self assert: self topEntity sourceCode equals: 'data'.
					self assert: (self topEntity isOfType: FASTPyIdentifier).
					stack pop.
				stack pop.
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation callee"
	self assert: self topEntity callee isNotNil.

		stack push: self topEntity callee.
		self assert: self topEntity sourceCode equals: 'function'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - calls' }
FASTPythonImporterTest >> testCallArgumentWithComparisonOperator [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testCallArgumentWithComparisonOperator 	"

	self parse: 'function(shape0!=resize)'.

	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'function(shape0!=resize)'.
	self assert: (self topEntity isOfType: FASTPyCall).
	self assert: (self topEntity isOfType: FASTTInvocation).
	self assert: (self topEntity isOfType: FASTTWithArguments).
	
	"Testing value of multivalued relation arguments"
	self assert: self topEntity arguments size equals: 1.
	
		stack push: (stack top arguments at: 1).
		self assert: self topEntity sourceCode equals: 'shape0!=resize'.
		self assert: (self topEntity isOfType: FASTPyComparisonOperator).
		
		"Testing value of multivalued relation operands"
		self assert: self topEntity operands size equals: 2.
		
			stack push: (stack top operands at: 1).
			self assert: self topEntity sourceCode equals: 'shape0'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
			stack push: (stack top operands at: 2).
			self assert: self topEntity sourceCode equals: 'resize'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		self assert: self topEntity operators equals: #('!=').
		stack pop.
	
	"Testing value of monovalue relation callee"
	self assert: self topEntity callee isNotNil.

		stack push: self topEntity callee.
		self assert: self topEntity sourceCode equals: 'function'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - calls' }
FASTPythonImporterTest >> testCallArgumentWithDictionary [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testCallArgumentWithDictionary 	"

	self parse: 'function({
    "id":pred_ids,
    "class":pred_classes
})'.

	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyDictionary) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyPair) size equals: 2.
	self assert: (fast allWithType: FASTPyString) size equals: 2.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'function({
    "id":pred_ids,
    "class":pred_classes
})' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyCall).
	self assert: (self topEntity isOfType: FASTTInvocation).
	self assert: (self topEntity isOfType: FASTTWithArguments).
	
	"Testing value of multivalued relation arguments"
	self assert: self topEntity arguments size equals: 1.
	
		stack push: (stack top arguments at: 1).
		self assert: self topEntity sourceCode equals: '{
    "id":pred_ids,
    "class":pred_classes
}' withPlatformLineEndings.
		self assert: (self topEntity isOfType: FASTPyDictionary).
		
		"Testing value of multivalued relation initializers"
		self assert: self topEntity initializers size equals: 2.
		
			stack push: (stack top initializers at: 1).
			self assert: self topEntity sourceCode equals: '"id":pred_ids'.
			self assert: (self topEntity isOfType: FASTPyPair).
			
			"Testing value of monovalue relation key"
			self assert: self topEntity key isNotNil.

				stack push: self topEntity key.
				self assert: self topEntity sourceCode equals: '"id"'.
				self assert: (self topEntity isOfType: FASTPyString).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTStringLiteral).
				stack pop.
			
			"Testing value of monovalue relation value"
			self assert: self topEntity value isNotNil.

				stack push: self topEntity value.
				self assert: self topEntity sourceCode equals: 'pred_ids'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		
			stack push: (stack top initializers at: 2).
			self assert: self topEntity sourceCode equals: '"class":pred_classes'.
			self assert: (self topEntity isOfType: FASTPyPair).
			
			"Testing value of monovalue relation key"
			self assert: self topEntity key isNotNil.

				stack push: self topEntity key.
				self assert: self topEntity sourceCode equals: '"class"'.
				self assert: (self topEntity isOfType: FASTPyString).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTStringLiteral).
				stack pop.
			
			"Testing value of monovalue relation value"
			self assert: self topEntity value isNotNil.

				stack push: self topEntity value.
				self assert: self topEntity sourceCode equals: 'pred_classes'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation callee"
	self assert: self topEntity callee isNotNil.

		stack push: self topEntity callee.
		self assert: self topEntity sourceCode equals: 'function'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - calls' }
FASTPythonImporterTest >> testCallArgumentWithEllipsis [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testCallArgumentWithEllipsis 	"

	self parse: 'function(3, ...)'.

	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyEllipsis) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'function(3, ...)'.
	self assert: (self topEntity isOfType: FASTPyCall).
	self assert: (self topEntity isOfType: FASTTInvocation).
	self assert: (self topEntity isOfType: FASTTWithArguments).
	
	"Testing value of multivalued relation arguments"
	self assert: self topEntity arguments size equals: 2.
	
		stack push: (stack top arguments at: 1).
		self assert: self topEntity sourceCode equals: '3'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral).
		stack pop.
	
		stack push: (stack top arguments at: 2).
		self assert: self topEntity sourceCode equals: '...'.
		self assert: (self topEntity isOfType: FASTPyEllipsis).
		self assert: (self topEntity isOfType: FASTTLiteral).
		stack pop.
	
	"Testing value of monovalue relation callee"
	self assert: self topEntity callee isNotNil.

		stack push: self topEntity callee.
		self assert: self topEntity sourceCode equals: 'function'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - calls' }
FASTPythonImporterTest >> testCallArgumentWithKeywordArgument [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testCallArgumentWithKeywordArgument 	"

	self parse: 'function("/root/.cache/torch/hub/checkpoints/", exist_ok=True)'.

	self assert: (fast allWithType: FASTPyBoolean) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyKeywordArgument) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'function("/root/.cache/torch/hub/checkpoints/", exist_ok=True)'.
	self assert: (self topEntity isOfType: FASTPyCall).
	self assert: (self topEntity isOfType: FASTTInvocation).
	self assert: (self topEntity isOfType: FASTTWithArguments).
	
	"Testing value of multivalued relation arguments"
	self assert: self topEntity arguments size equals: 2.
	
		stack push: (stack top arguments at: 1).
		self assert: self topEntity sourceCode equals: '"/root/.cache/torch/hub/checkpoints/"'.
		self assert: (self topEntity isOfType: FASTPyString).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTStringLiteral).
		stack pop.
	
		stack push: (stack top arguments at: 2).
		self assert: self topEntity sourceCode equals: 'exist_ok=True'.
		self assert: (self topEntity isOfType: FASTPyKeywordArgument).
		self assert: self topEntity name equals: 'exist_ok'.
		
		"Testing value of monovalue relation value"
		self assert: self topEntity value isNotNil.

			stack push: self topEntity value.
			self assert: self topEntity sourceCode equals: 'True'.
			self assert: (self topEntity isOfType: FASTPyBoolean).
			self assert: (self topEntity isOfType: FASTTBooleanLiteral).
			self assert: (self topEntity isOfType: FASTTLiteral).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation callee"
	self assert: self topEntity callee isNotNil.

		stack push: self topEntity callee.
		self assert: self topEntity sourceCode equals: 'function'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - calls' }
FASTPythonImporterTest >> testCallArgumentWithList [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testCallArgumentWithList 	"

	self parse: 'function(img, [pady, padx])'.

	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 4.
	self assert: (fast allWithType: FASTPyList) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'function(img, [pady, padx])'.
	self assert: (self topEntity isOfType: FASTPyCall).
	self assert: (self topEntity isOfType: FASTTInvocation).
	self assert: (self topEntity isOfType: FASTTWithArguments).
	
	"Testing value of multivalued relation arguments"
	self assert: self topEntity arguments size equals: 2.
	
		stack push: (stack top arguments at: 1).
		self assert: self topEntity sourceCode equals: 'img'.
		self assert: (self topEntity isOfType: FASTPyIdentifier).
		stack pop.
	
		stack push: (stack top arguments at: 2).
		self assert: self topEntity sourceCode equals: '[pady, padx]'.
		self assert: (self topEntity isOfType: FASTPyList).
		
		"Testing value of multivalued relation initializers"
		self assert: self topEntity initializers size equals: 2.
		
			stack push: (stack top initializers at: 1).
			self assert: self topEntity sourceCode equals: 'pady'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
			stack push: (stack top initializers at: 2).
			self assert: self topEntity sourceCode equals: 'padx'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation callee"
	self assert: self topEntity callee isNotNil.

		stack push: self topEntity callee.
		self assert: self topEntity sourceCode equals: 'function'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - calls' }
FASTPythonImporterTest >> testCallChained [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testCallChained 	"

	self parse: 'function()(13)'.

	self assert: (fast allWithType: FASTPyCall) size equals: 2.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'function()(13)'.
	self assert: (self topEntity isOfType: FASTPyCall).
	self assert: (self topEntity isOfType: FASTTInvocation).
	self assert: (self topEntity isOfType: FASTTWithArguments).
	
	"Testing value of multivalued relation arguments"
	self assert: self topEntity arguments size equals: 1.
	
		stack push: (stack top arguments at: 1).
		self assert: self topEntity sourceCode equals: '13'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral).
		stack pop.
	
	"Testing value of monovalue relation callee"
	self assert: self topEntity callee isNotNil.

		stack push: self topEntity callee.
		self assert: self topEntity sourceCode equals: 'function()'.
		self assert: (self topEntity isOfType: FASTPyCall).
		self assert: (self topEntity isOfType: FASTTInvocation).
		self assert: (self topEntity isOfType: FASTTWithArguments).
		
		"Testing value of monovalue relation callee"
		self assert: self topEntity callee isNotNil.

			stack push: self topEntity callee.
			self assert: self topEntity sourceCode equals: 'function'.
			self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - calls' }
FASTPythonImporterTest >> testCallLambda [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testCallLambda 	"

	self parse: '(lambda x: x > 0)(10)'.

	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyLambda) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyParameter) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '(lambda x: x > 0)(10)'.
	self assert: (self topEntity isOfType: FASTPyCall).
	self assert: (self topEntity isOfType: FASTTInvocation).
	self assert: (self topEntity isOfType: FASTTWithArguments).
	
	"Testing value of multivalued relation arguments"
	self assert: self topEntity arguments size equals: 1.
	
		stack push: (stack top arguments at: 1).
		self assert: self topEntity sourceCode equals: '10'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral).
		stack pop.
	
	"Testing value of monovalue relation callee"
	self assert: self topEntity callee isNotNil.

		stack push: self topEntity callee.
		self assert: self topEntity sourceCode equals: 'lambda x: x > 0'.
		self assert: (self topEntity isOfType: FASTPyLambda).
		self assert: (self topEntity isOfType: FASTTWithParameters).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'x > 0'.
			self assert: (self topEntity isOfType: FASTPyComparisonOperator).
			
			"Testing value of multivalued relation operands"
			self assert: self topEntity operands size equals: 2.
			
				stack push: (stack top operands at: 1).
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
				stack push: (stack top operands at: 2).
				self assert: self topEntity sourceCode equals: '0'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			self assert: self topEntity operators equals: #('>').
			stack pop.
		
		"Testing value of multivalued relation parameters"
		self assert: self topEntity parameters size equals: 1.
		
			stack push: (stack top parameters at: 1).
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyParameter).
			self assert: (self topEntity isOfType: FASTTVariableEntity).
			self assert: self topEntity name equals: 'x'
]

{ #category : 'tests - calls' }
FASTPythonImporterTest >> testCallSubscript [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testCallSubscript 	"

	self parse: 'coll[1](True)'.

	self assert: (fast allWithType: FASTPyBoolean) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'coll[1](True)'.
	self assert: (self topEntity isOfType: FASTPyCall).
	self assert: (self topEntity isOfType: FASTTInvocation).
	self assert: (self topEntity isOfType: FASTTWithArguments).
	
	"Testing value of multivalued relation arguments"
	self assert: self topEntity arguments size equals: 1.
	
		stack push: (stack top arguments at: 1).
		self assert: self topEntity sourceCode equals: 'True'.
		self assert: (self topEntity isOfType: FASTPyBoolean).
		self assert: (self topEntity isOfType: FASTTBooleanLiteral).
		self assert: (self topEntity isOfType: FASTTLiteral).
		stack pop.
	
	"Testing value of monovalue relation callee"
	self assert: self topEntity callee isNotNil.

		stack push: self topEntity callee.
		self assert: self topEntity sourceCode equals: 'coll[1]'.
		self assert: (self topEntity isOfType: FASTPySubscript).
		
		"Testing value of multivalued relation indices"
		self assert: self topEntity indices size equals: 1.
		
			stack push: (stack top indices at: 1).
			self assert: self topEntity sourceCode equals: '1'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		
		"Testing value of monovalue relation value"
		self assert: self topEntity value isNotNil.

			stack push: self topEntity value.
			self assert: self topEntity sourceCode equals: 'coll'.
			self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - calls' }
FASTPythonImporterTest >> testCallWithAttribute [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testCallWithAttribute 	"

	self parse: 'tqdm.pandas()'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'tqdm.pandas()'.
	self assert: (self topEntity isOfType: FASTPyCall).
	self assert: (self topEntity isOfType: FASTTInvocation).
	self assert: (self topEntity isOfType: FASTTWithArguments).
	
	"Testing value of monovalue relation callee"
	self assert: self topEntity callee isNotNil.

		stack push: self topEntity callee.
		self assert: self topEntity sourceCode equals: 'tqdm.pandas'.
		self assert: (self topEntity isOfType: FASTPyAttributeAccess).
		
		"Testing value of monovalue relation attribute"
		self assert: self topEntity attribute isNotNil.

			stack push: self topEntity attribute.
			self assert: self topEntity sourceCode equals: 'pandas'.
			self assert: (self topEntity isOfType: FASTPyVariable).
			self assert: (self topEntity isOfType: FASTTVariableEntity).
			stack pop.
		
		"Testing value of monovalue relation object"
		self assert: self topEntity object isNotNil.

			stack push: self topEntity object.
			self assert: self topEntity sourceCode equals: 'tqdm'.
			self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - operators' }
FASTPythonImporterTest >> testChainedComparisonOperator [

	| operator |
	self parse: '14 > 13 < 15'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 1.

	operator := (fast allWithType: FASTPyComparisonOperator) anyOne.
	self assert: operator sourceCode equals: '14 > 13 < 15'.
	self assert: (operator isOfType: FASTTExpression).
	self assert: operator operands size equals: 3.
	self assert: (operator operands first isOfType: FASTPyInteger).
	self assert: (operator operands second isOfType: FASTPyInteger).
	self assert: (operator operands third isOfType: FASTPyInteger).
	self assert: operator operands first sourceCode equals: '14'.
	self assert: operator operands second sourceCode equals: '13'.
	self assert: operator operands third sourceCode equals: '15'.
	self assert: operator operators size equals: 2.
	self assert: operator operators first equals: '>'.
	self assert: operator operators second equals: '<'
]

{ #category : 'tests - class' }
FASTPythonImporterTest >> testClassDefinition [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testClassDefinition 	"

	self parse: 'class AClass():
	pass'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyClassDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyPassStatement) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'class AClass():
	pass' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyClassDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	self assert: self topEntity name equals: 'AClass'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'pass'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'pass'.
			self assert: (self topEntity isOfType: FASTPyPassStatement)
]

{ #category : 'tests - operators' }
FASTPythonImporterTest >> testComparisonOperator [

	| operator |
	self parse: '10 >= 1'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 1.

	operator := (fast allWithType: FASTPyComparisonOperator) anyOne.
	self assert: operator sourceCode equals: '10 >= 1'.
	self assert: (operator isOfType: FASTTExpression).
	self assert: operator operands size equals: 2.
	self assert: (operator operands first isOfType: FASTPyInteger).
	self assert: (operator operands second isOfType: FASTPyInteger).
	self assert: operator operands first sourceCode equals: '10'.
	self assert: operator operands second sourceCode equals: '1'.
	self assert: operator operators size equals: 1.
	self assert: operator operators anyOne equals: '>='
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testComplex [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testComplex 	"

	self parse: '42j'.

	self assert: (fast allWithType: FASTPyComplex) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '42j'.
	self assert: (self topEntity isOfType: FASTPyComplex).
	self assert: (self topEntity isOfType: FASTTLiteral).
	self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests' }
FASTPythonImporterTest >> testConditionalExpression [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testConditionalExpression 	"

	self parse: '"even" if x % 2 == 0 else "odd"'.

	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyConditionalExpression) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 2.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '"even" if x % 2 == 0 else "odd"'.
	self assert: (self topEntity isOfType: FASTPyConditionalExpression).
	self assert: (self topEntity isOfType: FASTTWithCondition).
	
	"Testing value of monovalue relation condition"
	self assert: self topEntity condition isNotNil.

		stack push: self topEntity condition.
		self assert: self topEntity sourceCode equals: 'x % 2 == 0'.
		self assert: (self topEntity isOfType: FASTPyComparisonOperator).
		
		"Testing value of multivalued relation operands"
		self assert: self topEntity operands size equals: 2.
		
			stack push: (stack top operands at: 1).
			self assert: self topEntity sourceCode equals: 'x % 2'.
			self assert: (self topEntity isOfType: FASTPyBinaryOperator).
			self assert: (self topEntity isOfType: FASTTBinaryExpression).
			
			"Testing value of monovalue relation leftOperand"
			self assert: self topEntity leftOperand isNotNil.

				stack push: self topEntity leftOperand.
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			self assert: self topEntity operator equals: '%'.
			
			"Testing value of monovalue relation rightOperand"
			self assert: self topEntity rightOperand isNotNil.

				stack push: self topEntity rightOperand.
				self assert: self topEntity sourceCode equals: '2'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			stack pop.
		
			stack push: (stack top operands at: 2).
			self assert: self topEntity sourceCode equals: '0'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		self assert: self topEntity operators equals: #('==').
		stack pop.
	
	"Testing value of monovalue relation elseExpression"
	self assert: self topEntity elseExpression isNotNil.

		stack push: self topEntity elseExpression.
		self assert: self topEntity sourceCode equals: '"odd"'.
		self assert: (self topEntity isOfType: FASTPyString).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTStringLiteral).
		stack pop.
	
	"Testing value of monovalue relation thenExpression"
	self assert: self topEntity thenExpression isNotNil.

		stack push: self topEntity thenExpression.
		self assert: self topEntity sourceCode equals: '"even"'.
		self assert: (self topEntity isOfType: FASTPyString).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTStringLiteral)
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testContinueStatement [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testContinueStatement 	"

	self parse: 'while True:
	continue'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyBoolean) size equals: 1.
	self assert: (fast allWithType: FASTPyContinueStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyWhileStatement) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'while True:
	continue' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyWhileStatement).
	self assert: (self topEntity isOfType: FASTTConditionalStatement).
	self assert: (self topEntity isOfType: FASTTLoopStatement).
	self assert: (self topEntity isOfType: FASTTWithCondition).
	
	"Testing value of monovalue relation body"
	self assert: self topEntity body isNotNil.

		stack push: self topEntity body.
		self assert: self topEntity sourceCode equals: 'continue'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'continue'.
			self assert: (self topEntity isOfType: FASTPyContinueStatement).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation condition"
	self assert: self topEntity condition isNotNil.

		stack push: self topEntity condition.
		self assert: self topEntity sourceCode equals: 'True'.
		self assert: (self topEntity isOfType: FASTPyBoolean).
		self assert: (self topEntity isOfType: FASTTBooleanLiteral).
		self assert: (self topEntity isOfType: FASTTLiteral)
]

{ #category : 'tests - decorators' }
FASTPythonImporterTest >> testDecorator [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testDecorator 	"

	self parse: '@decorator
def funct():
	pass'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyDecorator) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyPassStatement) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def funct():
	pass' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	
	"Testing value of multivalued relation decorators"
	self assert: self topEntity decorators size equals: 1.
	
		stack push: (stack top decorators at: 1).
		self assert: self topEntity sourceCode equals: '@decorator'.
		self assert: (self topEntity isOfType: FASTPyDecorator).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'decorator'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	self assert: self topEntity name equals: 'funct'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'pass'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'pass'.
			self assert: (self topEntity isOfType: FASTPyPassStatement)
]

{ #category : 'tests - decorators' }
FASTPythonImporterTest >> testDecoratorOnClassDefinition [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testDecoratorOnClassDefinition 	"

	self parse: '@register_component
class MyComponent: pass'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyClassDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyDecorator) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyPassStatement) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'class MyComponent: pass'.
	self assert: (self topEntity isOfType: FASTPyClassDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	
	"Testing value of multivalued relation decorators"
	self assert: self topEntity decorators size equals: 1.
	
		stack push: (stack top decorators at: 1).
		self assert: self topEntity sourceCode equals: '@register_component'.
		self assert: (self topEntity isOfType: FASTPyDecorator).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'register_component'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	self assert: self topEntity name equals: 'MyComponent'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'pass'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'pass'.
			self assert: (self topEntity isOfType: FASTPyPassStatement)
]

{ #category : 'tests - decorators' }
FASTPythonImporterTest >> testDecoratorWithAttributeAccess [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testDecoratorWithAttributeAccess 	"

	self parse: '@functools.lru_cache
def funct(): pass'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyDecorator) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyPassStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def funct(): pass'.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	
	"Testing value of multivalued relation decorators"
	self assert: self topEntity decorators size equals: 1.
	
		stack push: (stack top decorators at: 1).
		self assert: self topEntity sourceCode equals: '@functools.lru_cache'.
		self assert: (self topEntity isOfType: FASTPyDecorator).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'functools.lru_cache'.
			self assert: (self topEntity isOfType: FASTPyAttributeAccess).
			
			"Testing value of monovalue relation attribute"
			self assert: self topEntity attribute isNotNil.

				stack push: self topEntity attribute.
				self assert: self topEntity sourceCode equals: 'lru_cache'.
				self assert: (self topEntity isOfType: FASTPyVariable).
				self assert: (self topEntity isOfType: FASTTVariableEntity).
				stack pop.
			
			"Testing value of monovalue relation object"
			self assert: self topEntity object isNotNil.

				stack push: self topEntity object.
				self assert: self topEntity sourceCode equals: 'functools'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		stack pop.
	self assert: self topEntity name equals: 'funct'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'pass'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'pass'.
			self assert: (self topEntity isOfType: FASTPyPassStatement)
]

{ #category : 'tests - decorators' }
FASTPythonImporterTest >> testDecoratorWithCall [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testDecoratorWithCall 	"

	self parse: '@factory.make_decorator()
def funct(): pass'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyDecorator) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyPassStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def funct(): pass'.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	
	"Testing value of multivalued relation decorators"
	self assert: self topEntity decorators size equals: 1.
	
		stack push: (stack top decorators at: 1).
		self assert: self topEntity sourceCode equals: '@factory.make_decorator()'.
		self assert: (self topEntity isOfType: FASTPyDecorator).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'factory.make_decorator()'.
			self assert: (self topEntity isOfType: FASTPyCall).
			self assert: (self topEntity isOfType: FASTTInvocation).
			self assert: (self topEntity isOfType: FASTTWithArguments).
			
			"Testing value of monovalue relation callee"
			self assert: self topEntity callee isNotNil.

				stack push: self topEntity callee.
				self assert: self topEntity sourceCode equals: 'factory.make_decorator'.
				self assert: (self topEntity isOfType: FASTPyAttributeAccess).
				
				"Testing value of monovalue relation attribute"
				self assert: self topEntity attribute isNotNil.

					stack push: self topEntity attribute.
					self assert: self topEntity sourceCode equals: 'make_decorator'.
					self assert: (self topEntity isOfType: FASTPyVariable).
					self assert: (self topEntity isOfType: FASTTVariableEntity).
					stack pop.
				
				"Testing value of monovalue relation object"
				self assert: self topEntity object isNotNil.

					stack push: self topEntity object.
					self assert: self topEntity sourceCode equals: 'factory'.
					self assert: (self topEntity isOfType: FASTPyIdentifier).
					stack pop.
				stack pop.
			stack pop.
		stack pop.
	self assert: self topEntity name equals: 'funct'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'pass'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'pass'.
			self assert: (self topEntity isOfType: FASTPyPassStatement)
]

{ #category : 'tests - decorators' }
FASTPythonImporterTest >> testDecoratorWithLambda [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testDecoratorWithLambda 	"

	self parse: '@(lambda f: f)
def funct(): pass'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyDecorator) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyLambda) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyParameter) size equals: 1.
	self assert: (fast allWithType: FASTPyPassStatement) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def funct(): pass'.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	
	"Testing value of multivalued relation decorators"
	self assert: self topEntity decorators size equals: 1.
	
		stack push: (stack top decorators at: 1).
		self assert: self topEntity sourceCode equals: '@(lambda f: f)'.
		self assert: (self topEntity isOfType: FASTPyDecorator).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'lambda f: f'.
			self assert: (self topEntity isOfType: FASTPyLambda).
			self assert: (self topEntity isOfType: FASTTWithParameters).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: 'f'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
			"Testing value of multivalued relation parameters"
			self assert: self topEntity parameters size equals: 1.
			
				stack push: (stack top parameters at: 1).
				self assert: self topEntity sourceCode equals: 'f'.
				self assert: (self topEntity isOfType: FASTPyParameter).
				self assert: (self topEntity isOfType: FASTTVariableEntity).
				self assert: self topEntity name equals: 'f'.
				stack pop.
			stack pop.
		stack pop.
	self assert: self topEntity name equals: 'funct'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'pass'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'pass'.
			self assert: (self topEntity isOfType: FASTPyPassStatement)
]

{ #category : 'tests - decorators' }
FASTPythonImporterTest >> testDecoratorWithSubscript [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testDecoratorWithSubscript 	"

	self parse: '@decorators[''auth'']
def funct(): pass'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyDecorator) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyPassStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def funct(): pass'.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	
	"Testing value of multivalued relation decorators"
	self assert: self topEntity decorators size equals: 1.
	
		stack push: (stack top decorators at: 1).
		self assert: self topEntity sourceCode equals: '@decorators[''auth'']'.
		self assert: (self topEntity isOfType: FASTPyDecorator).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'decorators[''auth'']'.
			self assert: (self topEntity isOfType: FASTPySubscript).
			
			"Testing value of multivalued relation indices"
			self assert: self topEntity indices size equals: 1.
			
				stack push: (stack top indices at: 1).
				self assert: self topEntity sourceCode equals: '''auth'''.
				self assert: (self topEntity isOfType: FASTPyString).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTStringLiteral).
				stack pop.
			
			"Testing value of monovalue relation value"
			self assert: self topEntity value isNotNil.

				stack push: self topEntity value.
				self assert: self topEntity sourceCode equals: 'decorators'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		stack pop.
	self assert: self topEntity name equals: 'funct'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'pass'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'pass'.
			self assert: (self topEntity isOfType: FASTPyPassStatement)
]

{ #category : 'tests - decorators' }
FASTPythonImporterTest >> testDecorators [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testDecorators 	"

	self parse: '@decoratorA
@decoratorB
def funct():
	pass'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyDecorator) size equals: 2.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyPassStatement) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def funct():
	pass' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	
	"Testing value of multivalued relation decorators"
	self assert: self topEntity decorators size equals: 2.
	
		stack push: (stack top decorators at: 1).
		self assert: self topEntity sourceCode equals: '@decoratorA'.
		self assert: (self topEntity isOfType: FASTPyDecorator).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'decoratorA'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	
		stack push: (stack top decorators at: 2).
		self assert: self topEntity sourceCode equals: '@decoratorB'.
		self assert: (self topEntity isOfType: FASTPyDecorator).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'decoratorB'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	self assert: self topEntity name equals: 'funct'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'pass'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'pass'.
			self assert: (self topEntity isOfType: FASTPyPassStatement)
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testDelStatement [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testDelStatement 	"

	self parse: 'def aFunction(coll):
	del coll'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyDeleteStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyParameter) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def aFunction(coll):
	del coll' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of multivalued relation parameters"
	self assert: self topEntity parameters size equals: 1.
	
		stack push: (stack top parameters at: 1).
		self assert: self topEntity sourceCode equals: 'coll'.
		self assert: (self topEntity isOfType: FASTPyParameter).
		self assert: (self topEntity isOfType: FASTTVariableEntity).
		self assert: self topEntity name equals: 'coll'.
		stack pop.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'del coll'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'del coll'.
			self assert: (self topEntity isOfType: FASTPyDeleteStatement).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: 'coll'.
				self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - collections' }
FASTPythonImporterTest >> testDictionary [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testDictionary 	"

	self parse: ' { "brand": "Ford", "model": "Mustang", "year": 1964 }'.

	self assert: (fast allWithType: FASTPyDictionary) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyPair) size equals: 3.
	self assert: (fast allWithType: FASTPyString) size equals: 5.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '{ "brand": "Ford", "model": "Mustang", "year": 1964 }'.
	self assert: (self topEntity isOfType: FASTPyDictionary).
	
	"Testing value of multivalued relation initializers"
	self assert: self topEntity initializers size equals: 3.
	
		stack push: (stack top initializers at: 1).
		self assert: self topEntity sourceCode equals: '"brand": "Ford"'.
		self assert: (self topEntity isOfType: FASTPyPair).
		
		"Testing value of monovalue relation key"
		self assert: self topEntity key isNotNil.

			stack push: self topEntity key.
			self assert: self topEntity sourceCode equals: '"brand"'.
			self assert: (self topEntity isOfType: FASTPyString).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTStringLiteral).
			stack pop.
		
		"Testing value of monovalue relation value"
		self assert: self topEntity value isNotNil.

			stack push: self topEntity value.
			self assert: self topEntity sourceCode equals: '"Ford"'.
			self assert: (self topEntity isOfType: FASTPyString).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTStringLiteral).
			stack pop.
		stack pop.
	
		stack push: (stack top initializers at: 2).
		self assert: self topEntity sourceCode equals: '"model": "Mustang"'.
		self assert: (self topEntity isOfType: FASTPyPair).
		
		"Testing value of monovalue relation key"
		self assert: self topEntity key isNotNil.

			stack push: self topEntity key.
			self assert: self topEntity sourceCode equals: '"model"'.
			self assert: (self topEntity isOfType: FASTPyString).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTStringLiteral).
			stack pop.
		
		"Testing value of monovalue relation value"
		self assert: self topEntity value isNotNil.

			stack push: self topEntity value.
			self assert: self topEntity sourceCode equals: '"Mustang"'.
			self assert: (self topEntity isOfType: FASTPyString).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTStringLiteral).
			stack pop.
		stack pop.
	
		stack push: (stack top initializers at: 3).
		self assert: self topEntity sourceCode equals: '"year": 1964'.
		self assert: (self topEntity isOfType: FASTPyPair).
		
		"Testing value of monovalue relation key"
		self assert: self topEntity key isNotNil.

			stack push: self topEntity key.
			self assert: self topEntity sourceCode equals: '"year"'.
			self assert: (self topEntity isOfType: FASTPyString).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTStringLiteral).
			stack pop.
		
		"Testing value of monovalue relation value"
		self assert: self topEntity value isNotNil.

			stack push: self topEntity value.
			self assert: self topEntity sourceCode equals: '1964'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - comprehension' }
FASTPythonImporterTest >> testDictionaryComprehension [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testDictionaryComprehension 	"

	self parse: '{ v:k for k,v in class_indices.items() }'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyDictionaryComprehension) size equals: 1.
	self assert: (fast allWithType: FASTPyForInClause) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 5.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyPair) size equals: 1.
	self assert: (fast allWithType: FASTPyPatternList) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '{ v:k for k,v in class_indices.items() }'.
	self assert: (self topEntity isOfType: FASTPyDictionaryComprehension).
	self assert: (self topEntity isOfType: FASTPyTComprehension).
	
	"Testing value of monovalue relation body"
	self assert: self topEntity body isNotNil.

		stack push: self topEntity body.
		self assert: self topEntity sourceCode equals: 'v:k'.
		self assert: (self topEntity isOfType: FASTPyPair).
		
		"Testing value of monovalue relation key"
		self assert: self topEntity key isNotNil.

			stack push: self topEntity key.
			self assert: self topEntity sourceCode equals: 'v'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
		"Testing value of monovalue relation value"
		self assert: self topEntity value isNotNil.

			stack push: self topEntity value.
			self assert: self topEntity sourceCode equals: 'k'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	
	"Testing value of multivalued relation clauses"
	self assert: self topEntity clauses size equals: 1.
	
		stack push: (stack top clauses at: 1).
		self assert: self topEntity sourceCode equals: 'for k,v in class_indices.items()'.
		self assert: (self topEntity isOfType: FASTPyForInClause).
		
		"Testing value of monovalue relation left"
		self assert: self topEntity left isNotNil.

			stack push: self topEntity left.
			self assert: self topEntity sourceCode equals: 'k,v'.
			self assert: (self topEntity isOfType: FASTPyPatternList).
			
			"Testing value of multivalued relation elements"
			self assert: self topEntity elements size equals: 2.
			
				stack push: (stack top elements at: 1).
				self assert: self topEntity sourceCode equals: 'k'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
				stack push: (stack top elements at: 2).
				self assert: self topEntity sourceCode equals: 'v'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		
		"Testing value of monovalue relation right"
		self assert: self topEntity right isNotNil.

			stack push: self topEntity right.
			self assert: self topEntity sourceCode equals: 'class_indices.items()'.
			self assert: (self topEntity isOfType: FASTPyCall).
			self assert: (self topEntity isOfType: FASTTInvocation).
			self assert: (self topEntity isOfType: FASTTWithArguments).
			
			"Testing value of monovalue relation callee"
			self assert: self topEntity callee isNotNil.

				stack push: self topEntity callee.
				self assert: self topEntity sourceCode equals: 'class_indices.items'.
				self assert: (self topEntity isOfType: FASTPyAttributeAccess).
				
				"Testing value of monovalue relation attribute"
				self assert: self topEntity attribute isNotNil.

					stack push: self topEntity attribute.
					self assert: self topEntity sourceCode equals: 'items'.
					self assert: (self topEntity isOfType: FASTPyVariable).
					self assert: (self topEntity isOfType: FASTTVariableEntity).
					stack pop.
				
				"Testing value of monovalue relation object"
				self assert: self topEntity object isNotNil.

					stack push: self topEntity object.
					self assert: self topEntity sourceCode equals: 'class_indices'.
					self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testDoubleQuotedString [

	| string |
	self parse: '"This is a string"'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	string := (fast allWithType: FASTPyString) anyOne.
	self assert: string sourceCode equals: '"This is a string"'.
	self assert: (string isOfType: FASTTStringLiteral).
	self assertEmpty: string allContainedEntities "This is because TreeSitter has nodes inside a string but we do not care about that in FAST. This is to avoid a regression"
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testEllipsis [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testEllipsis 	"

	self parse: '...'.

	self assert: (fast allWithType: FASTPyEllipsis) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '...'.
	self assert: (self topEntity isOfType: FASTPyEllipsis).
	self assert: (self topEntity isOfType: FASTTLiteral)
]

{ #category : 'tests' }
FASTPythonImporterTest >> testExpressionList [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testExpressionList 	"

	self parse: 'def myFunct():
	return 1 + 2, len("abc"), 3 * 4'.

	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 2.
	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyExpressionList) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 4.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def myFunct():
	return 1 + 2, len("abc"), 3 * 4' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	self assert: self topEntity name equals: 'myFunct'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'return 1 + 2, len("abc"), 3 * 4'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'return 1 + 2, len("abc"), 3 * 4'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			self assert: (self topEntity isOfType: FASTTReturnStatement).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: '1 + 2, len("abc"), 3 * 4'.
				self assert: (self topEntity isOfType: FASTPyExpressionList).
				
				"Testing value of multivalued relation expressions"
				self assert: self topEntity expressions size equals: 3.
				
					stack push: (stack top expressions at: 1).
					self assert: self topEntity sourceCode equals: '1 + 2'.
					self assert: (self topEntity isOfType: FASTPyBinaryOperator).
					self assert: (self topEntity isOfType: FASTTBinaryExpression).
					
					"Testing value of monovalue relation leftOperand"
					self assert: self topEntity leftOperand isNotNil.

						stack push: self topEntity leftOperand.
						self assert: self topEntity sourceCode equals: '1'.
						self assert: (self topEntity isOfType: FASTPyInteger).
						self assert: (self topEntity isOfType: FASTTLiteral).
						self assert: (self topEntity isOfType: FASTTNumericalLiteral).
						stack pop.
					self assert: self topEntity operator equals: '+'.
					
					"Testing value of monovalue relation rightOperand"
					self assert: self topEntity rightOperand isNotNil.

						stack push: self topEntity rightOperand.
						self assert: self topEntity sourceCode equals: '2'.
						self assert: (self topEntity isOfType: FASTPyInteger).
						self assert: (self topEntity isOfType: FASTTLiteral).
						self assert: (self topEntity isOfType: FASTTNumericalLiteral).
						stack pop.
					stack pop.
				
					stack push: (stack top expressions at: 2).
					self assert: self topEntity sourceCode equals: 'len("abc")'.
					self assert: (self topEntity isOfType: FASTPyCall).
					self assert: (self topEntity isOfType: FASTTInvocation).
					self assert: (self topEntity isOfType: FASTTWithArguments).
					
					"Testing value of multivalued relation arguments"
					self assert: self topEntity arguments size equals: 1.
					
						stack push: (stack top arguments at: 1).
						self assert: self topEntity sourceCode equals: '"abc"'.
						self assert: (self topEntity isOfType: FASTPyString).
						self assert: (self topEntity isOfType: FASTTLiteral).
						self assert: (self topEntity isOfType: FASTTStringLiteral).
						stack pop.
					
					"Testing value of monovalue relation callee"
					self assert: self topEntity callee isNotNil.

						stack push: self topEntity callee.
						self assert: self topEntity sourceCode equals: 'len'.
						self assert: (self topEntity isOfType: FASTPyIdentifier).
						stack pop.
					stack pop.
				
					stack push: (stack top expressions at: 3).
					self assert: self topEntity sourceCode equals: '3 * 4'.
					self assert: (self topEntity isOfType: FASTPyBinaryOperator).
					self assert: (self topEntity isOfType: FASTTBinaryExpression).
					
					"Testing value of monovalue relation leftOperand"
					self assert: self topEntity leftOperand isNotNil.

						stack push: self topEntity leftOperand.
						self assert: self topEntity sourceCode equals: '3'.
						self assert: (self topEntity isOfType: FASTPyInteger).
						self assert: (self topEntity isOfType: FASTTLiteral).
						self assert: (self topEntity isOfType: FASTTNumericalLiteral).
						stack pop.
					self assert: self topEntity operator equals: '*'.
					
					"Testing value of monovalue relation rightOperand"
					self assert: self topEntity rightOperand isNotNil.

						stack push: self topEntity rightOperand.
						self assert: self topEntity sourceCode equals: '4'.
						self assert: (self topEntity isOfType: FASTPyInteger).
						self assert: (self topEntity isOfType: FASTTLiteral).
						self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testFalse [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testFalse 	"

	self parse: 'False'.

	self assert: (fast allWithType: FASTPyBoolean) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'False'.
	self assert: (self topEntity isOfType: FASTPyBoolean).
	self assert: (self topEntity isOfType: FASTTBooleanLiteral).
	self assert: (self topEntity isOfType: FASTTLiteral)
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testFloat [

	| boolean |
	self parse: '42.0'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyFloat) size equals: 1.

	boolean := (fast allWithType: FASTPyFloat) anyOne.
	self assert: boolean sourceCode equals: '42.0'.
	self assert: (boolean isOfType: FASTTLiteral)
]

{ #category : 'tests - advanced statements' }
FASTPythonImporterTest >> testForStatement [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testForStatement 	"

	self parse: 'for i in [ ]:
    continue'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyContinueStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyForStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyList) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'for i in [ ]:
    continue' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyForStatement).
	self assert: (self topEntity isOfType: FASTTLoopStatement).
	
	"Testing value of monovalue relation body"
	self assert: self topEntity body isNotNil.

		stack push: self topEntity body.
		self assert: self topEntity sourceCode equals: 'continue'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'continue'.
			self assert: (self topEntity isOfType: FASTPyContinueStatement).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation left"
	self assert: self topEntity left isNotNil.

		stack push: self topEntity left.
		self assert: self topEntity sourceCode equals: 'i'.
		self assert: (self topEntity isOfType: FASTPyIdentifier).
		stack pop.
	
	"Testing value of monovalue relation right"
	self assert: self topEntity right isNotNil.

		stack push: self topEntity right.
		self assert: self topEntity sourceCode equals: '[ ]'.
		self assert: (self topEntity isOfType: FASTPyList)
]

{ #category : 'tests - advanced statements' }
FASTPythonImporterTest >> testForStatementWithElseClause [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testForStatementWithElseClause 	"

	self parse: 'for c in [1, 3, 5]:
    fun(c)
else: print("Hello")'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 2.
	self assert: (fast allWithType: FASTPyElseClause) size equals: 1.
	self assert: (fast allWithType: FASTPyForStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 4.
	self assert: (fast allWithType: FASTPyInteger) size equals: 3.
	self assert: (fast allWithType: FASTPyList) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'for c in [1, 3, 5]:
    fun(c)
else: print("Hello")' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyForStatement).
	self assert: (self topEntity isOfType: FASTPyTWithElseClause).
	self assert: (self topEntity isOfType: FASTTLoopStatement).
	
	"Testing value of monovalue relation body"
	self assert: self topEntity body isNotNil.

		stack push: self topEntity body.
		self assert: self topEntity sourceCode equals: 'fun(c)'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'fun(c)'.
			self assert: (self topEntity isOfType: FASTPyCall).
			self assert: (self topEntity isOfType: FASTTInvocation).
			self assert: (self topEntity isOfType: FASTTWithArguments).
			
			"Testing value of multivalued relation arguments"
			self assert: self topEntity arguments size equals: 1.
			
				stack push: (stack top arguments at: 1).
				self assert: self topEntity sourceCode equals: 'c'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
			"Testing value of monovalue relation callee"
			self assert: self topEntity callee isNotNil.

				stack push: self topEntity callee.
				self assert: self topEntity sourceCode equals: 'fun'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation elseClause"
	self assert: self topEntity elseClause isNotNil.

		stack push: self topEntity elseClause.
		self assert: self topEntity sourceCode equals: 'print("Hello")'.
		self assert: (self topEntity isOfType: FASTPyElseClause).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'print("Hello")'.
			self assert: (self topEntity isOfType: FASTPyCall).
			self assert: (self topEntity isOfType: FASTTInvocation).
			self assert: (self topEntity isOfType: FASTTWithArguments).
			
			"Testing value of multivalued relation arguments"
			self assert: self topEntity arguments size equals: 1.
			
				stack push: (stack top arguments at: 1).
				self assert: self topEntity sourceCode equals: '"Hello"'.
				self assert: (self topEntity isOfType: FASTPyString).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTStringLiteral).
				stack pop.
			
			"Testing value of monovalue relation callee"
			self assert: self topEntity callee isNotNil.

				stack push: self topEntity callee.
				self assert: self topEntity sourceCode equals: 'print'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation left"
	self assert: self topEntity left isNotNil.

		stack push: self topEntity left.
		self assert: self topEntity sourceCode equals: 'c'.
		self assert: (self topEntity isOfType: FASTPyIdentifier).
		stack pop.
	
	"Testing value of monovalue relation right"
	self assert: self topEntity right isNotNil.

		stack push: self topEntity right.
		self assert: self topEntity sourceCode equals: '[1, 3, 5]'.
		self assert: (self topEntity isOfType: FASTPyList).
		
		"Testing value of multivalued relation initializers"
		self assert: self topEntity initializers size equals: 3.
		
			stack push: (stack top initializers at: 1).
			self assert: self topEntity sourceCode equals: '1'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		
			stack push: (stack top initializers at: 2).
			self assert: self topEntity sourceCode equals: '3'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		
			stack push: (stack top initializers at: 3).
			self assert: self topEntity sourceCode equals: '5'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - advanced statements' }
FASTPythonImporterTest >> testForStatementWithForInClauseAndTuplePattern [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testForStatementWithForInClauseAndTuplePattern 	"

	self parse: 'for idx, (heights, widths) in data:
    print(idx, heights, widths)'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyForStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 8.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyPatternList) size equals: 1.
	self assert: (fast allWithType: FASTPyTuplePattern) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'for idx, (heights, widths) in data:
    print(idx, heights, widths)' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyForStatement).
	self assert: (self topEntity isOfType: FASTTLoopStatement).
	
	"Testing value of monovalue relation body"
	self assert: self topEntity body isNotNil.

		stack push: self topEntity body.
		self assert: self topEntity sourceCode equals: 'print(idx, heights, widths)'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'print(idx, heights, widths)'.
			self assert: (self topEntity isOfType: FASTPyCall).
			self assert: (self topEntity isOfType: FASTTInvocation).
			self assert: (self topEntity isOfType: FASTTWithArguments).
			
			"Testing value of multivalued relation arguments"
			self assert: self topEntity arguments size equals: 3.
			
				stack push: (stack top arguments at: 1).
				self assert: self topEntity sourceCode equals: 'idx'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
				stack push: (stack top arguments at: 2).
				self assert: self topEntity sourceCode equals: 'heights'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
				stack push: (stack top arguments at: 3).
				self assert: self topEntity sourceCode equals: 'widths'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
			"Testing value of monovalue relation callee"
			self assert: self topEntity callee isNotNil.

				stack push: self topEntity callee.
				self assert: self topEntity sourceCode equals: 'print'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation left"
	self assert: self topEntity left isNotNil.

		stack push: self topEntity left.
		self assert: self topEntity sourceCode equals: 'idx, (heights, widths)'.
		self assert: (self topEntity isOfType: FASTPyPatternList).
		
		"Testing value of multivalued relation elements"
		self assert: self topEntity elements size equals: 2.
		
			stack push: (stack top elements at: 1).
			self assert: self topEntity sourceCode equals: 'idx'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
			stack push: (stack top elements at: 2).
			self assert: self topEntity sourceCode equals: '(heights, widths)'.
			self assert: (self topEntity isOfType: FASTPyTuplePattern).
			
			"Testing value of multivalued relation patterns"
			self assert: self topEntity patterns size equals: 2.
			
				stack push: (stack top patterns at: 1).
				self assert: self topEntity sourceCode equals: 'heights'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
				stack push: (stack top patterns at: 2).
				self assert: self topEntity sourceCode equals: 'widths'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation right"
	self assert: self topEntity right isNotNil.

		stack push: self topEntity right.
		self assert: self topEntity sourceCode equals: 'data'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImport [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testFromImport 	"

	self parse: 'from datetime import date'.

	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'from datetime import date'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromModule"
	self assert: self topEntity fromModule isNotNil.

		stack push: self topEntity fromModule.
		self assert: self topEntity sourceCode equals: 'datetime'.
		self assert: (self topEntity isOfType: FASTPyFromModule).
		self assert: self topEntity segments equals: #('datetime').
		stack pop.
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 1.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'date'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('date')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportMultiple [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testFromImportMultiple 	"

	self parse: 'from collections import Counter, defaultdic'.

	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'from collections import Counter, defaultdic'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromModule"
	self assert: self topEntity fromModule isNotNil.

		stack push: self topEntity fromModule.
		self assert: self topEntity sourceCode equals: 'collections'.
		self assert: (self topEntity isOfType: FASTPyFromModule).
		self assert: self topEntity segments equals: #('collections').
		stack pop.
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 2.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'Counter'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('Counter').
		stack pop.
	
		stack push: (stack top importedEntities at: 2).
		self assert: self topEntity sourceCode equals: 'defaultdic'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('defaultdic')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportMultipleWithAlias [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testFromImportMultipleWithAlias 	"

	self parse: 'from math import sin, cos as cosinus, pi'.

	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'from math import sin, cos as cosinus, pi'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromModule"
	self assert: self topEntity fromModule isNotNil.

		stack push: self topEntity fromModule.
		self assert: self topEntity sourceCode equals: 'math'.
		self assert: (self topEntity isOfType: FASTPyFromModule).
		self assert: self topEntity segments equals: #('math').
		stack pop.
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 3.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'sin'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('sin').
		stack pop.
	
		stack push: (stack top importedEntities at: 2).
		self assert: self topEntity sourceCode equals: 'cos as cosinus'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity alias equals: 'cosinus'.
		self assert: self topEntity segments equals: #('cos').
		stack pop.
	
		stack push: (stack top importedEntities at: 3).
		self assert: self topEntity sourceCode equals: 'pi'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('pi')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportMultipleWithParenthesis [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testFromImportMultipleWithParenthesis 	"

	self parse: 'from math import (count, cycle, repeat,)'.

	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'from math import (count, cycle, repeat,)'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromModule"
	self assert: self topEntity fromModule isNotNil.

		stack push: self topEntity fromModule.
		self assert: self topEntity sourceCode equals: 'math'.
		self assert: (self topEntity isOfType: FASTPyFromModule).
		self assert: self topEntity segments equals: #('math').
		stack pop.
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 3.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'count'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('count').
		stack pop.
	
		stack push: (stack top importedEntities at: 2).
		self assert: self topEntity sourceCode equals: 'cycle'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('cycle').
		stack pop.
	
		stack push: (stack top importedEntities at: 3).
		self assert: self topEntity sourceCode equals: 'repeat'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('repeat')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportMultipleWithParenthesisAndAlias [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testFromImportMultipleWithParenthesisAndAlias 	"

	self parse: 'from math import (count, cycle as c, repeat,)'.

	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'from math import (count, cycle as c, repeat,)'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromModule"
	self assert: self topEntity fromModule isNotNil.

		stack push: self topEntity fromModule.
		self assert: self topEntity sourceCode equals: 'math'.
		self assert: (self topEntity isOfType: FASTPyFromModule).
		self assert: self topEntity segments equals: #('math').
		stack pop.
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 3.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'count'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('count').
		stack pop.
	
		stack push: (stack top importedEntities at: 2).
		self assert: self topEntity sourceCode equals: 'cycle as c'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity alias equals: 'c'.
		self assert: self topEntity segments equals: #('cycle').
		stack pop.
	
		stack push: (stack top importedEntities at: 3).
		self assert: self topEntity sourceCode equals: 'repeat'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('repeat')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportRelative [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testFromImportRelative 	"

	self parse: 'from ..utils.extra import module'.

	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'from ..utils.extra import module'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromModule"
	self assert: self topEntity fromModule isNotNil.

		stack push: self topEntity fromModule.
		self assert: self topEntity sourceCode equals: '..'.
		self assert: (self topEntity isOfType: FASTPyFromModule).
		self assert: self topEntity segments equals: #('..' 'utils' 'extra').
		stack pop.
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 1.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'module'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('module')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportRelativeWithAlias [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testFromImportRelativeWithAlias 	"

	self parse: 'from ..utils import module as mod'.

	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'from ..utils import module as mod'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromModule"
	self assert: self topEntity fromModule isNotNil.

		stack push: self topEntity fromModule.
		self assert: self topEntity sourceCode equals: '..'.
		self assert: (self topEntity isOfType: FASTPyFromModule).
		self assert: self topEntity segments equals: #('..' 'utils').
		stack pop.
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 1.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'module as mod'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity alias equals: 'mod'.
		self assert: self topEntity segments equals: #('module')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportRelativeWithDoubleDot [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testFromImportRelativeWithDoubleDot 	"

	self parse: 'from .. import module'.

	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'from .. import module'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromModule"
	self assert: self topEntity fromModule isNotNil.

		stack push: self topEntity fromModule.
		self assert: self topEntity sourceCode equals: '..'.
		self assert: (self topEntity isOfType: FASTPyFromModule).
		self assert: self topEntity segments equals: #('..').
		stack pop.
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 1.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'module'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('module')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportRelativeWithOnlyOneDot [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testFromImportRelativeWithOnlyOneDot 	"

	self parse: 'from . import module'.

	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'from . import module'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromModule"
	self assert: self topEntity fromModule isNotNil.

		stack push: self topEntity fromModule.
		self assert: self topEntity sourceCode equals: '.'.
		self assert: (self topEntity isOfType: FASTPyFromModule).
		self assert: self topEntity segments equals: #('.').
		stack pop.
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 1.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'module'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('module')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportWithAlias [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testFromImportWithAlias 	"

	self parse: 'from datetime import date as d'.

	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'from datetime import date as d'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromModule"
	self assert: self topEntity fromModule isNotNil.

		stack push: self topEntity fromModule.
		self assert: self topEntity sourceCode equals: 'datetime'.
		self assert: (self topEntity isOfType: FASTPyFromModule).
		self assert: self topEntity segments equals: #('datetime').
		stack pop.
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 1.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'date as d'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity alias equals: 'd'.
		self assert: self topEntity segments equals: #('date')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportWithWildcard [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testFromImportWithWildcard 	"

	self parse: 'from math import *'.

	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'from math import *'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromModule"
	self assert: self topEntity fromModule isNotNil.

		stack push: self topEntity fromModule.
		self assert: self topEntity sourceCode equals: 'math'.
		self assert: (self topEntity isOfType: FASTPyFromModule).
		self assert: self topEntity segments equals: #('math').
		stack pop.
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 1.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: '*'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('*')
]

{ #category : 'tests' }
FASTPythonImporterTest >> testFunctionDefinition [

	| function |
	self parse: 'def test():
	return 1'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.

	function := (fast allWithType: FASTPyFunctionDefinition) anyOne.
	self assert: function name equals: 'test'
]

{ #category : 'tests - parameters' }
FASTPythonImporterTest >> testFunctionParameters [

	| function |
	self parse: 'def add(a, b):
	return a + b'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	function := (fast allWithType: FASTPyFunctionDefinition) anyOne.

	self assert: (fast allWithType: FASTPyParameter) size equals: 2.
	self assertCollection: (fast allWithType: FASTPyParameter) hasSameElements: function parameters.
	function parameters do: [ :parameter | self assert: (parameter isOfType: FASTPyParameter) ].
	self assertCollection: (function parameters collect: #name) hasSameElements: #( 'a' 'b' )
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFutureImport [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testFutureImport 	"

	self parse: 'from __future__ import annotiations as ann, division'.

	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'from __future__ import annotiations as ann, division'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromModule"
	self assert: self topEntity fromModule isNotNil.

		stack push: self topEntity fromModule.
		self assert: self topEntity sourceCode equals: 'from __future__ import annotiations as ann, division'.
		self assert: (self topEntity isOfType: FASTPyFromModule).
		self assert: self topEntity segments equals: #('__future__').
		stack pop.
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 2.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'annotiations as ann'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity alias equals: 'ann'.
		self assert: self topEntity segments equals: #('annotiations').
		stack pop.
	
		stack push: (stack top importedEntities at: 2).
		self assert: self topEntity sourceCode equals: 'division'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('division')
]

{ #category : 'tests - comprehension' }
FASTPythonImporterTest >> testGeneratorExpression [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testGeneratorExpression 	"

	self parse: '(x * x for x in range(10))'.

	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyForInClause) size equals: 1.
	self assert: (fast allWithType: FASTPyGeneratorExpression) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 4.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '(x * x for x in range(10))'.
	self assert: (self topEntity isOfType: FASTPyGeneratorExpression).
	self assert: (self topEntity isOfType: FASTPyTComprehension).
	
	"Testing value of monovalue relation body"
	self assert: self topEntity body isNotNil.

		stack push: self topEntity body.
		self assert: self topEntity sourceCode equals: 'x * x'.
		self assert: (self topEntity isOfType: FASTPyBinaryOperator).
		self assert: (self topEntity isOfType: FASTTBinaryExpression).
		
		"Testing value of monovalue relation leftOperand"
		self assert: self topEntity leftOperand isNotNil.

			stack push: self topEntity leftOperand.
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		self assert: self topEntity operator equals: '*'.
		
		"Testing value of monovalue relation rightOperand"
		self assert: self topEntity rightOperand isNotNil.

			stack push: self topEntity rightOperand.
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	
	"Testing value of multivalued relation clauses"
	self assert: self topEntity clauses size equals: 1.
	
		stack push: (stack top clauses at: 1).
		self assert: self topEntity sourceCode equals: 'for x in range(10)'.
		self assert: (self topEntity isOfType: FASTPyForInClause).
		
		"Testing value of monovalue relation left"
		self assert: self topEntity left isNotNil.

			stack push: self topEntity left.
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
		"Testing value of monovalue relation right"
		self assert: self topEntity right isNotNil.

			stack push: self topEntity right.
			self assert: self topEntity sourceCode equals: 'range(10)'.
			self assert: (self topEntity isOfType: FASTPyCall).
			self assert: (self topEntity isOfType: FASTTInvocation).
			self assert: (self topEntity isOfType: FASTTWithArguments).
			
			"Testing value of multivalued relation arguments"
			self assert: self topEntity arguments size equals: 1.
			
				stack push: (stack top arguments at: 1).
				self assert: self topEntity sourceCode equals: '10'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			
			"Testing value of monovalue relation callee"
			self assert: self topEntity callee isNotNil.

				stack push: self topEntity callee.
				self assert: self topEntity sourceCode equals: 'range'.
				self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testGlobalStatement [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testGlobalStatement 	"

	self parse: 'def aFunction():
	global counter
	return counter'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyGlobalStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def aFunction():
	global counter
	return counter' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'global counter
	return counter' withPlatformLineEndings.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 2.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'global counter'.
			self assert: (self topEntity isOfType: FASTPyGlobalStatement).
			
			"Testing value of multivalued relation variables"
			self assert: self topEntity variables size equals: 1.
			
				stack push: (stack top variables at: 1).
				self assert: self topEntity sourceCode equals: 'counter'.
				self assert: (self topEntity isOfType: FASTPyVariable).
				self assert: (self topEntity isOfType: FASTTVariableEntity).
				stack pop.
			stack pop.
		
			stack push: (stack top statements at: 2).
			self assert: self topEntity sourceCode equals: 'return counter'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			self assert: (self topEntity isOfType: FASTTReturnStatement).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: 'counter'.
				self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testGlobalStatementMultiple [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testGlobalStatementMultiple 	"

	self parse: 'def function ():
	global x, y, z
	return (x, y, z)'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyGlobalStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyTuple) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 3.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def function ():
	global x, y, z
	return (x, y, z)' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	self assert: self topEntity name equals: 'function'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'global x, y, z
	return (x, y, z)' withPlatformLineEndings.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 2.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'global x, y, z'.
			self assert: (self topEntity isOfType: FASTPyGlobalStatement).
			
			"Testing value of multivalued relation variables"
			self assert: self topEntity variables size equals: 3.
			
				stack push: (stack top variables at: 1).
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyVariable).
				self assert: (self topEntity isOfType: FASTTVariableEntity).
				stack pop.
			
				stack push: (stack top variables at: 2).
				self assert: self topEntity sourceCode equals: 'y'.
				self assert: (self topEntity isOfType: FASTPyVariable).
				self assert: (self topEntity isOfType: FASTTVariableEntity).
				stack pop.
			
				stack push: (stack top variables at: 3).
				self assert: self topEntity sourceCode equals: 'z'.
				self assert: (self topEntity isOfType: FASTPyVariable).
				self assert: (self topEntity isOfType: FASTTVariableEntity).
				stack pop.
			stack pop.
		
			stack push: (stack top statements at: 2).
			self assert: self topEntity sourceCode equals: 'return (x, y, z)'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			self assert: (self topEntity isOfType: FASTTReturnStatement).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: '(x, y, z)'.
				self assert: (self topEntity isOfType: FASTPyTuple).
				
				"Testing value of multivalued relation initializers"
				self assert: self topEntity initializers size equals: 3.
				
					stack push: (stack top initializers at: 1).
					self assert: self topEntity sourceCode equals: 'x'.
					self assert: (self topEntity isOfType: FASTPyIdentifier).
					stack pop.
				
					stack push: (stack top initializers at: 2).
					self assert: self topEntity sourceCode equals: 'y'.
					self assert: (self topEntity isOfType: FASTPyIdentifier).
					stack pop.
				
					stack push: (stack top initializers at: 3).
					self assert: self topEntity sourceCode equals: 'z'.
					self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - advanced statements' }
FASTPythonImporterTest >> testIf [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testIf 	"

	self parse: 'if x > 0:
    3'.

	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyIfStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyThenClause) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'if x > 0:
    3' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyIfStatement).
	self assert: (self topEntity isOfType: FASTTConditionalStatement).
	self assert: (self topEntity isOfType: FASTTWithCondition).
	
	"Testing value of monovalue relation condition"
	self assert: self topEntity condition isNotNil.

		stack push: self topEntity condition.
		self assert: self topEntity sourceCode equals: 'x > 0'.
		self assert: (self topEntity isOfType: FASTPyComparisonOperator).
		
		"Testing value of multivalued relation operands"
		self assert: self topEntity operands size equals: 2.
		
			stack push: (stack top operands at: 1).
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
			stack push: (stack top operands at: 2).
			self assert: self topEntity sourceCode equals: '0'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		self assert: self topEntity operators equals: #('>').
		stack pop.
	
	"Testing value of monovalue relation thenClause"
	self assert: self topEntity thenClause isNotNil.

		stack push: self topEntity thenClause.
		self assert: self topEntity sourceCode equals: '3'.
		self assert: (self topEntity isOfType: FASTPyThenClause).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: '3'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - comprehension' }
FASTPythonImporterTest >> testIfClauseInListComprehension [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testIfClauseInListComprehension 	"

	self parse: '[x for x in range(10) if x  == 0]'.

	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyForInClause) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 4.
	self assert: (fast allWithType: FASTPyIfClause) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyListComprehension) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '[x for x in range(10) if x  == 0]'.
	self assert: (self topEntity isOfType: FASTPyListComprehension).
	self assert: (self topEntity isOfType: FASTPyTComprehension).
	
	"Testing value of monovalue relation body"
	self assert: self topEntity body isNotNil.

		stack push: self topEntity body.
		self assert: self topEntity sourceCode equals: 'x'.
		self assert: (self topEntity isOfType: FASTPyIdentifier).
		stack pop.
	
	"Testing value of multivalued relation clauses"
	self assert: self topEntity clauses size equals: 2.
	
		stack push: (stack top clauses at: 1).
		self assert: self topEntity sourceCode equals: 'for x in range(10)'.
		self assert: (self topEntity isOfType: FASTPyForInClause).
		
		"Testing value of monovalue relation left"
		self assert: self topEntity left isNotNil.

			stack push: self topEntity left.
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
		"Testing value of monovalue relation right"
		self assert: self topEntity right isNotNil.

			stack push: self topEntity right.
			self assert: self topEntity sourceCode equals: 'range(10)'.
			self assert: (self topEntity isOfType: FASTPyCall).
			self assert: (self topEntity isOfType: FASTTInvocation).
			self assert: (self topEntity isOfType: FASTTWithArguments).
			
			"Testing value of multivalued relation arguments"
			self assert: self topEntity arguments size equals: 1.
			
				stack push: (stack top arguments at: 1).
				self assert: self topEntity sourceCode equals: '10'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			
			"Testing value of monovalue relation callee"
			self assert: self topEntity callee isNotNil.

				stack push: self topEntity callee.
				self assert: self topEntity sourceCode equals: 'range'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		stack pop.
	
		stack push: (stack top clauses at: 2).
		self assert: self topEntity sourceCode equals: 'if x  == 0'.
		self assert: (self topEntity isOfType: FASTPyIfClause).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'x  == 0'.
			self assert: (self topEntity isOfType: FASTPyComparisonOperator).
			
			"Testing value of multivalued relation operands"
			self assert: self topEntity operands size equals: 2.
			
				stack push: (stack top operands at: 1).
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
				stack push: (stack top operands at: 2).
				self assert: self topEntity sourceCode equals: '0'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			self assert: self topEntity operators equals: #('==')
]

{ #category : 'tests - advanced statements' }
FASTPythonImporterTest >> testIfElse [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testIfElse 	"

	self parse: 'if x > 0:
    True
else:
	False'.

	self assert: (fast allWithType: FASTPyBoolean) size equals: 2.
	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyElseClause) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyIfStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyThenClause) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'if x > 0:
    True
else:
	False' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyIfStatement).
	self assert: (self topEntity isOfType: FASTTConditionalStatement).
	self assert: (self topEntity isOfType: FASTTWithCondition).
	
	"Testing value of monovalue relation condition"
	self assert: self topEntity condition isNotNil.

		stack push: self topEntity condition.
		self assert: self topEntity sourceCode equals: 'x > 0'.
		self assert: (self topEntity isOfType: FASTPyComparisonOperator).
		
		"Testing value of multivalued relation operands"
		self assert: self topEntity operands size equals: 2.
		
			stack push: (stack top operands at: 1).
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
			stack push: (stack top operands at: 2).
			self assert: self topEntity sourceCode equals: '0'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		self assert: self topEntity operators equals: #('>').
		stack pop.
	
	"Testing value of monovalue relation elseClause"
	self assert: self topEntity elseClause isNotNil.

		stack push: self topEntity elseClause.
		self assert: self topEntity sourceCode equals: 'False'.
		self assert: (self topEntity isOfType: FASTPyElseClause).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'False'.
			self assert: (self topEntity isOfType: FASTPyBoolean).
			self assert: (self topEntity isOfType: FASTTBooleanLiteral).
			self assert: (self topEntity isOfType: FASTTLiteral).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation thenClause"
	self assert: self topEntity thenClause isNotNil.

		stack push: self topEntity thenClause.
		self assert: self topEntity sourceCode equals: 'True'.
		self assert: (self topEntity isOfType: FASTPyThenClause).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'True'.
			self assert: (self topEntity isOfType: FASTPyBoolean).
			self assert: (self topEntity isOfType: FASTTBooleanLiteral).
			self assert: (self topEntity isOfType: FASTTLiteral)
]

{ #category : 'tests - advanced statements' }
FASTPythonImporterTest >> testIfElseIf [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testIfElseIf 	"

	self parse: 'if x > 0:
    True
elif x < 10:
	False'.

	self assert: (fast allWithType: FASTPyBoolean) size equals: 2.
	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 2.
	self assert: (fast allWithType: FASTPyElifClause) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 2.
	self assert: (fast allWithType: FASTPyIfStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyThenClause) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'if x > 0:
    True
elif x < 10:
	False' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyIfStatement).
	self assert: (self topEntity isOfType: FASTTConditionalStatement).
	self assert: (self topEntity isOfType: FASTTWithCondition).
	
	"Testing value of monovalue relation condition"
	self assert: self topEntity condition isNotNil.

		stack push: self topEntity condition.
		self assert: self topEntity sourceCode equals: 'x > 0'.
		self assert: (self topEntity isOfType: FASTPyComparisonOperator).
		
		"Testing value of multivalued relation operands"
		self assert: self topEntity operands size equals: 2.
		
			stack push: (stack top operands at: 1).
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
			stack push: (stack top operands at: 2).
			self assert: self topEntity sourceCode equals: '0'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		self assert: self topEntity operators equals: #('>').
		stack pop.
	
	"Testing value of multivalued relation elifClauses"
	self assert: self topEntity elifClauses size equals: 1.
	
		stack push: (stack top elifClauses at: 1).
		self assert: self topEntity sourceCode equals: 'elif x < 10:
	False' withPlatformLineEndings.
		self assert: (self topEntity isOfType: FASTPyElifClause).
		self assert: (self topEntity isOfType: FASTTConditionalStatement).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		self assert: (self topEntity isOfType: FASTTWithCondition).
		
		"Testing value of monovalue relation condition"
		self assert: self topEntity condition isNotNil.

			stack push: self topEntity condition.
			self assert: self topEntity sourceCode equals: 'x < 10'.
			self assert: (self topEntity isOfType: FASTPyComparisonOperator).
			
			"Testing value of multivalued relation operands"
			self assert: self topEntity operands size equals: 2.
			
				stack push: (stack top operands at: 1).
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
				stack push: (stack top operands at: 2).
				self assert: self topEntity sourceCode equals: '10'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			self assert: self topEntity operators equals: #('<').
			stack pop.
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'False'.
			self assert: (self topEntity isOfType: FASTPyBoolean).
			self assert: (self topEntity isOfType: FASTTBooleanLiteral).
			self assert: (self topEntity isOfType: FASTTLiteral).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation thenClause"
	self assert: self topEntity thenClause isNotNil.

		stack push: self topEntity thenClause.
		self assert: self topEntity sourceCode equals: 'True'.
		self assert: (self topEntity isOfType: FASTPyThenClause).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'True'.
			self assert: (self topEntity isOfType: FASTPyBoolean).
			self assert: (self topEntity isOfType: FASTTBooleanLiteral).
			self assert: (self topEntity isOfType: FASTTLiteral)
]

{ #category : 'tests - advanced statements' }
FASTPythonImporterTest >> testIfElseIf2 [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testIfElseIf2 	"

	self parse: 'if x > 0:
    True
elif x < 10:
	False
elif x == 60:
	True'.

	self assert: (fast allWithType: FASTPyBoolean) size equals: 3.
	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 3.
	self assert: (fast allWithType: FASTPyElifClause) size equals: 2.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 3.
	self assert: (fast allWithType: FASTPyIfStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyThenClause) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'if x > 0:
    True
elif x < 10:
	False
elif x == 60:
	True' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyIfStatement).
	self assert: (self topEntity isOfType: FASTTConditionalStatement).
	self assert: (self topEntity isOfType: FASTTWithCondition).
	
	"Testing value of monovalue relation condition"
	self assert: self topEntity condition isNotNil.

		stack push: self topEntity condition.
		self assert: self topEntity sourceCode equals: 'x > 0'.
		self assert: (self topEntity isOfType: FASTPyComparisonOperator).
		
		"Testing value of multivalued relation operands"
		self assert: self topEntity operands size equals: 2.
		
			stack push: (stack top operands at: 1).
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
			stack push: (stack top operands at: 2).
			self assert: self topEntity sourceCode equals: '0'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		self assert: self topEntity operators equals: #('>').
		stack pop.
	
	"Testing value of multivalued relation elifClauses"
	self assert: self topEntity elifClauses size equals: 2.
	
		stack push: (stack top elifClauses at: 1).
		self assert: self topEntity sourceCode equals: 'elif x < 10:
	False' withPlatformLineEndings.
		self assert: (self topEntity isOfType: FASTPyElifClause).
		self assert: (self topEntity isOfType: FASTTConditionalStatement).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		self assert: (self topEntity isOfType: FASTTWithCondition).
		
		"Testing value of monovalue relation condition"
		self assert: self topEntity condition isNotNil.

			stack push: self topEntity condition.
			self assert: self topEntity sourceCode equals: 'x < 10'.
			self assert: (self topEntity isOfType: FASTPyComparisonOperator).
			
			"Testing value of multivalued relation operands"
			self assert: self topEntity operands size equals: 2.
			
				stack push: (stack top operands at: 1).
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
				stack push: (stack top operands at: 2).
				self assert: self topEntity sourceCode equals: '10'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			self assert: self topEntity operators equals: #('<').
			stack pop.
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'False'.
			self assert: (self topEntity isOfType: FASTPyBoolean).
			self assert: (self topEntity isOfType: FASTTBooleanLiteral).
			self assert: (self topEntity isOfType: FASTTLiteral).
			stack pop.
		stack pop.
	
		stack push: (stack top elifClauses at: 2).
		self assert: self topEntity sourceCode equals: 'elif x == 60:
	True' withPlatformLineEndings.
		self assert: (self topEntity isOfType: FASTPyElifClause).
		self assert: (self topEntity isOfType: FASTTConditionalStatement).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		self assert: (self topEntity isOfType: FASTTWithCondition).
		
		"Testing value of monovalue relation condition"
		self assert: self topEntity condition isNotNil.

			stack push: self topEntity condition.
			self assert: self topEntity sourceCode equals: 'x == 60'.
			self assert: (self topEntity isOfType: FASTPyComparisonOperator).
			
			"Testing value of multivalued relation operands"
			self assert: self topEntity operands size equals: 2.
			
				stack push: (stack top operands at: 1).
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
				stack push: (stack top operands at: 2).
				self assert: self topEntity sourceCode equals: '60'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			self assert: self topEntity operators equals: #('==').
			stack pop.
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'True'.
			self assert: (self topEntity isOfType: FASTPyBoolean).
			self assert: (self topEntity isOfType: FASTTBooleanLiteral).
			self assert: (self topEntity isOfType: FASTTLiteral).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation thenClause"
	self assert: self topEntity thenClause isNotNil.

		stack push: self topEntity thenClause.
		self assert: self topEntity sourceCode equals: 'True'.
		self assert: (self topEntity isOfType: FASTPyThenClause).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'True'.
			self assert: (self topEntity isOfType: FASTPyBoolean).
			self assert: (self topEntity isOfType: FASTTBooleanLiteral).
			self assert: (self topEntity isOfType: FASTTLiteral)
]

{ #category : 'tests - advanced statements' }
FASTPythonImporterTest >> testIfElseIfElse [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testIfElseIfElse 	"

	self parse: 'if x > 0:
    True
elif x < 10:
	False
elif x == 60:
	True
else:
	False'.

	self assert: (fast allWithType: FASTPyBoolean) size equals: 4.
	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 3.
	self assert: (fast allWithType: FASTPyElifClause) size equals: 2.
	self assert: (fast allWithType: FASTPyElseClause) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 3.
	self assert: (fast allWithType: FASTPyIfStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyThenClause) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'if x > 0:
    True
elif x < 10:
	False
elif x == 60:
	True
else:
	False' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyIfStatement).
	self assert: (self topEntity isOfType: FASTTConditionalStatement).
	self assert: (self topEntity isOfType: FASTTWithCondition).
	
	"Testing value of monovalue relation condition"
	self assert: self topEntity condition isNotNil.

		stack push: self topEntity condition.
		self assert: self topEntity sourceCode equals: 'x > 0'.
		self assert: (self topEntity isOfType: FASTPyComparisonOperator).
		
		"Testing value of multivalued relation operands"
		self assert: self topEntity operands size equals: 2.
		
			stack push: (stack top operands at: 1).
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
			stack push: (stack top operands at: 2).
			self assert: self topEntity sourceCode equals: '0'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		self assert: self topEntity operators equals: #('>').
		stack pop.
	
	"Testing value of multivalued relation elifClauses"
	self assert: self topEntity elifClauses size equals: 2.
	
		stack push: (stack top elifClauses at: 1).
		self assert: self topEntity sourceCode equals: 'elif x < 10:
	False' withPlatformLineEndings.
		self assert: (self topEntity isOfType: FASTPyElifClause).
		self assert: (self topEntity isOfType: FASTTConditionalStatement).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		self assert: (self topEntity isOfType: FASTTWithCondition).
		
		"Testing value of monovalue relation condition"
		self assert: self topEntity condition isNotNil.

			stack push: self topEntity condition.
			self assert: self topEntity sourceCode equals: 'x < 10'.
			self assert: (self topEntity isOfType: FASTPyComparisonOperator).
			
			"Testing value of multivalued relation operands"
			self assert: self topEntity operands size equals: 2.
			
				stack push: (stack top operands at: 1).
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
				stack push: (stack top operands at: 2).
				self assert: self topEntity sourceCode equals: '10'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			self assert: self topEntity operators equals: #('<').
			stack pop.
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'False'.
			self assert: (self topEntity isOfType: FASTPyBoolean).
			self assert: (self topEntity isOfType: FASTTBooleanLiteral).
			self assert: (self topEntity isOfType: FASTTLiteral).
			stack pop.
		stack pop.
	
		stack push: (stack top elifClauses at: 2).
		self assert: self topEntity sourceCode equals: 'elif x == 60:
	True' withPlatformLineEndings.
		self assert: (self topEntity isOfType: FASTPyElifClause).
		self assert: (self topEntity isOfType: FASTTConditionalStatement).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		self assert: (self topEntity isOfType: FASTTWithCondition).
		
		"Testing value of monovalue relation condition"
		self assert: self topEntity condition isNotNil.

			stack push: self topEntity condition.
			self assert: self topEntity sourceCode equals: 'x == 60'.
			self assert: (self topEntity isOfType: FASTPyComparisonOperator).
			
			"Testing value of multivalued relation operands"
			self assert: self topEntity operands size equals: 2.
			
				stack push: (stack top operands at: 1).
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
				stack push: (stack top operands at: 2).
				self assert: self topEntity sourceCode equals: '60'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			self assert: self topEntity operators equals: #('==').
			stack pop.
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'True'.
			self assert: (self topEntity isOfType: FASTPyBoolean).
			self assert: (self topEntity isOfType: FASTTBooleanLiteral).
			self assert: (self topEntity isOfType: FASTTLiteral).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation elseClause"
	self assert: self topEntity elseClause isNotNil.

		stack push: self topEntity elseClause.
		self assert: self topEntity sourceCode equals: 'False'.
		self assert: (self topEntity isOfType: FASTPyElseClause).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'False'.
			self assert: (self topEntity isOfType: FASTPyBoolean).
			self assert: (self topEntity isOfType: FASTTBooleanLiteral).
			self assert: (self topEntity isOfType: FASTTLiteral).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation thenClause"
	self assert: self topEntity thenClause isNotNil.

		stack push: self topEntity thenClause.
		self assert: self topEntity sourceCode equals: 'True'.
		self assert: (self topEntity isOfType: FASTPyThenClause).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'True'.
			self assert: (self topEntity isOfType: FASTPyBoolean).
			self assert: (self topEntity isOfType: FASTTBooleanLiteral).
			self assert: (self topEntity isOfType: FASTTLiteral)
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testImport [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testImport 	"

	self parse: 'import random'.

	self assert: (fast allWithType: FASTPyImportStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'import random'.
	self assert: (self topEntity isOfType: FASTPyImportStatement).
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 1.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'random'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('random')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testImportDottedImport [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testImportDottedImport 	"

	self parse: 'import xml.etree.ElementTree'.

	self assert: (fast allWithType: FASTPyImportStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'import xml.etree.ElementTree'.
	self assert: (self topEntity isOfType: FASTPyImportStatement).
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 1.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'xml.etree.ElementTree'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('xml' 'etree' 'ElementTree')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testImportDottedImportAndAlias [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testImportDottedImportAndAlias 	"

	self parse: 'import xml.etree.ElementTree as ET'.

	self assert: (fast allWithType: FASTPyImportStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'import xml.etree.ElementTree as ET'.
	self assert: (self topEntity isOfType: FASTPyImportStatement).
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 1.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'xml.etree.ElementTree as ET'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity alias equals: 'ET'.
		self assert: self topEntity segments equals: #('xml' 'etree' 'ElementTree')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testImportMultiple [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testImportMultiple 	"

	self parse: 'import random, collections'.

	self assert: (fast allWithType: FASTPyImportStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'import random, collections'.
	self assert: (self topEntity isOfType: FASTPyImportStatement).
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 2.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'random'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('random').
		stack pop.
	
		stack push: (stack top importedEntities at: 2).
		self assert: self topEntity sourceCode equals: 'collections'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('collections')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testImportMultipleAndAliases [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testImportMultipleAndAliases 	"

	self parse: 'import random as rand, collections'.

	self assert: (fast allWithType: FASTPyImportStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'import random as rand, collections'.
	self assert: (self topEntity isOfType: FASTPyImportStatement).
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 2.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'random as rand'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity alias equals: 'rand'.
		self assert: self topEntity segments equals: #('random').
		stack pop.
	
		stack push: (stack top importedEntities at: 2).
		self assert: self topEntity sourceCode equals: 'collections'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('collections')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testImportWithAlias [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testImportWithAlias 	"

	self parse: 'import random as rand'.

	self assert: (fast allWithType: FASTPyImportStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'import random as rand'.
	self assert: (self topEntity isOfType: FASTPyImportStatement).
	
	"Testing value of multivalued relation importedEntities"
	self assert: self topEntity importedEntities size equals: 1.
	
		stack push: (stack top importedEntities at: 1).
		self assert: self topEntity sourceCode equals: 'random as rand'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity alias equals: 'rand'.
		self assert: self topEntity segments equals: #('random')
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testInteger [

	| boolean |
	self parse: '42'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.

	boolean := (fast allWithType: FASTPyInteger) anyOne.
	self assert: boolean sourceCode equals: '42'.
	self assert: (boolean isOfType: FASTTLiteral)
]

{ #category : 'tests - interpolations' }
FASTPythonImporterTest >> testInterpolation [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testInterpolation 	"

	self parse: 'f"User {name} has {value} items"'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 2.
	self assert: (fast allWithType: FASTPyInterpolation) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'f"User {name} has {value} items"'.
	self assert: (self topEntity isOfType: FASTPyString).
	self assert: (self topEntity isOfType: FASTTLiteral).
	self assert: (self topEntity isOfType: FASTTStringLiteral).
	
	"Testing value of multivalued relation interpolations"
	self assert: self topEntity interpolations size equals: 2.
	
		stack push: (stack top interpolations at: 1).
		self assert: self topEntity sourceCode equals: '{name}'.
		self assert: (self topEntity isOfType: FASTPyInterpolation).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'name'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	
		stack push: (stack top interpolations at: 2).
		self assert: self topEntity sourceCode equals: '{value}'.
		self assert: (self topEntity isOfType: FASTPyInterpolation).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'value'.
			self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - interpolations' }
FASTPythonImporterTest >> testInterpolationWithAttributeAccess [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testInterpolationWithAttributeAccess 	"

	self parse: 'f"{CFG.model_name}"'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInterpolation) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'f"{CFG.model_name}"'.
	self assert: (self topEntity isOfType: FASTPyString).
	self assert: (self topEntity isOfType: FASTTLiteral).
	self assert: (self topEntity isOfType: FASTTStringLiteral).
	
	"Testing value of multivalued relation interpolations"
	self assert: self topEntity interpolations size equals: 1.
	
		stack push: (stack top interpolations at: 1).
		self assert: self topEntity sourceCode equals: '{CFG.model_name}'.
		self assert: (self topEntity isOfType: FASTPyInterpolation).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'CFG.model_name'.
			self assert: (self topEntity isOfType: FASTPyAttributeAccess).
			
			"Testing value of monovalue relation attribute"
			self assert: self topEntity attribute isNotNil.

				stack push: self topEntity attribute.
				self assert: self topEntity sourceCode equals: 'model_name'.
				self assert: (self topEntity isOfType: FASTPyVariable).
				self assert: (self topEntity isOfType: FASTTVariableEntity).
				stack pop.
			
			"Testing value of monovalue relation object"
			self assert: self topEntity object isNotNil.

				stack push: self topEntity object.
				self assert: self topEntity sourceCode equals: 'CFG'.
				self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - interpolations' }
FASTPythonImporterTest >> testInterpolationWithBinaryOperator [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testInterpolationWithBooleanOperator 	"

	self parse: 'f"{k+1}"'.

	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyInterpolation) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'f"{k+1}"'.
	self assert: (self topEntity isOfType: FASTPyString).
	self assert: (self topEntity isOfType: FASTTLiteral).
	self assert: (self topEntity isOfType: FASTTStringLiteral).
	
	"Testing value of multivalued relation interpolations"
	self assert: self topEntity interpolations size equals: 1.
	
		stack push: (stack top interpolations at: 1).
		self assert: self topEntity sourceCode equals: '{k+1}'.
		self assert: (self topEntity isOfType: FASTPyInterpolation).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'k+1'.
			self assert: (self topEntity isOfType: FASTPyBinaryOperator).
			self assert: (self topEntity isOfType: FASTTBinaryExpression).
			
			"Testing value of monovalue relation leftOperand"
			self assert: self topEntity leftOperand isNotNil.

				stack push: self topEntity leftOperand.
				self assert: self topEntity sourceCode equals: 'k'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			self assert: self topEntity operator equals: '+'.
			
			"Testing value of monovalue relation rightOperand"
			self assert: self topEntity rightOperand isNotNil.

				stack push: self topEntity rightOperand.
				self assert: self topEntity sourceCode equals: '1'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - interpolations' }
FASTPythonImporterTest >> testInterpolationWithBooleanOperator [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testInterpolationWithBooleanOperator 	"

	self parse: 'f"{x and y}"'.

	self assert: (fast allWithType: FASTPyBooleanOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 2.
	self assert: (fast allWithType: FASTPyInterpolation) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'f"{x and y}"'.
	self assert: (self topEntity isOfType: FASTPyString).
	self assert: (self topEntity isOfType: FASTTLiteral).
	self assert: (self topEntity isOfType: FASTTStringLiteral).
	
	"Testing value of multivalued relation interpolations"
	self assert: self topEntity interpolations size equals: 1.
	
		stack push: (stack top interpolations at: 1).
		self assert: self topEntity sourceCode equals: '{x and y}'.
		self assert: (self topEntity isOfType: FASTPyInterpolation).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'x and y'.
			self assert: (self topEntity isOfType: FASTPyBooleanOperator).
			self assert: (self topEntity isOfType: FASTTBinaryExpression).
			
			"Testing value of monovalue relation leftOperand"
			self assert: self topEntity leftOperand isNotNil.

				stack push: self topEntity leftOperand.
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			self assert: self topEntity operator equals: 'and'.
			
			"Testing value of monovalue relation rightOperand"
			self assert: self topEntity rightOperand isNotNil.

				stack push: self topEntity rightOperand.
				self assert: self topEntity sourceCode equals: 'y'.
				self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - interpolations' }
FASTPythonImporterTest >> testInterpolationWithCall [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testInterpolationWithCall 	"

	self parse: 'f"{myMethod(2)}"'.

	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyInterpolation) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'f"{myMethod(2)}"'.
	self assert: (self topEntity isOfType: FASTPyString).
	self assert: (self topEntity isOfType: FASTTLiteral).
	self assert: (self topEntity isOfType: FASTTStringLiteral).
	
	"Testing value of multivalued relation interpolations"
	self assert: self topEntity interpolations size equals: 1.
	
		stack push: (stack top interpolations at: 1).
		self assert: self topEntity sourceCode equals: '{myMethod(2)}'.
		self assert: (self topEntity isOfType: FASTPyInterpolation).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'myMethod(2)'.
			self assert: (self topEntity isOfType: FASTPyCall).
			self assert: (self topEntity isOfType: FASTTInvocation).
			self assert: (self topEntity isOfType: FASTTWithArguments).
			
			"Testing value of multivalued relation arguments"
			self assert: self topEntity arguments size equals: 1.
			
				stack push: (stack top arguments at: 1).
				self assert: self topEntity sourceCode equals: '2'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			
			"Testing value of monovalue relation callee"
			self assert: self topEntity callee isNotNil.

				stack push: self topEntity callee.
				self assert: self topEntity sourceCode equals: 'myMethod'.
				self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - interpolations' }
FASTPythonImporterTest >> testInterpolationWithComparisonOperator [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testInterpolationWithComparisonOperator 	"

	self parse: 'f"{x == y}"'.

	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 2.
	self assert: (fast allWithType: FASTPyInterpolation) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'f"{x == y}"'.
	self assert: (self topEntity isOfType: FASTPyString).
	self assert: (self topEntity isOfType: FASTTLiteral).
	self assert: (self topEntity isOfType: FASTTStringLiteral).
	
	"Testing value of multivalued relation interpolations"
	self assert: self topEntity interpolations size equals: 1.
	
		stack push: (stack top interpolations at: 1).
		self assert: self topEntity sourceCode equals: '{x == y}'.
		self assert: (self topEntity isOfType: FASTPyInterpolation).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'x == y'.
			self assert: (self topEntity isOfType: FASTPyComparisonOperator).
			
			"Testing value of multivalued relation operands"
			self assert: self topEntity operands size equals: 2.
			
				stack push: (stack top operands at: 1).
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
				stack push: (stack top operands at: 2).
				self assert: self topEntity sourceCode equals: 'y'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			self assert: self topEntity operators equals: #('==')
]

{ #category : 'tests - interpolations' }
FASTPythonImporterTest >> testInterpolationWithComprehension [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testInterpolationWithComprehension 	"

	self parse: 'f"{[x for x in items]}"'.

	self assert: (fast allWithType: FASTPyForInClause) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 3.
	self assert: (fast allWithType: FASTPyInterpolation) size equals: 1.
	self assert: (fast allWithType: FASTPyListComprehension) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'f"{[x for x in items]}"'.
	self assert: (self topEntity isOfType: FASTPyString).
	self assert: (self topEntity isOfType: FASTTLiteral).
	self assert: (self topEntity isOfType: FASTTStringLiteral).
	
	"Testing value of multivalued relation interpolations"
	self assert: self topEntity interpolations size equals: 1.
	
		stack push: (stack top interpolations at: 1).
		self assert: self topEntity sourceCode equals: '{[x for x in items]}'.
		self assert: (self topEntity isOfType: FASTPyInterpolation).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: '[x for x in items]'.
			self assert: (self topEntity isOfType: FASTPyListComprehension).
			self assert: (self topEntity isOfType: FASTPyTComprehension).
			
			"Testing value of monovalue relation body"
			self assert: self topEntity body isNotNil.

				stack push: self topEntity body.
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
			"Testing value of multivalued relation clauses"
			self assert: self topEntity clauses size equals: 1.
			
				stack push: (stack top clauses at: 1).
				self assert: self topEntity sourceCode equals: 'for x in items'.
				self assert: (self topEntity isOfType: FASTPyForInClause).
				
				"Testing value of monovalue relation left"
				self assert: self topEntity left isNotNil.

					stack push: self topEntity left.
					self assert: self topEntity sourceCode equals: 'x'.
					self assert: (self topEntity isOfType: FASTPyIdentifier).
					stack pop.
				
				"Testing value of monovalue relation right"
				self assert: self topEntity right isNotNil.

					stack push: self topEntity right.
					self assert: self topEntity sourceCode equals: 'items'.
					self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - interpolations' }
FASTPythonImporterTest >> testInterpolationWithConditionalExpression [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testInterpolationWithConditionalExpression 	"

	self parse: 'f"x{ if cond else y}"'.

	self assert: (fast allWithType: FASTPyConditionalExpression) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 3.
	self assert: (fast allWithType: FASTPyInterpolation) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'f"x{ if cond else y}"'.
	self assert: (self topEntity isOfType: FASTPyString).
	self assert: (self topEntity isOfType: FASTTLiteral).
	self assert: (self topEntity isOfType: FASTTStringLiteral).
	
	"Testing value of multivalued relation interpolations"
	self assert: self topEntity interpolations size equals: 1.
	
		stack push: (stack top interpolations at: 1).
		self assert: self topEntity sourceCode equals: '{ if cond else y}'.
		self assert: (self topEntity isOfType: FASTPyInterpolation).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: ' if cond else y'.
			self assert: (self topEntity isOfType: FASTPyConditionalExpression).
			self assert: (self topEntity isOfType: FASTTWithCondition).
			
			"Testing value of monovalue relation condition"
			self assert: self topEntity condition isNotNil.

				stack push: self topEntity condition.
				self assert: self topEntity sourceCode equals: 'cond'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
			"Testing value of monovalue relation elseExpression"
			self assert: self topEntity elseExpression isNotNil.

				stack push: self topEntity elseExpression.
				self assert: self topEntity sourceCode equals: 'y'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
			"Testing value of monovalue relation thenExpression"
			self assert: self topEntity thenExpression isNotNil.

				stack push: self topEntity thenExpression.
				self assert: self topEntity sourceCode equals: ''.
				self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - interpolations' }
FASTPythonImporterTest >> testInterpolationWithFormatSpecifier [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testInterpolationWithFormatSpecifier 	"

	self parse: 'f"{255:X}"'.

	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyInterpolation) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'f"{255:X}"'.
	self assert: (self topEntity isOfType: FASTPyString).
	self assert: (self topEntity isOfType: FASTTLiteral).
	self assert: (self topEntity isOfType: FASTTStringLiteral).
	
	"Testing value of multivalued relation interpolations"
	self assert: self topEntity interpolations size equals: 1.
	
		stack push: (stack top interpolations at: 1).
		self assert: self topEntity sourceCode equals: '{255:X}'.
		self assert: (self topEntity isOfType: FASTPyInterpolation).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: '255'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		self assert: self topEntity formatSpecifier equals: 'X'
]

{ #category : 'tests - interpolations' }
FASTPythonImporterTest >> testInterpolationWithLambda [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testInterpolationWithLambda 	"

	self parse: 'f"{ (lambda x: x*2) }"'.

	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyInterpolation) size equals: 1.
	self assert: (fast allWithType: FASTPyLambda) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyParameter) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'f"{ (lambda x: x*2) }"'.
	self assert: (self topEntity isOfType: FASTPyString).
	self assert: (self topEntity isOfType: FASTTLiteral).
	self assert: (self topEntity isOfType: FASTTStringLiteral).
	
	"Testing value of multivalued relation interpolations"
	self assert: self topEntity interpolations size equals: 1.
	
		stack push: (stack top interpolations at: 1).
		self assert: self topEntity sourceCode equals: '{ (lambda x: x*2) }'.
		self assert: (self topEntity isOfType: FASTPyInterpolation).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'lambda x: x*2'.
			self assert: (self topEntity isOfType: FASTPyLambda).
			self assert: (self topEntity isOfType: FASTTWithParameters).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: 'x*2'.
				self assert: (self topEntity isOfType: FASTPyBinaryOperator).
				self assert: (self topEntity isOfType: FASTTBinaryExpression).
				
				"Testing value of monovalue relation leftOperand"
				self assert: self topEntity leftOperand isNotNil.

					stack push: self topEntity leftOperand.
					self assert: self topEntity sourceCode equals: 'x'.
					self assert: (self topEntity isOfType: FASTPyIdentifier).
					stack pop.
				self assert: self topEntity operator equals: '*'.
				
				"Testing value of monovalue relation rightOperand"
				self assert: self topEntity rightOperand isNotNil.

					stack push: self topEntity rightOperand.
					self assert: self topEntity sourceCode equals: '2'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					self assert: (self topEntity isOfType: FASTTLiteral).
					self assert: (self topEntity isOfType: FASTTNumericalLiteral).
					stack pop.
				stack pop.
			
			"Testing value of multivalued relation parameters"
			self assert: self topEntity parameters size equals: 1.
			
				stack push: (stack top parameters at: 1).
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyParameter).
				self assert: (self topEntity isOfType: FASTTVariableEntity).
				self assert: self topEntity name equals: 'x'
]

{ #category : 'tests - interpolations' }
FASTPythonImporterTest >> testInterpolationWithSubscript [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testInterpolationWithSubscript 	"

	self parse: 'f"{label_order[i]}"'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 2.
	self assert: (fast allWithType: FASTPyInterpolation) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'f"{label_order[i]}"'.
	self assert: (self topEntity isOfType: FASTPyString).
	self assert: (self topEntity isOfType: FASTTLiteral).
	self assert: (self topEntity isOfType: FASTTStringLiteral).
	
	"Testing value of multivalued relation interpolations"
	self assert: self topEntity interpolations size equals: 1.
	
		stack push: (stack top interpolations at: 1).
		self assert: self topEntity sourceCode equals: '{label_order[i]}'.
		self assert: (self topEntity isOfType: FASTPyInterpolation).
		
		"Testing value of monovalue relation expression"
		self assert: self topEntity expression isNotNil.

			stack push: self topEntity expression.
			self assert: self topEntity sourceCode equals: 'label_order[i]'.
			self assert: (self topEntity isOfType: FASTPySubscript).
			
			"Testing value of multivalued relation indices"
			self assert: self topEntity indices size equals: 1.
			
				stack push: (stack top indices at: 1).
				self assert: self topEntity sourceCode equals: 'i'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
			"Testing value of monovalue relation value"
			self assert: self topEntity value isNotNil.

				stack push: self topEntity value.
				self assert: self topEntity sourceCode equals: 'label_order'.
				self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - lambdas' }
FASTPythonImporterTest >> testLambda [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testLambda 	"

	self parse: 'lambda : 3'.

	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyLambda) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'lambda : 3'.
	self assert: (self topEntity isOfType: FASTPyLambda).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	
	"Testing value of monovalue relation expression"
	self assert: self topEntity expression isNotNil.

		stack push: self topEntity expression.
		self assert: self topEntity sourceCode equals: '3'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - lambdas' }
FASTPythonImporterTest >> testLambdaWithParameter [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testLambdaWithParameter 	"

	self parse: 'lambda x: x * x'.

	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 2.
	self assert: (fast allWithType: FASTPyLambda) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyParameter) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'lambda x: x * x'.
	self assert: (self topEntity isOfType: FASTPyLambda).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	
	"Testing value of monovalue relation expression"
	self assert: self topEntity expression isNotNil.

		stack push: self topEntity expression.
		self assert: self topEntity sourceCode equals: 'x * x'.
		self assert: (self topEntity isOfType: FASTPyBinaryOperator).
		self assert: (self topEntity isOfType: FASTTBinaryExpression).
		
		"Testing value of monovalue relation leftOperand"
		self assert: self topEntity leftOperand isNotNil.

			stack push: self topEntity leftOperand.
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		self assert: self topEntity operator equals: '*'.
		
		"Testing value of monovalue relation rightOperand"
		self assert: self topEntity rightOperand isNotNil.

			stack push: self topEntity rightOperand.
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	
	"Testing value of multivalued relation parameters"
	self assert: self topEntity parameters size equals: 1.
	
		stack push: (stack top parameters at: 1).
		self assert: self topEntity sourceCode equals: 'x'.
		self assert: (self topEntity isOfType: FASTPyParameter).
		self assert: (self topEntity isOfType: FASTTVariableEntity).
		self assert: self topEntity name equals: 'x'
]

{ #category : 'tests - lambdas' }
FASTPythonImporterTest >> testLambdaWithParameters [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testLambdaWithParameters 	"

	self parse: 'lambda a, b: a + b'.

	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 2.
	self assert: (fast allWithType: FASTPyLambda) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyParameter) size equals: 2.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'lambda a, b: a + b'.
	self assert: (self topEntity isOfType: FASTPyLambda).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	
	"Testing value of monovalue relation expression"
	self assert: self topEntity expression isNotNil.

		stack push: self topEntity expression.
		self assert: self topEntity sourceCode equals: 'a + b'.
		self assert: (self topEntity isOfType: FASTPyBinaryOperator).
		self assert: (self topEntity isOfType: FASTTBinaryExpression).
		
		"Testing value of monovalue relation leftOperand"
		self assert: self topEntity leftOperand isNotNil.

			stack push: self topEntity leftOperand.
			self assert: self topEntity sourceCode equals: 'a'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		self assert: self topEntity operator equals: '+'.
		
		"Testing value of monovalue relation rightOperand"
		self assert: self topEntity rightOperand isNotNil.

			stack push: self topEntity rightOperand.
			self assert: self topEntity sourceCode equals: 'b'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	
	"Testing value of multivalued relation parameters"
	self assert: self topEntity parameters size equals: 2.
	
		stack push: (stack top parameters at: 1).
		self assert: self topEntity sourceCode equals: 'a'.
		self assert: (self topEntity isOfType: FASTPyParameter).
		self assert: (self topEntity isOfType: FASTTVariableEntity).
		self assert: self topEntity name equals: 'a'.
		stack pop.
	
		stack push: (stack top parameters at: 2).
		self assert: self topEntity sourceCode equals: 'b'.
		self assert: (self topEntity isOfType: FASTPyParameter).
		self assert: (self topEntity isOfType: FASTTVariableEntity).
		self assert: self topEntity name equals: 'b'
]

{ #category : 'tests - collections' }
FASTPythonImporterTest >> testList [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testList 	"

	self parse: '[1, 2, 3]'.

	self assert: (fast allWithType: FASTPyInteger) size equals: 3.
	self assert: (fast allWithType: FASTPyList) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '[1, 2, 3]'.
	self assert: (self topEntity isOfType: FASTPyList).
	
	"Testing value of multivalued relation initializers"
	self assert: self topEntity initializers size equals: 3.
	
		stack push: (stack top initializers at: 1).
		self assert: self topEntity sourceCode equals: '1'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral).
		stack pop.
	
		stack push: (stack top initializers at: 2).
		self assert: self topEntity sourceCode equals: '2'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral).
		stack pop.
	
		stack push: (stack top initializers at: 3).
		self assert: self topEntity sourceCode equals: '3'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - comprehension' }
FASTPythonImporterTest >> testListComprehension [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testListComprehension 	"

	self parse: '[x * x for x in range(5)]'.

	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyForInClause) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 4.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyListComprehension) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '[x * x for x in range(5)]'.
	self assert: (self topEntity isOfType: FASTPyListComprehension).
	self assert: (self topEntity isOfType: FASTPyTComprehension).
	
	"Testing value of monovalue relation body"
	self assert: self topEntity body isNotNil.

		stack push: self topEntity body.
		self assert: self topEntity sourceCode equals: 'x * x'.
		self assert: (self topEntity isOfType: FASTPyBinaryOperator).
		self assert: (self topEntity isOfType: FASTTBinaryExpression).
		
		"Testing value of monovalue relation leftOperand"
		self assert: self topEntity leftOperand isNotNil.

			stack push: self topEntity leftOperand.
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		self assert: self topEntity operator equals: '*'.
		
		"Testing value of monovalue relation rightOperand"
		self assert: self topEntity rightOperand isNotNil.

			stack push: self topEntity rightOperand.
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	
	"Testing value of multivalued relation clauses"
	self assert: self topEntity clauses size equals: 1.
	
		stack push: (stack top clauses at: 1).
		self assert: self topEntity sourceCode equals: 'for x in range(5)'.
		self assert: (self topEntity isOfType: FASTPyForInClause).
		
		"Testing value of monovalue relation left"
		self assert: self topEntity left isNotNil.

			stack push: self topEntity left.
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
		"Testing value of monovalue relation right"
		self assert: self topEntity right isNotNil.

			stack push: self topEntity right.
			self assert: self topEntity sourceCode equals: 'range(5)'.
			self assert: (self topEntity isOfType: FASTPyCall).
			self assert: (self topEntity isOfType: FASTTInvocation).
			self assert: (self topEntity isOfType: FASTTWithArguments).
			
			"Testing value of multivalued relation arguments"
			self assert: self topEntity arguments size equals: 1.
			
				stack push: (stack top arguments at: 1).
				self assert: self topEntity sourceCode equals: '5'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			
			"Testing value of monovalue relation callee"
			self assert: self topEntity callee isNotNil.

				stack push: self topEntity callee.
				self assert: self topEntity sourceCode equals: 'range'.
				self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests' }
FASTPythonImporterTest >> testMethodDefinition [

	| method |
	self parse: 'class AClass():
	def method(self):
		pass'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyClassDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyMethodDefinition) size equals: 1.

	method := (fast allWithType: FASTPyMethodDefinition) anyOne.
	self assert: method name equals: 'method'
]

{ #category : 'tests' }
FASTPythonImporterTest >> testModuleWithTwoStatements [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testModuleWithTwoStatements 	"

	self parse: 'True
False'.

	self assert: (fast allWithType: FASTPyBoolean) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.

	stack push: fast rootEntities anyOne.
	self assert: self topEntity sourceCode equals: 'True
False' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyModule).
	self assert: (self topEntity isOfType: FASTTStatementBlock).
	self assert: (self topEntity isOfType: FamixTHasImmediateSource).
	self assert: (self topEntity isOfType: FamixTSourceAnchor).
	
	"Testing value of multivalued relation statements"
	self assert: self topEntity statements size equals: 2.
	
		stack push: (stack top statements at: 1).
		self assert: self topEntity sourceCode equals: 'True'.
		self assert: (self topEntity isOfType: FASTPyBoolean).
		self assert: (self topEntity isOfType: FASTTBooleanLiteral).
		self assert: (self topEntity isOfType: FASTTLiteral).
		stack pop.
	
		stack push: (stack top statements at: 2).
		self assert: self topEntity sourceCode equals: 'False'.
		self assert: (self topEntity isOfType: FASTPyBoolean).
		self assert: (self topEntity isOfType: FASTTBooleanLiteral).
		self assert: (self topEntity isOfType: FASTTLiteral)
]

{ #category : 'tests - advanced statements' }
FASTPythonImporterTest >> testNestedIf [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testNestedIf 	"

	self parse: 'if x > 0:
    if x < 10:
        1
    else:
        2
else:
    3'.

	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 2.
	self assert: (fast allWithType: FASTPyElseClause) size equals: 2.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 2.
	self assert: (fast allWithType: FASTPyIfStatement) size equals: 2.
	self assert: (fast allWithType: FASTPyInteger) size equals: 5.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyThenClause) size equals: 2.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'if x > 0:
    if x < 10:
        1
    else:
        2
else:
    3' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyIfStatement).
	self assert: (self topEntity isOfType: FASTTConditionalStatement).
	self assert: (self topEntity isOfType: FASTTWithCondition).
	
	"Testing value of monovalue relation condition"
	self assert: self topEntity condition isNotNil.

		stack push: self topEntity condition.
		self assert: self topEntity sourceCode equals: 'x > 0'.
		self assert: (self topEntity isOfType: FASTPyComparisonOperator).
		
		"Testing value of multivalued relation operands"
		self assert: self topEntity operands size equals: 2.
		
			stack push: (stack top operands at: 1).
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
			stack push: (stack top operands at: 2).
			self assert: self topEntity sourceCode equals: '0'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		self assert: self topEntity operators equals: #('>').
		stack pop.
	
	"Testing value of monovalue relation elseClause"
	self assert: self topEntity elseClause isNotNil.

		stack push: self topEntity elseClause.
		self assert: self topEntity sourceCode equals: '3'.
		self assert: (self topEntity isOfType: FASTPyElseClause).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: '3'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation thenClause"
	self assert: self topEntity thenClause isNotNil.

		stack push: self topEntity thenClause.
		self assert: self topEntity sourceCode equals: 'if x < 10:
        1
    else:
        2' withPlatformLineEndings.
		self assert: (self topEntity isOfType: FASTPyThenClause).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'if x < 10:
        1
    else:
        2' withPlatformLineEndings.
			self assert: (self topEntity isOfType: FASTPyIfStatement).
			self assert: (self topEntity isOfType: FASTTConditionalStatement).
			self assert: (self topEntity isOfType: FASTTWithCondition).
			
			"Testing value of monovalue relation condition"
			self assert: self topEntity condition isNotNil.

				stack push: self topEntity condition.
				self assert: self topEntity sourceCode equals: 'x < 10'.
				self assert: (self topEntity isOfType: FASTPyComparisonOperator).
				
				"Testing value of multivalued relation operands"
				self assert: self topEntity operands size equals: 2.
				
					stack push: (stack top operands at: 1).
					self assert: self topEntity sourceCode equals: 'x'.
					self assert: (self topEntity isOfType: FASTPyIdentifier).
					stack pop.
				
					stack push: (stack top operands at: 2).
					self assert: self topEntity sourceCode equals: '10'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					self assert: (self topEntity isOfType: FASTTLiteral).
					self assert: (self topEntity isOfType: FASTTNumericalLiteral).
					stack pop.
				self assert: self topEntity operators equals: #('<').
				stack pop.
			
			"Testing value of monovalue relation elseClause"
			self assert: self topEntity elseClause isNotNil.

				stack push: self topEntity elseClause.
				self assert: self topEntity sourceCode equals: '2'.
				self assert: (self topEntity isOfType: FASTPyElseClause).
				self assert: (self topEntity isOfType: FASTTStatementBlock).
				
				"Testing value of multivalued relation statements"
				self assert: self topEntity statements size equals: 1.
				
					stack push: (stack top statements at: 1).
					self assert: self topEntity sourceCode equals: '2'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					self assert: (self topEntity isOfType: FASTTLiteral).
					self assert: (self topEntity isOfType: FASTTNumericalLiteral).
					stack pop.
				stack pop.
			
			"Testing value of monovalue relation thenClause"
			self assert: self topEntity thenClause isNotNil.

				stack push: self topEntity thenClause.
				self assert: self topEntity sourceCode equals: '1'.
				self assert: (self topEntity isOfType: FASTPyThenClause).
				self assert: (self topEntity isOfType: FASTTStatementBlock).
				
				"Testing value of multivalued relation statements"
				self assert: self topEntity statements size equals: 1.
				
					stack push: (stack top statements at: 1).
					self assert: self topEntity sourceCode equals: '1'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					self assert: (self topEntity isOfType: FASTTLiteral).
					self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testNone [

	| boolean |
	self parse: 'None'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyNone) size equals: 1.

	boolean := (fast allWithType: FASTPyNone) anyOne.
	self assert: boolean sourceCode equals: 'None'.
	self assert: (boolean isOfType: FASTTLiteral)
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testNonlocalStatement [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testNonlocalStatement 	"

	self parse: 'def aFunction():
	nonlocal counter
	return counter'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyNonlocalStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def aFunction():
	nonlocal counter
	return counter' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'nonlocal counter
	return counter' withPlatformLineEndings.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 2.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'nonlocal counter'.
			self assert: (self topEntity isOfType: FASTPyNonlocalStatement).
			
			"Testing value of multivalued relation variables"
			self assert: self topEntity variables size equals: 1.
			
				stack push: (stack top variables at: 1).
				self assert: self topEntity sourceCode equals: 'counter'.
				self assert: (self topEntity isOfType: FASTPyVariable).
				self assert: (self topEntity isOfType: FASTTVariableEntity).
				stack pop.
			stack pop.
		
			stack push: (stack top statements at: 2).
			self assert: self topEntity sourceCode equals: 'return counter'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			self assert: (self topEntity isOfType: FASTTReturnStatement).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: 'counter'.
				self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testNonlocalStatementMultiple [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testNonlocalStatementMultiple 	"

	self parse: 'def function ():
	nonlocal x, y, z
	return (x, y, z)'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyNonlocalStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyTuple) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 3.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def function ():
	nonlocal x, y, z
	return (x, y, z)' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	self assert: self topEntity name equals: 'function'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'nonlocal x, y, z
	return (x, y, z)' withPlatformLineEndings.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 2.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'nonlocal x, y, z'.
			self assert: (self topEntity isOfType: FASTPyNonlocalStatement).
			
			"Testing value of multivalued relation variables"
			self assert: self topEntity variables size equals: 3.
			
				stack push: (stack top variables at: 1).
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyVariable).
				self assert: (self topEntity isOfType: FASTTVariableEntity).
				stack pop.
			
				stack push: (stack top variables at: 2).
				self assert: self topEntity sourceCode equals: 'y'.
				self assert: (self topEntity isOfType: FASTPyVariable).
				self assert: (self topEntity isOfType: FASTTVariableEntity).
				stack pop.
			
				stack push: (stack top variables at: 3).
				self assert: self topEntity sourceCode equals: 'z'.
				self assert: (self topEntity isOfType: FASTPyVariable).
				self assert: (self topEntity isOfType: FASTTVariableEntity).
				stack pop.
			stack pop.
		
			stack push: (stack top statements at: 2).
			self assert: self topEntity sourceCode equals: 'return (x, y, z)'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			self assert: (self topEntity isOfType: FASTTReturnStatement).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: '(x, y, z)'.
				self assert: (self topEntity isOfType: FASTPyTuple).
				
				"Testing value of multivalued relation initializers"
				self assert: self topEntity initializers size equals: 3.
				
					stack push: (stack top initializers at: 1).
					self assert: self topEntity sourceCode equals: 'x'.
					self assert: (self topEntity isOfType: FASTPyIdentifier).
					stack pop.
				
					stack push: (stack top initializers at: 2).
					self assert: self topEntity sourceCode equals: 'y'.
					self assert: (self topEntity isOfType: FASTPyIdentifier).
					stack pop.
				
					stack push: (stack top initializers at: 3).
					self assert: self topEntity sourceCode equals: 'z'.
					self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - operators' }
FASTPythonImporterTest >> testNotOperator [

	| operator |
	self parse: 'not True'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyNotOperator) size equals: 1.

	operator := (fast allWithType: FASTPyNotOperator) anyOne.
	self assert: operator sourceCode equals: 'not True'.
	self assert: (operator isOfType: FASTTExpression).
	self assert: operator argument sourceCode equals: 'True'.
	self assert: (operator argument isOfType: FASTPyBoolean)
]

{ #category : 'tests' }
FASTPythonImporterTest >> testOneComment [

	| entity |
	self parse: '#There is only one comment'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	entity := (fast allWithType: FASTPyModule) anyOne.
	self assert: entity sourceCode equals: '#There is only one comment'.

	self assert: (fast allWithType: FASTPyComment) size equals: 1.
	entity := (fast allWithType: FASTPyComment) anyOne.
	self assert: entity sourceCode equals: '#There is only one comment'
]

{ #category : 'tests' }
FASTPythonImporterTest >> testPassStatement [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testPassStatement 	"

	self parse: 'def aFunction():
	pass'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyPassStatement) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def aFunction():
	pass' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'pass'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'pass'.
			self assert: (self topEntity isOfType: FASTPyPassStatement)
]

{ #category : 'tests - comprehension' }
FASTPythonImporterTest >> testPatternListInListComprehension [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testPatternListInListComprehension 	"

	self parse: '[abs(x) + abs(y) for x, y in points]'.

	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 2.
	self assert: (fast allWithType: FASTPyForInClause) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 7.
	self assert: (fast allWithType: FASTPyListComprehension) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyPatternList) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '[abs(x) + abs(y) for x, y in points]'.
	self assert: (self topEntity isOfType: FASTPyListComprehension).
	self assert: (self topEntity isOfType: FASTPyTComprehension).
	
	"Testing value of monovalue relation body"
	self assert: self topEntity body isNotNil.

		stack push: self topEntity body.
		self assert: self topEntity sourceCode equals: 'abs(x) + abs(y)'.
		self assert: (self topEntity isOfType: FASTPyBinaryOperator).
		self assert: (self topEntity isOfType: FASTTBinaryExpression).
		
		"Testing value of monovalue relation leftOperand"
		self assert: self topEntity leftOperand isNotNil.

			stack push: self topEntity leftOperand.
			self assert: self topEntity sourceCode equals: 'abs(x)'.
			self assert: (self topEntity isOfType: FASTPyCall).
			self assert: (self topEntity isOfType: FASTTInvocation).
			self assert: (self topEntity isOfType: FASTTWithArguments).
			
			"Testing value of multivalued relation arguments"
			self assert: self topEntity arguments size equals: 1.
			
				stack push: (stack top arguments at: 1).
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
			"Testing value of monovalue relation callee"
			self assert: self topEntity callee isNotNil.

				stack push: self topEntity callee.
				self assert: self topEntity sourceCode equals: 'abs'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		self assert: self topEntity operator equals: '+'.
		
		"Testing value of monovalue relation rightOperand"
		self assert: self topEntity rightOperand isNotNil.

			stack push: self topEntity rightOperand.
			self assert: self topEntity sourceCode equals: 'abs(y)'.
			self assert: (self topEntity isOfType: FASTPyCall).
			self assert: (self topEntity isOfType: FASTTInvocation).
			self assert: (self topEntity isOfType: FASTTWithArguments).
			
			"Testing value of multivalued relation arguments"
			self assert: self topEntity arguments size equals: 1.
			
				stack push: (stack top arguments at: 1).
				self assert: self topEntity sourceCode equals: 'y'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
			"Testing value of monovalue relation callee"
			self assert: self topEntity callee isNotNil.

				stack push: self topEntity callee.
				self assert: self topEntity sourceCode equals: 'abs'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		stack pop.
	
	"Testing value of multivalued relation clauses"
	self assert: self topEntity clauses size equals: 1.
	
		stack push: (stack top clauses at: 1).
		self assert: self topEntity sourceCode equals: 'for x, y in points'.
		self assert: (self topEntity isOfType: FASTPyForInClause).
		
		"Testing value of monovalue relation left"
		self assert: self topEntity left isNotNil.

			stack push: self topEntity left.
			self assert: self topEntity sourceCode equals: 'x, y'.
			self assert: (self topEntity isOfType: FASTPyPatternList).
			
			"Testing value of multivalued relation elements"
			self assert: self topEntity elements size equals: 2.
			
				stack push: (stack top elements at: 1).
				self assert: self topEntity sourceCode equals: 'x'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			
				stack push: (stack top elements at: 2).
				self assert: self topEntity sourceCode equals: 'y'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		
		"Testing value of monovalue relation right"
		self assert: self topEntity right isNotNil.

			stack push: self topEntity right.
			self assert: self topEntity sourceCode equals: 'points'.
			self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testRawString [

	| string |
	self parse: 'r''This is a \string'''.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	string := (fast allWithType: FASTPyString) anyOne.
	self assert: string sourceCode equals: 'r''This is a \string'''.
	self assert: (string isOfType: FASTTStringLiteral).
	self assertEmpty: string allContainedEntities
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testReturnEmpty [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testReturnEmpty 	"

	self parse: 'def aFunction():
	return'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def aFunction():
	return' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'return'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'return'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			self assert: (self topEntity isOfType: FASTTReturnStatement)
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testReturnList [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testReturnList 	"

	self parse: 'def aFunction():
	return [1, 2, 3]'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 3.
	self assert: (fast allWithType: FASTPyList) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def aFunction():
	return [1, 2, 3]' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'return [1, 2, 3]'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'return [1, 2, 3]'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			self assert: (self topEntity isOfType: FASTTReturnStatement).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: '[1, 2, 3]'.
				self assert: (self topEntity isOfType: FASTPyList).
				
				"Testing value of multivalued relation initializers"
				self assert: self topEntity initializers size equals: 3.
				
					stack push: (stack top initializers at: 1).
					self assert: self topEntity sourceCode equals: '1'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					self assert: (self topEntity isOfType: FASTTLiteral).
					self assert: (self topEntity isOfType: FASTTNumericalLiteral).
					stack pop.
				
					stack push: (stack top initializers at: 2).
					self assert: self topEntity sourceCode equals: '2'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					self assert: (self topEntity isOfType: FASTTLiteral).
					self assert: (self topEntity isOfType: FASTTNumericalLiteral).
					stack pop.
				
					stack push: (stack top initializers at: 3).
					self assert: self topEntity sourceCode equals: '3'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					self assert: (self topEntity isOfType: FASTTLiteral).
					self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testReturnLiteral [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testReturnLiteral 	"

	self parse: 'def aFunction():
	return 1'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def aFunction():
	return 1' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'return 1'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'return 1'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			self assert: (self topEntity isOfType: FASTTReturnStatement).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: '1'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testReturnOperator [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testReturnOperator 	"

	self parse: 'def aFunction():
	return 10 > 13'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'def aFunction():
	return 10 > 13' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: (self topEntity isOfType: FASTPyTDefinition).
	self assert: (self topEntity isOfType: FASTTWithParameters).
	self assert: (self topEntity isOfType: FASTTWithStatements).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'return 10 > 13'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'return 10 > 13'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			self assert: (self topEntity isOfType: FASTTReturnStatement).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: '10 > 13'.
				self assert: (self topEntity isOfType: FASTPyComparisonOperator).
				
				"Testing value of multivalued relation operands"
				self assert: self topEntity operands size equals: 2.
				
					stack push: (stack top operands at: 1).
					self assert: self topEntity sourceCode equals: '10'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					self assert: (self topEntity isOfType: FASTTLiteral).
					self assert: (self topEntity isOfType: FASTTNumericalLiteral).
					stack pop.
				
					stack push: (stack top operands at: 2).
					self assert: self topEntity sourceCode equals: '13'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					self assert: (self topEntity isOfType: FASTTLiteral).
					self assert: (self topEntity isOfType: FASTTNumericalLiteral).
					stack pop.
				self assert: self topEntity operators equals: #('>')
]

{ #category : 'tests - collections' }
FASTPythonImporterTest >> testSet [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSet 	"

	self parse: '{1, 2, 3}'.

	self assert: (fast allWithType: FASTPyInteger) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySet) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '{1, 2, 3}'.
	self assert: (self topEntity isOfType: FASTPySet).
	
	"Testing value of multivalued relation initializers"
	self assert: self topEntity initializers size equals: 3.
	
		stack push: (stack top initializers at: 1).
		self assert: self topEntity sourceCode equals: '1'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral).
		stack pop.
	
		stack push: (stack top initializers at: 2).
		self assert: self topEntity sourceCode equals: '2'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral).
		stack pop.
	
		stack push: (stack top initializers at: 3).
		self assert: self topEntity sourceCode equals: '3'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - comprehension' }
FASTPythonImporterTest >> testSetComprehension [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSetComprehension 	"

	self parse: '{k1 for k1 in v.items() }'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyForInClause) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySetComprehension) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '{k1 for k1 in v.items() }'.
	self assert: (self topEntity isOfType: FASTPySetComprehension).
	self assert: (self topEntity isOfType: FASTPyTComprehension).
	
	"Testing value of monovalue relation body"
	self assert: self topEntity body isNotNil.

		stack push: self topEntity body.
		self assert: self topEntity sourceCode equals: 'k1'.
		self assert: (self topEntity isOfType: FASTPyIdentifier).
		stack pop.
	
	"Testing value of multivalued relation clauses"
	self assert: self topEntity clauses size equals: 1.
	
		stack push: (stack top clauses at: 1).
		self assert: self topEntity sourceCode equals: 'for k1 in v.items()'.
		self assert: (self topEntity isOfType: FASTPyForInClause).
		
		"Testing value of monovalue relation left"
		self assert: self topEntity left isNotNil.

			stack push: self topEntity left.
			self assert: self topEntity sourceCode equals: 'k1'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
		"Testing value of monovalue relation right"
		self assert: self topEntity right isNotNil.

			stack push: self topEntity right.
			self assert: self topEntity sourceCode equals: 'v.items()'.
			self assert: (self topEntity isOfType: FASTPyCall).
			self assert: (self topEntity isOfType: FASTTInvocation).
			self assert: (self topEntity isOfType: FASTTWithArguments).
			
			"Testing value of monovalue relation callee"
			self assert: self topEntity callee isNotNil.

				stack push: self topEntity callee.
				self assert: self topEntity sourceCode equals: 'v.items'.
				self assert: (self topEntity isOfType: FASTPyAttributeAccess).
				
				"Testing value of monovalue relation attribute"
				self assert: self topEntity attribute isNotNil.

					stack push: self topEntity attribute.
					self assert: self topEntity sourceCode equals: 'items'.
					self assert: (self topEntity isOfType: FASTPyVariable).
					self assert: (self topEntity isOfType: FASTTVariableEntity).
					stack pop.
				
				"Testing value of monovalue relation object"
				self assert: self topEntity object isNotNil.

					stack push: self topEntity object.
					self assert: self topEntity sourceCode equals: 'v'.
					self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testSingleQuotedString [

	| string |
	self parse: '''This is a string'''.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	string := (fast allWithType: FASTPyString) anyOne.
	self assert: string sourceCode equals: '''This is a string'''.
	self assert: (string isOfType: FASTTStringLiteral).
	self assertEmpty: string allContainedEntities
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSliceAttribute [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSliceAttribute 	"

	self parse: 'values[:obj.attr]'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySlice) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'values[:obj.attr]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: ':obj.attr'.
		self assert: (self topEntity isOfType: FASTPySlice).
		
		"Testing value of multivalued relation components"
		self assert: self topEntity components size equals: 1.
		
			stack push: (stack top components at: 1).
			self assert: self topEntity sourceCode equals: 'obj.attr'.
			self assert: (self topEntity isOfType: FASTPyAttributeAccess).
			
			"Testing value of monovalue relation attribute"
			self assert: self topEntity attribute isNotNil.

				stack push: self topEntity attribute.
				self assert: self topEntity sourceCode equals: 'attr'.
				self assert: (self topEntity isOfType: FASTPyVariable).
				self assert: (self topEntity isOfType: FASTTVariableEntity).
				stack pop.
			
			"Testing value of monovalue relation object"
			self assert: self topEntity object isNotNil.

				stack push: self topEntity object.
				self assert: self topEntity sourceCode equals: 'obj'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'values'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSliceBinaryOperator [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSliceBinaryOperator 	"

	self parse: 'values[:1000*3]'.

	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySlice) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'values[:1000*3]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: ':1000*3'.
		self assert: (self topEntity isOfType: FASTPySlice).
		
		"Testing value of multivalued relation components"
		self assert: self topEntity components size equals: 1.
		
			stack push: (stack top components at: 1).
			self assert: self topEntity sourceCode equals: '1000*3'.
			self assert: (self topEntity isOfType: FASTPyBinaryOperator).
			self assert: (self topEntity isOfType: FASTTBinaryExpression).
			
			"Testing value of monovalue relation leftOperand"
			self assert: self topEntity leftOperand isNotNil.

				stack push: self topEntity leftOperand.
				self assert: self topEntity sourceCode equals: '1000'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			self assert: self topEntity operator equals: '*'.
			
			"Testing value of monovalue relation rightOperand"
			self assert: self topEntity rightOperand isNotNil.

				stack push: self topEntity rightOperand.
				self assert: self topEntity sourceCode equals: '3'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'values'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSliceEmpty [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSliceEmpty 	"

	self parse: 'values[:]'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySlice) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'values[:]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: ':'.
		self assert: (self topEntity isOfType: FASTPySlice).
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'values'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSliceNone [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSliceNone 	"

	self parse: 'values[None:None:None]'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyNone) size equals: 3.
	self assert: (fast allWithType: FASTPySlice) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'values[None:None:None]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: 'None:None:None'.
		self assert: (self topEntity isOfType: FASTPySlice).
		
		"Testing value of multivalued relation components"
		self assert: self topEntity components size equals: 3.
		
			stack push: (stack top components at: 1).
			self assert: self topEntity sourceCode equals: 'None'.
			self assert: (self topEntity isOfType: FASTPyNone).
			self assert: (self topEntity isOfType: FASTTLiteral).
			stack pop.
		
			stack push: (stack top components at: 2).
			self assert: self topEntity sourceCode equals: 'None'.
			self assert: (self topEntity isOfType: FASTPyNone).
			self assert: (self topEntity isOfType: FASTTLiteral).
			stack pop.
		
			stack push: (stack top components at: 3).
			self assert: self topEntity sourceCode equals: 'None'.
			self assert: (self topEntity isOfType: FASTPyNone).
			self assert: (self topEntity isOfType: FASTTLiteral).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'values'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSliceParenthesis [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSliceParenthesis 	"

	self parse: 'values[i:(i + h)]'.

	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 4.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySlice) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'values[i:(i + h)]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: 'i:(i + h)'.
		self assert: (self topEntity isOfType: FASTPySlice).
		
		"Testing value of multivalued relation components"
		self assert: self topEntity components size equals: 2.
		
			stack push: (stack top components at: 1).
			self assert: self topEntity sourceCode equals: 'i'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
			stack push: (stack top components at: 2).
			self assert: self topEntity sourceCode equals: 'i + h'.
			self assert: (self topEntity isOfType: FASTPyBinaryOperator).
			self assert: (self topEntity isOfType: FASTTBinaryExpression).
			
			"Testing value of monovalue relation leftOperand"
			self assert: self topEntity leftOperand isNotNil.

				stack push: self topEntity leftOperand.
				self assert: self topEntity sourceCode equals: 'i'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			self assert: self topEntity operator equals: '+'.
			
			"Testing value of monovalue relation rightOperand"
			self assert: self topEntity rightOperand isNotNil.

				stack push: self topEntity rightOperand.
				self assert: self topEntity sourceCode equals: 'h'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'values'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSliceReverse [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSliceReverse 	"

	self parse: 'values[::-1]'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySlice) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.
	self assert: (fast allWithType: FASTPyUnaryOperator) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'values[::-1]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: '::-1'.
		self assert: (self topEntity isOfType: FASTPySlice).
		
		"Testing value of multivalued relation components"
		self assert: self topEntity components size equals: 1.
		
			stack push: (stack top components at: 1).
			self assert: self topEntity sourceCode equals: '-1'.
			self assert: (self topEntity isOfType: FASTPyUnaryOperator).
			self assert: (self topEntity isOfType: FASTPyTUnaryOperator).
			
			"Testing value of monovalue relation argument"
			self assert: self topEntity argument isNotNil.

				stack push: self topEntity argument.
				self assert: self topEntity sourceCode equals: '1'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			self assert: self topEntity operator equals: '-'.
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'values'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSliceSubscript [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSliceSubscript 	"

	self parse: 'values[pady[0]:-pady[1]]'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 3.
	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySlice) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 3.
	self assert: (fast allWithType: FASTPyUnaryOperator) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'values[pady[0]:-pady[1]]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: 'pady[0]:-pady[1]'.
		self assert: (self topEntity isOfType: FASTPySlice).
		
		"Testing value of multivalued relation components"
		self assert: self topEntity components size equals: 2.
		
			stack push: (stack top components at: 1).
			self assert: self topEntity sourceCode equals: 'pady[0]'.
			self assert: (self topEntity isOfType: FASTPySubscript).
			
			"Testing value of multivalued relation indices"
			self assert: self topEntity indices size equals: 1.
			
				stack push: (stack top indices at: 1).
				self assert: self topEntity sourceCode equals: '0'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				self assert: (self topEntity isOfType: FASTTLiteral).
				self assert: (self topEntity isOfType: FASTTNumericalLiteral).
				stack pop.
			
			"Testing value of monovalue relation value"
			self assert: self topEntity value isNotNil.

				stack push: self topEntity value.
				self assert: self topEntity sourceCode equals: 'pady'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				stack pop.
			stack pop.
		
			stack push: (stack top components at: 2).
			self assert: self topEntity sourceCode equals: '-pady[1]'.
			self assert: (self topEntity isOfType: FASTPyUnaryOperator).
			self assert: (self topEntity isOfType: FASTPyTUnaryOperator).
			
			"Testing value of monovalue relation argument"
			self assert: self topEntity argument isNotNil.

				stack push: self topEntity argument.
				self assert: self topEntity sourceCode equals: 'pady[1]'.
				self assert: (self topEntity isOfType: FASTPySubscript).
				
				"Testing value of multivalued relation indices"
				self assert: self topEntity indices size equals: 1.
				
					stack push: (stack top indices at: 1).
					self assert: self topEntity sourceCode equals: '1'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					self assert: (self topEntity isOfType: FASTTLiteral).
					self assert: (self topEntity isOfType: FASTTNumericalLiteral).
					stack pop.
				
				"Testing value of monovalue relation value"
				self assert: self topEntity value isNotNil.

					stack push: self topEntity value.
					self assert: self topEntity sourceCode equals: 'pady'.
					self assert: (self topEntity isOfType: FASTPyIdentifier).
					stack pop.
				stack pop.
			self assert: self topEntity operator equals: '-'.
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'values'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSliceVariables [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSliceVariables 	"

	self parse: 'values[x:y]'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySlice) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'values[x:y]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: 'x:y'.
		self assert: (self topEntity isOfType: FASTPySlice).
		
		"Testing value of multivalued relation components"
		self assert: self topEntity components size equals: 2.
		
			stack push: (stack top components at: 1).
			self assert: self topEntity sourceCode equals: 'x'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		
			stack push: (stack top components at: 2).
			self assert: self topEntity sourceCode equals: 'y'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'values'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSliceWithEnd [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSliceWithEnd 	"

	self parse: 'values[:7]'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySlice) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'values[:7]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: ':7'.
		self assert: (self topEntity isOfType: FASTPySlice).
		
		"Testing value of multivalued relation components"
		self assert: self topEntity components size equals: 1.
		
			stack push: (stack top components at: 1).
			self assert: self topEntity sourceCode equals: '7'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'values'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSliceWithStart [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSliceWithStart 	"

	self parse: 'values[2:]'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySlice) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'values[2:]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: '2:'.
		self assert: (self topEntity isOfType: FASTPySlice).
		
		"Testing value of multivalued relation components"
		self assert: self topEntity components size equals: 1.
		
			stack push: (stack top components at: 1).
			self assert: self topEntity sourceCode equals: '2'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'values'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSliceWithStartStopStep [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSliceWithStartStopStep 	"

	self parse: 'values[2:10:2]'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySlice) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'values[2:10:2]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: '2:10:2'.
		self assert: (self topEntity isOfType: FASTPySlice).
		
		"Testing value of multivalued relation components"
		self assert: self topEntity components size equals: 3.
		
			stack push: (stack top components at: 1).
			self assert: self topEntity sourceCode equals: '2'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		
			stack push: (stack top components at: 2).
			self assert: self topEntity sourceCode equals: '10'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		
			stack push: (stack top components at: 3).
			self assert: self topEntity sourceCode equals: '2'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'values'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSliceWithStep [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSliceWithStep 	"

	self parse: 'values[::4]'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySlice) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'values[::4]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: '::4'.
		self assert: (self topEntity isOfType: FASTPySlice).
		
		"Testing value of multivalued relation components"
		self assert: self topEntity components size equals: 1.
		
			stack push: (stack top components at: 1).
			self assert: self topEntity sourceCode equals: '4'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'values'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testStringWithEscapedInterpolation [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testStringWithEscapedInterpolation 	"

	self parse: 'f"The result is {{value}}"'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'f"The result is {{value}}"'.
	self assert: (self topEntity isOfType: FASTPyString).
	self assert: (self topEntity isOfType: FASTTLiteral).
	self assert: (self topEntity isOfType: FASTTStringLiteral)
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testStringWithEscapedSequence [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testStringWithEscapedSequence 	"

	self parse: '"Line 1\nLine 2"'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '"Line 1\nLine 2"'.
	self assert: (self topEntity isOfType: FASTPyString).
	self assert: (self topEntity isOfType: FASTTLiteral).
	self assert: (self topEntity isOfType: FASTTStringLiteral)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSubscript [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSubscript 	"

	self parse: 'row[''id'']'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'row[''id'']'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: '''id'''.
		self assert: (self topEntity isOfType: FASTPyString).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTStringLiteral).
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'row'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSubscriptOnAttribute [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSubscriptOnAttribute 	"

	self parse: 'os.environ[''CUDA_LAUNCH_BLOCKING'']'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'os.environ[''CUDA_LAUNCH_BLOCKING'']'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: '''CUDA_LAUNCH_BLOCKING'''.
		self assert: (self topEntity isOfType: FASTPyString).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTStringLiteral).
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'os.environ'.
		self assert: (self topEntity isOfType: FASTPyAttributeAccess).
		
		"Testing value of monovalue relation attribute"
		self assert: self topEntity attribute isNotNil.

			stack push: self topEntity attribute.
			self assert: self topEntity sourceCode equals: 'environ'.
			self assert: (self topEntity isOfType: FASTPyVariable).
			self assert: (self topEntity isOfType: FASTTVariableEntity).
			stack pop.
		
		"Testing value of monovalue relation object"
		self assert: self topEntity object isNotNil.

			stack push: self topEntity object.
			self assert: self topEntity sourceCode equals: 'os'.
			self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSubscriptOnAttributeWithParenthesis [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSubscriptOnAttributeWithParenthesis 	"

	self parse: '(os.environ)[''ATTR'']'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyString) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '(os.environ)[''ATTR'']'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: '''ATTR'''.
		self assert: (self topEntity isOfType: FASTPyString).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTStringLiteral).
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'os.environ'.
		self assert: (self topEntity isOfType: FASTPyAttributeAccess).
		
		"Testing value of monovalue relation attribute"
		self assert: self topEntity attribute isNotNil.

			stack push: self topEntity attribute.
			self assert: self topEntity sourceCode equals: 'environ'.
			self assert: (self topEntity isOfType: FASTPyVariable).
			self assert: (self topEntity isOfType: FASTTVariableEntity).
			stack pop.
		
		"Testing value of monovalue relation object"
		self assert: self topEntity object isNotNil.

			stack push: self topEntity object.
			self assert: self topEntity sourceCode equals: 'os'.
			self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSubscriptOnSubscript [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSubscriptOnSubscript 	"

	self parse: 'coll[1][2]'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 2.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'coll[1][2]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: '2'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral).
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'coll[1]'.
		self assert: (self topEntity isOfType: FASTPySubscript).
		
		"Testing value of multivalued relation indices"
		self assert: self topEntity indices size equals: 1.
		
			stack push: (stack top indices at: 1).
			self assert: self topEntity sourceCode equals: '1'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		
		"Testing value of monovalue relation value"
		self assert: self topEntity value isNotNil.

			stack push: self topEntity value.
			self assert: self topEntity sourceCode equals: 'coll'.
			self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSubscriptWithAttributeInSubscript [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSubscriptWithAttributeInSubscript 	"

	self parse: 'coll[obj.attr]'.

	self assert: (fast allWithType: FASTPyAttributeAccess) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'coll[obj.attr]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: 'obj.attr'.
		self assert: (self topEntity isOfType: FASTPyAttributeAccess).
		
		"Testing value of monovalue relation attribute"
		self assert: self topEntity attribute isNotNil.

			stack push: self topEntity attribute.
			self assert: self topEntity sourceCode equals: 'attr'.
			self assert: (self topEntity isOfType: FASTPyVariable).
			self assert: (self topEntity isOfType: FASTTVariableEntity).
			stack pop.
		
		"Testing value of monovalue relation object"
		self assert: self topEntity object isNotNil.

			stack push: self topEntity object.
			self assert: self topEntity sourceCode equals: 'obj'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'coll'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSubscriptWithBinaryOperator [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSubscriptWithBinaryOperator 	"

	self parse: 'values[1 + 2]'.

	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'values[1 + 2]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 1.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: '1 + 2'.
		self assert: (self topEntity isOfType: FASTPyBinaryOperator).
		self assert: (self topEntity isOfType: FASTTBinaryExpression).
		
		"Testing value of monovalue relation leftOperand"
		self assert: self topEntity leftOperand isNotNil.

			stack push: self topEntity leftOperand.
			self assert: self topEntity sourceCode equals: '1'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		self assert: self topEntity operator equals: '+'.
		
		"Testing value of monovalue relation rightOperand"
		self assert: self topEntity rightOperand isNotNil.

			stack push: self topEntity rightOperand.
			self assert: self topEntity sourceCode equals: '2'.
			self assert: (self topEntity isOfType: FASTPyInteger).
			self assert: (self topEntity isOfType: FASTTLiteral).
			self assert: (self topEntity isOfType: FASTTNumericalLiteral).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'values'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSubscriptWithEllipsis [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSubscriptWithEllipsis 	"

	self parse: 'imgs[..., i]'.

	self assert: (fast allWithType: FASTPyEllipsis) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'imgs[..., i]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 2.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: '...'.
		self assert: (self topEntity isOfType: FASTPyEllipsis).
		self assert: (self topEntity isOfType: FASTTLiteral).
		stack pop.
	
		stack push: (stack top indices at: 2).
		self assert: self topEntity sourceCode equals: 'i'.
		self assert: (self topEntity isOfType: FASTPyIdentifier).
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'imgs'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - subscripts' }
FASTPythonImporterTest >> testSubscriptWithTwoIndicies [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testSubscriptWithTwoIndicies 	"

	self parse: 'loc[1, 2]'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPySubscript) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'loc[1, 2]'.
	self assert: (self topEntity isOfType: FASTPySubscript).
	
	"Testing value of multivalued relation indices"
	self assert: self topEntity indices size equals: 2.
	
		stack push: (stack top indices at: 1).
		self assert: self topEntity sourceCode equals: '1'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral).
		stack pop.
	
		stack push: (stack top indices at: 2).
		self assert: self topEntity sourceCode equals: '2'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral).
		stack pop.
	
	"Testing value of monovalue relation value"
	self assert: self topEntity value isNotNil.

		stack push: self topEntity value.
		self assert: self topEntity sourceCode equals: 'loc'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testTrue [

	| boolean |
	self parse: 'True'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyBoolean) size equals: 1.

	boolean := (fast allWithType: FASTPyBoolean) anyOne.
	self assert: boolean sourceCode equals: 'True'.
	self assert: (boolean isOfType: FASTTBooleanLiteral)
]

{ #category : 'tests - collections' }
FASTPythonImporterTest >> testTuple [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testTuple 	"

	self parse: '(1, 2, 3)'.

	self assert: (fast allWithType: FASTPyInteger) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyTuple) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '(1, 2, 3)'.
	self assert: (self topEntity isOfType: FASTPyTuple).
	
	"Testing value of multivalued relation initializers"
	self assert: self topEntity initializers size equals: 3.
	
		stack push: (stack top initializers at: 1).
		self assert: self topEntity sourceCode equals: '1'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral).
		stack pop.
	
		stack push: (stack top initializers at: 2).
		self assert: self topEntity sourceCode equals: '2'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral).
		stack pop.
	
		stack push: (stack top initializers at: 3).
		self assert: self topEntity sourceCode equals: '3'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - collections' }
FASTPythonImporterTest >> testTupleExpression [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testTupleExpression 	"

	self parse: '3, 5,'.

	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyTuple) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '3, 5,'.
	self assert: (self topEntity isOfType: FASTPyTuple).
	
	"Testing value of multivalued relation initializers"
	self assert: self topEntity initializers size equals: 2.
	
		stack push: (stack top initializers at: 1).
		self assert: self topEntity sourceCode equals: '3'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral).
		stack pop.
	
		stack push: (stack top initializers at: 2).
		self assert: self topEntity sourceCode equals: '5'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - collections' }
FASTPythonImporterTest >> testTupleExpressionWithCall [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testTupleExpressionWithCall 	"

	self parse: 'toto(), 5,'.

	self assert: (fast allWithType: FASTPyCall) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyTuple) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'toto(), 5,'.
	self assert: (self topEntity isOfType: FASTPyTuple).
	
	"Testing value of multivalued relation initializers"
	self assert: self topEntity initializers size equals: 2.
	
		stack push: (stack top initializers at: 1).
		self assert: self topEntity sourceCode equals: 'toto()'.
		self assert: (self topEntity isOfType: FASTPyCall).
		self assert: (self topEntity isOfType: FASTTInvocation).
		self assert: (self topEntity isOfType: FASTTWithArguments).
		
		"Testing value of monovalue relation callee"
		self assert: self topEntity callee isNotNil.

			stack push: self topEntity callee.
			self assert: self topEntity sourceCode equals: 'toto'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	
		stack push: (stack top initializers at: 2).
		self assert: self topEntity sourceCode equals: '5'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests - collections' }
FASTPythonImporterTest >> testTupleWithListSplat [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testTupleWithListSplat 	"

	self parse: '(*tuple, 3)'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyListSplat) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyTuple) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: '(*tuple, 3)'.
	self assert: (self topEntity isOfType: FASTPyTuple).
	
	"Testing value of multivalued relation initializers"
	self assert: self topEntity initializers size equals: 2.
	
		stack push: (stack top initializers at: 1).
		self assert: self topEntity sourceCode equals: '*tuple'.
		self assert: (self topEntity isOfType: FASTPyListSplat).
		
		"Testing value of monovalue relation iterable"
		self assert: self topEntity iterable isNotNil.

			stack push: self topEntity iterable.
			self assert: self topEntity sourceCode equals: 'tuple'.
			self assert: (self topEntity isOfType: FASTPyIdentifier).
			stack pop.
		stack pop.
	
		stack push: (stack top initializers at: 2).
		self assert: self topEntity sourceCode equals: '3'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		self assert: (self topEntity isOfType: FASTTLiteral).
		self assert: (self topEntity isOfType: FASTTNumericalLiteral)
]

{ #category : 'tests' }
FASTPythonImporterTest >> testTwoComments [

	| entity |
	self parse: '# Comment 1
	
# Comment 2'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	entity := (fast allWithType: FASTPyModule) anyOne.
	self assert: entity sourceCode equals: '# Comment 1
	
# Comment 2' withPlatformLineEndings.

	self assert: (fast allWithType: FASTPyComment) size equals: 2.
	self assertCollection: ((fast allWithType: FASTPyComment) collect: #sourceCode as: Array) hasSameElements: { '# Comment 1'. '# Comment 2' }
]

{ #category : 'tests - operators' }
FASTPythonImporterTest >> testUnaryOperator [

	| operator |
	self parse: '-13'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyUnaryOperator) size equals: 1.

	operator := (fast allWithType: FASTPyUnaryOperator) anyOne.
	self assert: operator sourceCode equals: '-13'.
	self assert: (operator isOfType: FASTTExpression).
	self assert: operator argument sourceCode equals: '13'.
	self assert: (operator argument isOfType: FASTPyInteger).
	self assert: operator operator equals: '-'
]

{ #category : 'tests - advanced statements' }
FASTPythonImporterTest >> testWhile [
	<generated>
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testWhile 	"

	self parse: 'while True:
	break'.

	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyBoolean) size equals: 1.
	self assert: (fast allWithType: FASTPyBreakStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyWhileStatement) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'while True:
	break' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyWhileStatement).
	self assert: (self topEntity isOfType: FASTTConditionalStatement).
	self assert: (self topEntity isOfType: FASTTLoopStatement).
	self assert: (self topEntity isOfType: FASTTWithCondition).
	
	"Testing value of monovalue relation body"
	self assert: self topEntity body isNotNil.

		stack push: self topEntity body.
		self assert: self topEntity sourceCode equals: 'break'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		self assert: (self topEntity isOfType: FASTTStatementBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'break'.
			self assert: (self topEntity isOfType: FASTPyBreakStatement).
			stack pop.
		stack pop.
	
	"Testing value of monovalue relation condition"
	self assert: self topEntity condition isNotNil.

		stack push: self topEntity condition.
		self assert: self topEntity sourceCode equals: 'True'.
		self assert: (self topEntity isOfType: FASTPyBoolean).
		self assert: (self topEntity isOfType: FASTTBooleanLiteral).
		self assert: (self topEntity isOfType: FASTTLiteral)
]

{ #category : 'running' }
FASTPythonImporterTest >> topEntity [

	^ stack top
]
