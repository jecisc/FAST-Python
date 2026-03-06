"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `body` | `FASTPyTComprehension` | `comprehensionBodyOwner` | `FASTPyExpression` | |
| `clause` | `FASTPyTComprehension` | `comprehensionClauseOwner` | `FASTPyExpression` | |



"
Trait {
	#name : 'FASTPyTComprehension',
	#instVars : [
		'#body => FMOne type: #FASTPyExpression opposite: #comprehensionBodyOwner',
		'#clause => FMOne type: #FASTPyExpression opposite: #comprehensionClauseOwner'
	],
	#category : 'FAST-Python-Model-Traits',
	#package : 'FAST-Python-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTPyTComprehension classSide >> annotation [

	<FMClass: #TComprehension super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyTComprehension >> body [
	"Relation named: #body type: #FASTPyExpression opposite: #comprehensionBodyOwner"

	<generated>
	^ body
]

{ #category : 'accessing' }
FASTPyTComprehension >> body: anObject [

	<generated>
	body := anObject
]

{ #category : 'navigation' }
FASTPyTComprehension >> bodyGroup [
	<generated>
	<navigation: 'Body'>
	^ MooseSpecializedGroup with: self body
]

{ #category : 'accessing' }
FASTPyTComprehension >> clause [
	"Relation named: #clause type: #FASTPyExpression opposite: #comprehensionClauseOwner"

	<generated>
	^ clause
]

{ #category : 'accessing' }
FASTPyTComprehension >> clause: anObject [

	<generated>
	clause := anObject
]

{ #category : 'navigation' }
FASTPyTComprehension >> clauseGroup [
	<generated>
	<navigation: 'Clause'>
	^ MooseSpecializedGroup with: self clause
]
