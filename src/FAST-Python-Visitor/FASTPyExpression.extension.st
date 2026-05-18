Extension { #name : 'FASTPyExpression' }

{ #category : '*FAST-Python-Visitor' }
FASTPyExpression >> accept: aVisitor [

	<generated>
	^ aVisitor visitFASTPyExpression: self
]
