"
TestTranscript utilized to test print statements. 
 
Internal Representation and Key Implementation Points.

    Instance Variables
	cr 
	value:		<Object>


    Implementation Points
"
Class {
	#name : #TestTranscript,
	#superclass : #Object,
	#instVars : [
		'cr',
		'value'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #accessing }
TestTranscript >> cr [

	"Returns a cr-required for testing jbPrintStatement"

	^ cr
]

{ #category : #accessing }
TestTranscript >> show: anObject [

	"Returns the test value instead of executing in a Transcript"

	^ value
]

{ #category : #accessing }
TestTranscript >> value: anObject [

	"Assigns a value-required for testing jbPrintStatement"

	value := anObject
]
