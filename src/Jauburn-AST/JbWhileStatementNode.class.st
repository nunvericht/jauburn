"
Abstract syntax tree node class for while statement
 
Internal Representation and Key Implementation Points.

    Instance Variables
	condition:		<Object>
	doStatements:		<Object>


    Implementation Points
"
Class {
	#name : #JbWhileStatementNode,
	#superclass : #JbAbstractSyntaxTreeNode,
	#instVars : [
		'condition',
		'doStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbWhileStatementNode >> condition [

	^ condition
]

{ #category : #accessing }
JbWhileStatementNode >> condition: anObject [

	condition:= anObject
]

{ #category : #accessing }
JbWhileStatementNode >> doStatements [

	^ doStatements
]

{ #category : #accessing }
JbWhileStatementNode >> doStatements: anObject [

	doStatements := anObject
]
