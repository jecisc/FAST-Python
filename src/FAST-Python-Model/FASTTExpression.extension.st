Extension { #name : 'FASTTExpression' }

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> pairKeyOwner [
	"Relation named: #pairKeyOwner type: #FASTPyPair opposite: #key"

	<generated>
	<container>
	<derived>
	<FMProperty: #pairKeyOwner type: #FASTPyPair opposite: #key>
	<package: #'FAST-Python-Model'>
	^ self attributeAt: #pairKeyOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> pairKeyOwner: anObject [

	<generated>
	(self attributeAt: #pairKeyOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self pairKeyOwner.
		self attributeAt: #pairKeyOwner put: anObject.
		otherSide key: nil ]
	ifNotNil: [ 
		self attributeAt: #pairKeyOwner put: anObject.
		anObject key: self ]
]

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> pairValueOwner [
	"Relation named: #pairValueOwner type: #FASTPyPair opposite: #value"

	<generated>
	<container>
	<derived>
	<FMProperty: #pairValueOwner type: #FASTPyPair opposite: #value>
	<package: #'FAST-Python-Model'>
	^ self attributeAt: #pairValueOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> pairValueOwner: anObject [

	<generated>
	(self attributeAt: #pairValueOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self pairValueOwner.
		self attributeAt: #pairValueOwner put: anObject.
		otherSide value: nil ]
	ifNotNil: [ 
		self attributeAt: #pairValueOwner put: anObject.
		anObject value: self ]
]
