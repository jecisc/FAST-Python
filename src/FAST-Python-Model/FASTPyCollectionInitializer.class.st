"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `initializers` | `FASTPyCollectionInitializer` | `collectionInitializers` | `FASTTExpression` | Each initializer defines one element.|



"
Class {
	#name : 'FASTPyCollectionInitializer',
	#superclass : 'FASTPyExpression',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyCollectionInitializer class >> annotation [

	<FMClass: #CollectionInitializer super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyCollectionInitializer >> addInitializer: anObject [
	<generated>
	^ self initializers add: anObject
]

{ #category : 'accessing' }
FASTPyCollectionInitializer >> initializers [
	"Relation named: #initializers type: #FASTTExpression opposite: #collectionInitializers"

	<generated>
	<FMComment: 'Each initializer defines one element.'>
	<derived>
	<FMProperty: #initializers type: #FASTTExpression opposite: #collectionInitializers>
	<multivalued>
	^ self attributeAt: #initializers ifAbsentPut: [ FMMultivalueLink on: self opposite: #collectionInitializers: ]
]

{ #category : 'accessing' }
FASTPyCollectionInitializer >> initializers: anObject [

	<generated>
	self initializers value: anObject
]

{ #category : 'navigation' }
FASTPyCollectionInitializer >> initializersGroup [
	<generated>
	<navigation: 'Initializers'>
	^ MooseSpecializedGroup withAll: self initializers asSet
]
