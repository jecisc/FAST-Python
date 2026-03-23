"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `parentAsPatternSource` | `FASTPyTAsPatternSource` | `source` | `FASTPyAsPattern` | |
| `parentAsPatternTarget` | `FASTPyTAsPatternTarget` | `target` | `FASTPyAsPattern` | |
| `parentAssignmentLeft` | `FASTPyTAssignable` | `left` | `FASTPyAssignment` | |
| `parentClassDefinition` | `FASTPyTSuperclass` | `superclasses` | `FASTPyClassDefinition` | |
| `parentDeclarator` | `FASTPyTDecoratorExpression` | `expression` | `FASTPyDecorator` | |
| `parentDeleteStatement` | `FASTPyTDeletable` | `expression` | `FASTPyDeleteStatement` | The delete statement that own the expression (if it's the case)|
| `parentRaiseStatement` | `FASTPyTRaised` | `exception` | `FASTPyRaiseStatement` | |
| `parentSplat` | `FASTPyTSplatExpression` | `expression` | `FASTPySplat` | |
| `parentSplatParameter` | `FASTPyTSplatParameterTarget` | `target` | `FASTPySplatParameter` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `value` | `FASTPyAttributeAccess` | `attributeObjectOwner` | `FASTPyExpression` | I am the receiver of the attribute. I can be multiple things such as a variable, a call, another attribute access, a primitive type, a subscript...|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyAttributeAccess',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTAsPatternTarget + FASTPyTReturnReferenceable + FASTPyTSplatParameterTarget + FASTTNamedEntity',
	#classTraits : 'FASTPyTAsPatternTarget classTrait + FASTPyTReturnReferenceable classTrait + FASTPyTSplatParameterTarget classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#value => FMOne type: #FASTPyExpression opposite: #attributeObjectOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyAttributeAccess class >> annotation [

	<FMClass: #AttributeAccess super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyAttributeAccess >> value [
	"Relation named: #value type: #FASTPyExpression opposite: #attributeObjectOwner"

	<generated>
	<FMComment: 'I am the receiver of the attribute. I can be multiple things such as a variable, a call, another attribute access, a primitive type, a subscript...'>
	^ value
]

{ #category : 'accessing' }
FASTPyAttributeAccess >> value: anObject [

	<generated>
	value := anObject
]

{ #category : 'navigation' }
FASTPyAttributeAccess >> valueGroup [
	<generated>
	<navigation: 'Value'>
	^ MooseSpecializedGroup with: self value
]
