"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentSplat` | `FASTPyTSplatExpression` | `expression` | `FASTPySplat` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `body` | `FASTPyComprehension` | `comprehensionBodyOwner` | `FASTPyExpression` | |
| `clauses` | `FASTPyComprehension` | `comprehensionClauseOwner` | `FASTPyExpression` | |
| `condition` | `FASTTWithCondition` | `parentConditional` | `FASTTExpression` | The boolean condition tested|



"
Class {
	#name : 'FASTPyComprehension',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTSplatExpression + FASTTWithCondition',
	#classTraits : 'FASTPyTSplatExpression classTrait + FASTTWithCondition classTrait',
	#instVars : [
		'#body => FMOne type: #FASTPyExpression opposite: #comprehensionBodyOwner',
		'#clauses => FMMany type: #FASTPyExpression opposite: #comprehensionClauseOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyComprehension class >> annotation [

	<FMClass: #Comprehension super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyComprehension >> addClause: anObject [
	<generated>
	^ self clauses add: anObject
]

{ #category : 'accessing' }
FASTPyComprehension >> body [
	"Relation named: #body type: #FASTPyExpression opposite: #comprehensionBodyOwner"

	<generated>
	^ body
]

{ #category : 'accessing' }
FASTPyComprehension >> body: anObject [

	<generated>
	body := anObject
]

{ #category : 'navigation' }
FASTPyComprehension >> bodyGroup [
	<generated>
	<navigation: 'Body'>
	^ MooseSpecializedGroup with: self body
]

{ #category : 'accessing' }
FASTPyComprehension >> clauses [
	"Relation named: #clauses type: #FASTPyExpression opposite: #comprehensionClauseOwner"

	<generated>
	<derived>
	^ clauses
]

{ #category : 'accessing' }
FASTPyComprehension >> clauses: anObject [

	<generated>
	clauses value: anObject
]

{ #category : 'navigation' }
FASTPyComprehension >> clausesGroup [
	<generated>
	<navigation: 'Clauses'>
	^ MooseSpecializedGroup withAll: self clauses asSet
]
