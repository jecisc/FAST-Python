"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentDeclarator` | `FASTPyTDecoratorExpression` | `expression` | `FASTPyDecorator` | |
| `sliceOwner` | `FASTPyTSliceContent` | `components` | `FASTPySlice` | Slice in which I am a component (start, end or step) (If it's the case)'|



"
Class {
	#name : 'FASTPyIdentifier',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTDecoratorExpression + FASTPyTSliceContent',
	#classTraits : 'FASTPyTDecoratorExpression classTrait + FASTPyTSliceContent classTrait',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyIdentifier class >> annotation [

	<FMClass: #Identifier super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]
