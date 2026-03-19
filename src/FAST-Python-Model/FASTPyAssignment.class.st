"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentAssignmentLeft` | `FASTPyTAssignable` | `left` | `FASTPyAssignment` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `left` | `FASTPyAssignment` | `parentAssignmentLeft` | `FASTPyTAssignable` | |
| `right` | `FASTPyAssignment` | `parentAssignmentRight` | `FASTPyExpression` | |
| `type` | `FASTPyAssignment` | `parentAssignment` | `FASTPyType` | |



"
Class {
	#name : 'FASTPyAssignment',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTAssignable',
	#classTraits : 'FASTPyTAssignable classTrait',
	#instVars : [
		'#left => FMOne type: #FASTPyTAssignable opposite: #parentAssignmentLeft',
		'#right => FMOne type: #FASTPyExpression opposite: #parentAssignmentRight',
		'#type => FMOne type: #FASTPyType opposite: #parentAssignment'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyAssignment class >> annotation [

	<FMClass: #Assignment super: #FASTPyExpression>
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

{ #category : 'accessing' }
FASTPyAssignment >> type [
	"Relation named: #type type: #FASTPyType opposite: #parentAssignment"

	<generated>
	^ type
]

{ #category : 'accessing' }
FASTPyAssignment >> type: anObject [

	<generated>
	type := anObject
]

{ #category : 'navigation' }
FASTPyAssignment >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]
