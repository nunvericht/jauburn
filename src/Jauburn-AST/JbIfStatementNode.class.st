"
Abstract Syntax Tree Node Parent Class for If then statement
Subclass of JbAbstractSyntaxTreeNode 
Subclass: JbIfElseStatementNode

<if-statement> ::=
if '(' <expression> ')' <statement-block>

Internal Representation and Key Implementation Points.

	 Overrides:
	executeIn:
	
	 Overridden:
	executeIn:

	 Instance Variables
	condition:		<Object>
	thenStatements:		<Object>
			
			
 Implementation Points

"
Class {
	#name : #JbIfStatementNode,
	#superclass : #JbAbstractSyntaxTreeNode,
	#instVars : [
		'condition',
		'thenStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbIfStatementNode >> condition [

	^ condition
]

{ #category : #accessing }
JbIfStatementNode >> condition: anObject [

	condition := anObject
]

{ #category : #accessing }
JbIfStatementNode >> thenStatements [

	^ thenStatements
]

{ #category : #accessing }
JbIfStatementNode >> thenStatements: anObject [

	thenStatements := anObject
]
