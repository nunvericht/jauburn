"
I am an interpreter for programs written in the Jauburn language.  My principle API methods are:

	interpret: anAST -- given an abstract syntax tree, interpret it
	run: aString -- parse and interpret the supplied string
"
Class {
	#name : #JbInterpreter,
	#superclass : #Object,
	#instVars : [
		'environment',
		'jbUIManager'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #functions }
JbInterpreter class >> newWithStandardLibrary [

	^ self new interpret: self standardLibrary
]

{ #category : #functions }
JbInterpreter class >> standardLibrary [

	"Defines function utilized in newWithStandardLibrary:
	not(b), and(a,b), or(a,b), abs(f), sqrt(x), gcd(a,b) 
	
	Newtons sqrt: 0.5 * (y + x/y) with y being a guess.
	
	Euclid's gcd: If a = 0, then gcd a,b) = b 
		If b= 0; then gcd(a,b) = a;  Else write a in quotient remainder form (a = b * q + r)
		Find gcd(b,r) since gcd(a,b) = gcd(b,r)."

	^ 'var not = function (b) { if (b) { return false; } 
			else { return true; } };
	
		var and = function (a,b) {if (a) 
						{ if (b) { return true; }
							 else { return false; } }
								else { return false; } };
								
		var or = function (a,b) { if (a) { return true; } 
					else { if (b) { return true; } 
						else { return false; } } };
					
		var abs = function (x) { if (x >= 0) { return x;} 
					else {return x * -1;} };
	
		var sqrt = function (x) { if (x == 0) { return 0; } 
							else { var y = 1; var z = 100;
        						while (z > 1) {
            						y = 0.5 * (y + x / y); z = z - 1; }
        								return y; } };
								
		var gcd = function (a, b) {if (b == 0) { return a; } 
			else { return gcd(abs(b), abs(a % b)) ; } };'
]

{ #category : #accessing }
JbInterpreter >> environment [ 

	^environment
]

{ #category : #initialization }
JbInterpreter >> initialize [

	super initialize.
	environment := JbEnvironment new
]

{ #category : #api }
JbInterpreter >> interpret: programString [

	| ast |
	ast := self parse: programString.
	self interpretAst: ast
]

{ #category : #api }
JbInterpreter >> interpretAst: ast [

	^ ast executeIn: environment
]

{ #category : #api }
JbInterpreter >> jbUIManager [

	^ jbUIManager ifNil: [ UIManager default ]
]

{ #category : #api }
JbInterpreter >> jbUIManager: aUIManager [

	jbUIManager := aUIManager
]

{ #category : #api }
JbInterpreter >> parse: programString [

	| parser |
	parser := JbParser new.
	^(parser parse: programString)
]

{ #category : #api }
JbInterpreter >> run: programString [

	"Just an alias for #interpret:"

	self interpret: programString
]
