"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentAsPatternSource` | `FASTPyTAsPatternSource` | `source` | `FASTPyAsPattern` | |
| `parentAsPatternTarget` | `FASTPyTAsPatternTarget` | `target` | `FASTPyAsPattern` | |
| `parentAssignmentLeft` | `FASTPyTAssignable` | `left` | `FASTPyAssignment` | |



"
Class {
	#name : 'FASTPyTuple',
	#superclass : 'FASTPyCollectionInitializer',
	#traits : 'FASTPyTAsPatternTarget + FASTPyTAssignable',
	#classTraits : 'FASTPyTAsPatternTarget classTrait + FASTPyTAssignable classTrait',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyTuple class >> annotation [

	<FMClass: #Tuple super: #FASTPyCollectionInitializer>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]
