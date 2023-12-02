Extension { #name : #JbInputStatementNode }

{ #category : #'*Jauburn-Interpreter' }
JbInputStatementNode >> executeIn: environment [

	"Opens an input dialog when an inputnum statement executes in interpreter"

	| input |
	input := environment jbUIManager textEntry: 'Enter a number'.
	environment at: self identifier put: input asNumber
]
