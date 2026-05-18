Extension { #name : 'FASTPyGlobalStatement' }

{ #category : '*FAST-Python-Visitor' }
FASTPyGlobalStatement >> accept: aVisitor [

	<generated>
	^ aVisitor visitFASTPyGlobalStatement: self
]
