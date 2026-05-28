Trait {
	#name : 'FASTTCFGUtility',
	#instVars : [
		'basicBlocks',
		'currentStatements',
		'currentConditionals'
	],
	#category : 'FAST-Python-Tools-CFG/DataFlow',
	#package : 'FAST-Python-Tools',
	#tag : 'CFG/DataFlow'
}

{ #category : 'instance creation' }
FASTTCFGUtility classSide >> buildCFGOf: aFASTEntity [

	^ self new buildCFGForModel: aFASTEntity
]

{ #category : 'running' }
FASTTCFGUtility >> addStatement: aStatement [

	^ self currentStatements add: aStatement
]

{ #category : 'accessing' }
FASTTCFGUtility >> basicBlocks [
	^ basicBlocks
]

{ #category : 'running' }
FASTTCFGUtility >> buildAndUseConditionalBlockDuring: aBlock [

	| conditional |
	[
		conditional := self buildBlockOfType: FASTCFGConditionalBlock.
		currentConditionals push: conditional.

		aBlock value ] ensure: [
			self assert: conditional == currentConditionals top description: 'The top conditional does not match the one produced before the execution of the block'.
			currentConditionals pop ]
]

{ #category : 'running' }
FASTTCFGUtility >> buildBlockIfNeeded [
	"If we have statements stocked, we create a new block with them. Else we do nothing."

	self currentStatements ifEmpty: [ ^ self ].
	self buildBlockOfType: FASTCFGBlock
]

{ #category : 'running' }
FASTTCFGUtility >> buildBlockOfType: aBlockClass [

	| newBlock |
	newBlock := aBlockClass new.
	newBlock statements: self currentStatements.
	currentStatements := OrderedCollection new.

	self managePreviousBlocksOf: newBlock.

	basicBlocks add: newBlock.

	^ newBlock
]

{ #category : 'running' }
FASTTCFGUtility >> buildCFGForModel: aFASTModel [

	aFASTModel accept: self.
	self shouldBuildNullBlock ifTrue: [ self buildBlockOfType: FASTCFGNullBlock ].

	^ self basicBlocks detect: [ :block | block isStart ]
]

{ #category : 'accessing' }
FASTTCFGUtility >> currentStatements [
	^ currentStatements
]

{ #category : 'initialization' }
FASTTCFGUtility >> initializeCFG [

	currentConditionals := Stack new.
	basicBlocks := OrderedCollection new.
	currentStatements := OrderedCollection new
]

{ #category : 'running' }
FASTTCFGUtility >> managePreviousBlocksOf: newBlock [
	"If we are in a conditional, we add ourself there. Else we add ourself in all non finished conditionals and to their ."

	currentConditionals
		ifEmpty: [
				self basicBlocks
					reject: #isFull
					thenDo: [ :block | block addNextBlock: newBlock ] ]
		ifNotEmpty: [ currentConditionals top addNextBlock: newBlock ]
]

{ #category : 'asserting' }
FASTTCFGUtility >> shouldBuildNullBlock [
	"We build a null block if we have an unfinished conditional or more than one final block."

	(self basicBlocks select: [ :block | block isConditional and: [ block isFull not ] ]) ifNotEmpty: [ ^ true ].

	^ (self basicBlocks reject: #isFinal) size = 1
]
