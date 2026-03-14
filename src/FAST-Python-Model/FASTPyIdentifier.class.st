"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attributeOwner` | `FASTPyIdentifier` | `attribute` | `FASTPyAttributeAccess` | The attribute access accessing me (if it's the case)|
| `parentAsPatternSource` | `FASTPyTAsPatternSource` | `source` | `FASTPyAsPattern` | |
| `parentAsPatternTarget` | `FASTPyTAsPatternTarget` | `target` | `FASTPyAsPattern` | |
| `parentAssignmentLeft` | `FASTPyTAssignable` | `left` | `FASTPyAssignment` | |
| `parentDeclarator` | `FASTPyTDecoratorExpression` | `expression` | `FASTPyDecorator` | |
| `parentRaiseStatement` | `FASTPyTRaised` | `exception` | `FASTPyRaiseStatement` | |
| `parentSplat` | `FASTPyTSplatExpression` | `expression` | `FASTPyCollectionSplat` | |
| `parentSplatParameter` | `FASTPyTSplatParameterTarget` | `target` | `FASTPyTSplatParameter` | |



"
Class {
	#name : 'FASTPyIdentifier',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTAsPatternTarget + FASTPyTReturnReferenceable + FASTPyTSplatParameterTarget',
	#classTraits : 'FASTPyTAsPatternTarget classTrait + FASTPyTReturnReferenceable classTrait + FASTPyTSplatParameterTarget classTrait',
	#instVars : [
		'#attributeOwner => FMOne type: #FASTPyAttributeAccess opposite: #attribute'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyIdentifier class >> annotation [

	<FMClass: #Identifier super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyIdentifier >> attributeOwner [
	"Relation named: #attributeOwner type: #FASTPyAttributeAccess opposite: #attribute"

	<generated>
	<FMComment: 'The attribute access accessing me (if it''s the case)'>
	<container>
	<derived>
	^ attributeOwner
]

{ #category : 'accessing' }
FASTPyIdentifier >> attributeOwner: anObject [

	<generated>
	attributeOwner := anObject
]

{ #category : 'navigation' }
FASTPyIdentifier >> attributeOwnerGroup [
	<generated>
	<navigation: 'AttributeOwner'>
	^ MooseSpecializedGroup with: self attributeOwner
]
