"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `definitionOwner` | `FASTPyDecorator` | `decorators` | `FASTPyTDefinition` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTPyDecorator` | `decoratorOwner` | `FASTPyExpression` | |



"
Class {
	#name : 'FASTPyDecorator',
	#superclass : 'FASTPyEntity',
	#instVars : [
		'#definitionOwner => FMOne type: #FASTPyTDefinition opposite: #decorators',
		'#expression => FMOne type: #FASTPyExpression opposite: #decoratorOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyDecorator class >> annotation [

	<FMClass: #Decorator super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyDecorator >> definitionOwner [
	"Relation named: #definitionOwner type: #FASTPyTDefinition opposite: #decorators"

	<generated>
	<container>
	^ definitionOwner
]

{ #category : 'accessing' }
FASTPyDecorator >> definitionOwner: anObject [

	<generated>
	definitionOwner := anObject
]

{ #category : 'navigation' }
FASTPyDecorator >> definitionOwnerGroup [
	<generated>
	<navigation: 'DefinitionOwner'>
	^ MooseSpecializedGroup with: self definitionOwner
]

{ #category : 'accessing' }
FASTPyDecorator >> expression [
	"Relation named: #expression type: #FASTPyExpression opposite: #decoratorOwner"

	<generated>
	^ expression
]

{ #category : 'accessing' }
FASTPyDecorator >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : 'navigation' }
FASTPyDecorator >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
