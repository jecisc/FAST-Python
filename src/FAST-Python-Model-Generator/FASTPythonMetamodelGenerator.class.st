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
		'falseClass',
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
		'trueClass',
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
		'tStringLiteral'
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
	aliasedImport := builder ensureClassNamed: #AliasedImport.
	argumentList := builder ensureClassNamed: #ArgumentList.
	asPattern := builder ensureClassNamed: #AsPattern.
	asPatternTarget := builder ensureClassNamed: #AsPatternTarget.
	assertStatement := builder ensureClassNamed: #AssertStatement.
	assignment := builder ensureClassNamed: #Assignment.
	attribute := builder ensureClassNamed: #Attribute.
	augmentedAssignment := builder ensureClassNamed: #AugmentedAssignment.
	await := builder ensureClassNamed: #Await.
	binaryOperator := builder ensureClassNamed: #BinaryOperator.
	block := builder ensureClassNamed: #Block.
	booleanOperator := builder ensureClassNamed: #BooleanOperator.
	breakStatement := builder ensureClassNamed: #BreakStatement.
	call := builder ensureClassNamed: #Call.
	caseClause := builder ensureClassNamed: #CaseClause.
	casePattern := builder ensureClassNamed: #CasePattern.
	chevron := builder ensureClassNamed: #Chevron.
	classDefinition := builder ensureClassNamed: #ClassDefinition.
	classDefinition withTesting.
	classPattern := builder ensureClassNamed: #ClassPattern.
	comment := builder ensureClassNamed: #Comment.
	comparisonOperator := builder ensureClassNamed: #ComparisonOperator.
	complexPattern := builder ensureClassNamed: #ComplexPattern.
	concatenatedString := builder ensureClassNamed: #ConcatenatedString.
	conditionalExpression := builder ensureClassNamed: #ConditionalExpression.
	constrainedType := builder ensureClassNamed: #ConstrainedType.
	continueStatement := builder ensureClassNamed: #ContinueStatement.
	decoratedDefinition := builder ensureClassNamed: #DecoratedDefinition.
	decorator := builder ensureClassNamed: #Decorator.
	defaultParameter := builder ensureClassNamed: #DefaultParameter.
	deleteStatement := builder ensureClassNamed: #DeleteStatement.
	dictPattern := builder ensureClassNamed: #DictPattern.
	dictionary := builder ensureClassNamed: #Dictionary.
	dictionaryComprehension := builder ensureClassNamed: #DictionaryComprehension.
	dictionarySplat := builder ensureClassNamed: #DictionarySplat.
	dictionarySplatPattern := builder ensureClassNamed: #DictionarySplatPattern.
	dottedName := builder ensureClassNamed: #DottedName.
	elifClause := builder ensureClassNamed: #ElifClause.
	ellipsis := builder ensureClassNamed: #Ellipsis.
	elseClause := builder ensureClassNamed: #ElseClause.
	escapeInterpolation := builder ensureClassNamed: #EscapeInterpolation.
	escapeSequence := builder ensureClassNamed: #EscapeSequence.
	exceptClause := builder ensureClassNamed: #ExceptClause.
	execStatement := builder ensureClassNamed: #ExecStatement.
	expressionList := builder ensureClassNamed: #ExpressionList.
	falseClass := builder ensureClassNamed: #False.
	finallyClause := builder ensureClassNamed: #FinallyClause.
	float := builder ensureClassNamed: #Float.
	forInClause := builder ensureClassNamed: #ForInClause.
	forStatement := builder ensureClassNamed: #ForStatement.
	formatExpression := builder ensureClassNamed: #FormatExpression.
	formatSpecifier := builder ensureClassNamed: #FormatSpecifier.
	functionDefinition := builder ensureClassNamed: #FunctionDefinition.
	futureImportStatement := builder ensureClassNamed: #FutureImportStatement.
	generatorExpression := builder ensureClassNamed: #GeneratorExpression.
	genericType := builder ensureClassNamed: #GenericType.
	globalStatement := builder ensureClassNamed: #GlobalStatement.
	identifier := builder ensureClassNamed: #Identifier.
	ifClause := builder ensureClassNamed: #IfClause.
	ifStatement := builder ensureClassNamed: #IfStatement.
	importFromStatement := builder ensureClassNamed: #ImportFromStatement.
	importPrefix := builder ensureClassNamed: #ImportPrefix.
	importStatement := builder ensureClassNamed: #ImportStatement.
	integer := builder ensureClassNamed: #Integer.
	interpolation := builder ensureClassNamed: #Interpolation.
	keywordArgument := builder ensureClassNamed: #KeywordArgument.
	keywordPattern := builder ensureClassNamed: #KeywordPattern.
	keywordSeparator := builder ensureClassNamed: #KeywordSeparator.
	lambda := builder ensureClassNamed: #Lambda.
	lambdaParameters := builder ensureClassNamed: #LambdaParameters.
	lineContinuation := builder ensureClassNamed: #LineContinuation.
	list := builder ensureClassNamed: #List.
	listComprehension := builder ensureClassNamed: #ListComprehension.
	listPattern := builder ensureClassNamed: #ListPattern.
	listSplat := builder ensureClassNamed: #ListSplat.
	listSplatPattern := builder ensureClassNamed: #ListSplatPattern.
	matchStatement := builder ensureClassNamed: #MatchStatement.
	memberType := builder ensureClassNamed: #MemberType.
	methodDefinition := builder ensureClassNamed: #MethodDefinition.
	module := builder ensureClassNamed: #Module.
	namedExpression := builder ensureClassNamed: #NamedExpression.
	none := builder ensureClassNamed: #None.
	nonlocalStatement := builder ensureClassNamed: #NonlocalStatement.
	notOperator := builder ensureClassNamed: #NotOperator.
	pair := builder ensureClassNamed: #Pair.
	parameter := builder ensureClassNamed: #Parameter.
	parenthesizedExpression := builder ensureClassNamed: #ParenthesizedExpression.
	parenthesizedListSplat := builder ensureClassNamed: #ParenthesizedListSplat.
	passStatement := builder ensureClassNamed: #PassStatement.
	patternList := builder ensureClassNamed: #PatternList.
	positionalSeparator := builder ensureClassNamed: #PositionalSeparator.
	printStatement := builder ensureClassNamed: #PrintStatement.
	raiseStatement := builder ensureClassNamed: #RaiseStatement.
	relativeImport := builder ensureClassNamed: #RelativeImport.
	returnStatement := builder ensureClassNamed: #ReturnStatement.
	set := builder ensureClassNamed: #Set.
	setComprehension := builder ensureClassNamed: #SetComprehension.
	slice := builder ensureClassNamed: #Slice.
	splatPattern := builder ensureClassNamed: #SplatPattern.
	splatType := builder ensureClassNamed: #SplatType.
	string := builder ensureClassNamed: #String.
	subscript := builder ensureClassNamed: #Subscript.
	trueClass := builder ensureClassNamed: #True.
	tryStatement := builder ensureClassNamed: #TryStatement.
	tuple := builder ensureClassNamed: #Tuple.
	tupleExpression := builder ensureClassNamed: #TupleExpression.
	tuplePattern := builder ensureClassNamed: #TuplePattern.
	type := builder ensureClassNamed: #Type.
	typeAliasStatement := builder ensureClassNamed: #TypeAliasStatement.
	typeConversion := builder ensureClassNamed: #TypeConversion.
	typeParameter := builder ensureClassNamed: #TypeParameter.
	typedDefaultParameter := builder ensureClassNamed: #TypedDefaultParameter.
	typedParameter := builder ensureClassNamed: #TypedParameter.
	unaryOperator := builder ensureClassNamed: #UnaryOperator.
	unionPattern := builder ensureClassNamed: #UnionPattern.
	unionType := builder ensureClassNamed: #UnionType.
	whileStatement := builder ensureClassNamed: #WhileStatement.
	wildcardImport := builder ensureClassNamed: #WildcardImport.
	withClause := builder ensureClassNamed: #WithClause.
	withItem := builder ensureClassNamed: #WithItem.
	withStatement := builder ensureClassNamed: #WithStatement.
	yield := builder ensureClassNamed: #Yield.
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineHierarchy [
	"define class hierarchy"

	super defineHierarchy.

	entity --|> tEntity.
	
	classDefinition --|> tNamedEntity.
	
	comment --|> tComment.
	
	functionDefinition --|> tNamedBehaviouralEntity.
	
	parameter --|> tVariableEntity.
	
	methodDefinition --|> tNamedBehaviouralEntity.
	
	module --|> #THasImmediateSource.
	
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

	tComment := self remoteTrait: #TComment withPrefix: #FAST.
	tNamedBehaviouralEntity := self remoteTrait: #TNamedBehaviouralEntity withPrefix: #FAST.
	tNamedEntity := self remoteTrait: #TNamedEntity withPrefix: #FAST.
	tStringLiteral := self remoteTrait: #TStringLiteral withPrefix: #FAST.
	tVariableEntity := self remoteTrait: #TVariableEntity withPrefix: #FAST.
]
