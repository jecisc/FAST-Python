"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `operands` | `FASTPyComparisonOperator` | `parentComparisonOperator` | `FASTTExpression` | List of the operands of the comparison operands. For example if we have `a == b != c`, it will be a, b and c.|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `operators` | `String` | nil | The comparators applied in order. Possible operators:  <, <=, ==, !=, >=, >, <>, in, not in, is, is not|

"
Class {
	#name : 'FASTPyComparisonOperator',
	#superclass : 'FASTPyOperator',
	#instVars : [
		'#operators => FMProperty'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyComparisonOperator class >> annotation [

	<FMClass: #ComparisonOperator super: #FASTPyOperator>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyComparisonOperator >> addOperand: anObject [
	<generated>
	^ self operands add: anObject
]

{ #category : 'accessing' }
FASTPyComparisonOperator >> operands [
	"Relation named: #operands type: #FASTTExpression opposite: #parentComparisonOperator"

	<generated>
	<FMComment: 'List of the operands of the comparison operands. For example if we have `a == b != c`, it will be a, b and c.'>
	<derived>
	<FMProperty: #operands type: #FASTTExpression opposite: #parentComparisonOperator>
	<multivalued>
	^ self attributeAt: #operands ifAbsentPut: [ FMMultivalueLink on: self opposite: #parentComparisonOperator: ]
]

{ #category : 'accessing' }
FASTPyComparisonOperator >> operands: anObject [

	<generated>
	self operands value: anObject
]

{ #category : 'navigation' }
FASTPyComparisonOperator >> operandsGroup [
	<generated>
	<navigation: 'Operands'>
	^ MooseSpecializedGroup withAll: self operands asSet
]

{ #category : 'accessing' }
FASTPyComparisonOperator >> operators [

	<FMProperty: #operators type: #String>
	<generated>
	<multivalued>
	<FMComment: 'The comparators applied in order. Possible operators:  <, <=, ==, !=, >=, >, <>, in, not in, is, is not'>
	^ operators
]

{ #category : 'accessing' }
FASTPyComparisonOperator >> operators: anObject [
	<generated>
	operators := anObject
]
