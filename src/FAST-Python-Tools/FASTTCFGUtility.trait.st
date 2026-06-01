Trait {
	#name : 'FASTTCFGUtility',
	#instVars : [
		'startBlock',
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
FASTTCFGUtility >> allBlocks [

	startBlock ifNil: [ ^ Array empty ].

	^ startBlock withAllFollowingBlocks
]

{ #category : 'running' }
FASTTCFGUtility >> buildAndUseConditionalDuring: aBlock [

	| conditional |
	[
		conditional := self buildBlockOfType: FASTCFGConditionalBlock.
		currentConditionals push: conditional.

		aBlock value ] ensure: [
			self assert: conditional == currentConditionals top description: 'The top conditional does not match the one produced before the execution of the block'.
			^ currentConditionals pop ]
]

{ #category : 'running' }
FASTTCFGUtility >> buildAndUseLoopDuring: aBlock [
	"For loops, we do an extra step compared to conditionals in order to build the loops if needed."

	self finializeLoop: (self buildAndUseConditionalDuring: aBlock)
]

{ #category : 'running' }
FASTTCFGUtility >> buildBlockIfNeeded [
	"If we have statements stocked, we create a new block with them. Else we do nothing."

	self currentStatements ifEmpty: [ ^ self ].
	^ self buildBlockOfType: FASTCFGBlock
]

{ #category : 'running' }
FASTTCFGUtility >> buildBlockOfType: aBlockClass [

	| newBlock |
	newBlock := aBlockClass new.
	newBlock statements: self currentStatements.
	currentStatements := OrderedCollection new.

	self managePreviousBlocksOf: newBlock.

	startBlock ifNil: [
			startBlock := newBlock.
			newBlock isStart: true ].

	^ newBlock
]

{ #category : 'running' }
FASTTCFGUtility >> buildCFGForModel: aFASTModel [

	aFASTModel accept: self.
	self shouldBuildNullBlock ifTrue: [ self buildBlockOfType: FASTCFGNullBlock ].

	^ startBlock
]

{ #category : 'accessing' }
FASTTCFGUtility >> currentStatements [
	^ currentStatements
]

{ #category : 'running' }
FASTTCFGUtility >> finializeLoop: loop [
	"When we close a loop, we check all blocks that are not full and that do not end with a break to create the loop."

	loop allFollowingBlocks
		reject: [ :block | block isFull or: [ block endsWithBreakStatement ] ]
		thenDo: [ :block | block addNextBlock: loop ]
]

{ #category : 'initialization' }
FASTTCFGUtility >> initializeCFG [

	currentConditionals := Stack new.
	currentStatements := OrderedCollection new
]

{ #category : 'running' }
FASTTCFGUtility >> managePreviousBlocksOf: newBlock [
	"If we are in a conditional, we add ourself there. Else we add ourself in all non finished conditionals and to their ."

	currentConditionals
		ifEmpty: [
				self allBlocks
					reject: #isFull
					thenDo: [ :block | block addNextBlock: newBlock ] ]
		ifNotEmpty: [ currentConditionals top addNextBlock: newBlock ]
]

{ #category : 'asserting' }
FASTTCFGUtility >> shouldBuildNullBlock [
	"We build a null block if we have an unfinished conditional or more than one final block."

	(self allBlocks select: [ :block | block isConditional and: [ block isFull not ] ]) ifNotEmpty: [ ^ true ].

	^ (self allBlocks reject: #isFinal) size = 1
]
