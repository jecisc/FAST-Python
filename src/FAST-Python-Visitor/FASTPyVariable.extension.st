Extension { #name : 'FASTPyVariable' }

{ #category : '*FAST-Python-Visitor' }
FASTPyVariable >> accept: aVisitor [

	<generated>
	^ aVisitor visitFASTPyVariable: self
]
