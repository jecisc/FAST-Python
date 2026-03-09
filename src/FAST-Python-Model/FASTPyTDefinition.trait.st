"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `decorators` | `FASTPyTDefinition` | `definitionOwner` | `FASTPyDecorator` | |



"
Trait {
	#name : 'FASTPyTDefinition',
	#instVars : [
		'#decorators => FMMany type: #FASTPyDecorator opposite: #definitionOwner'
	],
	#category : 'FAST-Python-Model-Traits',
	#package : 'FAST-Python-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTPyTDefinition classSide >> annotation [

	<FMClass: #TDefinition super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyTDefinition >> addDecorator: anObject [
	<generated>
	^ self decorators add: anObject
]

{ #category : 'accessing' }
FASTPyTDefinition >> decorators [
	"Relation named: #decorators type: #FASTPyDecorator opposite: #definitionOwner"

	<generated>
	<derived>
	^ decorators
]

{ #category : 'accessing' }
FASTPyTDefinition >> decorators: anObject [

	<generated>
	decorators value: anObject
]

{ #category : 'navigation' }
FASTPyTDefinition >> decoratorsGroup [
	<generated>
	<navigation: 'Decorators'>
	^ MooseSpecializedGroup withAll: self decorators asSet
]
