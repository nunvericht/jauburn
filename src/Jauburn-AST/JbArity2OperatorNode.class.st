"
Abstract Syntax Tree Parent Class for Operator Nodes.
Subclass of JbAbstractSyntaxTreeNode 
 
Internal Representation and Key Implementation Points.

	 Overrides:
	evaluateIn:
	
	 Overridden:
	operator
	
	 Instance Variables
	lhs:		<Object>
	rhs:		<Object>

    Implementation Points
"
Class {
	#name : #JbArity2OperatorNode,
	#superclass : #JbAbstractSyntaxTreeNode,
	#instVars : [
		'lhs',
		'rhs'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbArity2OperatorNode >> lhs [
	^ lhs
]

{ #category : #accessing }
JbArity2OperatorNode >> lhs: anObject [
	lhs := anObject
]

{ #category : #accessing }
JbArity2OperatorNode >> operator [

	^ self subclassResponsibility 
]

{ #category : #accessing }
JbArity2OperatorNode >> rhs [
	^ rhs
]

{ #category : #accessing }
JbArity2OperatorNode >> rhs: anObject [
	rhs := anObject
]
