"
Abstract Syntax Tree  for Function Calls-created when a function call is encountered
Subclass of JbAbstractSyntaxTreeNode 

Internal Representation and Key Implementation Points.

	 Overrides:
	evaluateIn:
	executeIn:

    Instance Variables
	arguments:		<Object>
	identifier:		<Object>

    Implementation Points:
	When a function call is evaluated, (like f(5)), create an environment (JbEnvironment) with the parameters bound
	to the values passed as arguments and evaluate the body in that environment. 
	Note that function calls can be statements (doIt(10);) or expressions (var y = 2*f(3);) so you will need to implement both evaluateIn:
	and executeIn:.
"
Class {
	#name : #JbFunctionCallNode,
	#superclass : #JbAbstractSyntaxTreeNode,
	#instVars : [
		'identifier',
		'arguments'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbFunctionCallNode >> arguments [
	^ arguments
]

{ #category : #accessing }
JbFunctionCallNode >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
JbFunctionCallNode >> identifier [
	^ identifier
]

{ #category : #accessing }
JbFunctionCallNode >> identifier: anObject [
	identifier := anObject
]
