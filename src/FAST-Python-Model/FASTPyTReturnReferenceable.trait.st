"
Lot of relations in python points to references. And some nodes can return lot of those references such as call, subscript, tuple, attribute. I am here to group those dependences.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentAsPatternSource` | `FASTPyTAsPatternSource` | `source` | `FASTPyAsPattern` | |
| `parentAssignmentLeft` | `FASTPyTAssignable` | `left` | `FASTPyAssignment` | |
| `parentDeclarator` | `FASTPyTDecoratorExpression` | `expression` | `FASTPyDecorator` | |
| `parentRaiseStatement` | `FASTPyTRaised` | `exception` | `FASTPyRaiseStatement` | |
| `parentSplat` | `FASTPyTCanBeSplatExpression` | `expression` | `FASTPyCollectionSplat` | |



"
Trait {
	#name : 'FASTPyTReturnReferenceable',
	#traits : 'FASTPyTAsPatternSource + FASTPyTAssignable + FASTPyTCanBeSplatExpression + FASTPyTDecoratorExpression + FASTPyTRaised',
	#classTraits : 'FASTPyTAsPatternSource classTrait + FASTPyTAssignable classTrait + FASTPyTCanBeSplatExpression classTrait + FASTPyTDecoratorExpression classTrait + FASTPyTRaised classTrait',
	#category : 'FAST-Python-Model-Traits',
	#package : 'FAST-Python-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTPyTReturnReferenceable classSide >> annotation [

	<FMClass: #TReturnReferenceable super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]
