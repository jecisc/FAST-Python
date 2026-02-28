"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `initializers` | `FASTPyList` | `collectionInitializers` | `FASTTExpression` | Each initializer defines one element.|



"
Class {
	#name : 'FASTPyList',
	#superclass : 'FASTPyExpression',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyList class >> annotation [

	<FMClass: #List super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyList >> addInitializer: anObject [
	<generated>
	^ self initializers add: anObject
]

{ #category : 'accessing' }
FASTPyList >> initializers [
	"Relation named: #initializers type: #FASTTExpression opposite: #collectionInitializers"

	<generated>
	<FMComment: 'Each initializer defines one element.'>
	<derived>
	<FMProperty: #initializers type: #FASTTExpression opposite: #collectionInitializers>
	<multivalued>
	^ self attributeAt: #initializers ifAbsentPut: [ FMMultivalueLink on: self opposite: #collectionInitializers: ]
]

{ #category : 'accessing' }
FASTPyList >> initializers: anObject [

	<generated>
	self initializers value: anObject
]

{ #category : 'navigation' }
FASTPyList >> initializersGroup [
	<generated>
	<navigation: 'Initializers'>
	^ MooseSpecializedGroup withAll: self initializers asSet
]
