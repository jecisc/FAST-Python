Class {
	#name : 'FASTPythonMetamodelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'entity',
		'_ERROR',
		'tEntity',
		'asPattern',
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
		'decorator',
		'deleteStatement',
		'dictPattern',
		'dictionary',
		'dictionaryComprehension',
		'dictionarySplat',
		'dottedName',
		'elifClause',
		'ellipsis',
		'elseClause',
		'escapeInterpolation',
		'escapeSequence',
		'exceptClause',
		'execStatement',
		'finallyClause',
		'float',
		'forInClause',
		'forStatement',
		'formatExpression',
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
		'list',
		'listComprehension',
		'listPattern',
		'listSplat',
		'matchStatement',
		'memberType',
		'module',
		'namedExpression',
		'none',
		'nonlocalStatement',
		'notOperator',
		'pair',
		'parameter',
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
		'splatType',
		'string',
		'subscript',
		'tryStatement',
		'tuple',
		'type',
		'typeAliasStatement',
		'typeConversion',
		'unaryOperator',
		'unionPattern',
		'unionType',
		'whileStatement',
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
		'tWithElseClause',
		'tWithComment',
		'collectionSplat',
		'tAsPatternTarget',
		'tAsPatternSource',
		'tWithStatementItem',
		'tRaised',
		'tAssignable',
		'tReturnReferenceable',
		'tSplatExpression',
		'listSplatParameter',
		'tSplatParameterTarget',
		'tSplatParameter',
		'dictionarySplatParameter',
		'tPattern',
		'tClassPatternElement',
		'tUnionMember',
		'tDeletable',
		'tTypeContent',
		'typeParameter',
		'tWithTypeParameters'
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
	chevron := builder ensureClassNamed: #Chevron."Todo"
	classDefinition := builder ensureClassNamed: #ClassDefinition."ToReview"
	classDefinition withTesting.
	classPattern := builder ensureClassNamed: #ClassPattern."Todo"
	collectionInitializer := builder ensureClassNamed: #CollectionInitializer.
	(collectionSplat := builder ensureClassNamed: #CollectionSplat) comment: 'In Python a collection (list or dictionary) splat is the unpacking of a collection in a call or in the definition of another definition like `[ *list , 4 ]` or `func(*list)`'.
	comment := builder ensureClassNamed: #Comment."Todo"
	comparisonOperator := builder ensureClassNamed: #ComparisonOperator.
	complex := builder ensureClassNamed: #Complex.
	concatenatedString := builder ensureClassNamed: #ConcatenatedString."Todo"
	conditionalExpression := builder ensureClassNamed: #ConditionalExpression."Todo"
	constrainedType := builder ensureClassNamed: #ConstrainedType."Todo"
	continueStatement := builder ensureClassNamed: #ContinueStatement.
	decorator := builder ensureClassNamed: #Decorator."Todo"
	deleteStatement := builder ensureClassNamed: #DeleteStatement.
	dictionary := builder ensureClassNamed: #Dictionary."To Review"
	dictionaryComprehension := builder ensureClassNamed: #DictionaryComprehension."Todo"
	dictionarySplat := builder ensureClassNamed: #DictionarySplat."Todo"
	dictionarySplatParameter := builder ensureClassNamed: #DictionarySplatParameter."Todo"
	dottedName := builder ensureClassNamed: #DottedName."Todo"
	elifClause := builder ensureClassNamed: #ElifClause."Todo"
	ellipsis := builder ensureClassNamed: #Ellipsis.
	elseClause := builder ensureClassNamed: #ElseClause."Todo"
	escapeInterpolation := builder ensureClassNamed: #EscapeInterpolation."Todo"
	escapeSequence := builder ensureClassNamed: #EscapeSequence."Todo"
	exceptClause := builder ensureClassNamed: #ExceptClause."Todo"
	execStatement := builder ensureClassNamed: #ExecStatement."Todo"
	expression := builder ensureClassNamed: #Expression.
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
	listSplat := builder ensureClassNamed: #ListSplat."To Review"
	listSplatParameter := builder ensureClassNamed: #ListSplatParameter."Todo"
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
	positionalSeparator := builder ensureClassNamed: #PositionalSeparator."Todo"
	printStatement := builder ensureClassNamed: #PrintStatement."Todo"
	raiseStatement := builder ensureClassNamed: #RaiseStatement."Todo"
	returnStatement := builder ensureClassNamed: #ReturnStatement."Todo"
	set := builder ensureClassNamed: #Set.
	setComprehension := builder ensureClassNamed: #SetComprehension."Todo"
	slice := builder ensureClassNamed: #Slice. "To review"
	splatType := builder ensureClassNamed: #SplatType."Todo"
	statement := builder ensureClassNamed: #Statement.
	string := builder ensureClassNamed: #String.
	subscript := builder ensureClassNamed: #Subscript.
	thenClause := builder ensureClassNamed: #ThenClause.
	tryStatement := builder ensureClassNamed: #TryStatement."Todo"
	tuple := builder ensureClassNamed: #Tuple."To Review"
	type := builder ensureClassNamed: #Type."Todo"
	typeAliasStatement := builder ensureClassNamed: #TypeAliasStatement."Todo"
	typeConversion := builder ensureClassNamed: #TypeConversion."Todo"
	typeParameter := builder ensureClassNamed: #TypeParameter.
	unaryOperator := builder ensureClassNamed: #UnaryOperator.
	unionPattern := builder ensureClassNamed: #UnionPattern."Todo"
	unionType := builder ensureClassNamed: #UnionType."Todo"
	variable := builder ensureClassNamed: #Variable. "To review"
	whileStatement := builder ensureClassNamed: #WhileStatement.
	withStatement := builder ensureClassNamed: #WithStatement."Todo"
	yield := builder ensureClassNamed: #Yield"Todo"
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineHierarchy [
	"define class hierarchy"

	super defineHierarchy.

	entity --|> tEntity.
	entity --|> tWithComment.
	
	"Adding a bunch of traits in errors to not interupt the parsing much if we have an error."
	_ERROR --|> expression.

	asPattern --|> tWithStatementItem.

	assignment --|> expression. "This should be a statement and not an expression. But making it an expression make it easier to manage nested assignments."
	assignment --|> tAssignable.

	assertStatement --|> statement.

	attribute --|> expression.
	attribute --|> tReturnReferenceable.
	attribute --|> tAsPatternTarget.
	attribute --|> tSplatParameterTarget.
	
	augmentedAssignment --|> assignment.
	
	await --|> statement.

	binaryOperator --|> operator.
	binaryOperator --|> tBinaryExpression.
	binaryOperator --|> tSplatExpression.
	binaryOperator --|> tPattern.

	block --|> tStatementBlock.

	booleanOperator --|> operator.
	booleanOperator --|> tBinaryExpression. "I am not 100% sure this is the best trait to use but it seems to work well for now"
	booleanOperator --|> tSplatExpression.
	booleanOperator --|> tRaised.

	boolean --|> literal.
	boolean --|> tBooleanLiteral.
	
	breakStatement --|> statement.

	call --|> expression.
	call --|> tInvocation.
	call --|> tReturnReferenceable.
	call --|> tWithStatementItem.
	
	caseClause --|> tStatementBlock.
	caseClause --|> tWithCondition.

	classDefinition --|> statement.
	classDefinition --|> tDefinition.
	classDefinition --|> tWithTypeParameters.
	
	classPattern --|> tPattern.

	collectionInitializer --|> expression.
	collectionInitializer --|> tSplatExpression.
	collectionInitializer --|> tPattern.
	
	collectionSplat --|> expression.
	collectionSplat --|> tPattern.

	comment --|> tComment.

	comparisonOperator --|> operator.

	complex --|> literal.
	complex --|> tNumericalLiteral.
	
	concatenatedString --|> expression.
	
	conditionalExpression --|> expression.
	conditionalExpression --|> tWithCondition.
	
	continueStatement --|> statement.
	
	constrainedType --|> tTypeContent.

	deleteStatement --|> statement.

	dictionary --|> collectionInitializer.
	
	dictionaryComprehension --|> expression.
	dictionaryComprehension --|> tComprehension.
	
	dictionarySplat --|> collectionSplat.
	
	dictionarySplatParameter --|> parameter.
	dictionarySplatParameter --|> tSplatParameter.
	
	dottedName --|> expression.
	dottedName --|> tPattern.
	dottedName --|> tClassPatternElement.

	elseClause --|> tStatementBlock.

	elifClause --|> block.
	elifClause --|> tConditionalStatement.
	
	ellipsis --|> literal.
	
	exceptClause --|> tStatementBlock.
	
	execStatement --|> statement.

	expression --|> statement. "In Python expressions can also be expression statements."
	expression --|> tExpression.
	expression --|> tTypeContent. "Not sure all expressions should be but it's simpler like this."
	
	finallyClause --|> tStatementBlock.
	
	float --|> literal.
	float --|> tNumericalLiteral.
	
	forInClause --|> expression. "This is wrong! I am just here temporarily until we rework the relation to the for in clause (I need to be able to be a clause of a list comprehension)"

	forStatement --|> statement.
	forStatement --|> tLoopStatement.
	forStatement --|> tWithElseClause.

	functionDefinition --|> statement.
	functionDefinition --|> tDefinition.
	functionDefinition --|> tWithTypeParameters.
	
	generatorExpression --|> expression.
	generatorExpression --|> tComprehension.
	
	genericType --|> tTypeContent.
	genericType --|> tWithTypeParameters.

	globalStatement --|> statement.

	identifier --|> expression.
	identifier --|> tReturnReferenceable.
	identifier --|> tAsPatternTarget.
	identifier --|> tSplatParameterTarget.
	
	ifClause --|> expression. "This is wrong! I am just here temporarily until we rework the relation to the for in clause (I need to be able to be a clause of a list comprehension)"

	ifStatement --|> statement.
	ifStatement --|> tConditionalStatement.
	ifStatement --|> tWithElseClause.
	
	import --|> statement.

	importStatement --|> import.

	importFromStatement --|> import.

	integer --|> literal.
	integer --|> tNumericalLiteral.
	
	keywordArgument --|> expression.
	keywordArgument --|> tNamedEntity.
	
	keywordPattern --|> tClassPatternElement.
	keywordPattern --|> tPattern.
	keywordPattern --|> tNamedEntity.
	
	keywordSeparator --|> tVariableEntity. "I'm not fan because they cannot be in assignation but that will do for now."
	
	lambda --|> expression.
	lambda --|> tWithParameters.
	lambda --|> tDecoratorExpression.
	
	list --|> collectionInitializer.
	list --|> tAsPatternTarget.
	list --|> tAssignable.
	
	listComprehension --|> expression.
	listComprehension --|> tComprehension.

	listSplat --|> collectionSplat.
	
	listSplatParameter --|> parameter.
	listSplatParameter --|> tSplatParameter.

	literal --|> expression.
	literal --|> tLiteral.
	literal --|> tPattern.
	
	matchStatement --|> statement.

	methodDefinition --|> statement.
	methodDefinition --|> tDefinition.
	methodDefinition --|> tWithTypeParameters.

	module --|> tStatementBlock.
	module --|> #THasImmediateSource.
	module withPrecedenceOf: #THasImmediateSource.
	
	none --|> literal.

	nonlocalStatement --|> statement.
	
	notOperator --|> operator.
	notOperator --|> tUnaryOperator.

	operator --|> expression.

	pair --|> expression.
	
	parameter --|> tVariableEntity.

	passStatement --|> statement.
	
	positionalSeparator --|> tVariableEntity. "I'm not fan because they cannot be in assignation but that will do for now."
	
	printStatement --|> statement.
	
	raiseStatement --|> statement.

	returnStatement --|> statement.
	returnStatement --|> tReturnStatement.

	set --|> collectionInitializer.
	
	setComprehension --|> expression.
	setComprehension --|> tComprehension.
	
	slice --|> expression.
	
	statement --|> tStatement.

	string --|> literal.
	string --|> tStringLiteral.
	string --|> tSplatExpression.
	
	subscript --|> expression.
	subscript --|> tReturnReferenceable.
	subscript --|> tAsPatternTarget.
	
	tAsPatternTarget --|> tAsPatternSource.
	
	tComprehension --|> tSplatExpression.
	tComprehension --|> tWithCondition.
	
	tDefinition --|> tNamedBehaviouralEntity.
	
	tReturnReferenceable --|> tAssignable.
	tReturnReferenceable --|> tRaised.
	tReturnReferenceable --|> tAsPatternSource.
	tReturnReferenceable --|> tSplatExpression.
	tReturnReferenceable --|> tDecoratorExpression.
	tReturnReferenceable --|> tDeletable.

	thenClause --|> tStatementBlock.

	tuple --|> collectionInitializer.
	tuple --|> tAsPatternTarget.
	tuple --|> tAssignable.
	tuple --|> tDeletable.
	
	tryStatement --|> statement.
	tryStatement --|> tStatementBlock.
	tryStatement --|> tWithElseClause.
	
	typeAliasStatement --|> statement.
	
	typeParameter --|> tTypeContent.

	unaryOperator --|> operator.
	unaryOperator --|> tUnaryOperator.
	
	unionPattern --|> tPattern.

	variable --|> expression.
	variable --|> tVariableEntity.
	variable --|> tAssignable.

	whileStatement --|> statement.
	whileStatement --|> tConditionalStatement.
	whileStatement --|> tLoopStatement.
	whileStatement --|> tWithElseClause.
	
	withStatement --|> statement.
	withStatement --|> tStatementBlock
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineProperties [

	super defineProperties.
	
	augmentedAssignment property: #operator type: #String. 
	
	(caseClause property: #alias type: #String) comment: 'Alias used if an as pattern is used in the clause.'.

	(comparisonOperator property: #operators type: #String)
		multivalued: true;
		comment: 'The comparators applied in order. Possible operators:  <, <=, ==, !=, >=, >, <>, in, not in, is, is not'.

	(dottedName property: #identifiers type: #String)
		multivalued: true;
		comment: 'The elements separated by a .'.
	
	(exceptClause property: #alias type: #String) comment: 'Alias used if an as pattern is used in the clause.'.

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
	
	(interpolation property: #typeConversion type: #String) comment: 'If specified, the type conversion of the interpolation.'.

	unaryOperator property: #operator type: #String
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineRelations [

	super defineRelations.

	(entity property: #genericChildren) <>-* (entity property: #genericParent).
	
	(assignment property: #left) <>- (tAssignable property: #parentAssignmentLeft).
	(assignment property: #right) <>- (expression property: #parentAssignmentRight).
	(assignment property: #type) <>- (type property: #parentAssignment).

	(asPattern property: #target) <>- (tAsPatternTarget property: #parentAsPatternTarget).

	(asPattern property: #source) <>- (tAsPatternSource property: #parentAsPatternSource).

	((assertStatement property: #expressions) comment: 'The expressions asserted')
	<>-* ((expression property: #parentAssertStatement) comment: 'The assert statement that own the expression (if it''s the case)').

	((attribute property: #object) comment:
		 'I am the receiver of the attribute. I can be multiple things such as a variable, a call, another attribute access, a primitive type, a subscript...')
	<>- ((expression property: #attributeObjectOwner) comment: 'My parent if I define the object of an attribute access (if it''s the case).').

	((attribute property: #attribute) comment: 'The variable been accessed')
	<>- ((identifier property: #attributeOwner) comment: 'The attribute access accessing me (if it''s the case)').

	(await property: #expression) <>- (expression property: #parentAwait).

	((call property: #callee) comment:
		 'I represent what is called. Can be a class for an instantiation. A function invocation. A method invocation. The call of the return of a call. The call of something invoked from an array access...')
	<>- ((expression property: #caller) comment: 'The call entity calling me (if it''s the case)').
	
	(caseClause property: #pattern) <>-(tPattern property: #parentCaseClause).
	
	(chevron property: #expression) <>- (expression property: #parentChevron).
	
	(classPattern property: #elements) <>-* (tClassPatternElement property: #parentClassPattern).

	((collectionInitializer property: #initializers) comment: 'Each initializer defines one element.')
	<>-* ((expression property: #collectionInitializer) comment: 'The owner of the expression').

	(collectionSplat property: #expression) <>- (tSplatExpression property: #parentSplat).

	((comparisonOperator property: #operands) comment:
		 'List of the operands of the comparison operands. For example if we have `a == b != c`, it will be a, b and c.')
	<>-* ((expression property: #parentComparisonOperator) comment: 'Parent comparison expression of which I am.').

	(concatenatedString property: #strings) <>-* (string property: #parentConcatenatedString).

	(conditionalExpression property: #thenExpression) <>- (expression property: #conditionalExpressionThenOwner).

	(conditionalExpression property: #elseExpression) <>- (expression property: #conditionalExpressionElseOwner).
	
	(constrainedType property: #type) <>- (type property: #parentContrainedType).
	
	(constrainedType property: #bound) <>- (type property: #parentContrainedTypeBound).

	(decorator property: #expression) <>- (tDecoratorExpression property: #parentDeclarator).

	((deleteStatement property: #expression) comment: 'The expression to apply the delete on')
	<>- ((tDeletable property: #parentDeleteStatement) comment: 'The delete statement that own the expression (if it''s the case)').
	
	(exceptClause property: #expressions) <>-* (expression property: #parentExceptClause). "We could point less things than expression, but in reality in Python any expression can be provided. It will just end up in runtime error."

	(forInClause property: #left) <>- (expression property: #forInClauseLeftOwner).

	(forInClause property: #right) <>- (expression property: #forInClauseRightOwner).

	((forStatement property: #right) comment: 'The list that the for statement iterates over')
	<>- ((expression property: #forStatementLeftOwner) comment: 'The for statement owner (if possible)').
	((forStatement property: #left) comment: 'The identifier of the created local variable or tuple')
	<>- ((expression property: #forStatementRightOwner) comment: 'The for statement owner (if possible)').
	
	(functionDefinition property: #returnType) <>- (type property: #parentFunctionDefinition).

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
	
	(keywordPattern property: #value) <>- (tPattern property: #parentKeywordPatternValue).

	(lambda property: #expression) <>- (expression property: #lambdaOwner).
	
	(matchStatement property: #subject) <>- (expression property: #parentMatchStatement).
	
	(matchStatement property: #cases) <>-* (caseClause property: #parentMatchStatement).
	
	((nonlocalStatement property: #variables) comment: 'The variables scoped')
	<>-* ((variable property: #nonlocalOwner) comment: 'The global statement defining my scope (if it''s the case)').

	(pair property: #key) <>- (expression property: #pairKeyOwner). "It should be anything hashable. Maybe we could refine the target but not sure."

	(pair property: #value) <>- (expression property: #pairValueOwner).
	
	(parameter property: #type) <>- (type property: #parentParameter).
	
	(parameter property: #defaultValue) <>- (expression property: #parentDefaultParameterValue). "I need to refine the relation with a new trait."

	(printStatement property: #expressions) <>-* (expression property: #prarentPrintStatement).
	
	(printStatement property: #redirection) <>- (chevron property: #parentPrintStatement). 
	
	(raiseStatement property: #exception) <>- (tRaised property: #parentRaiseStatement).

	((slice property: #components) comment: 'The components are the expressions between the `:` of a slice.')
	<>-* ((expression property: #sliceOwner) comment: 'Slice in which I am a component (start, end or step) (If it''s the case)'''). "Originally, I created a trait for Slice content because the python syntax does not allow all expressions. But multiple libraries are changing the syntax to accept other objects such as float, list or even string. So now I point FASTPyExpression to not fail on all those cases."

	(string property: #interpolations) <>-* (interpolation property: #parentString).

	((subscript property: #value) comment: 'The receiver of the subscript')
	<>- ((expression property: #subscriptValueOwner) comment: 'My parent if I define the receiver of a subscript (if it''s the case).').

	((subscript property: #indices) comment: 'The elements defining the indices to select in a subscript.')
	<>-* ((expression property: #subscriptIndiceOwner) comment: 'My parent if I am defining an index to select of a subscript (if it''s the case)').

	(tComprehension property: #body) <>- (expression property: #comprehensionBodyOwner).

	(tComprehension property: #clauses) <>-* (expression property: #comprehensionClauseOwner).

	(tDefinition property: #decorators) <>-* (decorator property: #definitionOwner).
	
	(tryStatement property: #excepts) <>-* (exceptClause property: #parentTryStatement).

	(tSplatParameter property: #target) <>- (tSplatParameterTarget property: #parentSplatParameter).

	((tUnaryOperator property: #argument) comment: 'Expression influanced by the unary operator..')
	<>- ((expression property: #parentUnaryOperator) comment: 'Parent unary operator in which I am.').
	
	(type property: #content) <>- (tTypeContent property: #parentType).
	
	(typeAliasStatement property: #left) <>- (type property: #parentyTypeAliasStatementAlias).
	(typeAliasStatement property: #right) <>- (type property: #parentyTypeAliasStatementType).
	
	(tryStatement property: #finally) <>- (finallyClause property: #parentTryStatement).

	(tWithElseClause property: #elseClause) <>- (elseClause property: #ifStatementOwner).
	
	(tWithTypeParameters property: #typeParameters) <>-* (type property: #parentWithTypeParameters).
	
	(unionPattern property: #members) <>-* (tPattern property: #parentUnionPattern).

	(withStatement property: #items) <>-* (tWithStatementItem property: #parentWithStatementItem)
]

{ #category : 'definition' }
FASTPythonMetamodelGenerator >> defineTraits [

	super defineTraits.
	
	"Entity"
	tEntity := self remoteTrait: #TEntity withPrefix: #FAST.
	
	"FAST-Python"
	tAsPatternTarget := (builder newTraitNamed: #TAsPatternTarget) comment: 'I represent an entity that could be the alias/target of an as pattern.'.

	tAsPatternSource := (builder newTraitNamed: #TAsPatternSource) comment: 'I represent an entity that could be aliased in an as pattern.'.

	(tAssignable := builder newTraitNamed: #TAssignable) comment: 'I represent something that can be assigned in an assignment'.
	
	(tClassPatternElement := builder newTraitNamed: #TClassPatternElement) comment: 'I represent the elements of a class pattern in python pattern matcher. The first element is the class name, the others the arguments.'.

	tComprehension := builder newTraitNamed: #TComprehension.
	
	(tDecoratorExpression := builder newTraitNamed: #TDecoratorExpression) comment: 'I represent an entity that *can* be the expression of a decorator.'.

	tDefinition := builder newTraitNamed: #TDefinition.

	(tDeletable := builder newTraitNamed: #TDeletable) comment: 'I represent an expression that can be in a delete statement.'.
	
	(tPattern := builder newTraitNamed: #TPattern) comment: 'I represent an entity that can be the pattern of a case clause in a match statement..'.

	(tRaised := builder newTraitNamed: #TRaised) comment: 'I represent an expression that can give an exception to raise in a raise statement.'.

	((tReturnReferenceable := builder newTraitNamed: #TReturnReferenceable) comment: 'Lot of relations in python points to references. And some nodes can return lot of those references such as call, subscript, tuple, attribute. I am here to group those dependences.').

	tSplatExpression := (builder newTraitNamed: #TSplatExpression) comment: 'My users are expressions that can be in a collection splat. For example in `[ *getList(), 3 ]`, we have a list splat on the call `getList()`. Get list, is the expression of the splat.'.

	(tSplatParameter := builder newTraitNamed: #TSplatParameter) comment: 'I represent a parameter that is a list or dictionary splat.'.

	tSplatParameterTarget := (builder newTraitNamed: #TSplatParameterTarget) comment: 'My users are parameter target in a splat. For example in `def f(*list): pass`, we have a list splat parameter named list.'.
	
	(tTypeContent := builder newTraitNamed: #TTypeContent) comment: 'My user can be used as a type declaration'.

	tUnaryOperator := builder newTraitNamed: #TUnaryOperator.
	
	tWithElseClause := builder newTraitNamed: #TWithElseClause.

	tWithStatementItem := (builder newTraitNamed: #TWithStatementItem) comment: 'I represent an entity that can be the item of a with_statement.'.

	(tWithTypeParameters := builder newTraitNamed: #TWithTypeParameters) comment: 'I represent an entity with type parameters such as generic types, function/method definition or class definition'.
	
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
	tWithComment := self remoteTrait: #TWithComments withPrefix: #FAST.
	tWithParameters := self remoteTrait: #TWithParameters withPrefix: #FAST.
	tWithStatements := self remoteTrait: #TWithStatements withPrefix: #FAST
]
