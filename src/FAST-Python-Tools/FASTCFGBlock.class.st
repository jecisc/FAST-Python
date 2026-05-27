Class {
	#name : 'FASTCFGBlock',
	#superclass : 'FASTCFGAbstractBlock',
	#instVars : [
		'nextBlock'
	],
	#category : 'FAST-Python-Tools-CFG/DataFlow',
	#package : 'FAST-Python-Tools',
	#tag : 'CFG/DataFlow'
}

{ #category : 'adding' }
FASTCFGBlock >> addNextBlock: aBlock [

	self nextBlock ifNotNil: [ self error: 'This basic block already has a next block and cannot have multiple.' ].
	aBlock addPreviousBlock: self.
	^ self nextBlock: aBlock
]

{ #category : 'testing' }
FASTCFGBlock >> isFull [

	^ self nextBlock isNotNil
]

{ #category : 'accessing' }
FASTCFGBlock >> nextBlock [
	^ nextBlock
]

{ #category : 'accessing' }
FASTCFGBlock >> nextBlock: anObject [
	nextBlock := anObject
]

{ #category : 'accessing' }
FASTCFGBlock >> nextBlockForValues [

	^{ #next -> self nextBlock }
]

{ #category : 'accessing' }
FASTCFGBlock >> nextBlocks [

	^ self nextBlock
		  ifNil: [ Array empty ]
		  ifNotNil: [ { self nextBlock } ]
]
