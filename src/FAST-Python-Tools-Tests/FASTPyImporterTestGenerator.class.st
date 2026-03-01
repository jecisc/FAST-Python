Class {
	#name : 'FASTPyImporterTestGenerator',
	#superclass : 'Object',
	#instVars : [
		'testCase'
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
FASTPyImporterTestGenerator >> generateAssertionsFor: entity pushing: pushString on: aStream identation: aNumber popAtTheEnd: shouldPop [

	| propertiesToAssert |
	aStream
		cr;
		tab: aNumber;
		nextPutAll: 'stack push: ';
		nextPutAll: pushString;
		nextPutAll: '.';
		cr;
		tab: aNumber.

	aStream
		nextPutAll: 'self assert: self topEntity sourceCode equals: ';
		print: entity sourceCode withInternalLineEndings;
		nextPutAll: (entity sourceCode lines size > 1
				 ifTrue: [ ' withPlatformLineEndings.' ]
				 ifFalse: [ '.' ]);
		cr;
		tab: aNumber;
		nextPutAll: 'self assert: (self topEntity isOfType: ';
		nextPutAll: entity class name;
		nextPutAll: ').';
		cr;
		tab: aNumber.

	propertiesToAssert := entity mooseDescription allProperties select: [ :property | self testCase shouldSelectProperty: property of: entity ].
	propertiesToAssert do: [ :property |
			| result selector skipPop |
			result := property getRawFrom: entity.
			selector := property implementingSelector.
			skipPop := shouldPop not and: [ property = propertiesToAssert last ].
			(property isMultivalued and: [ property type isPrimitive not ])
				ifTrue: [
						result ifNotEmpty: [
								aStream
									cr;
									tab: aNumber;
									nextPutAll: '"Testing value of multivalued relation ';
									nextPutAll: selector;
									nextPutAll: '"';
									cr;
									tab: aNumber;
									nextPutAll: 'self assert: self topEntity ';
									nextPutAll: selector;
									nextPutAll: ' size equals: ';
									print: result size;
									nextPut: $.;
									cr;
									tab: aNumber.
								result doWithIndex: [ :child :index |
										self
											generateAssertionsFor: child
											pushing: '(stack top ' , selector , ' at: ' , index asString , ')'
											on: aStream
											identation: aNumber + 1
											popAtTheEnd: (skipPop not or: [ result size ~= index ]) ] ] ]
				ifFalse: [
						(result isMooseObject and: [ result isMooseEntity ])
							ifTrue: [
									aStream
										cr;
										tab: aNumber;
										nextPutAll: '"Testing value of monovalue relation ';
										nextPutAll: selector;
										nextPutAll: '"';
										cr;
										tab: aNumber;
										nextPutAll: 'self assert: self topEntity ';
										nextPutAll: selector;
										nextPutAll: ' isNotNil.';
										cr.
									self
										generateAssertionsFor: result
										pushing: 'self topEntity ' , selector
										on: aStream
										identation: aNumber + 1
										popAtTheEnd: skipPop not ]
							ifFalse: [
									aStream
										nextPutAll: 'self assert: self topEntity ';
										nextPutAll: selector;
										nextPutAll: ' equals: ';
										store: result;
										nextPutAll: '.';
										cr;
										tab: aNumber ] ] "When we have a relation to a collection of entities we do recursively do the testing." ].

	shouldPop ifTrue: [
			aStream
				nextPutAll: 'stack pop.';
				cr;
				tab: aNumber ]
]

{ #category : 'test generation' }
FASTPyImporterTestGenerator >> generateTestNamed: aString fromCode: code protocol: protocol [

	| model method |
	model := self testCase new parse: code.

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

			          self
				          generateAssertionsFor: model rootEntities anyOne genericChildren first
				          pushing: 'fast rootEntities anyOne genericChildren first'
				          on: aStream
				          identation: 1
				          popAtTheEnd: false ].



	self testCase compile: method classified: protocol
]

{ #category : 'accessing' }
FASTPyImporterTestGenerator >> testCase [
	^ testCase
]

{ #category : 'accessing' }
FASTPyImporterTestGenerator >> testCase: anObject [
	testCase := anObject
]
