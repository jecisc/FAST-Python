"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argument` | `FASTPyTUnaryOperator` | `parentUnaryOperator` | `FASTTExpression` | Expression influanced by the unary operator..|



"
Class {
	#name : 'FASTPyNotOperator',
	#superclass : 'FASTPyOperator',
	#traits : 'FASTPyTUnaryOperator',
	#classTraits : 'FASTPyTUnaryOperator classTrait',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyNotOperator class >> annotation [

	<FMClass: #NotOperator super: #FASTPyOperator>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]
