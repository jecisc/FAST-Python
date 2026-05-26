Extension { #name : 'FASTConditionalBasicBlock' }

{ #category : '*FAST-Python-Tools' }
FASTConditionalBasicBlock >> nextFalseBlock [

	self flag: #todo. "This should move to FAST."
	^ self nextBlockForValue: false
]

{ #category : '*FAST-Python-Tools' }
FASTConditionalBasicBlock >> nextTrueBlock [

	self flag: #todo. "This should move to FAST."
	^ self nextBlockForValue: true
]
