"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `body` | `FASTPyTComprehension` | `comprehensionBodyOwner` | `FASTPyExpression` | |
| `clause` | `FASTPyTComprehension` | `comprehensionClauseOwner` | `FASTPyExpression` | |



"
Class {
	#name : 'FASTPyDictionaryComprehension',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTComprehension',
	#classTraits : 'FASTPyTComprehension classTrait',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyDictionaryComprehension class >> annotation [

	<FMClass: #DictionaryComprehension super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]
