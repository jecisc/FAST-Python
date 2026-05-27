Class {
	#name : 'FASTCFGAbstractBlock',
	#superclass : 'Object',
	#instVars : [
		'statements',
		'previousBlocks'
	],
	#category : 'FAST-Python-Tools-CFG/DataFlow',
	#package : 'FAST-Python-Tools',
	#tag : 'CFG/DataFlow'
}

{ #category : 'adding' }
FASTCFGAbstractBlock >> addNextBlock: aBlock [

	^ self subclassResponsibility
]

{ #category : 'adding' }
FASTCFGAbstractBlock >> addPreviousBlock: aBlock [

	(self previousBlocks includes: aBlock) ifFalse: [ self previousBlocks add: aBlock ]
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> firstStatement [

	^ self statements first
]

{ #category : 'initialization' }
FASTCFGAbstractBlock >> initialize [

	super initialize.
	previousBlocks := OrderedCollection new
]

{ #category : 'inspector' }
FASTCFGAbstractBlock >> inspectionVisualization: aBuilder [

	<inspectorPresentationOrder: 3 title: 'Visu'>
	^ (aBuilder instantiate: SpRoassalInspectorPresenter)
		  canvas: (FASTCFGVisualizationBuilder on: self);
		  yourself
]

{ #category : 'inspector' }
FASTCFGAbstractBlock >> inspectionVisualizationContext: aContext [

	aContext active: self isStart
]

{ #category : 'testing' }
FASTCFGAbstractBlock >> isConditional [

	^ false
]

{ #category : 'testing' }
FASTCFGAbstractBlock >> isFinal [

	^ self nextBlocks isEmpty
]

{ #category : 'testing' }
FASTCFGAbstractBlock >> isNullBlock [

	^ false
]

{ #category : 'testing' }
FASTCFGAbstractBlock >> isStart [

	^ self previousBlocks isEmpty
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> lastStatement [

	^ self statements last
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> nextBlocks [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> previousBlocks [
	^ previousBlocks
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> statements [
	^ statements
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> statements: anObject [
	statements := anObject
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> withAllFollowingBlocks [

	^ self withDeep: #nextBlocks collect: #yourself
]
