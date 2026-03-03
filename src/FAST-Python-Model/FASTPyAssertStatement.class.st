"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTPyAssertStatement` | `assertOwner` | `FASTPyExpression` | The expression asserted|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyAssertStatement',
	#superclass : 'FASTPyEntity',
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#expression => FMOne type: #FASTPyExpression opposite: #assertOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyAssertStatement class >> annotation [

	<FMClass: #AssertStatement super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyAssertStatement >> expression [
	"Relation named: #expression type: #FASTPyExpression opposite: #assertOwner"

	<generated>
	<FMComment: 'The expression asserted'>
	^ expression
]

{ #category : 'accessing' }
FASTPyAssertStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : 'navigation' }
FASTPyAssertStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
