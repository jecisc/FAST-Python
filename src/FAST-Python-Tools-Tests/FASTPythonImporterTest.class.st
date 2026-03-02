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
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol: "

	self parse: 'def aFunction(a, b):
    assert b != 0'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyAssertStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyParameter) size equals: 2.
	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'def aFunction(a, b):
    assert b != 0' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of multivalued relation parameters"
	self assert: self topEntity parameters size equals: 2.
	
		stack push: (stack top parameters at: 1).
		self assert: self topEntity sourceCode equals: 'a'.
		self assert: (self topEntity isOfType: FASTPyParameter).
		self assert: self topEntity name equals: 'a'.
		stack pop.
		
		stack push: (stack top parameters at: 2).
		self assert: self topEntity sourceCode equals: 'b'.
		self assert: (self topEntity isOfType: FASTPyParameter).
		self assert: self topEntity name equals: 'b'.
		stack pop.
		
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'assert b != 0'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		
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
					stack pop.
					self assert: self topEntity operators equals: #('!=').
				
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
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol: "

	self parse: '0b00101101 & 0b00011011'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyBinaryOperator) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: '0b00101101 & 0b00011011'.
	self assert: (self topEntity isOfType: FASTPyBinaryOperator).
	
	"Testing value of monovalue relation leftOperand"
	self assert: self topEntity leftOperand isNotNil.

		stack push: self topEntity leftOperand.
		self assert: self topEntity sourceCode equals: '0b00101101'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		stack pop.
		
	"Testing value of monovalue relation rightOperand"
	self assert: self topEntity rightOperand isNotNil.

		stack push: self topEntity rightOperand.
		self assert: self topEntity sourceCode equals: '0b00011011'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		stack pop.
		self assert: self topEntity operator equals: '&'.
	
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

	| boolean |
	self parse: '42j'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.

	boolean := (fast allWithType: FASTPyInteger) anyOne.
	self assert: boolean sourceCode equals: '42j'.
	self assert: (boolean isOfType: FASTTLiteral)
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testDelStatement [
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol: "

	self parse: 'def aFunction(coll):
	del coll'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyParameter) size equals: 1.
	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyDeleteStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'def aFunction(coll):
	del coll' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of multivalued relation parameters"
	self assert: self topEntity parameters size equals: 1.
	
		stack push: (stack top parameters at: 1).
		self assert: self topEntity sourceCode equals: 'coll'.
		self assert: (self topEntity isOfType: FASTPyParameter).
		self assert: self topEntity name equals: 'coll'.
		stack pop.
		
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'del coll'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'del coll'.
			self assert: (self topEntity isOfType: FASTPyDeleteStatement).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: 'coll'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				
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

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImport [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	self parse: 'from datetime import date'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'from datetime import date'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromImportModule"
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
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	self parse: 'from collections import Counter, defaultdic'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 2.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'from collections import Counter, defaultdic'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromImportModule"
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
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	self parse: 'from math import sin, cos as cosinus, pi'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 3.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'from math import sin, cos as cosinus, pi'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromImportModule"
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
		self assert: self topEntity segments equals: #('cos').
		self assert: self topEntity alias equals: 'cosinus'.
		stack pop.
		
		stack push: (stack top importedEntities at: 3).
		self assert: self topEntity sourceCode equals: 'pi'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('pi')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportMultipleWithParenthesis [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	self parse: 'from math import (count, cycle, repeat,)'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 3.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'from math import (count, cycle, repeat,)'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromImportModule"
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
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	self parse: 'from math import (count, cycle as c, repeat,)'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 3.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'from math import (count, cycle as c, repeat,)'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromImportModule"
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
		self assert: self topEntity segments equals: #('cycle').
		self assert: self topEntity alias equals: 'c'.
		stack pop.
		
		stack push: (stack top importedEntities at: 3).
		self assert: self topEntity sourceCode equals: 'repeat'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('repeat')
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportRelative [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	self parse: 'from ..utils.extra import module'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'from ..utils.extra import module'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromImportModule"
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
		self assert: self topEntity segments equals: #('module').
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportRelativeWithAlias [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	self parse: 'from ..utils import module as mod'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'from ..utils import module as mod'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromImportModule"
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
		self assert: self topEntity segments equals: #('module').
		self assert: self topEntity alias equals: 'mod'
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportRelativeWithDoubleDot [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	self parse: 'from .. import module'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'from .. import module'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromImportModule"
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
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	self parse: 'from . import module'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'from . import module'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromImportModule"
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
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	self parse: 'from datetime import date as d'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'from datetime import date as d'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromImportModule"
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
		self assert: self topEntity segments equals: #('date').
		self assert: self topEntity alias equals: 'd'
]

{ #category : 'tests - imports' }
FASTPythonImporterTest >> testFromImportWithWildcard [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	self parse: 'from math import *'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'from math import *'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromImportModule"
	self assert: self topEntity fromModule isNotNil.

		stack push: self topEntity fromModule.
		self assert: self topEntity sourceCode equals: 'math'.
		self assert: (self topEntity isOfType: FASTPyFromModule).
		self assert: self topEntity segments equals: #('math').
		stack pop.
		
	"Testing value of multivalued relation genericChildren"
	self assert: self topEntity genericChildren size equals: 1.
	
		stack push: (stack top genericChildren at: 1).
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
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode: "

	self parse: 'from __future__ import annotiations as ann, division'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportFromStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyFromModule) size equals: 1.
	self assert: (fast allWithType: FASTPyImportedEntity) size equals: 2.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'from __future__ import annotiations as ann, division'.
	self assert: (self topEntity isOfType: FASTPyImportFromStatement).
	
	"Testing value of monovalue relation fromImportModule"
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
		self assert: self topEntity segments equals: #('annotiations').
		self assert: self topEntity alias equals: 'ann'.
		stack pop.
		
		stack push: (stack top importedEntities at: 2).
		self assert: self topEntity sourceCode equals: 'division'.
		self assert: (self topEntity isOfType: FASTPyImportedEntity).
		self assert: self topEntity segments equals: #('division').
		stack pop.
		stack pop.
	
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testGlobalStatement [
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol: "

	self parse: 'def aFunction():
	global counter
	return counter'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyGlobalStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'def aFunction():
	global counter
	return counter' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'global counter
	return counter' withPlatformLineEndings.
		self assert: (self topEntity isOfType: FASTPyBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 2.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'global counter'.
			self assert: (self topEntity isOfType: FASTPyGlobalStatement).
			
			"Testing value of monovalue relation variable"
			self assert: self topEntity variable isNotNil.

				stack push: self topEntity variable.
				self assert: self topEntity sourceCode equals: 'counter'.
				self assert: (self topEntity isOfType: FASTPyVariable).
				stack pop.
				stack pop.
			
			stack push: (stack top statements at: 2).
			self assert: self topEntity sourceCode equals: 'return counter'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: 'counter'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				
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

{ #category : 'tests - collections' }
FASTPythonImporterTest >> testList [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode:protocol: "

	self parse: '[1, 2, 3]'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyList) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 3.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: '[1, 2, 3]'.
	self assert: (self topEntity isOfType: FASTPyList).
	
	"Testing value of multivalued relation initializers"
	self assert: self topEntity initializers size equals: 3.
	
		stack push: (stack top initializers at: 1).
		self assert: self topEntity sourceCode equals: '1'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		stack pop.
		
		stack push: (stack top initializers at: 2).
		self assert: self topEntity sourceCode equals: '2'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		stack pop.
		
		stack push: (stack top initializers at: 3).
		self assert: self topEntity sourceCode equals: '3'.
		self assert: (self topEntity isOfType: FASTPyInteger)
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

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testNonlocalStatement [
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol: "

	self parse: 'def aFunction():
	nonlocal counter
	return counter'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyNonlocalStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyVariable) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'def aFunction():
	nonlocal counter
	return counter' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'nonlocal counter
	return counter' withPlatformLineEndings.
		self assert: (self topEntity isOfType: FASTPyBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 2.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'nonlocal counter'.
			self assert: (self topEntity isOfType: FASTPyNonlocalStatement).
			
			"Testing value of monovalue relation variable"
			self assert: self topEntity variable isNotNil.

				stack push: self topEntity variable.
				self assert: self topEntity sourceCode equals: 'counter'.
				self assert: (self topEntity isOfType: FASTPyVariable).
				stack pop.
				stack pop.
			
			stack push: (stack top statements at: 2).
			self assert: self topEntity sourceCode equals: 'return counter'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: 'counter'.
				self assert: (self topEntity isOfType: FASTPyIdentifier).
				
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
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol: "

	self parse: 'def aFunction():
	pass'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyPassStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyBlock) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'def aFunction():
	pass' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'pass'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'pass'.
			self assert: (self topEntity isOfType: FASTPyPassStatement).
			
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
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode:protocol: "

	self parse: 'def aFunction():
	return'.

	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'def aFunction():
	return' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'return'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'return'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testReturnList [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode:protocol: "

	self parse: 'def aFunction():
	return [1, 2, 3]'.

	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyList) size equals: 1.
	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 3.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'def aFunction():
	return [1, 2, 3]' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'return [1, 2, 3]'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'return [1, 2, 3]'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			
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
					stack pop.
					
					stack push: (stack top initializers at: 2).
					self assert: self topEntity sourceCode equals: '2'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					stack pop.
					
					stack push: (stack top initializers at: 3).
					self assert: self topEntity sourceCode equals: '3'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testReturnLiteral [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode:protocol: "

	self parse: 'def aFunction():
	return 1'.

	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'def aFunction():
	return 1' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'return 1'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'return 1'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			
			"Testing value of monovalue relation expression"
			self assert: self topEntity expression isNotNil.

				stack push: self topEntity expression.
				self assert: self topEntity sourceCode equals: '1'.
				self assert: (self topEntity isOfType: FASTPyInteger).
				
]

{ #category : 'tests - statements' }
FASTPythonImporterTest >> testReturnOperator [
	"Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol: "

	self parse: 'def aFunction():
	return 10 > 13'.

	self assert: (fast allWithType: FASTPyReturnStatement) size equals: 1.
	self assert: (fast allWithType: FASTPyBlock) size equals: 1.
	self assert: (fast allWithType: FASTPyComparisonOperator) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 2.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyFunctionDefinition) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: 'def aFunction():
	return 10 > 13' withPlatformLineEndings.
	self assert: (self topEntity isOfType: FASTPyFunctionDefinition).
	self assert: self topEntity name equals: 'aFunction'.
	
	"Testing value of monovalue relation statementBlock"
	self assert: self topEntity statementBlock isNotNil.

		stack push: self topEntity statementBlock.
		self assert: self topEntity sourceCode equals: 'return 10 > 13'.
		self assert: (self topEntity isOfType: FASTPyBlock).
		
		"Testing value of multivalued relation statements"
		self assert: self topEntity statements size equals: 1.
		
			stack push: (stack top statements at: 1).
			self assert: self topEntity sourceCode equals: 'return 10 > 13'.
			self assert: (self topEntity isOfType: FASTPyReturnStatement).
			
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
					stack pop.
					
					stack push: (stack top operands at: 2).
					self assert: self topEntity sourceCode equals: '13'.
					self assert: (self topEntity isOfType: FASTPyInteger).
					stack pop.
					self assert: self topEntity operators equals: #('>').
				
]

{ #category : 'tests - collections' }
FASTPythonImporterTest >> testSet [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode:protocol: "

	self parse: '{1, 2, 3}'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 3.
	self assert: (fast allWithType: FASTPySet) size equals: 1.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: '{1, 2, 3}'.
	self assert: (self topEntity isOfType: FASTPySet).
	
	"Testing value of multivalued relation initializers"
	self assert: self topEntity initializers size equals: 3.
	
		stack push: (stack top initializers at: 1).
		self assert: self topEntity sourceCode equals: '1'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		stack pop.
		
		stack push: (stack top initializers at: 2).
		self assert: self topEntity sourceCode equals: '2'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		stack pop.
		
		stack push: (stack top initializers at: 3).
		self assert: self topEntity sourceCode equals: '3'.
		self assert: (self topEntity isOfType: FASTPyInteger)
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

{ #category : 'tests - collections' }
FASTPythonImporterTest >> testTuple [
	"Generated as regression test by FASTPythonImporterTest class>>#generateTestNamed:fromCode:protocol: "

	self parse: '(1, 2, 3)'.

	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyTuple) size equals: 1.
	self assert: (fast allWithType: FASTPyInteger) size equals: 3.

	stack push: fast rootEntities anyOne genericChildren first.
	self assert: self topEntity sourceCode equals: '(1, 2, 3)'.
	self assert: (self topEntity isOfType: FASTPyTuple).
	
	"Testing value of multivalued relation initializers"
	self assert: self topEntity initializers size equals: 3.
	
		stack push: (stack top initializers at: 1).
		self assert: self topEntity sourceCode equals: '1'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		stack pop.
		
		stack push: (stack top initializers at: 2).
		self assert: self topEntity sourceCode equals: '2'.
		self assert: (self topEntity isOfType: FASTPyInteger).
		stack pop.
		
		stack push: (stack top initializers at: 3).
		self assert: self topEntity sourceCode equals: '3'.
		self assert: (self topEntity isOfType: FASTPyInteger)
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

{ #category : 'running' }
FASTPythonImporterTest >> topEntity [

	^ stack top
]
