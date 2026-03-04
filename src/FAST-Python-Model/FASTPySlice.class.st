"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `components` | `FASTPySlice` | `sliceOwner` | `FASTPyExpression` | The components are the expressions between the `:` of a slice.|



"
Class {
	#name : 'FASTPySlice',
	#superclass : 'FASTPyExpression',
	#instVars : [
		'#components => FMMany type: #FASTPyExpression opposite: #sliceOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPySlice class >> annotation [

	<FMClass: #Slice super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPySlice >> addComponent: anObject [
	<generated>
	^ self components add: anObject
]

{ #category : 'accessing' }
FASTPySlice >> components [
	"Relation named: #components type: #FASTPyExpression opposite: #sliceOwner"

	<generated>
	<FMComment: 'The components are the expressions between the `:` of a slice.'>
	<derived>
	^ components
]

{ #category : 'accessing' }
FASTPySlice >> components: anObject [

	<generated>
	components value: anObject
]

{ #category : 'navigation' }
FASTPySlice >> componentsGroup [
	<generated>
	<navigation: 'Components'>
	^ MooseSpecializedGroup withAll: self components asSet
]
