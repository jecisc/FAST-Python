Extension { #name : 'FASTPyOperator' }

{ #category : '*FAST-Python-Visitor' }
FASTPyOperator >> accept: aVisitor [

	<generated>
	^ aVisitor visitFASTPyOperator: self
]
