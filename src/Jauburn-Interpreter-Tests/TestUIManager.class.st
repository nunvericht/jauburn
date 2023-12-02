"
TestUI utilized to test inputnum. 
 
Internal Representation and Key Implementation Points.

    Instance Variables
	input:		<Object>


    Implementation Points
"
Class {
	#name : #TestUIManager,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #services }
TestUIManager >> input: aString [

	"Assigns the test input-returned by textEntry:  
	This method is used in testing instead of presenting a text entry box"

	input := aString
]

{ #category : #services }
TestUIManager >> textEntry: aString [

	"Returns the test input instead of presenting a text entry box"

	^ input
]
