"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentDeclarator` | `FASTPyTDecoratorExpression` | `expression` | `FASTPyDecorator` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attribute` | `FASTPyAttributeAccess` | `attributeOwner` | `FASTPyVariable` | The variable been accessed|
| `object` | `FASTPyAttributeAccess` | `attributeObjectOwner` | `FASTPyExpression` | I am the receiver of the attribute. I can be multiple things such as a variable, a call, another attribute access, a primitive type, a subscript...|



"
Class {
	#name : 'FASTPyAttributeAccess',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTDecoratorExpression',
	#classTraits : 'FASTPyTDecoratorExpression classTrait',
	#instVars : [
		'#attribute => FMOne type: #FASTPyVariable opposite: #attributeOwner',
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
	"Relation named: #attribute type: #FASTPyVariable opposite: #attributeOwner"

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
