"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentFunctionDefinition` | `FASTPyType` | `returnType` | `FASTPyFunctionDefinition` | |
| `parentyTypeAliasStatementAlias` | `FASTPyType` | `left` | `FASTPyTypeAliasStatement` | |
| `parentyTypeAliasStatementType` | `FASTPyType` | `right` | `FASTPyTypeAliasStatement` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTPyType` | `parentType` | `FASTPyExpression` | |



"
Class {
	#name : 'FASTPyType',
	#superclass : 'FASTPyEntity',
	#instVars : [
		'#expression => FMOne type: #FASTPyExpression opposite: #parentType',
		'#parentFunctionDefinition => FMOne type: #FASTPyFunctionDefinition opposite: #returnType',
		'#parentyTypeAliasStatementAlias => FMOne type: #FASTPyTypeAliasStatement opposite: #left',
		'#parentyTypeAliasStatementType => FMOne type: #FASTPyTypeAliasStatement opposite: #right'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyType class >> annotation [

	<FMClass: #Type super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyType >> expression [
	"Relation named: #expression type: #FASTPyExpression opposite: #parentType"

	<generated>
	^ expression
]

{ #category : 'accessing' }
FASTPyType >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : 'navigation' }
FASTPyType >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : 'accessing' }
FASTPyType >> parentFunctionDefinition [
	"Relation named: #parentFunctionDefinition type: #FASTPyFunctionDefinition opposite: #returnType"

	<generated>
	<container>
	<derived>
	^ parentFunctionDefinition
]

{ #category : 'accessing' }
FASTPyType >> parentFunctionDefinition: anObject [

	<generated>
	parentFunctionDefinition := anObject
]

{ #category : 'navigation' }
FASTPyType >> parentFunctionDefinitionGroup [
	<generated>
	<navigation: 'ParentFunctionDefinition'>
	^ MooseSpecializedGroup with: self parentFunctionDefinition
]

{ #category : 'accessing' }
FASTPyType >> parentyTypeAliasStatementAlias [
	"Relation named: #parentyTypeAliasStatementAlias type: #FASTPyTypeAliasStatement opposite: #left"

	<generated>
	<container>
	<derived>
	^ parentyTypeAliasStatementAlias
]

{ #category : 'accessing' }
FASTPyType >> parentyTypeAliasStatementAlias: anObject [

	<generated>
	parentyTypeAliasStatementAlias := anObject
]

{ #category : 'navigation' }
FASTPyType >> parentyTypeAliasStatementAliasGroup [
	<generated>
	<navigation: 'ParentyTypeAliasStatementAlias'>
	^ MooseSpecializedGroup with: self parentyTypeAliasStatementAlias
]

{ #category : 'accessing' }
FASTPyType >> parentyTypeAliasStatementType [
	"Relation named: #parentyTypeAliasStatementType type: #FASTPyTypeAliasStatement opposite: #right"

	<generated>
	<container>
	<derived>
	^ parentyTypeAliasStatementType
]

{ #category : 'accessing' }
FASTPyType >> parentyTypeAliasStatementType: anObject [

	<generated>
	parentyTypeAliasStatementType := anObject
]

{ #category : 'navigation' }
FASTPyType >> parentyTypeAliasStatementTypeGroup [
	<generated>
	<navigation: 'ParentyTypeAliasStatementType'>
	^ MooseSpecializedGroup with: self parentyTypeAliasStatementType
]
