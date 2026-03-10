"
I represent an entity that can be one of the component of a slice.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sliceOwner` | `FASTPyTSliceContent` | `components` | `FASTPySlice` | Slice in which I am a component (start, end or step) (If it's the case)'|



"
Trait {
	#name : 'FASTPyTSliceContent',
	#instVars : [
		'#sliceOwner => FMOne type: #FASTPySlice opposite: #components'
	],
	#category : 'FAST-Python-Model-Traits',
	#package : 'FAST-Python-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTPyTSliceContent classSide >> annotation [

	<FMClass: #TSliceContent super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyTSliceContent >> sliceOwner [
	"Relation named: #sliceOwner type: #FASTPySlice opposite: #components"

	<generated>
	<FMComment: 'Slice in which I am a component (start, end or step) (If it''s the case)'''>
	<container>
	^ sliceOwner
]

{ #category : 'accessing' }
FASTPyTSliceContent >> sliceOwner: anObject [

	<generated>
	sliceOwner := anObject
]

{ #category : 'navigation' }
FASTPyTSliceContent >> sliceOwnerGroup [
	<generated>
	<navigation: 'SliceOwner'>
	^ MooseSpecializedGroup with: self sliceOwner
]
