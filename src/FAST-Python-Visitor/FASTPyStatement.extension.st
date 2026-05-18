Extension { #name : 'FASTPyStatement' }

{ #category : '*FAST-Python-Visitor' }
FASTPyStatement >> accept: aVisitor [

	<generated>
	^ aVisitor visitFASTPyStatement: self
]
