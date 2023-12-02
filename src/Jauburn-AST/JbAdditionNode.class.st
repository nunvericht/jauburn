"
Subclass of JbArityOperatorNode
Abstract Syntax Tree Parent Class for Operator Nodes.
Subclass of JbAbstractSyntaxTreeNode 
 
Internal Representation and Key Implementation Points.
 
Overrides:
	operator

Inherits

    Instance Variables
	lhs:		<Object>
	rhs:		<Object>

Operator Method returns subclass operator

"
Class {
	#name : #JbAdditionNode,
	#superclass : #JbArity2OperatorNode,
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbAdditionNode >> operator [

	^ $+
]
