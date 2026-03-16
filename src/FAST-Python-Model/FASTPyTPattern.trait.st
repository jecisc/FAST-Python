"
I represent an entity that can be the pattern of a case clause in a match statement..

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentCaseClause` | `FASTPyTPattern` | `pattern` | `FASTPyCaseClause` | |



"
Trait {
	#name : 'FASTPyTPattern',
	#instVars : [
		'#parentCaseClause => FMOne type: #FASTPyCaseClause opposite: #pattern'
	],
	#category : 'FAST-Python-Model-Traits',
	#package : 'FAST-Python-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTPyTPattern classSide >> annotation [

	<FMClass: #TPattern super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyTPattern >> parentCaseClause [
	"Relation named: #parentCaseClause type: #FASTPyCaseClause opposite: #pattern"

	<generated>
	<container>
	<derived>
	^ parentCaseClause
]

{ #category : 'accessing' }
FASTPyTPattern >> parentCaseClause: anObject [

	<generated>
	parentCaseClause := anObject
]

{ #category : 'navigation' }
FASTPyTPattern >> parentCaseClauseGroup [
	<generated>
	<navigation: 'ParentCaseClause'>
	^ MooseSpecializedGroup with: self parentCaseClause
]
