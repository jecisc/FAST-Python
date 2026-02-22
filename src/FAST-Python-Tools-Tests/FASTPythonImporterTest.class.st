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

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonBinaryOperator) size equals: 1.

	operator := (fast allWithType: FASTPythonBinaryOperator) anyOne.
	self assert: operator sourceCode equals: '40 + 2'.
	self assert: (operator isOfType: FASTTBinaryExpression).
	self assert: operator leftOperand sourceCode equals: '40'.
	self assert: (operator leftOperand isOfType: FASTPythonInteger).
	self assert: operator rightOperand sourceCode equals: '2'.
	self assert: (operator rightOperand isOfType: FASTPythonInteger)
]

{ #category : 'tests' }
FASTPythonImporterTest >> testClassDefinition [

	| class |
	self parse: 'class AClass():
	pass'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonClassDefinition) size equals: 1.

	class := (fast allWithType: FASTPythonClassDefinition) anyOne.
	self assert: class name equals: 'AClass'
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testComplex [

	| boolean |
	self parse: '42j'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonInteger) size equals: 1.

	boolean := (fast allWithType: FASTPythonInteger) anyOne.
	self assert: boolean sourceCode equals: '42j'.
	self assert: (boolean isOfType: FASTTLiteral)
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testDoubleQuotedString [

	| string |
	self parse: '"This is a string"'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonString) size equals: 1.

	string := (fast allWithType: FASTPythonString) anyOne.
	self assert: string sourceCode equals: '"This is a string"'.
	self assert: (string isOfType: FASTTStringLiteral).
	self assertEmpty: string allContainedEntities "This is because TreeSitter has nodes inside a string but we do not care about that in FAST. This is to avoid a regression"
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testFalse [

	| boolean |
	self parse: 'False'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonBoolean) size equals: 1.

	boolean := (fast allWithType: FASTPythonBoolean) anyOne.
	self assert: boolean sourceCode equals: 'False'.
	self assert: (boolean isOfType: FASTTBooleanLiteral)
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testFloat [

	| boolean |
	self parse: '42.0'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonFloat) size equals: 1.

	boolean := (fast allWithType: FASTPythonFloat) anyOne.
	self assert: boolean sourceCode equals: '42.0'.
	self assert: (boolean isOfType: FASTTLiteral)
]

{ #category : 'tests' }
FASTPythonImporterTest >> testFunctionDefinition [

	| function |
	self parse: 'def test():
	return 1'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonFunctionDefinition) size equals: 1.

	function := (fast allWithType: FASTPythonFunctionDefinition) anyOne.
	self assert: function name equals: 'test'
]

{ #category : 'tests - parameters' }
FASTPythonImporterTest >> testFunctionParameters [

	| function |
	self parse: 'def add(a, b):
	return a + b'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonFunctionDefinition) size equals: 1.
	function := (fast allWithType: FASTPythonFunctionDefinition) anyOne.

	self assert: (fast allWithType: FASTPythonParameter) size equals: 2.
	self assertCollection: (fast allWithType: FASTPythonParameter) hasSameElements: function parameters.
	function parameters do: [ :parameter | self assert: (parameter isOfType: FASTPythonParameter) ].
	self assertCollection: (function parameters collect: #name) hasSameElements: #( 'a' 'b' )
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testInteger [

	| boolean |
	self parse: '42'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonInteger) size equals: 1.

	boolean := (fast allWithType: FASTPythonInteger) anyOne.
	self assert: boolean sourceCode equals: '42'.
	self assert: (boolean isOfType: FASTTLiteral)
]

{ #category : 'tests' }
FASTPythonImporterTest >> testMethodDefinition [

	| method |
	self parse: 'class AClass():
	def method(self):
		pass'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonClassDefinition) size equals: 1.
	self assert: (fast allWithType: FASTPythonMethodDefinition) size equals: 1.

	method := (fast allWithType: FASTPythonMethodDefinition) anyOne.
	self assert: method name equals: 'method'
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testNone [

	| boolean |
	self parse: 'None'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonNone) size equals: 1.

	boolean := (fast allWithType: FASTPythonNone) anyOne.
	self assert: boolean sourceCode equals: 'None'.
	self assert: (boolean isOfType: FASTTLiteral)
]

{ #category : 'tests' }
FASTPythonImporterTest >> testOneComment [

	| entity |
	self parse: '#There is only one comment'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	entity := (fast allWithType: FASTPythonModule) anyOne.
	self assert: entity sourceCode equals: '#There is only one comment'.

	self assert: (fast allWithType: FASTPythonComment) size equals: 1.
	entity := (fast allWithType: FASTPythonComment) anyOne.
	self assert: entity sourceCode equals: '#There is only one comment'
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testRawString [

	| string |
	self parse: 'r''This is a \string'''.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonString) size equals: 1.

	string := (fast allWithType: FASTPythonString) anyOne.
	self assert: string sourceCode equals: 'r''This is a \string'''.
	self assert: (string isOfType: FASTTStringLiteral).
	self assertEmpty: string allContainedEntities
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testSingleQuotedString [

	| string |
	self parse: '''This is a string'''.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonString) size equals: 1.

	string := (fast allWithType: FASTPythonString) anyOne.
	self assert: string sourceCode equals: '''This is a string'''.
	self assert: (string isOfType: FASTTStringLiteral).
	self assertEmpty: string allContainedEntities
]

{ #category : 'tests - literals' }
FASTPythonImporterTest >> testTrue [

	| boolean |
	self parse: 'True'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	self assert: (fast allWithType: FASTPythonBoolean) size equals: 1.

	boolean := (fast allWithType: FASTPythonBoolean) anyOne.
	self assert: boolean sourceCode equals: 'True'.
	self assert: (boolean isOfType: FASTTBooleanLiteral)
]

{ #category : 'tests' }
FASTPythonImporterTest >> testTwoComments [

	| entity |
	self parse: '# Comment 1
	
# Comment 2'.

	self assert: (fast allWithType: FASTPythonModule) size equals: 1.
	entity := (fast allWithType: FASTPythonModule) anyOne.
	self assert: entity sourceCode equals: '# Comment 1
	
# Comment 2' withPlatformLineEndings.

	self assert: (fast allWithType: FASTPythonComment) size equals: 2.
	self assertCollection: ((fast allWithType: FASTPythonComment) collect: #sourceCode as: Array) hasSameElements: { '# Comment 1'. '# Comment 2' }
]
