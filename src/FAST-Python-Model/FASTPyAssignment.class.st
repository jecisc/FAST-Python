"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `left` | `FASTPyAssignment` | `parentAssignmentLeft` | `FASTPyTAssignable` | |
| `right` | `FASTPyAssignment` | `parentAssignmentRight` | `FASTPyExpression` | |



"
Class {
	#name : 'FASTPyAssignment',
	#superclass : 'FASTPyStatement',
	#instVars : [
		'#left => FMOne type: #FASTPyTAssignable opposite: #parentAssignmentLeft',
		'#right => FMOne type: #FASTPyExpression opposite: #parentAssignmentRight'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyAssignment class >> annotation [

	<FMClass: #Assignment super: #FASTPyStatement>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyAssignment >> left [
	"Relation named: #left type: #FASTPyTAssignable opposite: #parentAssignmentLeft"

	<generated>
	^ left
]

{ #category : 'accessing' }
FASTPyAssignment >> left: anObject [

	<generated>
	left := anObject
]

{ #category : 'navigation' }
FASTPyAssignment >> leftGroup [
	<generated>
	<navigation: 'Left'>
	^ MooseSpecializedGroup with: self left
]

{ #category : 'accessing' }
FASTPyAssignment >> right [
	"Relation named: #right type: #FASTPyExpression opposite: #parentAssignmentRight"

	<generated>
	^ right
]

{ #category : 'accessing' }
FASTPyAssignment >> right: anObject [

	<generated>
	right := anObject
]

{ #category : 'navigation' }
FASTPyAssignment >> rightGroup [
	<generated>
	<navigation: 'Right'>
	^ MooseSpecializedGroup with: self right
]
