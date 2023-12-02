"
Custom Exception Class for function return statements

    Instance Variables
	returnValue:		<Object>


    Implementation Points
"
Class {
	#name : #JbReturnException,
	#superclass : #Error,
	#instVars : [
		'returnValue'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #accessing }
JbReturnException >> returnValue [

	^ returnValue
]

{ #category : #accessing }
JbReturnException >> returnValue: anObject [


	returnValue := anObject
]
