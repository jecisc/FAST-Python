"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentString` | `FASTPyInterpolation` | `interpolations` | `FASTPyString` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTPyInterpolation` | `parentInterpolation` | `FASTPyExpression` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `formatSpecifier` | `String` | nil | If specified, the format of the interpolation.|

"
Class {
	#name : 'FASTPyInterpolation',
	#superclass : 'FASTPyEntity',
	#instVars : [
		'#expression => FMOne type: #FASTPyExpression opposite: #parentInterpolation',
		'#formatSpecifier => FMProperty',
		'#parentString => FMOne type: #FASTPyString opposite: #interpolations'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyInterpolation class >> annotation [

	<FMClass: #Interpolation super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyInterpolation >> expression [
	"Relation named: #expression type: #FASTPyExpression opposite: #parentInterpolation"

	<generated>
	^ expression
]

{ #category : 'accessing' }
FASTPyInterpolation >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : 'navigation' }
FASTPyInterpolation >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : 'accessing' }
FASTPyInterpolation >> formatSpecifier [

	<FMProperty: #formatSpecifier type: #String>
	<generated>
	<FMComment: 'If specified, the format of the interpolation.'>
	^ formatSpecifier
]

{ #category : 'accessing' }
FASTPyInterpolation >> formatSpecifier: anObject [
	<generated>
	formatSpecifier := anObject
]

{ #category : 'accessing' }
FASTPyInterpolation >> parentString [
	"Relation named: #parentString type: #FASTPyString opposite: #interpolations"

	<generated>
	<container>
	^ parentString
]

{ #category : 'accessing' }
FASTPyInterpolation >> parentString: anObject [

	<generated>
	parentString := anObject
]

{ #category : 'navigation' }
FASTPyInterpolation >> parentStringGroup [
	<generated>
	<navigation: 'ParentString'>
	^ MooseSpecializedGroup with: self parentString
]
