Extension { #name : #JbIfStatementNode }

{ #category : #'*Jauburn-Interpreter' }
JbIfStatementNode >> executeIn: environment [

	"If statement exuction in interpreter"

	(self condition evaluateIn: environment) ifTrue: [ 
		self thenStatements do: [ :each | each executeIn: environment ] ]
]
