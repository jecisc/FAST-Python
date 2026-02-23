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

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> parentNotOperator [
	"Relation named: #parentNotOperator type: #FASTPyNotOperator opposite: #argument"

	<generated>
	<FMComment: 'Parent not operator in which I am.'>
	<container>
	<derived>
	<FMProperty: #parentNotOperator type: #FASTPyNotOperator opposite: #argument>
	<package: #'FAST-Python-Model'>
	^ self attributeAt: #parentNotOperator ifAbsent: [ nil ]
]

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> parentNotOperator: anObject [

	<generated>
	(self attributeAt: #parentNotOperator ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentNotOperator.
		self attributeAt: #parentNotOperator put: anObject.
		otherSide argument: nil ]
	ifNotNil: [ 
		self attributeAt: #parentNotOperator put: anObject.
		anObject argument: self ]
]
