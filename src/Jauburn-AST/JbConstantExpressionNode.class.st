"
Abstract Syntax Tree class for Constant Expression Nodes
Subclass of JbAbstractSyntaxTreeNode 
 
Internal Representation and Key Implementation Points.

	 Overrides:
	evaluateIn:
	value

    Instance Variables
	value:		<Object>

    Implementation Points
"
Class {
	#name : #JbConstantExpressionNode,
	#superclass : #JbAbstractSyntaxTreeNode,
	#instVars : [
		'value'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbConstantExpressionNode >> value [
	^ value
]

{ #category : #accessing }
JbConstantExpressionNode >> value: anObject [
	value := anObject
]
