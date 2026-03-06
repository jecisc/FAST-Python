"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `elements` | `FASTPyPatternList` | `patternListOwner` | `FASTPyExpression` | |



"
Class {
	#name : 'FASTPyPatternList',
	#superclass : 'FASTPyExpression',
	#instVars : [
		'#elements => FMMany type: #FASTPyExpression opposite: #patternListOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyPatternList class >> annotation [

	<FMClass: #PatternList super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyPatternList >> addElement: anObject [
	<generated>
	^ self elements add: anObject
]

{ #category : 'accessing' }
FASTPyPatternList >> elements [
	"Relation named: #elements type: #FASTPyExpression opposite: #patternListOwner"

	<generated>
	<derived>
	^ elements
]

{ #category : 'accessing' }
FASTPyPatternList >> elements: anObject [

	<generated>
	elements value: anObject
]

{ #category : 'navigation' }
FASTPyPatternList >> elementsGroup [
	<generated>
	<navigation: 'Elements'>
	^ MooseSpecializedGroup withAll: self elements asSet
]
