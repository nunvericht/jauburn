"
Abstract Syntax Tree class for Identifier Expression Nodes
Subclass of JbAbstractSyntaxTreeNode 
 
Internal Representation and Key Implementation Points.

	 Overrides:
	evaluateIn:

    Instance Variables
	identifier:		<Object>


 Implementation Points
"
Class {
	#name : #JbIdentifierExpressionNode,
	#superclass : #JbAbstractSyntaxTreeNode,
	#instVars : [
		'identifier'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbIdentifierExpressionNode >> identifier [
	^ identifier
]

{ #category : #accessing }
JbIdentifierExpressionNode >> identifier: anObject [
	identifier := anObject
]
