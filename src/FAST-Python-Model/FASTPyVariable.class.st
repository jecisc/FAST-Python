"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `nonlocalOwner` | `FASTPyVariable` | `variables` | `FASTPyNonlocalStatement` | The global statement defining my scope (if it's the case)|
| `parameterOwner` | `FASTTVariableEntity` | `parameters` | `FASTTWithParameters` | parameterOwner|
| `parentAssignmentExpression` | `FASTTVariableEntity` | `variable` | `FASTTAssignment` | Optional assignment to the variable|
| `parentAssignmentLeft` | `FASTPyTAssignable` | `left` | `FASTPyAssignment` | |
| `parentGlobal` | `FASTPyVariable` | `variables` | `FASTPyGlobalStatement` | The global statement defining my scope (if it's the case)|


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
	#superclass : 'FASTPyIdentifier',
	#traits : 'FASTPyTAssignable + FASTTVariableEntity',
	#classTraits : 'FASTPyTAssignable classTrait + FASTTVariableEntity classTrait',
	#instVars : [
		'#nonlocalOwner => FMOne type: #FASTPyNonlocalStatement opposite: #variables',
		'#parentGlobal => FMOne type: #FASTPyGlobalStatement opposite: #variables'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyVariable class >> annotation [

	<FMClass: #Variable super: #FASTPyIdentifier>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
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

{ #category : 'accessing' }
FASTPyVariable >> parentGlobal [
	"Relation named: #parentGlobal type: #FASTPyGlobalStatement opposite: #variables"

	<generated>
	<FMComment: 'The global statement defining my scope (if it''s the case)'>
	<container>
	^ parentGlobal
]

{ #category : 'accessing' }
FASTPyVariable >> parentGlobal: anObject [

	<generated>
	parentGlobal := anObject
]

{ #category : 'navigation' }
FASTPyVariable >> parentGlobalGroup [
	<generated>
	<navigation: 'ParentGlobal'>
	^ MooseSpecializedGroup with: self parentGlobal
]
