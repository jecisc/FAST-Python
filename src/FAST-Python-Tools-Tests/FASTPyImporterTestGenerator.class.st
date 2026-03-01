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
	stream
		cr;
		tab: indentation;
		nextPutAll: 'stack push: ';
		nextPutAll: pushString;
		nextPutAll: '.';
		cr;
		tab: indentation.

	stream
		nextPutAll: 'self assert: self topEntity sourceCode equals: ';
		print: entity sourceCode withInternalLineEndings;
		nextPutAll: (entity sourceCode lines size > 1
				 ifTrue: [ ' withPlatformLineEndings.' ]
				 ifFalse: [ '.' ]);
		cr;
		tab: indentation;
		nextPutAll: 'self assert: (self topEntity isOfType: ';
		nextPutAll: entity class name;
		nextPutAll: ').';
		cr;
		tab: indentation.

	propertiesToAssert := entity mooseDescription allProperties select: [ :property | self shouldSelectProperty: property of: entity ].
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
									self
										generateAssertionsFor: result
										pushing: 'self topEntity ' , selector
										popAtTheEnd: skipPop not ]
							ifFalse: [
									stream
										nextPutAll: 'self assert: self topEntity ';
										nextPutAll: selector;
										nextPutAll: ' equals: ';
										store: result;
										nextPutAll: '.';
										cr;
										tab: indentation ] ] ].

	shouldPop ifTrue: [
			stream
				nextPutAll: 'stack pop.';
				cr;
				tab: indentation.
			indentation := indentation - 1 ]
]

{ #category : 'test generation' }
FASTPyImporterTestGenerator >> generateTestNamed: aString fromCode: code protocol: protocol [

	| model |
	model := self testCase new parse: code.

	stream
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
		nextPutAll: 'self parse: ';
		print: code;
		nextPut: $.;
		cr;
		cr.

	model allEntityTypes do: [ :type |
			stream
				tab;
				nextPutAll: 'self assert: (fast allWithType: ';
				print: type;
				nextPutAll: ') size equals: ';
				print: (model allWithType: type) size;
				nextPut: $.;
				cr ].

	model rootEntities size = 1 ifFalse: [ self error: 'FAST generator was thought with only 1 top entity?' ].

	self
		generateAssertionsFor: model rootEntities anyOne genericChildren first
		pushing: 'fast rootEntities anyOne genericChildren first'
		popAtTheEnd: false.

	self testCase compile: stream contents classified: protocol
]

{ #category : 'initialization' }
FASTPyImporterTestGenerator >> initialize [

	super initialize.
	indentation := 0.
	stream := '' writeStream
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
