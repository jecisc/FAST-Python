Class {
	#name : 'FASTCFGLoopConditionalBlock',
	#superclass : 'FASTCFGConditionalBlock',
	#category : 'FAST-Python-Tools-CFG/DataFlow',
	#package : 'FAST-Python-Tools',
	#tag : 'CFG/DataFlow'
}

{ #category : 'adding' }
FASTCFGLoopConditionalBlock >> addNextBlock: aBlock [

	| nextBlock |
	nextBlock := super addNextBlock: aBlock.

	"In a loop, by default my first node loop to myself. There is an edge case when the first statement is a break, but this will be managed elsewhere."
	(self nextBlocks indexOf: nextBlock) = 1 ifTrue: [ nextBlock addNextBlock: self ].

	^ nextBlock
]
