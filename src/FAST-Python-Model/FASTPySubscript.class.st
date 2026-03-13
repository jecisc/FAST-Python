"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentAsPatternSource` | `FASTPyTAsPatternSource` | `source` | `FASTPyAsPattern` | |
| `parentAsPatternTarget` | `FASTPyTAsPatternTarget` | `target` | `FASTPyAsPattern` | |
| `parentDeclarator` | `FASTPyTDecoratorExpression` | `expression` | `FASTPyDecorator` | |
| `parentSplat` | `FASTPyTCanBeSplatExpression` | `expression` | `FASTPyCollectionSplat` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `indices` | `FASTPySubscript` | `subscriptIndiceOwner` | `FASTPyExpression` | The elements defining the indices to select in a subscript.|
| `value` | `FASTPySubscript` | `subscriptValueOwner` | `FASTPyExpression` | The receiver of the subscript|



"
Class {
	#name : 'FASTPySubscript',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTAsPatternSource + FASTPyTAsPatternTarget + FASTPyTCanBeSplatExpression + FASTPyTDecoratorExpression',
	#classTraits : 'FASTPyTAsPatternSource classTrait + FASTPyTAsPatternTarget classTrait + FASTPyTCanBeSplatExpression classTrait + FASTPyTDecoratorExpression classTrait',
	#instVars : [
		'#indices => FMMany type: #FASTPyExpression opposite: #subscriptIndiceOwner',
		'#value => FMOne type: #FASTPyExpression opposite: #subscriptValueOwner'
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
	"Relation named: #indices type: #FASTPyExpression opposite: #subscriptIndiceOwner"

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
	"Relation named: #value type: #FASTPyExpression opposite: #subscriptValueOwner"

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
