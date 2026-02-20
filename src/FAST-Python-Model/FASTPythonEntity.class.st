"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericParent` | `FASTPythonEntity` | `genericChildren` | `FASTPythonEntity` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericChildren` | `FASTPythonEntity` | `genericParent` | `FASTPythonEntity` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPythonEntity',
	#superclass : 'MooseEntity',
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#instVars : [
		'#genericChildren => FMMany type: #FASTPythonEntity opposite: #genericParent',
		'#genericParent => FMOne type: #FASTPythonEntity opposite: #genericChildren'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPythonEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FASTPythonEntity class >> isAbstract [

	<generated>
	^ self == FASTPythonEntity
]

{ #category : 'meta' }
FASTPythonEntity class >> metamodel [

	<generated>
	^ FASTPythonModel metamodel
]

{ #category : 'adding' }
FASTPythonEntity >> addGenericChildren: anObject [
	<generated>
	^ self genericChildren add: anObject
]

{ #category : 'accessing' }
FASTPythonEntity >> genericChildren [
	"Relation named: #genericChildren type: #FASTPythonEntity opposite: #genericParent"

	<generated>
	<derived>
	^ genericChildren
]

{ #category : 'accessing' }
FASTPythonEntity >> genericChildren: anObject [

	<generated>
	genericChildren value: anObject
]

{ #category : 'navigation' }
FASTPythonEntity >> genericChildrenGroup [
	<generated>
	<navigation: 'GenericChildren'>
	^ MooseSpecializedGroup withAll: self genericChildren asSet
]

{ #category : 'accessing' }
FASTPythonEntity >> genericParent [
	"Relation named: #genericParent type: #FASTPythonEntity opposite: #genericChildren"

	<generated>
	<container>
	^ genericParent
]

{ #category : 'accessing' }
FASTPythonEntity >> genericParent: anObject [

	<generated>
	genericParent := anObject
]

{ #category : 'navigation' }
FASTPythonEntity >> genericParentGroup [
	<generated>
	<navigation: 'GenericParent'>
	^ MooseSpecializedGroup with: self genericParent
]

{ #category : 'testing' }
FASTPythonEntity >> isBehaviouralEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPythonEntity >> isClassDefinition [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPythonEntity >> isExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPythonEntity >> isLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPythonEntity >> isQueryable [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPythonEntity >> isScopableEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPythonEntity >> isStringLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTPythonEntity >> isVariableEntity [

	<generated>
	^ false
]
