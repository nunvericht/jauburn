"
Abstract Syntax Tree Return Statement Node-created when a return statement is encountered.

Internal Representation and Key Implementation Points.

	 Overrides:
	executeIn:

    Instance Variables
	expression:		<Object>


    Implementation Points:

When a return statement is executed, its operand should be evaluated (it is an expression) and returned to whoever
called the function without evaluating any additional statements in the function. Uses a custom exception.
"
Class {
	#name : #JbReturnStatementNode,
	#superclass : #JbAbstractSyntaxTreeNode,
	#instVars : [
		'expression'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbReturnStatementNode >> expression [
	^ expression
]

{ #category : #accessing }
JbReturnStatementNode >> expression: anObject [
	expression := anObject
]
