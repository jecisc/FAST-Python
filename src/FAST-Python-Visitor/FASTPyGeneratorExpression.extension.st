Extension { #name : 'FASTPyGeneratorExpression' }

{ #category : '*FAST-Python-Visitor' }
FASTPyGeneratorExpression >> accept: aVisitor [

	<generated>
	^ aVisitor visitFASTPyGeneratorExpression: self
]
