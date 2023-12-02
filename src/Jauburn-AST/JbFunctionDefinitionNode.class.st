"
AST for Function Definitions-created when a function definition is encountered.

<function-definition-expression> ::=
   function '(' <identifier-list> ')' <statement-block>

Internal Representation and Key Implementation Points.

    Instance Variables
	body:		<Object>
	parameters:		<Object>


    Implementation Points

When a function definition is evaluated, the interpreter should create an instance of JbFunction (this class is
included), filling in its instance variables appropriately.  When a function (like function(x) { return 2 *
x; }) is evaluated, we create a value (a JbFunction).
"
Class {
	#name : #JbFunctionDefinitionNode,
	#superclass : #JbAbstractSyntaxTreeNode,
	#instVars : [
		'body',
		'parameters'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbFunctionDefinitionNode >> body [
	^ body
]

{ #category : #accessing }
JbFunctionDefinitionNode >> body: anObject [
	body := anObject
]

{ #category : #accessing }
JbFunctionDefinitionNode >> parameters [
	^ parameters
]

{ #category : #accessing }
JbFunctionDefinitionNode >> parameters: anObject [
	parameters := anObject
]
