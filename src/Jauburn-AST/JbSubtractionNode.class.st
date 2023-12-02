"
Subclass of JbArityOperatorNode
 
Inherits

    Instance Variables
	lhs:		<Object>
	rhs:		<Object>

Operator Method returns subclass operator
"
Class {
	#name : #JbSubtractionNode,
	#superclass : #JbArity2OperatorNode,
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbSubtractionNode >> operator [

	^ $-
]
