"
Subclass of JbArityOperatorNode
 
Inherits

    Instance Variables
	lhs:		<Object>
	rhs:		<Object>

Operator Method returns subclass operator
"
Class {
	#name : #JbMultiplicationNode,
	#superclass : #JbArity2OperatorNode,
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbMultiplicationNode >> operator [

	^ $*
]
