"
Abstract Syntax Tree Node class for If-else statement
Subclass of JbIfStatementNode


<if-else-statement> ::=
   if '(' <expression> ')' <statement-block> else <statement-block>
 
Internal Representation and Key Implementation Points.

	Overrides:
	executeIn:
	
   Inherited Instance Variables
	condition:		<Object>
	thenStatements:		<Object>

   Instance Variables
	elseStatements:		<Object>


 Implementation Points
"
Class {
	#name : #JbIfElseStatementNode,
	#superclass : #JbIfStatementNode,
	#instVars : [
		'elseStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbIfElseStatementNode >> elseStatements [

	^ elseStatements
]

{ #category : #accessing }
JbIfElseStatementNode >> elseStatements: anObject [

	elseStatements := anObject
]
