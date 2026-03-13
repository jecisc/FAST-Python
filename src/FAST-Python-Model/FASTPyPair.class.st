"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `key` | `FASTPyPair` | `pairKeyOwner` | `FASTPyExpression` | |
| `value` | `FASTPyPair` | `pairValueOwner` | `FASTPyExpression` | |



"
Class {
	#name : 'FASTPyPair',
	#superclass : 'FASTPyExpression',
	#instVars : [
		'#key => FMOne type: #FASTPyExpression opposite: #pairKeyOwner',
		'#value => FMOne type: #FASTPyExpression opposite: #pairValueOwner'
	],
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
	"Relation named: #key type: #FASTPyExpression opposite: #pairKeyOwner"

	<generated>
	^ key
]

{ #category : 'accessing' }
FASTPyPair >> key: anObject [

	<generated>
	key := anObject
]

{ #category : 'navigation' }
FASTPyPair >> keyGroup [
	<generated>
	<navigation: 'Key'>
	^ MooseSpecializedGroup with: self key
]

{ #category : 'accessing' }
FASTPyPair >> value [
	"Relation named: #value type: #FASTPyExpression opposite: #pairValueOwner"

	<generated>
	^ value
]

{ #category : 'accessing' }
FASTPyPair >> value: anObject [

	<generated>
	value := anObject
]

{ #category : 'navigation' }
FASTPyPair >> valueGroup [
	<generated>
	<navigation: 'Value'>
	^ MooseSpecializedGroup with: self value
]
