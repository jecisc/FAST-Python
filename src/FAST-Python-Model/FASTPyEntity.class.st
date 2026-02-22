"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `genericParent` | `FASTPyEntity` | `genericChildren` | `FASTPyEntity` | |
| `parentConditionalStatement` | `FASTTExpression` | `condition` | `FASTTConditionalStatement` | Optional condition statement where this expression is used|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericChildren` | `FASTPyEntity` | `genericParent` | `FASTPyEntity` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyEntity',
	#superclass : 'MooseEntity',
	#traits : 'FASTTEntity + FASTTExpression',
	#classTraits : 'FASTTEntity classTrait + FASTTExpression classTrait',
	#instVars : [
		'#genericChildren => FMMany type: #FASTPyEntity opposite: #genericParent',
		'#genericParent => FMOne type: #FASTPyEntity opposite: #genericChildren'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FASTPyEntity class >> isAbstract [

	<generated>
	^ self == FASTPyEntity
]

{ #category : 'meta' }
FASTPyEntity class >> metamodel [

	<generated>
	^ FASTPyModel metamodel
]

{ #category : 'adding' }
FASTPyEntity >> addGenericChildren: anObject [
	<generated>
	^ self genericChildren add: anObject
]

{ #category : 'accessing' }
FASTPyEntity >> genericChildren [
	"Relation named: #genericChildren type: #FASTPyEntity opposite: #genericParent"

	<generated>
	<derived>
	^ genericChildren
]

{ #category : 'accessing' }
FASTPyEntity >> genericChildren: anObject [

	<generated>
	genericChildren value: anObject
]

{ #category : 'navigation' }
FASTPyEntity >> genericChildrenGroup [
	<generated>
	<navigation: 'GenericChildren'>
	^ MooseSpecializedGroup withAll: self genericChildren asSet
]

{ #category : 'accessing' }
FASTPyEntity >> genericParent [
	"Relation named: #genericParent type: #FASTPyEntity opposite: #genericChildren"

	<generated>
	<container>
	^ genericParent
]

{ #category : 'accessing' }
FASTPyEntity >> genericParent: anObject [

	<generated>
	genericParent := anObject
]

{ #category : 'navigation' }
FASTPyEntity >> genericParentGroup [
	<generated>
	<navigation: 'GenericParent'>
	^ MooseSpecializedGroup with: self genericParent
]

{ #category : 'testing' }
FASTPyEntity >> isBehaviouralEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPyEntity >> isBinaryExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPyEntity >> isBooleanLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPyEntity >> isClassDefinition [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPyEntity >> isLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPyEntity >> isQueryable [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPyEntity >> isScopableEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPyEntity >> isStringLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPyEntity >> isVariableEntity [

	<generated>
	^ false
]
