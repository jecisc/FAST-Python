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
| `patterns` | `FASTPyTuplePattern` | `tuplePatternOwner` | `FASTPyExpression` | |



"
Class {
	#name : 'FASTPyTuplePattern',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTAssignable',
	#classTraits : 'FASTPyTAssignable classTrait',
	#instVars : [
		'#patterns => FMMany type: #FASTPyExpression opposite: #tuplePatternOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyTuplePattern class >> annotation [

	<FMClass: #TuplePattern super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyTuplePattern >> addPattern: anObject [
	<generated>
	^ self patterns add: anObject
]

{ #category : 'accessing' }
FASTPyTuplePattern >> patterns [
	"Relation named: #patterns type: #FASTPyExpression opposite: #tuplePatternOwner"

	<generated>
	<derived>
	^ patterns
]

{ #category : 'accessing' }
FASTPyTuplePattern >> patterns: anObject [

	<generated>
	patterns value: anObject
]

{ #category : 'navigation' }
FASTPyTuplePattern >> patternsGroup [
	<generated>
	<navigation: 'Patterns'>
	^ MooseSpecializedGroup withAll: self patterns asSet
]
