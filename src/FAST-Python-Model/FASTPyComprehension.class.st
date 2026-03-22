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
| `body` | `FASTPyComprehension` | `parentComprehensionBody` | `FASTPyExpression` | |
| `clauses` | `FASTPyComprehension` | `parentComprehensionClause` | `FASTPyExpression` | |
| `conditions` | `FASTPyComprehension` | `parentComprehensionCondition` | `FASTPyExpression` | |



"
Class {
	#name : 'FASTPyComprehension',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTSplatExpression',
	#classTraits : 'FASTPyTSplatExpression classTrait',
	#instVars : [
		'#body => FMOne type: #FASTPyExpression opposite: #parentComprehensionBody',
		'#clauses => FMMany type: #FASTPyExpression opposite: #parentComprehensionClause',
		'#conditions => FMMany type: #FASTPyExpression opposite: #parentComprehensionCondition'
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

{ #category : 'adding' }
FASTPyComprehension >> addCondition: anObject [
	<generated>
	^ self conditions add: anObject
]

{ #category : 'accessing' }
FASTPyComprehension >> body [
	"Relation named: #body type: #FASTPyExpression opposite: #parentComprehensionBody"

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
	"Relation named: #clauses type: #FASTPyExpression opposite: #parentComprehensionClause"

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

{ #category : 'accessing' }
FASTPyComprehension >> conditions [
	"Relation named: #conditions type: #FASTPyExpression opposite: #parentComprehensionCondition"

	<generated>
	<derived>
	^ conditions
]

{ #category : 'accessing' }
FASTPyComprehension >> conditions: anObject [

	<generated>
	conditions value: anObject
]

{ #category : 'navigation' }
FASTPyComprehension >> conditionsGroup [
	<generated>
	<navigation: 'Conditions'>
	^ MooseSpecializedGroup withAll: self conditions asSet
]
