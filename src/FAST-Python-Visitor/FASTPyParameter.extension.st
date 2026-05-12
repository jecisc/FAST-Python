Extension { #name : 'FASTPyParameter' }

{ #category : '*FAST-Python-Visitor' }
FASTPyParameter >> accept: aVisitor [

	<generated>
	^ aVisitor visitFASTPyParameter: self
]
