"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentSplat` | `FASTPyTSplatExpression` | `expression` | `FASTPyCollectionSplat` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `body` | `FASTPyTComprehension` | `comprehensionBodyOwner` | `FASTPyExpression` | |
| `clauses` | `FASTPyTComprehension` | `comprehensionClauseOwner` | `FASTPyExpression` | |



"
Trait {
	#name : 'FASTPyTComprehension',
	#instVars : [
		'#body => FMOne type: #FASTPyExpression opposite: #comprehensionBodyOwner',
		'#clauses => FMMany type: #FASTPyExpression opposite: #comprehensionClauseOwner'
	],
	#traits : 'FASTPyTSplatExpression',
	#classTraits : 'FASTPyTSplatExpression classTrait',
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

{ #category : 'adding' }
FASTPyTComprehension >> addClause: anObject [
	<generated>
	^ self clauses add: anObject
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
FASTPyTComprehension >> clauses [
	"Relation named: #clauses type: #FASTPyExpression opposite: #comprehensionClauseOwner"

	<generated>
	<derived>
	^ clauses
]

{ #category : 'accessing' }
FASTPyTComprehension >> clauses: anObject [

	<generated>
	clauses value: anObject
]

{ #category : 'navigation' }
FASTPyTComprehension >> clausesGroup [
	<generated>
	<navigation: 'Clauses'>
	^ MooseSpecializedGroup withAll: self clauses asSet
]
