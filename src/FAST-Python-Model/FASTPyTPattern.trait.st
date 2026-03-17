"
I represent an entity that can be the pattern of a case clause in a match statement..

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentCaseClause` | `FASTPyTPattern` | `pattern` | `FASTPyCaseClause` | |
| `parentKeywordPatternValue` | `FASTPyTPattern` | `value` | `FASTPyKeywordPattern` | |
| `parentUnionPattern` | `FASTPyTPattern` | `members` | `FASTPyUnionPattern` | |



"
Trait {
	#name : 'FASTPyTPattern',
	#instVars : [
		'#parentCaseClause => FMOne type: #FASTPyCaseClause opposite: #pattern',
		'#parentKeywordPatternValue => FMOne type: #FASTPyKeywordPattern opposite: #value',
		'#parentUnionPattern => FMOne type: #FASTPyUnionPattern opposite: #members'
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

{ #category : 'accessing' }
FASTPyTPattern >> parentKeywordPatternValue [
	"Relation named: #parentKeywordPatternValue type: #FASTPyKeywordPattern opposite: #value"

	<generated>
	<container>
	<derived>
	^ parentKeywordPatternValue
]

{ #category : 'accessing' }
FASTPyTPattern >> parentKeywordPatternValue: anObject [

	<generated>
	parentKeywordPatternValue := anObject
]

{ #category : 'navigation' }
FASTPyTPattern >> parentKeywordPatternValueGroup [
	<generated>
	<navigation: 'ParentKeywordPatternValue'>
	^ MooseSpecializedGroup with: self parentKeywordPatternValue
]

{ #category : 'accessing' }
FASTPyTPattern >> parentUnionPattern [
	"Relation named: #parentUnionPattern type: #FASTPyUnionPattern opposite: #members"

	<generated>
	<container>
	^ parentUnionPattern
]

{ #category : 'accessing' }
FASTPyTPattern >> parentUnionPattern: anObject [

	<generated>
	parentUnionPattern := anObject
]

{ #category : 'navigation' }
FASTPyTPattern >> parentUnionPatternGroup [
	<generated>
	<navigation: 'ParentUnionPattern'>
	^ MooseSpecializedGroup with: self parentUnionPattern
]
