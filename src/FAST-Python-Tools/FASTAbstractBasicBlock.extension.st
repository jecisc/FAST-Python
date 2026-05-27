Extension { #name : 'FASTAbstractBasicBlock' }

{ #category : '*FAST-Python-Tools' }
FASTAbstractBasicBlock >> inspectionVisualization: aBuilder [

	<inspectorPresentationOrder: 3 title: 'Visu'>
	^ (aBuilder instantiate: SpRoassalInspectorPresenter)
		  canvas: (FASTCFGVisualizationBuilder on: self);
		  yourself
]

{ #category : '*FAST-Python-Tools' }
FASTAbstractBasicBlock >> inspectionVisualizationContext: aContext [

	aContext active: self isStart
]

{ #category : '*FAST-Python-Tools' }
FASTAbstractBasicBlock >> isExit [

	self flag: #todo. "I implemented this because #isFinal is currently not right. This should be removed once we fix the FAST CFG model."
	^ self nextBlocks isEmpty
]

{ #category : '*FAST-Python-Tools' }
FASTAbstractBasicBlock >> withAllFollowingBlocks [

	^ self withDeep: #nextBlocks collect: #yourself
]
