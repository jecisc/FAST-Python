"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `key` | `FASTPyPair` | `pairKeyOwner` | `FASTTExpression` | |
| `value` | `FASTPyPair` | `pairValueOwner` | `FASTTExpression` | |



"
Class {
	#name : 'FASTPyPair',
	#superclass : 'FASTPyExpression',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyPair class >> annotation [

	<FMClass: #Pair super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyPair >> key [
	"Relation named: #key type: #FASTTExpression opposite: #pairKeyOwner"

	<generated>
	<FMProperty: #key type: #FASTTExpression opposite: #pairKeyOwner>
	^ self attributeAt: #key ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTPyPair >> key: anObject [

	<generated>
	(self attributeAt: #key ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self key.
		self attributeAt: #key put: anObject.
		otherSide pairKeyOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #key put: anObject.
		anObject pairKeyOwner: self ]
]

{ #category : 'navigation' }
FASTPyPair >> keyGroup [
	<generated>
	<navigation: 'Key'>
	^ MooseSpecializedGroup with: self key
]

{ #category : 'accessing' }
FASTPyPair >> value [
	"Relation named: #value type: #FASTTExpression opposite: #pairValueOwner"

	<generated>
	<FMProperty: #value type: #FASTTExpression opposite: #pairValueOwner>
	^ self attributeAt: #value ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTPyPair >> value: anObject [

	<generated>
	(self attributeAt: #value ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self value.
		self attributeAt: #value put: anObject.
		otherSide pairValueOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #value put: anObject.
		anObject pairValueOwner: self ]
]

{ #category : 'navigation' }
FASTPyPair >> valueGroup [
	<generated>
	<navigation: 'Value'>
	^ MooseSpecializedGroup with: self value
]
