Extension { #name : #JbFunctionCallNode }

{ #category : #'*Jauburn-Interpreter' }
JbFunctionCallNode >> evaluateIn: environment [

	"When a function call is evaluated, (like f(5)), create an environment (JbEnvironment) with the parameters bound
to the values passed as arguments and evaluate the body in that environment. 
Note that function calls can be statements (doIt(10);) or expressions (var y = 2*f(3);) "

	| argValues function newEnv |
	function := environment at: identifier. "look up function identifier"
	newEnv := JbEnvironment new. "Create a new JbEnvironment"
	newEnv outerEnvironment: function environment.
	argValues := arguments collect: [ :arg | arg evaluateIn: environment ].

	^ function call: argValues in: newEnv
]

{ #category : #'*Jauburn-Interpreter' }
JbFunctionCallNode >> executeIn: environment [

	"When a function call is evaluated, (like f(5)), create an environment (JbEnvironment) with the parameters bound
to the values passed as arguments and evaluate the body in that environment. 
Note that function calls can be statements (doIt(10);) or expressions (var y = 2*f(3);) "

	| argValues function newEnv |
	function := environment at: identifier. "look up function identifier"
	newEnv := JbEnvironment new. "Create a new JbEnvironment"
	newEnv outerEnvironment: function environment.
	argValues := arguments collect: [ :arg | arg evaluateIn: environment ].

	^ function call: argValues in: newEnv
]
