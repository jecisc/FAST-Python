Class {
	#name : 'FASTPyImporterTestGenerator',
	#superclass : 'Object',
	#instVars : [
		'testCase',
		'indentation',
		'stream'
	],
	#category : 'FAST-Python-Tools-Tests',
	#package : 'FAST-Python-Tools-Tests'
}

{ #category : 'tests' }
FASTPyImporterTestGenerator class >> testCase: aClass [

	^ self new
		  testCase: aClass;
		  yourself
]

{ #category : 'test generation' }
FASTPyImporterTestGenerator >> generateAssertionsFor: entity pushing: pushString popAtTheEnd: shouldPop [

	| propertiesToAssert |
	indentation := indentation + 1.

	propertiesToAssert := entity mooseDescription allProperties select: [ :property | self shouldSelectProperty: property of: entity ]. "Sorting properties in order to always have the same order."
	propertiesToAssert sort: #name ascending.

	stream
		cr;
		tab: indentation;
		nextPutAll: 'stack push: ';
		nextPutAll: pushString;
		nextPutAll: '.';
		cr;
		tab: indentation;
		nextPutAll: 'self assert: self topEntity sourceCode equals: ';
		print: entity sourceCode withInternalLineEndings;
		nextPutAll: (entity sourceCode lines size > 1
				 ifTrue: [ ' withPlatformLineEndings.' ]
				 ifFalse: [ '.' ]);
		cr;
		tab: indentation;
		nextPutAll: 'self assert: (self topEntity isOfType: ';
		nextPutAll: entity class name.


	(shouldPop not and: [ propertiesToAssert isEmpty ])
		ifTrue: [ stream nextPut: $) ]
		ifFalse: [
				stream
					nextPutAll: ').';
					cr;
					tab: indentation ].

	propertiesToAssert do: [ :property |
			| result selector skipPop |
			result := property getRawFrom: entity.
			selector := property implementingSelector.
			skipPop := shouldPop not and: [ property = propertiesToAssert last ].
			(property isMultivalued and: [ property type isPrimitive not ])
				ifTrue: [
						result ifNotEmpty: [
								stream
									cr;
									tab: indentation;
									nextPutAll: '"Testing value of multivalued relation ';
									nextPutAll: selector;
									nextPutAll: '"';
									cr;
									tab: indentation;
									nextPutAll: 'self assert: self topEntity ';
									nextPutAll: selector;
									nextPutAll: ' size equals: ';
									print: result size;
									nextPut: $.;
									cr;
									tab: indentation.
								result doWithIndex: [ :child :index |
									self
										generateAssertionsFor: child
										pushing: '(stack top ' , selector , ' at: ' , index asString , ')'
										popAtTheEnd: (skipPop not or: [ result size ~= index ]) ] ] ]
				ifFalse: [ "When we have a relation to a collection of entities we do recursively do the testing."
						(result isMooseObject and: [ result isMooseEntity ])
							ifTrue: [
									stream
										cr;
										tab: indentation;
										nextPutAll: '"Testing value of monovalue relation ';
										nextPutAll: selector;
										nextPutAll: '"';
										cr;
										tab: indentation;
										nextPutAll: 'self assert: self topEntity ';
										nextPutAll: selector;
										nextPutAll: ' isNotNil.';
										cr.
									self generateAssertionsFor: result pushing: 'self topEntity ' , selector popAtTheEnd: skipPop not ]
							ifFalse: [
									stream
										nextPutAll: 'self assert: self topEntity ';
										nextPutAll: selector;
										nextPutAll: ' equals: ';
										store: result.
									skipPop ifFalse: [
											stream
												nextPut: $.;
												cr;
												tab: indentation ] ] ] ].

	shouldPop ifTrue: [
			stream
				nextPutAll: 'stack pop.';
				cr;
				tab: indentation ].
	indentation := indentation - 1
]

{ #category : 'test generation' }
FASTPyImporterTestGenerator >> generateTestNamed: aString fromCode: code protocol: protocol [

	| model methodName |
	model := self testCase new parse: code.
	methodName := ('test' , aString capitalized) asSymbol.

	stream
		nextPutAll: methodName;
		cr;
		tab;
		nextPutAll: '<generated>';
		cr;
		tab;
		nextPutAll: '"Generated as regression test by ';
		print: thisContext homeMethod;
		cr;
		tab;
		nextPutAll: 'Regenerate executing: 	self regenerateTest: ';
		print: methodName;
		nextPutAll: ' 	"';
		cr;
		cr;
		tab;
		nextPutAll: 'self parse: ';
		print: code;
		nextPut: $.;
		cr;
		cr.

	(model allEntityTypes sorted: #class ascending) do: [ :type |
			stream
				tab;
				nextPutAll: 'self assert: (fast allWithType: ';
				print: type;
				nextPutAll: ') size equals: ';
				print: (model allWithType: type) size;
				nextPut: $.;
				cr ].

	model rootEntities size = 1 ifFalse: [ self error: 'FAST generator was thought with only 1 top entity?' ].
	
	"If we have only one entity in the root entity, we test it directly and we don't test the root entity since it will be tested by other tests in general.
	If we have multiple children we test the root entity."
	model rootEntities anyOne containedEntities size = 1
		ifTrue: [ self generateAssertionsFor: model rootEntities anyOne containedEntities first pushing: 'fast rootEntities anyOne containedEntities first' popAtTheEnd: false ]
		ifFalse: [ self generateAssertionsFor: model rootEntities anyOne pushing: 'fast rootEntities anyOne' popAtTheEnd: false ].

	self testCase compile: stream contents classified: protocol
]

{ #category : 'initialization' }
FASTPyImporterTestGenerator >> initialize [

	super initialize.
	indentation := 0.
	stream := '' writeStream
]

{ #category : 'test generation' }
FASTPyImporterTestGenerator >> regenerateTest: aCompiledMethod [

	| sourceCode |
	sourceCode := aCompiledMethod ast statements first arguments first value.

	self generateTestNamed: (aCompiledMethod selector withoutPrefix: 'test') fromCode: sourceCode protocol: aCompiledMethod protocol
]

{ #category : 'asserting' }
FASTPyImporterTestGenerator >> shouldSelectProperty: property of: entity [

	(self testCase propertiesToExclude includes: property implementingSelector) ifTrue: [ ^ false ].
	
	property isChildrenProperty ifTrue: [ ^  (property getFrom: entity) isEmptyOrNil not ].

	property isDerived ifTrue: [ ^ false ]. "No need to check derived properties since they can be recomputed. I am not the place to test general mecanisms"

	property isContainer ifTrue: [ ^ false ]. "We check from top to bottom. Not need to tests relations in both ways."

	^ (property getFrom: entity) isEmptyOrNil not
]

{ #category : 'accessing' }
FASTPyImporterTestGenerator >> testCase [
	^ testCase
]

{ #category : 'accessing' }
FASTPyImporterTestGenerator >> testCase: anObject [
	testCase := anObject
]
