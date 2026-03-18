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
| `parentSplat` | `FASTPyTSplatExpression` | `expression` | `FASTPyCollectionSplat` | |
| `parentSplatParameter` | `FASTPyTSplatParameterTarget` | `target` | `FASTPyTSplatParameter` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attribute` | `FASTPyAttributeAccess` | `attributeOwner` | `FASTPyIdentifier` | The variable been accessed|
| `object` | `FASTPyAttributeAccess` | `attributeObjectOwner` | `FASTPyExpression` | I am the receiver of the attribute. I can be multiple things such as a variable, a call, another attribute access, a primitive type, a subscript...|



"
Class {
	#name : 'FASTPyAttributeAccess',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTAsPatternTarget + FASTPyTReturnReferenceable + FASTPyTSplatParameterTarget',
	#classTraits : 'FASTPyTAsPatternTarget classTrait + FASTPyTReturnReferenceable classTrait + FASTPyTSplatParameterTarget classTrait',
	#instVars : [
		'#attribute => FMOne type: #FASTPyIdentifier opposite: #attributeOwner',
		'#object => FMOne type: #FASTPyExpression opposite: #attributeObjectOwner'
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
FASTPyAttributeAccess >> attribute [
	"Relation named: #attribute type: #FASTPyIdentifier opposite: #attributeOwner"

	<generated>
	<FMComment: 'The variable been accessed'>
	^ attribute
]

{ #category : 'accessing' }
FASTPyAttributeAccess >> attribute: anObject [

	<generated>
	attribute := anObject
]

{ #category : 'navigation' }
FASTPyAttributeAccess >> attributeGroup [
	<generated>
	<navigation: 'Attribute'>
	^ MooseSpecializedGroup with: self attribute
]

{ #category : 'accessing' }
FASTPyAttributeAccess >> object [
	"Relation named: #object type: #FASTPyExpression opposite: #attributeObjectOwner"

	<generated>
	<FMComment: 'I am the receiver of the attribute. I can be multiple things such as a variable, a call, another attribute access, a primitive type, a subscript...'>
	^ object
]

{ #category : 'accessing' }
FASTPyAttributeAccess >> object: anObject [

	<generated>
	object := anObject
]

{ #category : 'navigation' }
FASTPyAttributeAccess >> objectGroup [
	<generated>
	<navigation: 'Object'>
	^ MooseSpecializedGroup with: self object
]
