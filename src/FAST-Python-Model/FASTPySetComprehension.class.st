"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentSplat` | `FASTPyTCanBeSplatExpression` | `expression` | `FASTPyCollectionSplat` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `body` | `FASTPyTComprehension` | `comprehensionBodyOwner` | `FASTPyExpression` | |
| `clauses` | `FASTPyTComprehension` | `comprehensionClauseOwner` | `FASTPyExpression` | |



"
Class {
	#name : 'FASTPySetComprehension',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTPyTComprehension',
	#classTraits : 'FASTPyTComprehension classTrait',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPySetComprehension class >> annotation [

	<FMClass: #SetComprehension super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]
