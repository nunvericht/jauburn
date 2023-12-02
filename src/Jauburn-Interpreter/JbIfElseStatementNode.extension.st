Extension { #name : #JbIfElseStatementNode }

{ #category : #'*Jauburn-Interpreter' }
JbIfElseStatementNode >> executeIn: environment [

	"If-else statement exuction in interpreter"

	(self condition evaluateIn: environment)
		ifTrue: [ 
		self thenStatements do: [ :each | each executeIn: environment ] ]
		ifFalse: [ 
		self elseStatements do: [ :each | each executeIn: environment ] ]
]
