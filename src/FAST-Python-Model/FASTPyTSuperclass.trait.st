"
My users are expressions that can define a superclass in a class declaration.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentClassSuperclass` | `FASTPyTSuperclass` | `superclasses` | `FASTPyClassDefinition` | |



"
Trait {
	#name : 'FASTPyTSuperclass',
	#instVars : [
		'#parentClassSuperclass => FMOne type: #FASTPyClassDefinition opposite: #superclasses'
	],
	#category : 'FAST-Python-Model-Traits',
	#package : 'FAST-Python-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTPyTSuperclass classSide >> annotation [

	<FMClass: #TSuperclass super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyTSuperclass >> parentClassSuperclass [
	"Relation named: #parentClassSuperclass type: #FASTPyClassDefinition opposite: #superclasses"

	<generated>
	<container>
	^ parentClassSuperclass
]

{ #category : 'accessing' }
FASTPyTSuperclass >> parentClassSuperclass: anObject [

	<generated>
	parentClassSuperclass := anObject
]

{ #category : 'navigation' }
FASTPyTSuperclass >> parentClassSuperclassGroup [
	<generated>
	<navigation: 'ParentClassSuperclass'>
	^ MooseSpecializedGroup with: self parentClassSuperclass
]
