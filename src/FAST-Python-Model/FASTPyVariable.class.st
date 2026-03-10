"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attributeOwner` | `FASTPyVariable` | `attribute` | `FASTPyAttributeAccess` | The attribute access accessing me (if it's the case)|
| `globalOwner` | `FASTPyVariable` | `variables` | `FASTPyGlobalStatement` | The global statement defining my scope (if it's the case)|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `nonlocalOwner` | `FASTPyVariable` | `variables` | `FASTPyNonlocalStatement` | The global statement defining my scope (if it's the case)|
| `parameterOwner` | `FASTTVariableEntity` | `parameters` | `FASTTWithParameters` | parameterOwner|
| `parentAssignmentExpression` | `FASTTVariableEntity` | `variable` | `FASTTAssignment` | Optional assignment to the variable|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyVariable',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTTVariableEntity',
	#classTraits : 'FASTTVariableEntity classTrait',
	#instVars : [
		'#attributeOwner => FMOne type: #FASTPyAttributeAccess opposite: #attribute',
		'#globalOwner => FMOne type: #FASTPyGlobalStatement opposite: #variables',
		'#nonlocalOwner => FMOne type: #FASTPyNonlocalStatement opposite: #variables'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyVariable class >> annotation [

	<FMClass: #Variable super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyVariable >> attributeOwner [
	"Relation named: #attributeOwner type: #FASTPyAttributeAccess opposite: #attribute"

	<generated>
	<FMComment: 'The attribute access accessing me (if it''s the case)'>
	<container>
	<derived>
	^ attributeOwner
]

{ #category : 'accessing' }
FASTPyVariable >> attributeOwner: anObject [

	<generated>
	attributeOwner := anObject
]

{ #category : 'navigation' }
FASTPyVariable >> attributeOwnerGroup [
	<generated>
	<navigation: 'AttributeOwner'>
	^ MooseSpecializedGroup with: self attributeOwner
]

{ #category : 'accessing' }
FASTPyVariable >> globalOwner [
	"Relation named: #globalOwner type: #FASTPyGlobalStatement opposite: #variables"

	<generated>
	<FMComment: 'The global statement defining my scope (if it''s the case)'>
	<container>
	^ globalOwner
]

{ #category : 'accessing' }
FASTPyVariable >> globalOwner: anObject [

	<generated>
	globalOwner := anObject
]

{ #category : 'navigation' }
FASTPyVariable >> globalOwnerGroup [
	<generated>
	<navigation: 'GlobalOwner'>
	^ MooseSpecializedGroup with: self globalOwner
]

{ #category : 'accessing' }
FASTPyVariable >> nonlocalOwner [
	"Relation named: #nonlocalOwner type: #FASTPyNonlocalStatement opposite: #variables"

	<generated>
	<FMComment: 'The global statement defining my scope (if it''s the case)'>
	<container>
	^ nonlocalOwner
]

{ #category : 'accessing' }
FASTPyVariable >> nonlocalOwner: anObject [

	<generated>
	nonlocalOwner := anObject
]

{ #category : 'navigation' }
FASTPyVariable >> nonlocalOwnerGroup [
	<generated>
	<navigation: 'NonlocalOwner'>
	^ MooseSpecializedGroup with: self nonlocalOwner
]
