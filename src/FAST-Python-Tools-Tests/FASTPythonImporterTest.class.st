"
A FASTPythonImporterTest is a test class for testing the behavior of FASTPythonImporter
"
Class {
	#name : 'FASTPythonImporterTest',
	#superclass : 'TestCase',
	#instVars : [
		'importer',
		'fast'
	],
	#category : 'FAST-Python-Tools-Tests',
	#package : 'FAST-Python-Tools-Tests'
}

{ #category : 'running' }
FASTPythonImporterTest >> parse: aString [

	fast := importer parse: aString withPlatformLineEndings
]

{ #category : 'running' }
FASTPythonImporterTest >> setUp [

	super setUp.

	importer := FASTPythonImporter new
]

{ #category : 'tests - literals' }
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
