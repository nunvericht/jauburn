"
Abstract Syntax Tree Node class for Program Node
 
Internal Representation and Key Implementation Points.

	 Overrides:
	executeIn:


    Instance Variables
	statements:		<Object>


    Implementation Points
"
Class {
	#name : #JbProgramNode,
	#superclass : #JbAbstractSyntaxTreeNode,
	#instVars : [
		'statements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbProgramNode >> statements [
	^ statements
]

{ #category : #accessing }
JbProgramNode >> statements: anObject [
	statements := anObject
]
