"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `left` | `FASTPyForInClause` | `forInClauseLeftOwner` | `FASTPyExpression` | |
| `right` | `FASTPyForInClause` | `forInClauseRightOwner` | `FASTPyExpression` | |



"
Class {
	#name : 'FASTPyForInClause',
	#superclass : 'FASTPyExpression',
	#instVars : [
		'#left => FMOne type: #FASTPyExpression opposite: #forInClauseLeftOwner',
		'#right => FMOne type: #FASTPyExpression opposite: #forInClauseRightOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyForInClause class >> annotation [

	<FMClass: #ForInClause super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyForInClause >> left [
	"Relation named: #left type: #FASTPyExpression opposite: #forInClauseLeftOwner"

	<generated>
	^ left
]

{ #category : 'accessing' }
FASTPyForInClause >> left: anObject [

	<generated>
	left := anObject
]

{ #category : 'navigation' }
FASTPyForInClause >> leftGroup [
	<generated>
	<navigation: 'Left'>
	^ MooseSpecializedGroup with: self left
]

{ #category : 'accessing' }
FASTPyForInClause >> right [
	"Relation named: #right type: #FASTPyExpression opposite: #forInClauseRightOwner"

	<generated>
	^ right
]

{ #category : 'accessing' }
FASTPyForInClause >> right: anObject [

	<generated>
	right := anObject
]

{ #category : 'navigation' }
FASTPyForInClause >> rightGroup [
	<generated>
	<navigation: 'Right'>
	^ MooseSpecializedGroup with: self right
]
