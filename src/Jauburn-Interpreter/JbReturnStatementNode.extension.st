Extension { #name : #JbReturnStatementNode }

{ #category : #'*Jauburn-Interpreter' }
JbReturnStatementNode >> executeIn: environment [

	"When a return statement is executed, its operand should be evaluated (it is an expression) and returned to whoever
	called the function without evaluating any additional statements in the function using a custom exception handler"

	| returnValue returnExc |
	returnValue := expression evaluateIn: environment.
	returnExc := JbReturnException new returnValue: returnValue.
	returnExc signal
]
