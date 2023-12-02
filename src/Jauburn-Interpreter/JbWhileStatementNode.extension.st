Extension { #name : #JbWhileStatementNode }

{ #category : #'*Jauburn-Interpreter' }
JbWhileStatementNode >> executeIn: environment [

	"While statement exuction in interpreter"

	[ self condition evaluateIn: environment ] whileTrue: [ 
		self doStatements do: [ :each | each executeIn: environment ] ]
]
