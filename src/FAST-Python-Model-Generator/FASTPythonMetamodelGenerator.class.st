Class {
	#name : 'FASTPythonMetamodelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'entity',
		'_ERROR',
		'tEntity',
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
		'import',
		'importedEntity',
		'fromModule',
		'tInvocation',
		'tStatementBlock',
		'tReturnStatement',
		'tStatement',
		'collectionInitializer',
		'tConditionalStatement',
		'complex',
		'thenClause',
		'tLoopStatement',
		'statement',
		'tWithStatements',
		'tNumericalLiteral',
		'tComprehension',
		'tWithCondition',
		'tWithParameters',
		'tDefinition',
		'tDecoratorExpression',
		'tWithElseClause'
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
	asPattern := builder ensureClassNamed: #AsPattern."Todo"
	asPatternTarget := builder ensureClassNamed: #AsPatternTarget."Todo"
	assertStatement := builder ensureClassNamed: #AssertStatement.
	assignment := builder ensureClassNamed: #Assignment."To review"
	attribute := builder ensureClassNamed: #AttributeAccess.
	augmentedAssignment := builder ensureClassNamed: #AugmentedAssignment."Todo"
	await := builder ensureClassNamed: #Await."Todo"
	binaryOperator := builder ensureClassNamed: #BinaryOperator.
	block := builder ensureClassNamed: #Block."To review"
	boolean := builder ensureClassNamed: #Boolean.
	booleanOperator := builder ensureClassNamed: #BooleanOperator.
	breakStatement := builder ensureClassNamed: #BreakStatement.
	call := builder ensureClassNamed: #Call."Todo"
	caseClause := builder ensureClassNamed: #CaseClause."Todo"
	casePattern := builder ensureClassNamed: #CasePattern."Todo"
	chevron := builder ensureClassNamed: #Chevron."Todo"
	classDefinition := builder ensureClassNamed: #ClassDefinition."ToReview"
	classDefinition withTesting.
	classPattern := builder ensureClassNamed: #ClassPattern."Todo"
	collectionInitializer := builder ensureClassNamed: #CollectionInitializer.
	comment := builder ensureClassNamed: #Comment."Todo"
	comparisonOperator := builder ensureClassNamed: #ComparisonOperator.
	complex := builder ensureClassNamed: #Complex.
	complexPattern := builder ensureClassNamed: #ComplexPattern."Todo"
	concatenatedString := builder ensureClassNamed: #ConcatenatedString."Todo"
	conditionalExpression := builder ensureClassNamed: #ConditionalExpression."Todo"
	constrainedType := builder ensureClassNamed: #ConstrainedType."Todo"
	continueStatement := builder ensureClassNamed: #ContinueStatement.
	decorator := builder ensureClassNamed: #Decorator."Todo"
	defaultParameter := builder ensureClassNamed: #DefaultParameter."Todo"
	deleteStatement := builder ensureClassNamed: #DeleteStatement.
	dictPattern := builder ensureClassNamed: #DictPattern."Todo"
	dictionary := builder ensureClassNamed: #Dictionary."To Review"
	dictionaryComprehension := builder ensureClassNamed: #DictionaryComprehension."Todo"
	dictionarySplat := builder ensureClassNamed: #DictionarySplat."Todo"
	dictionarySplatPattern := builder ensureClassNamed: #DictionarySplatPattern."Todo"
	dottedName := builder ensureClassNamed: #DottedName."Todo"
	elifClause := builder ensureClassNamed: #ElifClause."Todo"
	ellipsis := builder ensureClassNamed: #Ellipsis.
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
	fromModule := builder ensureClassNamed: #FromModule.
	functionDefinition := builder ensureClassNamed: #FunctionDefinition."ToReview"
	generatorExpression := builder ensureClassNamed: #GeneratorExpression."Todo"
	genericType := builder ensureClassNamed: #GenericType."Todo"
	globalStatement := builder ensureClassNamed: #GlobalStatement.
	identifier := builder ensureClassNamed: #Identifier."Todo"
	ifClause := builder ensureClassNamed: #IfClause."Todo"
	ifStatement := builder ensureClassNamed: #IfStatement.
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
	list := builder ensureClassNamed: #List.
	listComprehension := builder ensureClassNamed: #ListComprehension."Todo"
	listPattern := builder ensureClassNamed: #ListPattern."Todo"
	listSplat := builder ensureClassNamed: #ListSplat."To Review"
	listSplatPattern := builder ensureClassNamed: #ListSplatPattern."Todo"
	literal := builder ensureClassNamed: #Literal.
	matchStatement := builder ensureClassNamed: #MatchStatement."Todo"
	memberType := builder ensureClassNamed: #MemberType."Todo"
	methodDefinition := builder ensureClassNamed: #MethodDefinition."ToReview"
	module := builder ensureClassNamed: #Module."ToReview"
	namedExpression := builder ensureClassNamed: #NamedExpression."Todo"
	none := builder ensureClassNamed: #None.
	nonlocalStatement := builder ensureClassNamed: #NonlocalStatement.
	notOperator := builder ensureClassNamed: #NotOperator.
	operator := builder ensureClassNamed: #Operator.
	pair := builder ensureClassNamed: #Pair.
	parameter := builder ensureClassNamed: #Parameter."ToReview"
	parenthesizedListSplat := builder ensureClassNamed: #ParenthesizedListSplat."Todo"
	passStatement := builder ensureClassNamed: #PassStatement."To Review"
	patternList := builder ensureClassNamed: #PatternList."Todo"
	positionalSeparator := builder ensureClassNamed: #PositionalSeparator."Todo"
	printStatement := builder ensureClassNamed: #PrintStatement."Todo"
	raiseStatement := builder ensureClassNamed: #RaiseStatement."Todo"
	returnStatement := builder ensureClassNamed: #ReturnStatement."Todo"
	set := builder ensureClassNamed: #Set.
	setComprehension := builder ensureClassNamed: #SetComprehension."Todo"
	slice := builder ensureClassNamed: #Slice. "To review"
	splatPattern := builder ensureClassNamed: #SplatPattern."Todo"
	splatType := builder ensureClassNamed: #SplatType."Todo"
	statement := builder ensureClassNamed: #Statement.
	string := builder ensureClassNamed: #String.
	subscript := builder ensureClassNamed: #Subscript.
	thenClause := builder ensureClassNamed: #ThenClause.
	tryStatement := builder ensureClassNamed: #TryStatement."Todo"
	tuple := builder ensureClassNamed: #Tuple."To Review"
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
	whileStatement := builder ensureClassNamed: #WhileStatement.
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
	entity --|> tExpression.
	entity --|> tStatement.

	assignment --|> tAssignment.

	assertStatement --|> statement.

	attribute --|> expression.
	attribute --|> tDecoratorExpression.
	
	await --|> tStatement.

	binaryOperator --|> operator.
	binaryOperator --|> tBinaryExpression.

	block --|> tStatementBlock.

	booleanOperator --|> operator.
	booleanOperator --|> tBinaryExpression. "I am not 100% sure this is the best trait to use but it seems to work well for now"

	boolean --|> literal.
	boolean --|> tBooleanLiteral.
	
	breakStatement --|> statement.

	call --|> expression.
	call --|> tInvocation.
	call --|> tDecoratorExpression.

	classDefinition --|> tNamedBehaviouralEntity.
	classDefinition --|> tDefinition.

	collectionInitializer --|> expression.

	comment --|> tComment.

	comparisonOperator --|> operator.

	complex --|> literal.
	complex --|> tNumericalLiteral.
	
	conditionalExpression --|> expression.
	conditionalExpression --|> tWithCondition.
	
	continueStatement --|> statement.

	deleteStatement --|> statement.

	dictionary --|> collectionInitializer.
	
	dictionaryComprehension --|> expression.
	dictionaryComprehension --|> tComprehension.

	elseClause --|> block.

	elifClause --|> block.
	elifClause --|> tConditionalStatement.
	
	ellipsis --|> literal.

	expression --|> statement. "In Python expressions can also be expression statements."
	expression --|> tExpression.
	
	expressionList --|> expression.
	
	float --|> literal.
	float --|> tNumericalLiteral.
	
	forInClause --|> expression. "This is wrong! I am just here temporarily until we rework the relation to the for in clause (I need to be able to be a clause of a list comprehension)"

	forStatement --|> statement.
	forStatement --|> tLoopStatement.
	forStatement --|> tWithElseClause.

	functionDefinition --|> tNamedBehaviouralEntity.
	functionDefinition --|> tDefinition.
	
	generatorExpression --|> expression.
	generatorExpression --|> tComprehension.

	globalStatement --|> statement.

	identifier --|> expression.
	identifier --|> tDecoratorExpression.
	
	ifClause --|> expression. "This is wrong! I am just here temporarily until we rework the relation to the for in clause (I need to be able to be a clause of a list comprehension)"

	ifStatement --|> statement.
	ifStatement --|> tConditionalStatement.
	ifStatement --|> tWithElseClause.

	importStatement --|> import.

	importFromStatement --|> import.

	integer --|> literal.
	integer --|> tNumericalLiteral.
	
	keywordArgument --|> expression.
	keywordArgument --|> tNamedEntity.
	
	lambda --|> expression.
	lambda --|> tWithParameters.
	lambda --|> tDecoratorExpression.
	
	list --|> collectionInitializer.
	
	listComprehension --|> expression.
	listComprehension --|> tComprehension.

	literal --|> expression.
	literal --|> tLiteral.
	
	listSplat --|> expression.

	methodDefinition --|> tNamedBehaviouralEntity.
	methodDefinition --|> tDefinition.

	module --|> block. "A Module has statements."
	module --|> #THasImmediateSource.
	
	none --|> literal.

	nonlocalStatement --|> statement.
	
	notOperator --|> operator.
	notOperator --|> tUnaryOperator.

	operator --|> expression.

	pair --|> expression.
	
	patternList --|> expression. "This is wrong! As for forInClause I should not be an expression. To fix later."

	parameter --|> tVariableEntity.

	passStatement --|> statement.

	returnStatement --|> statement.
	returnStatement --|> tReturnStatement.

	set --|> collectionInitializer.
	
	setComprehension --|> expression.
	setComprehension --|> tComprehension.
	
	slice --|> expression.
	
	statement --|> tStatement.

	string --|> literal.
	string --|> tStringLiteral.
	
	subscript --|> expression.
	subscript --|> tDecoratorExpression.

	thenClause --|> block.

	tuple --|> collectionInitializer.
	
	tuplePattern --|> expression. "TO REVIEW. This might be wrong."

	unaryOperator --|> operator.
	unaryOperator --|> tUnaryOperator.

	variable --|> expression.
	variable --|> tVariableEntity.

	whileStatement --|> statement.
	whileStatement --|> tConditionalStatement.
	whileStatement --|> tLoopStatement
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
	
	(interpolation property: #formatSpecifier type: #String) comment: 'If specified, the format of the interpolation.'.

	unaryOperator property: #operator type: #String
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineRelations [

	super defineRelations.

	(entity property: #genericChildren) <>-* (entity property: #genericParent).

	((attribute property: #object) comment:
		 'I am the receiver of the attribute. I can be multiple things such as a variable, a call, another attribute access, a primitive type, a subscript...')
	<>- ((expression property: #attributeObjectOwner) comment: 'My parent if I define the object of an attribute access (if it''s the case).').

	((attribute property: #attribute) comment: 'The variable been accessed')
	<>- ((variable property: #attributeOwner) comment: 'The attribute access accessing me (if it''s the case)').

	((assertStatement property: #expression) comment: 'The expression asserted')
	<>- ((expression property: #assertOwner) comment: 'The assert statement that own the expression (if it''s the case)').

	(await property: #expression) <>- (expression property: #parentAwait).

	((call property: #callee) comment:
		 'I represent what is called. Can be a class for an instantiation. A function invocation. A method invocation. The call of the return of a call. The call of something invoked from an array access...')
	<>- ((expression property: #caller) comment: 'The call entity calling me (if it''s the case)').

	((collectionInitializer property: #initializers) comment: 'Each initializer defines one element.')
	<>-* ((expression property: #collectionInitializer) comment: 'The owner of the expression').

	((comparisonOperator property: #operands) comment:
		 'List of the operands of the comparison operands. For example if we have `a == b != c`, it will be a, b and c.')
	<>-* ((expression property: #parentComparisonOperator) comment: 'Parent comparison expression of which I am.').

	(conditionalExpression property: #thenExpression) <>- (expression property: #conditionalExpressionThenOwner).

	(conditionalExpression property: #elseExpression) <>- (expression property: #conditionalExpressionElseOwner).

	(decorator property: #expression) <>- (tDecoratorExpression property: #parentDeclarator).

	((deleteStatement property: #expression) comment: 'The expression to apply the delete on')
	<>- ((expression property: #deleteOwner) comment: 'The delete statement that own the expression (if it''s the case)').

	(expressionList property: #expressions) <>-* (expression property: #expressionListOwner).

	(forInClause property: #left) <>- (expression property: #forInClauseLeftOwner).

	(forInClause property: #right) <>- (expression property: #forInClauseRightOwner).

	((forStatement property: #right) comment: 'The list that the for statement iterates over')
	<>- ((expression property: #forStatementLeftOwner) comment: 'The for statement owner (if possible)').
	((forStatement property: #left) comment: 'The identifier of the created local variable or tuple')
	<>- ((expression property: #forStatementRightOwner) comment: 'The for statement owner (if possible)').

	((globalStatement property: #variables) comment: 'The variables scoped')
	<>-* ((variable property: #globalOwner) comment: 'The global statement defining my scope (if it''s the case)').

	(ifClause property: #expression) <>- (expression property: #ifClauseOwner).

	(ifStatement property: #thenClause) <>- (thenClause property: #ifStatementOwner).

	(ifStatement property: #elifClauses) <>-* (elifClause property: #ifStatementOwner).

	((import property: #importedEntities) comment: 'List of the imported entities.')
	<>-* ((importedEntity property: #import) comment: 'Import declaring me as imported entity.').

	((importFromStatement property: #fromModule) comment:
		 'Module in which the imported entities should be looked for. `from datetime import date` has `datetime` as fromModule..')
	<>- ((fromModule property: #import) comment: 'Import declaring me as from import module.').

	(interpolation property: #expression) <>- (expression property: #parentInterpolation).

	((keywordArgument property: #value) comment: 'The value of the keyword argument.')
	<>- ((expression property: #keywordArgumentOwner) comment: 'Keyword argument from which I am the value (if it''s the case)').

	(lambda property: #expression) <>- (expression property: #lambdaOwner).

	((listSplat property: #iterable) comment: 'The iterable to unpack. Can be a collection, a call, an attribute access or a subscript.')
	<>- ((expression property: #listSplatOwner) comment: 'List splat unpacking me (if it''s the case)').

	((nonlocalStatement property: #variables) comment: 'The variables scoped')
	<>-* ((variable property: #nonlocalOwner) comment: 'The global statement defining my scope (if it''s the case)').

	(pair property: #key) <>- (tExpression property: #pairKeyOwner).

	(pair property: #value) <>- (tExpression property: #pairValueOwner).

	(patternList property: #elements) <>-* (expression property: #patternListOwner).

	((slice property: #components) comment: 'The components are the expressions between the `:` of a slice.')
	<>-* ((expression property: #sliceOwner) comment: 'Slice in which I am a component (start, end or step) (If it''s the case)''').

	(string property: #interpolations) <>-* (interpolation property: #parentString).

	((subscript property: #value) comment: 'The receiver of the subscript')
	<>- ((expression property: #subscriptValueOwner) comment: 'My parent if I define the receiver of a subscript (if it''s the case).').

	((subscript property: #indices) comment: 'The elements defining the indices to select in a subscript.')
	<>-* ((expression property: #subscriptIndiceOwner) comment: 'My parent if I am defining an index to select of a subscript (if it''s the case)').

	(tComprehension property: #body) <>- (expression property: #comprehensionBodyOwner).

	(tComprehension property: #clauses) <>-* (expression property: #comprehensionClauseOwner).

	(tDefinition property: #decorators) <>-* (decorator property: #definitionOwner).

	(tuplePattern property: #patterns) <>-* (expression property: #tuplePatternOwner).

	((tUnaryOperator property: #argument) comment: 'Expression influanced by the unary operator..')
	<>- ((expression property: #parentUnaryOperator) comment: 'Parent unary operator in which I am.').

	(tWithElseClause property: #elseClause) <>- (elseClause property: #ifStatementOwner)
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineTraits [

	super defineTraits.
	
	"Entity"
	tEntity := self remoteTrait: #TEntity withPrefix: #FAST.

	"FAST-Python"
	tComprehension := builder newTraitNamed: #TComprehension.
	tDefinition := builder newTraitNamed: #TDefinition.
	tDecoratorExpression := builder newTraitNamed: #TDecoratorExpression.
	tDecoratorExpression comment: 'I represent an entity that *can* be the expression of a decorator.'.
	tUnaryOperator := builder newTraitNamed: #TUnaryOperator.
	tWithElseClause := builder newTraitNamed: #TWithElseClause.
	
	"Remotes"
	tAssignment := self remoteTrait: #TAssignment withPrefix: #FAST.
	tBinaryExpression := self remoteTrait: #TBinaryExpression withPrefix: #FAST.
	tBooleanLiteral := self remoteTrait: #TBooleanLiteral withPrefix: #FAST.
	tComment := self remoteTrait: #TComment withPrefix: #FAST.
	tConditionalStatement := self remoteTrait: #TConditionalStatement withPrefix: #FAST.
	tExpression := self remoteTrait: #TExpression withPrefix: #FAST.
	tInvocation := self remoteTrait: #TInvocation withPrefix: #FAST. 
	tLiteral := self remoteTrait: #TLiteral withPrefix: #FAST.
	tLoopStatement := self remoteTrait: #TLoopStatement withPrefix: #FAST.
	tNamedBehaviouralEntity := self remoteTrait: #TNamedBehaviouralEntity withPrefix: #FAST.
	tNamedEntity := self remoteTrait: #TNamedEntity withPrefix: #FAST.
	tNumericalLiteral := self remoteTrait: #TNumericalLiteral withPrefix: #FAST.
	tReturnStatement := self remoteTrait: #TReturnStatement withPrefix: #FAST.
	tStatement := self remoteTrait: #TStatement withPrefix: #FAST.
	tStatementBlock := self remoteTrait: #TStatementBlock withPrefix: #FAST.
	tStringLiteral := self remoteTrait: #TStringLiteral withPrefix: #FAST.
	tVariableEntity := self remoteTrait: #TVariableEntity withPrefix: #FAST.
	tWithCondition := self remoteTrait: #TWithCondition withPrefix: #FAST.
	tWithParameters := self remoteTrait: #TWithParameters withPrefix: #FAST.
	tWithStatements := self remoteTrait: #TWithStatements withPrefix: #FAST
]
