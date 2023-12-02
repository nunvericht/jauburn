"
Abstract Syntax Tree Node class for inputnum statement
Subclass of JbAbstractSyntaxTreeNode

 	Overrides:
	executeIn:
	

	Instance Variables
	identifier:		<Object>


   Implementation Points
	When an inputnum statement executes, opens an input dialog with 
	JbUIManager (UIManager default).  ui is overriden in tests.
"
Class {
	#name : #JbInputStatementNode,
	#superclass : #JbAbstractSyntaxTreeNode,
	#instVars : [
		'identifier'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbInputStatementNode >> identifier [

	^ identifier
]

{ #category : #accessing }
JbInputStatementNode >> identifier: anObject [

	identifier:= anObject
]
