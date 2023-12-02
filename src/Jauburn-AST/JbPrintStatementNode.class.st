"
Abstract Syntax Tree Node class for print statement
 
Internal Representation and Key Implementation Points.

	 Overrides:
	executeIn:

    Instance Variables
	expression:		<Object>


    Implementation Points
"
Class {
	#name : #JbPrintStatementNode,
	#superclass : #JbAbstractSyntaxTreeNode,
	#instVars : [
		'expression'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbPrintStatementNode >> expression [

	^ expression
]

{ #category : #accessing }
JbPrintStatementNode >> expression: anObject [

	expression := anObject
]
