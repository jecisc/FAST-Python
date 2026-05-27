Extension { #name : 'FASTAbstractBasicBlock' }

{ #category : '*FAST-Python-Tools' }
FASTAbstractBasicBlock >> isExit [

	self flag: #todo. "I implemented this because #isFinal is currently not right. This should be removed once we fix the FAST CFG model."
	^ self nextBlocks isEmpty
]

{ #category : '*FAST-Python-Tools' }
FASTAbstractBasicBlock >> withAllFollowingBlocks [

	^ self withDeep: #nextBlocks collect: #yourself
]
