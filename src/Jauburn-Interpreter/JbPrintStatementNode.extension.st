Extension { #name : #JbPrintStatementNode }

{ #category : #'*Jauburn-Interpreter' }
JbPrintStatementNode >> executeIn: anEnvironment [

	| value |
	value := expression evaluateIn: anEnvironment.
	
	anEnvironment jbTranscript
		show: value;
		cr
]
