Extension { #name : 'FASTPyEntity' }

{ #category : '*FAST-Python-Visitor' }
FASTPyEntity >> accept: aVisitor [

	<generated>
	^ aVisitor visitFASTPyEntity: self
]
