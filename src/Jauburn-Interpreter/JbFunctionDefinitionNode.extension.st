Extension { #name : #JbFunctionDefinitionNode }

{ #category : #'*Jauburn-Interpreter' }
JbFunctionDefinitionNode >> evaluateIn: environment [

	"When a function definition is evaluated in the interpreter, create an instance of JbFunction"


	^ JbFunction new
		  parameters: self parameters;
		  body: self body;
		  environment: environment;
		  yourself
]
