"
Abstract Syntax Tree for Variable Declaration Statements

Internal Representation and Key Implementation Points.

	 Overrides:
	executeIn:
 
    Instance Variables
	expression:		<Object>
	identifier:		<Object>


    Implementation Points
"
Class {
	#name : #JbVariableDeclarationStatementNode,
	#superclass : #JbAbstractSyntaxTreeNode,
	#instVars : [
		'identifier',
		'expression'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbVariableDeclarationStatementNode >> expression [
	^ expression
]

{ #category : #accessing }
JbVariableDeclarationStatementNode >> expression: anObject [
	expression := anObject
]

{ #category : #accessing }
JbVariableDeclarationStatementNode >> identifier [
	^ identifier
]

{ #category : #accessing }
JbVariableDeclarationStatementNode >> identifier: anObject [
	identifier := anObject
]
