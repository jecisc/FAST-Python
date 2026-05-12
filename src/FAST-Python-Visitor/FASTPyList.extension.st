Extension { #name : 'FASTPyList' }

{ #category : '*FAST-Python-Visitor' }
FASTPyList >> accept: aVisitor [

	<generated>
	^ aVisitor visitFASTPyList: self
]
