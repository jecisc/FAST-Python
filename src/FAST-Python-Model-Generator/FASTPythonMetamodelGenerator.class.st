Class {
	#name : 'FASTPythonMetamodelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'entity',
		'_ERROR',
		'tEntity',
		'aliasedImport',
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
		'futureImportStatement',
		'generatorExpression',
		'genericType',
		'globalStatement',
		'identifier',
		'ifClause',
		'ifStatement',
		'importFromStatement',
		'importPrefix',
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
		'relativeImport',
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
		'wildcardImport',
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
		'tBinaryExpression'
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

	^ #FASTPython
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
	aliasedImport := builder ensureClassNamed: #AliasedImport."Todo"
	argumentList := builder ensureClassNamed: #ArgumentList."Todo"
	asPattern := builder ensureClassNamed: #AsPattern."Todo"
	asPatternTarget := builder ensureClassNamed: #AsPatternTarget."Todo"
	assertStatement := builder ensureClassNamed: #AssertStatement."Todo"
	assignment := builder ensureClassNamed: #Assignment."Todo"
	attribute := builder ensureClassNamed: #Attribute."Todo"
	augmentedAssignment := builder ensureClassNamed: #AugmentedAssignment."Todo"
	await := builder ensureClassNamed: #Await."Todo"
	binaryOperator := builder ensureClassNamed: #BinaryOperator."Todo"
	block := builder ensureClassNamed: #Block."Todo"
	boolean := builder ensureClassNamed: #Boolean.
	booleanOperator := builder ensureClassNamed: #BooleanOperator."Todo"
	breakStatement := builder ensureClassNamed: #BreakStatement."Todo"
	call := builder ensureClassNamed: #Call."Todo"
	caseClause := builder ensureClassNamed: #CaseClause."Todo"
	casePattern := builder ensureClassNamed: #CasePattern."Todo"
	chevron := builder ensureClassNamed: #Chevron."Todo"
	classDefinition := builder ensureClassNamed: #ClassDefinition."ToReview"
	classDefinition withTesting.
	classPattern := builder ensureClassNamed: #ClassPattern."Todo"
	comment := builder ensureClassNamed: #Comment."Todo"
	comparisonOperator := builder ensureClassNamed: #ComparisonOperator."Todo"
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
	dictionary := builder ensureClassNamed: #Dictionary."Todo"
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
	functionDefinition := builder ensureClassNamed: #FunctionDefinition."ToReview"
	futureImportStatement := builder ensureClassNamed: #FutureImportStatement."Todo"
	generatorExpression := builder ensureClassNamed: #GeneratorExpression."Todo"
	genericType := builder ensureClassNamed: #GenericType."Todo"
	globalStatement := builder ensureClassNamed: #GlobalStatement."Todo"
	identifier := builder ensureClassNamed: #Identifier."Todo"
	ifClause := builder ensureClassNamed: #IfClause."Todo"
	ifStatement := builder ensureClassNamed: #IfStatement."Todo"
	importFromStatement := builder ensureClassNamed: #ImportFromStatement."Todo"
	importPrefix := builder ensureClassNamed: #ImportPrefix."Todo"
	importStatement := builder ensureClassNamed: #ImportStatement."Todo"
	integer := builder ensureClassNamed: #Integer.
	interpolation := builder ensureClassNamed: #Interpolation.
	keywordArgument := builder ensureClassNamed: #KeywordArgument."Todo"
	keywordPattern := builder ensureClassNamed: #KeywordPattern."Todo"
	keywordSeparator := builder ensureClassNamed: #KeywordSeparator."Todo"
	lambda := builder ensureClassNamed: #Lambda."Todo"
	lambdaParameters := builder ensureClassNamed: #LambdaParameters."Todo"
	lineContinuation := builder ensureClassNamed: #LineContinuation."Todo"
	list := builder ensureClassNamed: #List."Todo"
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
	notOperator := builder ensureClassNamed: #NotOperator."Todo"
	pair := builder ensureClassNamed: #Pair."Todo"
	parameter := builder ensureClassNamed: #Parameter."ToReview"
	parenthesizedExpression := builder ensureClassNamed: #ParenthesizedExpression."Todo"
	parenthesizedListSplat := builder ensureClassNamed: #ParenthesizedListSplat."Todo"
	passStatement := builder ensureClassNamed: #PassStatement."Todo"
	patternList := builder ensureClassNamed: #PatternList."Todo"
	positionalSeparator := builder ensureClassNamed: #PositionalSeparator."Todo"
	printStatement := builder ensureClassNamed: #PrintStatement."Todo"
	raiseStatement := builder ensureClassNamed: #RaiseStatement."Todo"
	relativeImport := builder ensureClassNamed: #RelativeImport."Todo"
	returnStatement := builder ensureClassNamed: #ReturnStatement."Todo"
	set := builder ensureClassNamed: #Set."Todo"
	setComprehension := builder ensureClassNamed: #SetComprehension."Todo"
	slice := builder ensureClassNamed: #Slice."Todo"
	splatPattern := builder ensureClassNamed: #SplatPattern."Todo"
	splatType := builder ensureClassNamed: #SplatType."Todo"
	string := builder ensureClassNamed: #String.
	subscript := builder ensureClassNamed: #Subscript."Todo"
	tryStatement := builder ensureClassNamed: #TryStatement."Todo"
	tuple := builder ensureClassNamed: #Tuple."Todo"
	tupleExpression := builder ensureClassNamed: #TupleExpression."Todo"
	tuplePattern := builder ensureClassNamed: #TuplePattern."Todo"
	type := builder ensureClassNamed: #Type."Todo"
	typeAliasStatement := builder ensureClassNamed: #TypeAliasStatement."Todo"
	typeConversion := builder ensureClassNamed: #TypeConversion."Todo"
	typeParameter := builder ensureClassNamed: #TypeParameter."Todo"
	typedDefaultParameter := builder ensureClassNamed: #TypedDefaultParameter."Todo"
	typedParameter := builder ensureClassNamed: #TypedParameter."Todo"
	unaryOperator := builder ensureClassNamed: #UnaryOperator."Todo"
	unionPattern := builder ensureClassNamed: #UnionPattern."Todo"
	unionType := builder ensureClassNamed: #UnionType."Todo"
	whileStatement := builder ensureClassNamed: #WhileStatement."Todo"
	wildcardImport := builder ensureClassNamed: #WildcardImport."Todo"
	withClause := builder ensureClassNamed: #WithClause."Todo"
	withItem := builder ensureClassNamed: #WithItem."Todo"
	withStatement := builder ensureClassNamed: #WithStatement."Todo"
	yield := builder ensureClassNamed: #Yield"Todo".
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineHierarchy [
	"define class hierarchy"

	super defineHierarchy.

	entity --|> tEntity.
	self flag: #todo. "The next line is WRONG and NEEDS to be reviewed but we currently need it because else everything will break until the MM is in a better state."
	entity --|> tExpression.
	
	binaryOperator --|> expression.
	binaryOperator --|> tBinaryExpression.
	
	boolean --|> literal.
	boolean --|> tBooleanLiteral.
	
	classDefinition --|> tNamedEntity.
	
	comment --|> tComment.
	
	expression --|> tExpression.
	
	self flag: #todo. "I am not sure this should be the case but the importer is too young and we need this to not have everything breaking."
	identifier --|> expression. 
	
	float --|> literal.
	
	functionDefinition --|> tNamedBehaviouralEntity.
	
	integer --|> literal.
	
	literal --|> tLiteral.
	
	none --|> literal.
	
	parameter --|> tVariableEntity.
	
	methodDefinition --|> tNamedBehaviouralEntity.
	
	module --|> #THasImmediateSource.
	
	string --|> literal.
	string --|> tStringLiteral
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineRelations [

	super defineRelations.
	(entity property: #'genericChildren') <>-* (entity property: #'genericParent').
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineTraits [

	super defineTraits.

	"From FAST"
	tEntity := self remoteTrait: #TEntity withPrefix: #FAST.

	tBinaryExpression := self remoteTrait: #TBinaryExpression withPrefix: #FAST.
	tBooleanLiteral := self remoteTrait: #TBooleanLiteral withPrefix: #FAST.
	tComment := self remoteTrait: #TComment withPrefix: #FAST.
	tExpression := self remoteTrait: #TExpression withPrefix: #FAST.
	tLiteral := self remoteTrait: #TLiteral withPrefix: #FAST.
	tNamedBehaviouralEntity := self remoteTrait: #TNamedBehaviouralEntity withPrefix: #FAST.
	tNamedEntity := self remoteTrait: #TNamedEntity withPrefix: #FAST.
	tStringLiteral := self remoteTrait: #TStringLiteral withPrefix: #FAST.
	tVariableEntity := self remoteTrait: #TVariableEntity withPrefix: #FAST.
]
