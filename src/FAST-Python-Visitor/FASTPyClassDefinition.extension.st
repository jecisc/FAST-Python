Extension { #name : 'FASTPyClassDefinition' }

{ #category : '*FAST-Python-Visitor' }
FASTPyClassDefinition >> accept: aVisitor [

	<generated>
	^ aVisitor visitFASTPyClassDefinition: self
]
