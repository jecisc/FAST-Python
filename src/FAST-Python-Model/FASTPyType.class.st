"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentAssignment` | `FASTPyType` | `type` | `FASTPyAssignment` | |
| `parentContrainedType` | `FASTPyType` | `type` | `FASTPyConstrainedType` | |
| `parentContrainedTypeBound` | `FASTPyType` | `bound` | `FASTPyConstrainedType` | |
| `parentFunctionDefinition` | `FASTPyType` | `returnType` | `FASTPyFunctionDefinition` | |
| `parentParameter` | `FASTPyType` | `type` | `FASTPyParameter` | |
| `parentWithTypeParameters` | `FASTPyType` | `typeParameters` | `FASTPyTWithTypeParameters` | |
| `parentyTypeAliasStatementAlias` | `FASTPyType` | `left` | `FASTPyTypeAliasStatement` | |
| `parentyTypeAliasStatementType` | `FASTPyType` | `right` | `FASTPyTypeAliasStatement` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `content` | `FASTPyType` | `parentType` | `FASTPyTTypeContent` | |



"
Class {
	#name : 'FASTPyType',
	#superclass : 'FASTPyEntity',
	#instVars : [
		'#content => FMOne type: #FASTPyTTypeContent opposite: #parentType',
		'#parentAssignment => FMOne type: #FASTPyAssignment opposite: #type',
		'#parentContrainedType => FMOne type: #FASTPyConstrainedType opposite: #type',
		'#parentContrainedTypeBound => FMOne type: #FASTPyConstrainedType opposite: #bound',
		'#parentFunctionDefinition => FMOne type: #FASTPyFunctionDefinition opposite: #returnType',
		'#parentParameter => FMOne type: #FASTPyParameter opposite: #type',
		'#parentWithTypeParameters => FMOne type: #FASTPyTWithTypeParameters opposite: #typeParameters',
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
FASTPyType >> content [
	"Relation named: #content type: #FASTPyTTypeContent opposite: #parentType"

	<generated>
	^ content
]

{ #category : 'accessing' }
FASTPyType >> content: anObject [

	<generated>
	content := anObject
]

{ #category : 'navigation' }
FASTPyType >> contentGroup [
	<generated>
	<navigation: 'Content'>
	^ MooseSpecializedGroup with: self content
]

{ #category : 'accessing' }
FASTPyType >> parentAssignment [
	"Relation named: #parentAssignment type: #FASTPyAssignment opposite: #type"

	<generated>
	<container>
	<derived>
	^ parentAssignment
]

{ #category : 'accessing' }
FASTPyType >> parentAssignment: anObject [

	<generated>
	parentAssignment := anObject
]

{ #category : 'navigation' }
FASTPyType >> parentAssignmentGroup [
	<generated>
	<navigation: 'ParentAssignment'>
	^ MooseSpecializedGroup with: self parentAssignment
]

{ #category : 'accessing' }
FASTPyType >> parentContrainedType [
	"Relation named: #parentContrainedType type: #FASTPyConstrainedType opposite: #type"

	<generated>
	<container>
	<derived>
	^ parentContrainedType
]

{ #category : 'accessing' }
FASTPyType >> parentContrainedType: anObject [

	<generated>
	parentContrainedType := anObject
]

{ #category : 'accessing' }
FASTPyType >> parentContrainedTypeBound [
	"Relation named: #parentContrainedTypeBound type: #FASTPyConstrainedType opposite: #bound"

	<generated>
	<container>
	<derived>
	^ parentContrainedTypeBound
]

{ #category : 'accessing' }
FASTPyType >> parentContrainedTypeBound: anObject [

	<generated>
	parentContrainedTypeBound := anObject
]

{ #category : 'navigation' }
FASTPyType >> parentContrainedTypeBoundGroup [
	<generated>
	<navigation: 'ParentContrainedTypeBound'>
	^ MooseSpecializedGroup with: self parentContrainedTypeBound
]

{ #category : 'navigation' }
FASTPyType >> parentContrainedTypeGroup [
	<generated>
	<navigation: 'ParentContrainedType'>
	^ MooseSpecializedGroup with: self parentContrainedType
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
FASTPyType >> parentParameter [
	"Relation named: #parentParameter type: #FASTPyParameter opposite: #type"

	<generated>
	<container>
	<derived>
	^ parentParameter
]

{ #category : 'accessing' }
FASTPyType >> parentParameter: anObject [

	<generated>
	parentParameter := anObject
]

{ #category : 'navigation' }
FASTPyType >> parentParameterGroup [
	<generated>
	<navigation: 'ParentParameter'>
	^ MooseSpecializedGroup with: self parentParameter
]

{ #category : 'accessing' }
FASTPyType >> parentWithTypeParameters [
	"Relation named: #parentWithTypeParameters type: #FASTPyTWithTypeParameters opposite: #typeParameters"

	<generated>
	<container>
	^ parentWithTypeParameters
]

{ #category : 'accessing' }
FASTPyType >> parentWithTypeParameters: anObject [

	<generated>
	parentWithTypeParameters := anObject
]

{ #category : 'navigation' }
FASTPyType >> parentWithTypeParametersGroup [
	<generated>
	<navigation: 'ParentWithTypeParameters'>
	^ MooseSpecializedGroup with: self parentWithTypeParameters
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
