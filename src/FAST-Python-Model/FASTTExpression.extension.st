Extension { #name : 'FASTTExpression' }

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> parentComparisonOperator [
	"Relation named: #parentComparisonOperator type: #FASTPyComparisonOperator opposite: #operands"

	<generated>
	<FMComment: 'Parent comparison expression of which I am.'>
	<container>
	<FMProperty: #parentComparisonOperator type: #FASTPyComparisonOperator opposite: #operands>
	<package: #'FAST-Python-Model'>
	^ self attributeAt: #parentComparisonOperator ifAbsent: [ nil ]
]

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> parentComparisonOperator: anObject [

	<generated>
	self attributeAt: #parentComparisonOperator put: (FMMultivalueLink on: self update: #operands from: self parentComparisonOperator to: anObject).
]
