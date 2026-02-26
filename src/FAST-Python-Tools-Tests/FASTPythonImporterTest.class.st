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

{ #category : 'as yet unclassified' }
FASTPythonImporterTest class >> generateAssertionsFor: entity on: aStream identation: aNumber [

	aStream
		nextPutAll: 'self assert: entity sourceCode equals: ';
		print: entity sourceCode;
		nextPutAll: (entity sourceCode lines size > 1
				 ifTrue: [ ' withPlateformLineEnding.' ]
				 ifFalse: [ '.' ]);
		cr;
		tab: aNumber;
		nextPutAll: 'self assert: (entity isOfType: ';
		nextPutAll: entity class name;
		nextPutAll: ').';
		cr;
		tab: aNumber.

	(entity mooseDescription allProperties select: [ :property | self shouldSelectProperty: property of: entity ]) do: [ :property |
			aStream
				nextPutAll: 'self assert: entity ';
				nextPutAll: property implementingSelector;
				nextPutAll: ' equals: ';
				store: (property getRawFrom: entity);
				nextPutAll: '.';
				cr;
				tab: aNumber ].

	(entity containedEntitySelectors select: [ :selector | (entity perform: selector) isEmptyOrNil not ]) ifNotEmpty: [ :properties |
			properties do: [ :selector |
					(entity perform: selector) ifNotNil: [ :result |
							result ifNotEmpty: [
									aStream
										nextPutAll: 'self assert: entity ';
										nextPutAll: selector;
										nextPutAll: ' size equals: ';
										print: result size;
										nextPut: $.;
										cr;
										cr;
										tab: aNumber + 1.
									result doWithIndex: [ :child :index |
											aStream
												nextPutAll: 'stack push: (stack top ';
												nextPutAll: selector;
												nextPutAll: ' at: ';
												print: index;
												nextPutAll: ').';
												cr;
												tab: aNumber + 1;
												nextPutAll: 'entity := stack top.';
												cr;
												tab: aNumber + 1.
											self generateAssertionsFor: child on: aStream identation: aNumber + 1.

											properties last = selector ifFalse: [
													aStream
														nextPutAll: 'stack pop.';
														cr;
														cr;
														tab: aNumber;
														nextPutAll: 'entity := stack top.';
														cr;
														tab: aNumber ] ] ] ] ] ]
]

{ #category : 'as yet unclassified' }
FASTPythonImporterTest class >> generateTestNamed: aString fromCode: code [

	| model method |
	model := self new parse: code.

	method := String streamContents: [ :aStream |
			          aStream
				          nextPutAll: 'test';
				          nextPutAll: aString capitalized;
				          cr;
				          tab;
				          nextPutAll: '"Generated as regression test by ';
				          print: thisContext homeMethod;
				          nextPutAll: ' "';
				          cr;
				          cr;
				          tab;
				          nextPutAll: '| entity |';
				          cr;
				          cr;
				          tab;
				          nextPutAll: 'self parse: ';
				          print: code;
				          nextPut: $.;
				          cr;
				          cr.

			          model allEntityTypes do: [ :type |
					          aStream
						          tab;
						          nextPutAll: 'self assert: (fast allWithType: ';
						          print: type;
						          nextPutAll: ') size equals: ';
						          print: (model allWithType: type) size;
						          nextPut: $.;
						          cr ].

			          model rootEntities size = 1 ifFalse: [ self error: 'FAST generator was thought with only 1 top entity?' ].

			          aStream
				          cr;
				          tab;
				          nextPutAll: 'stack push: fast rootEntities anyOne genericChildren first.
	entity := stack top.';
				          "We exclude assertions on module in generation"cr;
				          tab.
			          self generateAssertionsFor: model rootEntities anyOne genericChildren first on: aStream identation: 1 ].



	self compile: method classified: 'tests'
]

{ #category : 'as yet unclassified' }
FASTPythonImporterTest class >> propertiesToExclude [

	^ #( source startPos endPos )
]

{ #category : 'as yet unclassified' }
FASTPythonImporterTest class >> shouldSelectProperty: property of: entity [

	property isDerived ifTrue: [ ^ false ].
	
	property isContainer ifTrue: [ ^ false ].

	(self propertiesToExclude includes: property implementingSelector) ifTrue: [ ^ false ].

	^ (property getFrom: entity) isNotEmpty
]

{ #category : 'running' }
FASTPythonImporterTest >> importer [

	^ importer ifNil: [ importer := self importerClass new ]
]

{ #category : 'as yet unclassified' }
FASTPythonImporterTest >> importerClass [

	^ self class environment at: (self class name withoutSuffix: 'Test') asSymbol
]

{ #category : 'running' }
FASTPythonImporterTest >> parse: aString [

	^ fast := self importer parse: aString withPlatformLineEndings
]

{ #category : 'running' }
FASTPythonImporterTest >> setUp [

	super setUp.

	stack := Stack new
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

{ #category : 'tests - opererators' }
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

{ #category : 'tests - opererators' }
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

{ #category : 'tests - opererators' }
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

{ #category : 'tests - opererators' }
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

{ #category : 'tests - opererators' }
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

{ #category : 'tests' }
FASTPythonImporterTest >> testClassDefinition [

	| class |
	self parse: 'class AClass():
	pass'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyClassDefinition) size equals: 1.

	class := (fast allWithType: FASTPyClassDefinition) anyOne.
	self assert: class name equals: 'AClass'
]

{ #category : 'tests - opererators' }
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

	| boolean |
	self parse: '42j'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.

	boolean := (fast allWithType: FASTPyInteger) anyOne.
	self assert: boolean sourceCode equals: '42j'.
	self assert: (boolean isOfType: FASTTLiteral)
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
FASTPythonImporterTest >> testFalse [

	| boolean |
	self parse: 'False'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyBoolean) size equals: 1.

	boolean := (fast allWithType: FASTPyBoolean) anyOne.
	self assert: boolean sourceCode equals: 'False'.
	self assert: (boolean isOfType: FASTTBooleanLiteral)
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

{ #category : 'tests' }
FASTPythonImporterTest >> testFromImport [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	| entity |

	self parse: 'from datetime import date'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFromImportModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	entity := stack top.
	self assert: entity sourceCode equals: 'from datetime import date'.
	self assert: (entity isOfType: FASTPyImportFromStatement).
	self assert: entity fromImportModule size equals: 1.

		stack push: (stack top fromImportModule at: 1).
		entity := stack top.
		self assert: entity sourceCode equals: 'datetime'.
		self assert: (entity isOfType: FASTPyFromImportModule).
		self assert: entity segments equals: #('datetime').
		stack pop.

	entity := stack top.
	self assert: entity importedEntities size equals: 1.

		stack push: (stack top importedEntities at: 1).
		entity := stack top.
		self assert: entity sourceCode equals: 'date'.
		self assert: (entity isOfType: FASTPyImportedEntity).
		self assert: entity segments equals: #('date').
		
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
FASTPythonImporterTest >> testImport [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	| entity |

	self parse: 'import random'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	entity := stack top.
	self assert: entity sourceCode equals: 'import random'.
	self assert: (entity isOfType: FASTPyImportStatement).
	self assert: entity importedEntities size equals: 1.

		stack push: (stack top importedEntities at: 1).
		entity := stack top.
		self assert: entity sourceCode equals: 'random'.
		self assert: (entity isOfType: FASTPyImportedEntity).
		self assert: entity segments equals: #('random').
		self assert: entity alias isNil
	
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testImportDottedImport [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	| entity |

	self parse: 'import xml.etree.ElementTree'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	entity := stack top.
	self assert: entity sourceCode equals: 'import xml.etree.ElementTree'.
	self assert: (entity isOfType: FASTPyImportStatement).
	self assert: entity importedEntities size equals: 1.

		stack push: (stack top importedEntities at: 1).
		entity := stack top.
		self assert: entity sourceCode equals: 'xml.etree.ElementTree'.
		self assert: (entity isOfType: FASTPyImportedEntity).
		self assert: entity segments equals: #('xml' 'etree' 'ElementTree').
		
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testImportDottedImportAndAlias [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	| entity |

	self parse: 'import xml.etree.ElementTree as ET'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	entity := stack top.
	self assert: entity sourceCode equals: 'import xml.etree.ElementTree as ET'.
	self assert: (entity isOfType: FASTPyImportStatement).
	self assert: entity importedEntities size equals: 1.

		stack push: (stack top importedEntities at: 1).
		entity := stack top.
		self assert: entity sourceCode equals: 'xml.etree.ElementTree as ET'.
		self assert: (entity isOfType: FASTPyImportedEntity).
		self assert: entity segments equals: #('xml' 'etree' 'ElementTree').
		self assert: entity alias equals: 'ET'.
		
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testImportMultiple [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	| entity |

	self parse: 'import random, collections'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 2.

	stack push: fast rootEntities anyOne genericChildren first.
	entity := stack top.
	self assert: entity sourceCode equals: 'import random, collections'.
	self assert: (entity isOfType: FASTPyImportStatement).
	self assert: entity importedEntities size equals: 2.

		stack push: (stack top importedEntities at: 1).
		entity := stack top.
		self assert: entity sourceCode equals: 'random'.
		self assert: (entity isOfType: FASTPyImportedEntity).
		self assert: entity segments equals: #('random').
		stack pop.

		stack push: (stack top importedEntities at: 2).
		entity := stack top.
		self assert: entity sourceCode equals: 'collections'.
		self assert: (entity isOfType: FASTPyImportedEntity).
		self assert: entity segments equals: #('collections').
		
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testImportMultipleAndAliases [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	| entity |

	self parse: 'import random as rand, collections'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 2.

	stack push: fast rootEntities anyOne genericChildren first.
	entity := stack top.
	self assert: entity sourceCode equals: 'import random as rand, collections'.
	self assert: (entity isOfType: FASTPyImportStatement).
	self assert: entity importedEntities size equals: 2.

		stack push: (stack top importedEntities at: 1).
		entity := stack top.
		self assert: entity sourceCode equals: 'random as rand'.
		self assert: (entity isOfType: FASTPyImportedEntity).
		self assert: entity segments equals: #('random').
		self assert: entity alias equals: 'rand'.
		stack pop.

		stack push: (stack top importedEntities at: 2).
		entity := stack top.
		self assert: entity sourceCode equals: 'collections'.
		self assert: (entity isOfType: FASTPyImportedEntity).
		self assert: entity segments equals: #('collections').
		
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testImportWithAlias [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	| entity |

	self parse: 'import random as rand'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	entity := stack top.
	self assert: entity sourceCode equals: 'import random as rand'.
	self assert: (entity isOfType: FASTPyImportStatement).
	self assert: entity importedEntities size equals: 1.

		stack push: (stack top importedEntities at: 1).
		entity := stack top.
		self assert: entity sourceCode equals: 'random as rand'.
		self assert: (entity isOfType: FASTPyImportedEntity).
		self assert: entity segments equals: #('random').
		self assert: entity alias equals: 'rand'.
		
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

{ #category : 'tests - opererators' }
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

{ #category : 'tests - opererators' }
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
