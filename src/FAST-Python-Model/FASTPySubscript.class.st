"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentAsPatternSource` | `FASTPyTAsPatternSource` | `source` | `FASTPyAsPattern` | |
| `parentAsPatternTarget` | `FASTPyTAsPatternTarget` | `target` | `FASTPyAsPattern` | |
| `parentAssignmentLeft` | `FASTPyTAssignable` | `left` | `FASTPyAssignment` | |
| `parentDeclarator` | `FASTPyTDecoratorExpression` | `expression` | `FASTPyDecorator` | |
| `parentDeleteStatement` | `FASTPyTDeletable` | `expression` | `FASTPyDeleteStatement` | The delete statement that own the expression (if it's the case)|
| `parentRaiseStatement` | `FASTPyTRaised` | `exception` | `FASTPyRaiseStatement` | |
| `parentSplat` | `FASTPyTSplatExpression` | `expression` | `FASTPySplat` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `indices` | `FASTPySubscript` | `parentSubscriptIndice` | `FASTPyExpression` | The elements defining the indices to select in a subscript.|
| `value` | `FASTPySubscript` | `parentSubscriptValue` | `FASTPyExpression` | The receiver of the subscript|



"
Class {
	#name : 'FASTPySubscript',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTAsPatternTarget + FASTPyTReturnReferenceable',
	#classTraits : 'FASTPyTAsPatternTarget classTrait + FASTPyTReturnReferenceable classTrait',
	#instVars : [
		'#indices => FMMany type: #FASTPyExpression opposite: #parentSubscriptIndice',
		'#value => FMOne type: #FASTPyExpression opposite: #parentSubscriptValue'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPySubscript class >> annotation [

	<FMClass: #Subscript super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPySubscript >> addIndex: anObject [
	<generated>
	^ self indices add: anObject
]

{ #category : 'accessing' }
FASTPySubscript >> indices [
	"Relation named: #indices type: #FASTPyExpression opposite: #parentSubscriptIndice"

	<generated>
	<FMComment: 'The elements defining the indices to select in a subscript.'>
	<derived>
	^ indices
]

{ #category : 'accessing' }
FASTPySubscript >> indices: anObject [

	<generated>
	indices value: anObject
]

{ #category : 'navigation' }
FASTPySubscript >> indicesGroup [
	<generated>
	<navigation: 'Indices'>
	^ MooseSpecializedGroup withAll: self indices asSet
]

{ #category : 'accessing' }
FASTPySubscript >> value [
	"Relation named: #value type: #FASTPyExpression opposite: #parentSubscriptValue"

	<generated>
	<FMComment: 'The receiver of the subscript'>
	^ value
]

{ #category : 'accessing' }
FASTPySubscript >> value: anObject [

	<generated>
	value := anObject
]

{ #category : 'navigation' }
FASTPySubscript >> valueGroup [
	<generated>
	<navigation: 'Value'>
	^ MooseSpecializedGroup with: self value
]
