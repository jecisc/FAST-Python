Class {
	#name : 'FASTPythonMetamodelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'entity',
		'_ERROR',
		'tEntity',
		'argumentList',
		'asPattern',
		'asPatternTarget',
		'assertStatement',
		'assignment',
		'attribute',
		'augmentedAssignment',
		'await',
		'binaryOperator',
		'block',
		'booleanOperator',
		'breakStatement',
		'call',
		'caseClause',
		'casePattern',
		'chevron',
		'classDefinition',
		'classPattern',
		'comment',
		'comparisonOperator',
		'complexPattern',
		'concatenatedString',
		'conditionalExpression',
		'constrainedType',
		'continueStatement',
		'decoratedDefinition',
		'decorator',
		'defaultParameter',
		'deleteStatement',
		'dictPattern',
		'dictionary',
		'dictionaryComprehension',
		'dictionarySplat',
		'dictionarySplatPattern',
		'dottedName',
		'elifClause',
		'ellipsis',
		'elseClause',
		'escapeInterpolation',
		'escapeSequence',
		'exceptClause',
		'execStatement',
		'expressionList',
		'finallyClause',
		'float',
		'forInClause',
		'forStatement',
		'formatExpression',
		'formatSpecifier',
		'functionDefinition',
		'generatorExpression',
		'genericType',
		'globalStatement',
		'identifier',
		'ifClause',
		'ifStatement',
		'importFromStatement',
		'importStatement',
		'integer',
		'interpolation',
		'keywordArgument',
		'keywordPattern',
		'keywordSeparator',
		'lambda',
		'lambdaParameters',
		'lineContinuation',
		'list',
		'listComprehension',
		'listPattern',
		'listSplat',
		'listSplatPattern',
		'matchStatement',
		'memberType',
		'module',
		'namedExpression',
		'none',
		'nonlocalStatement',
		'notOperator',
		'pair',
		'parameter',
		'parenthesizedExpression',
		'parenthesizedListSplat',
		'passStatement',
		'patternList',
		'positionalSeparator',
		'printStatement',
		'raiseStatement',
		'returnStatement',
		'set',
		'setComprehension',
		'slice',
		'splatPattern',
		'splatType',
		'string',
		'subscript',
		'tryStatement',
		'tuple',
		'tupleExpression',
		'tuplePattern',
		'type',
		'typeAliasStatement',
		'typeConversion',
		'typeParameter',
		'typedDefaultParameter',
		'typedParameter',
		'unaryOperator',
		'unionPattern',
		'unionType',
		'whileStatement',
		'withClause',
		'withItem',
		'withStatement',
		'yield',
		'tComment',
		'tNamedBehaviouralEntity',
		'tNamedEntity',
		'tVariableEntity',
		'methodDefinition',
		'boolean',
		'tStringLiteral',
		'tBooleanLiteral',
		'literal',
		'tLiteral',
		'tExpression',
		'expression',
		'tBinaryExpression',
		'operator',
		'tUnaryOperator',
		'tAssignment',
		'variable',
		'structuralEntity',
		'import',
		'importedEntity',
		'fromModule',
		'tInvocation',
		'tStatementBlock',
		'tReturnStatement',
		'tStatement',
		'collectionInitializer'
	],
	#category : 'FAST-Python-Model-Generator',
	#package : 'FAST-Python-Model-Generator'
}

{ #category : 'accessing' }
FASTPythonMetamodelGenerator class >> packageName [

	^ #'FAST-Python-Model'
]

{ #category : 'accessing' }
FASTPythonMetamodelGenerator class >> prefix [

	^ #FASTPy
]

{ #category : 'accessing' }
FASTPythonMetamodelGenerator class >> submetamodels [

	^ { FASTMetamodelGenerator }
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineClasses [
	super defineClasses.
	entity := builder ensureClassNamed: #Entity.
	_ERROR := builder ensureClassNamed: #ERROR.
	argumentList := builder ensureClassNamed: #ArgumentList."Todo"
	asPattern := builder ensureClassNamed: #AsPattern."Todo"
	asPatternTarget := builder ensureClassNamed: #AsPatternTarget."Todo"
	assertStatement := builder ensureClassNamed: #AssertStatement."Todo"
	assignment := builder ensureClassNamed: #Assignment."To review"
	attribute := builder ensureClassNamed: #Attribute."To review"
	augmentedAssignment := builder ensureClassNamed: #AugmentedAssignment."Todo"
	await := builder ensureClassNamed: #Await."Todo"
	binaryOperator := builder ensureClassNamed: #BinaryOperator.
	block := builder ensureClassNamed: #Block."To review"
	boolean := builder ensureClassNamed: #Boolean.
	booleanOperator := builder ensureClassNamed: #BooleanOperator.
	breakStatement := builder ensureClassNamed: #BreakStatement."Todo"
	collectionInitializer := builder ensureClassNamed: #CollectionInitializer.
	call := builder ensureClassNamed: #Call."Todo"
	caseClause := builder ensureClassNamed: #CaseClause."Todo"
	casePattern := builder ensureClassNamed: #CasePattern."Todo"
	chevron := builder ensureClassNamed: #Chevron."Todo"
	classDefinition := builder ensureClassNamed: #ClassDefinition."ToReview"
	classDefinition withTesting.
	classPattern := builder ensureClassNamed: #ClassPattern."Todo"
	comment := builder ensureClassNamed: #Comment."Todo"
	comparisonOperator := builder ensureClassNamed: #ComparisonOperator.
	complexPattern := builder ensureClassNamed: #ComplexPattern."Todo"
	concatenatedString := builder ensureClassNamed: #ConcatenatedString."Todo"
	conditionalExpression := builder ensureClassNamed: #ConditionalExpression."Todo"
	constrainedType := builder ensureClassNamed: #ConstrainedType."Todo"
	continueStatement := builder ensureClassNamed: #ContinueStatement."Todo"
	decoratedDefinition := builder ensureClassNamed: #DecoratedDefinition."Todo"
	decorator := builder ensureClassNamed: #Decorator."Todo"
	defaultParameter := builder ensureClassNamed: #DefaultParameter."Todo"
	deleteStatement := builder ensureClassNamed: #DeleteStatement."Todo"
	dictPattern := builder ensureClassNamed: #DictPattern."Todo"
	dictionary := builder ensureClassNamed: #Dictionary."To Review"
	dictionaryComprehension := builder ensureClassNamed: #DictionaryComprehension."Todo"
	dictionarySplat := builder ensureClassNamed: #DictionarySplat."Todo"
	dictionarySplatPattern := builder ensureClassNamed: #DictionarySplatPattern."Todo"
	dottedName := builder ensureClassNamed: #DottedName."Todo"
	elifClause := builder ensureClassNamed: #ElifClause."Todo"
	ellipsis := builder ensureClassNamed: #Ellipsis."Todo"
	elseClause := builder ensureClassNamed: #ElseClause."Todo"
	escapeInterpolation := builder ensureClassNamed: #EscapeInterpolation."Todo"
	escapeSequence := builder ensureClassNamed: #EscapeSequence."Todo"
	exceptClause := builder ensureClassNamed: #ExceptClause."Todo"
	execStatement := builder ensureClassNamed: #ExecStatement."Todo"
	expression := builder ensureClassNamed: #Expression.
	expressionList := builder ensureClassNamed: #ExpressionList."Todo"
	finallyClause := builder ensureClassNamed: #FinallyClause."Todo"
	float := builder ensureClassNamed: #Float.
	forInClause := builder ensureClassNamed: #ForInClause."Todo"
	forStatement := builder ensureClassNamed: #ForStatement."Todo"
	formatExpression := builder ensureClassNamed: #FormatExpression."Todo"
	formatSpecifier := builder ensureClassNamed: #FormatSpecifier."Todo"
	fromModule := builder ensureClassNamed: #FromModule.
	functionDefinition := builder ensureClassNamed: #FunctionDefinition."ToReview"
	generatorExpression := builder ensureClassNamed: #GeneratorExpression."Todo"
	genericType := builder ensureClassNamed: #GenericType."Todo"
	globalStatement := builder ensureClassNamed: #GlobalStatement."Todo"
	identifier := builder ensureClassNamed: #Identifier."Todo"
	ifClause := builder ensureClassNamed: #IfClause."Todo"
	ifStatement := builder ensureClassNamed: #IfStatement."Todo"
	import := builder ensureClassNamed: #Import. "To review"
	importedEntity := builder ensureClassNamed: #ImportedEntity.
	importFromStatement := builder ensureClassNamed: #ImportFromStatement."Todo"
	importStatement := builder ensureClassNamed: #ImportStatement."Todo"
	integer := builder ensureClassNamed: #Integer.
	interpolation := builder ensureClassNamed: #Interpolation.
	keywordArgument := builder ensureClassNamed: #KeywordArgument."Todo"
	keywordPattern := builder ensureClassNamed: #KeywordPattern."Todo"
	keywordSeparator := builder ensureClassNamed: #KeywordSeparator."Todo"
	lambda := builder ensureClassNamed: #Lambda."Todo"
	lambdaParameters := builder ensureClassNamed: #LambdaParameters."Todo"
	lineContinuation := builder ensureClassNamed: #LineContinuation."Todo"
	list := builder ensureClassNamed: #List.
	listComprehension := builder ensureClassNamed: #ListComprehension."Todo"
	listPattern := builder ensureClassNamed: #ListPattern."Todo"
	listSplat := builder ensureClassNamed: #ListSplat."Todo"
	listSplatPattern := builder ensureClassNamed: #ListSplatPattern."Todo"
	literal := builder ensureClassNamed: #Literal.
	matchStatement := builder ensureClassNamed: #MatchStatement."Todo"
	memberType := builder ensureClassNamed: #MemberType."Todo"
	methodDefinition := builder ensureClassNamed: #MethodDefinition."ToReview"
	module := builder ensureClassNamed: #Module."ToReview"
	namedExpression := builder ensureClassNamed: #NamedExpression."Todo"
	none := builder ensureClassNamed: #None.
	nonlocalStatement := builder ensureClassNamed: #NonlocalStatement."Todo"
	notOperator := builder ensureClassNamed: #NotOperator.
	operator := builder ensureClassNamed: #Operator.
	pair := builder ensureClassNamed: #Pair.
	parameter := builder ensureClassNamed: #Parameter."ToReview"
	parenthesizedExpression := builder ensureClassNamed: #ParenthesizedExpression."Todo"
	parenthesizedListSplat := builder ensureClassNamed: #ParenthesizedListSplat."Todo"
	passStatement := builder ensureClassNamed: #PassStatement."To Review"
	patternList := builder ensureClassNamed: #PatternList."Todo"
	positionalSeparator := builder ensureClassNamed: #PositionalSeparator."Todo"
	printStatement := builder ensureClassNamed: #PrintStatement."Todo"
	raiseStatement := builder ensureClassNamed: #RaiseStatement."Todo"
	returnStatement := builder ensureClassNamed: #ReturnStatement."Todo"
	set := builder ensureClassNamed: #Set.
	setComprehension := builder ensureClassNamed: #SetComprehension."Todo"
	slice := builder ensureClassNamed: #Slice."Todo"
	splatPattern := builder ensureClassNamed: #SplatPattern."Todo"
	splatType := builder ensureClassNamed: #SplatType."Todo"
	string := builder ensureClassNamed: #String.
	structuralEntity := builder ensureClassNamed: #StructuralEntity.
	subscript := builder ensureClassNamed: #Subscript."Todo"
	tryStatement := builder ensureClassNamed: #TryStatement."Todo"
	tuple := builder ensureClassNamed: #Tuple."To Review"
	tupleExpression := builder ensureClassNamed: #TupleExpression."Todo"
	tuplePattern := builder ensureClassNamed: #TuplePattern."Todo"
	type := builder ensureClassNamed: #Type."Todo"
	typeAliasStatement := builder ensureClassNamed: #TypeAliasStatement."Todo"
	typeConversion := builder ensureClassNamed: #TypeConversion."Todo"
	typeParameter := builder ensureClassNamed: #TypeParameter."Todo"
	typedDefaultParameter := builder ensureClassNamed: #TypedDefaultParameter."Todo"
	typedParameter := builder ensureClassNamed: #TypedParameter."Todo"
	unaryOperator := builder ensureClassNamed: #UnaryOperator.
	unionPattern := builder ensureClassNamed: #UnionPattern."Todo"
	unionType := builder ensureClassNamed: #UnionType."Todo"
	variable := builder ensureClassNamed: #Variable. "To review"
	whileStatement := builder ensureClassNamed: #WhileStatement."Todo"
	withClause := builder ensureClassNamed: #WithClause."Todo"
	withItem := builder ensureClassNamed: #WithItem."Todo"
	withStatement := builder ensureClassNamed: #WithStatement."Todo"
	yield := builder ensureClassNamed: #Yield"Todo"
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineHierarchy [
	"define class hierarchy"

	super defineHierarchy.

	entity --|> tEntity.
	self flag: #todo. "The next two line are WRONG and NEEDS to be reviewed but we currently need it because else everything will break until the MM is in a better state."
	entity --|> tStatement.
	
	assignment --|> tAssignment.
	
	attribute --|> structuralEntity.
	
	binaryOperator --|> operator.
	binaryOperator --|> tBinaryExpression.

	block --|> tStatementBlock.
	
	booleanOperator --|> operator.
	booleanOperator --|> tBinaryExpression. "I am not 100% sure this is the best trait to use but it seems to work well for now"
	
	boolean --|> literal.
	boolean --|> tBooleanLiteral.
	
	call --|> tInvocation.
	
	classDefinition --|> tNamedEntity.
	
	collectionInitializer --|> expression.
	
	comment --|> tComment.
	
	comparisonOperator --|> operator.
	
	expression --|> tExpression.
	
	self flag: #todo. "I am not sure this should be the case but the importer is too young and we need this to not have everything breaking."
	identifier --|> expression. 
	
	importStatement --|> import.
	
	importFromStatement --|> import.
	
	float --|> literal.
	
	functionDefinition --|> tNamedBehaviouralEntity.
	
	integer --|> literal.
	
	list --|> collectionInitializer.

	literal --|> tLiteral.
	
	none --|> literal.
	
	pair --|> expression.
	
	parameter --|> structuralEntity.
	
	passStatement --|> tStatement.
	
	methodDefinition --|> tNamedBehaviouralEntity.
	
	module --|> #THasImmediateSource.
	
	notOperator --|> operator.
	notOperator --|> tUnaryOperator.
	
	operator --|> expression.
	
	returnStatement --|> tReturnStatement.
	
	set --|> collectionInitializer.
	
	string --|> literal.
	string --|> tStringLiteral.
	
	structuralEntity --|> tVariableEntity.
	
	tuple --|> collectionInitializer.
	
	unaryOperator --|> operator.
	unaryOperator --|> tUnaryOperator.
	
	variable --|> structuralEntity
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineProperties [

	super defineProperties.

	(comparisonOperator property: #operators type: #String)
		multivalued: true;
		comment: 'The comparators applied in order. Possible operators:  <, <=, ==, !=, >=, >, <>, in, not in, is, is not'.

	(fromModule property: #segments type: #String)
		multivalued: true;
		comment:
			'The segments of the module path. For example if you declare `xml.etree.ElementTree` as module, the segments will be { ''xml'' . ''etree'' . ''ElementTree''}.'.
			
	(importedEntity property: #segments type: #String)
		multivalued: true;
		comment:
			'The segments of the imported entity. For example if you import `xml.etree.ElementTree`, the segments will be { ''xml'' . ''etree'' . ''ElementTree''}.'.

	(importedEntity property: #alias type: #String) comment: 'If the imported entity has an alias, I contain it.'.

	unaryOperator property: #operator type: #String
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineRelations [

	super defineRelations.

	(entity property: #genericChildren) <>-* (entity property: #genericParent).

	((comparisonOperator property: #operands) comment:
		 'List of the operands of the comparison operands. For example if we have `a == b != c`, it will be a, b and c.')
	<>-* ((tExpression property: #parentComparisonOperator) comment: 'Parent comparison expression of which I am.').

	((import property: #importedEntities) comment: 'List of the imported entities.')
	<>-* ((importedEntity property: #import) comment: 'Import declaring me as imported entity.').

	((importFromStatement property: #fromModule) comment:
		 'Module in which the imported entities should be looked for. `from datetime import date` has `datetime` as fromModule..')
	<>- ((fromModule property: #import) comment: 'Import declaring me as from import module.').

	((collectionInitializer property: #initializers) comment: 'Each initializer defines one element.')
	<>-* ((tExpression property: #collectionInitializer) comment: 'The owner of the expression').

	((tUnaryOperator property: #argument) comment: 'Expression influanced by the unary operator..')
	<>- ((tExpression property: #parentUnaryOperator) comment: 'Parent unary operator in which I am.')
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineTraits [

	super defineTraits.
	
	"Entity"
	tEntity := self remoteTrait: #TEntity withPrefix: #FAST.

	"FAST-Python"
	tUnaryOperator := builder newTraitNamed: #TUnaryOperator.
	
	"Remotes"
	tAssignment := self remoteTrait: #TAssignment withPrefix: #FAST.
	tBinaryExpression := self remoteTrait: #TBinaryExpression withPrefix: #FAST.
	tBooleanLiteral := self remoteTrait: #TBooleanLiteral withPrefix: #FAST.
	tComment := self remoteTrait: #TComment withPrefix: #FAST.
	tExpression := self remoteTrait: #TExpression withPrefix: #FAST.
	tInvocation := self remoteTrait: #TInvocation withPrefix: #FAST. 
	tReturnStatement := self remoteTrait: #TReturnStatement withPrefix: #FAST.
	tStatement := self remoteTrait: #TStatement withPrefix: #FAST.
	tStatementBlock := self remoteTrait: #TStatementBlock withPrefix: #FAST.
	tLiteral := self remoteTrait: #TLiteral withPrefix: #FAST.
	tNamedBehaviouralEntity := self remoteTrait: #TNamedBehaviouralEntity withPrefix: #FAST.
	tNamedEntity := self remoteTrait: #TNamedEntity withPrefix: #FAST.
	tStringLiteral := self remoteTrait: #TStringLiteral withPrefix: #FAST.
	tVariableEntity := self remoteTrait: #TVariableEntity withPrefix: #FAST
]
