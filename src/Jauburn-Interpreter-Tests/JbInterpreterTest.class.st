Class {
	#name : #JbInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'innerInterpreter',
		'parser'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #utilities }
JbInterpreterTest >> innerInterpret: aString [

	^ innerInterpreter interpret: aString
]

{ #category : #utilities }
JbInterpreterTest >> interpret: aString [

	^ interpreter interpret: aString
]

{ #category : #running }
JbInterpreterTest >> setUp [

	parser := JbParser new.
	interpreter := JbInterpreter newWithStandardLibrary.
	innerInterpreter := JbInterpreter newWithStandardLibrary
]

{ #category : #running }
JbInterpreterTest >> testAbsoluteValue [

	"Tests abs(f) function in interpreter standardLibrary"

	self interpret: 'var a = abs(-1);'.
	self assert: (interpreter environment at: 'a') equals: 1.

	self interpret: 'var b = abs(2);'.
	self assert: (interpreter environment at: 'b') equals: 2.

	self interpret: 'var c = abs(0);'.
	self assert: (interpreter environment at: 'c') equals: 0.

	self interpret: 'var d = abs(10);'.
	self assert: (interpreter environment at: 'd') equals: 10.

	self interpret: 'var e = abs(-1 * 2 * 6);'.
	self assert: (interpreter environment at: 'e') equals: 12
]

{ #category : #running }
JbInterpreterTest >> testAndFunction [

	"Tests and(a,b) function in interpreter standardLibrary"

	"Test and (a,b) when a = true and b = true.  Test development code"

	self interpret: 'var c = function (a,b) {if (a) 
		{ if (b) { return true; } else { return false; } }
			else {return false;} };'.
	self interpret: 'var d = 1 == 1; var e = 2 > 1;'.
	self interpret: 'var f = c(d,e);'.
	self assert: (interpreter environment at: 'd') equals: true.
	self assert: (interpreter environment at: 'e') equals: true.
	self assert: (interpreter environment at: 'f') equals: true.

	"Test and (a,b) when a = true and b = false"
	self interpret: 'var g = c(d, 2 < 1);'.
	self assert: (interpreter environment at: 'g') equals: false.

	"Test and (a,b) when a = false and b = true"
	self interpret: 'var h = c(not(d), e);'.
	self assert: (interpreter environment at: 'h') equals: false.

	self interpret: 'var i = and(100 < 1, 50 > 1);'.
	self assert: (interpreter environment at: 'i') equals: false.

	"Test and (a,b) when a = true and b = true"
	self interpret: 'var j = and(100 > 1, 50 > 1);'.
	self assert: (interpreter environment at: 'j') equals: true.

	"Test and (a,b) when a = false and b = false"
	self interpret: 'var k = and(100 < 1, 50 < 1);'.
	self assert: (interpreter environment at: 'k') equals: false
]

{ #category : #running }
JbInterpreterTest >> testAssignmentChangesVariableToExpressionValue [

	self interpret: 'var x = 3 + 2 * 5; x = 99;'.
	self assert: (interpreter environment at: 'x') equals: 99
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionOrder [

	"Tests order of operation"

	self interpret: 'var x = 3 + 8 / 8;'.
	self assert: (interpreter environment at: 'x') equals: 4.

	self interpret: 'var x = 3 + 8 % 8 + 3;'.
	self assert: (interpreter environment at: 'x') equals: 6.

	self interpret: 'var x = 3 * 2 * 5 / 1;'.
	self assert: (interpreter environment at: 'x') equals: 30.

	self interpret: 'var y = 8 - 5 / 5 + 1;'.
	self assert: (interpreter environment at: 'y') equals: 8.

	self interpret: 'var y = 5 - 3 + 5;'.
	self assert: (interpreter environment at: 'y') equals: 7.

	self interpret: 'var y = 3 + 2 - 5 + 1;'.
	self assert: (interpreter environment at: 'y') equals: 1.

	self interpret: 'var y = 3 + 2 - 5 - 1;'.
	self assert: (interpreter environment at: 'y') equals: -1
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValue [

	self interpret: 'var x = 3 + 2 * 8;'.
	self assert: (interpreter environment at: 'x') equals: 19.

	self interpret: 'var x = 6;var y = 2*x;'.
	self assert: (interpreter environment at: 'y') equals: 12.

	self interpret: 'var x = 6;var y = x/2;'.
	self assert: (interpreter environment at: 'y') equals: 3.

	self interpret: 'var x = 8 - 7;'.
	self assert: (interpreter environment at: 'x') equals: 1.

	self interpret: 'var x = 8 / 8; x = x * 20;'.
	self assert: (interpreter environment at: 'x') equals: 20.

	self interpret: 'var x = 8 % 8;'.
	self assert: (interpreter environment at: 'x') equals: 0
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValueWithParentheses [

	self interpret: 'var x = (8 + 8) / 8;'.
	self assert: (interpreter environment at: 'x') equals: 2.

	self interpret: 'var x = (8 + 8) % 8;'.
	self assert: (interpreter environment at: 'x') equals: 0.

	self interpret: 'var x = (2.0 + 3.0) - (5.0 + 1.0);'.
	self assert: (interpreter environment at: 'x') equals: -1.0
]

{ #category : #running }
JbInterpreterTest >> testDeclarationCreatesVariable [

	self interpret: 'var x = 99;'.
	self assert: (interpreter environment includesKey: 'x')
]

{ #category : #running }
JbInterpreterTest >> testEnvironmentVariables [

	"Tests that outer environment cannot access inner environment variables, while inner can access 	the outer environment variables."

	| outer inner |
	outer := interpreter environment.
	inner := innerInterpreter environment.
	inner outerEnvironment: outer.

	"assign var a to inner environment and assert that a is found in inner environment"
	self innerInterpret: 'var a = function (x) {  x = x + 1; } ;'.
	self assert: (inner includesKey: 'a').

	"assert that a is not found in outer environment"
	self should: [ outer at: 'a' ] raise: KeyNotFound.

	"Now assign b and verify that it is in the outer environment."
	self interpret: 'var b = 2;'.
	self assert: (outer at: 'b') equals: 2.

	"Verify that b can also be found by the inner environment."
	self assert: (inner at: 'b') equals: 2
]

{ #category : #running }
JbInterpreterTest >> testFunctionCalls [

	"Test functions Calls basic functionality (also tests definitions)"

	"Tests return exception handler"

	self interpret: 'var a = function (x) { return 36; }; var b =  a(2);'.
	self assert: ((interpreter environment at: 'a') isKindOf: JbFunction).
	self assert: (interpreter environment at: 'b') equals: 36.

	"Test function call expressions"
	self interpret: 'var c = function (x) { return x + 2; };'.
	self interpret: 'var d = c(6);'.
	self assert: ((interpreter environment at: 'c') isKindOf: JbFunction).
	self assert: (interpreter environment at: 'd') equals: 8.

	"Test function call expressions with no spaces around return"
	self interpret:
		'var e = function (x,y) {return x + y;};  var f = e(3.2,5.1);'.
	self assert: ((interpreter environment at: 'e') isKindOf: JbFunction).
	self assert: (interpreter environment at: 'f') equals: 8.3.

	"Tests correct use of variable with various white space"
	self interpret:
		'var g = 0; var h = function (x, y) {g = x + y;}; var i = h (1, 2);'.
	self assert: ((interpreter environment at: 'h') isKindOf: JbFunction).
	self assert: (interpreter environment at: 'g') equals: 3 "does this overwrite original g? as g has to be definied before running test"
]

{ #category : #running }
JbInterpreterTest >> testFunctionCallsWithMultipleStatementsInBody [

	"Test functions Calls with Statements (also tests definitions)"

	"Test function call statements"

	self interpret:
		'var k = 5; var j = function (x, y) {k = x * y;}; j(10,2);'.
	self assert: ((interpreter environment at: 'j') isKindOf: JbFunction).
	self assert: (interpreter environment at: 'k') equals: 20.

	"Test multiple statements in body"
	self interpret:
		'var n = 2; var l = function (x, y) {x = x + 1; n = x + y;}; var m = l(2,3);'.
	self assert: ((interpreter environment at: 'l') isKindOf: JbFunction).
	self assert: (interpreter environment at: 'n') equals: 6.

	self interpret:
		'var useless = function (a, b, monkey) {print a+b-monkey; return 2*monkey;};'.
	self interpret: 'var x = useless(1, 2, 3);'.
	self assert:
		((interpreter environment at: 'useless') isKindOf: JbFunction).
	self assert: (interpreter environment at: 'x') equals: 6.

	self interpret:
		'var make_counter = function() { var c = 0; return function() { c = c + 1; return c; }; };'.
	self interpret: 'var c1 = make_counter();'.
	self interpret:
		'var c2 = make_counter(); var x = c1(); var y = c1(); var z = c2();'.
	self assert: (interpreter environment at: 'x') equals: 1.
	self assert: (interpreter environment at: 'y') equals: 2.
	self assert: (interpreter environment at: 'z') equals: 1  
]

{ #category : #running }
JbInterpreterTest >> testFunctionDefinitions [

	"Test Function Definitions"

	self interpret: 'var a = function (x) {x = 22;};'.
	self interpret: 'var b = function(x) {};'.
	self interpret: 'var c = function(x) {return 2 * x;};'.
	self interpret: 'var d = function (x, y) {return x + y;};'.
	self assert: ((interpreter environment at: 'a') isKindOf: JbFunction).
	self assert: ((interpreter environment at: 'b') isKindOf: JbFunction).
	self assert: ((interpreter environment at: 'c') isKindOf: JbFunction).
	self assert: ((interpreter environment at: 'd') isKindOf: JbFunction)
]

{ #category : #running }
JbInterpreterTest >> testGCD [

	"Tests gcd(a,b) function in interpreter standardLibrary"

	self interpret: 'var a = gcd(5, 100);'.
	self assert: (interpreter environment at: 'a') equals: 5.

	self interpret: 'var b = gcd(0, 100);'.
	self assert: (interpreter environment at: 'b') equals: 100.

	self interpret: 'var c = gcd(100, 0);'.
	self assert: (interpreter environment at: 'c') equals: 100.

	self interpret: 'var d = gcd(0, 0);'.
	self assert: (interpreter environment at: 'd') equals: 0.

	self interpret: 'var e = gcd(10000, 25);'.
	self assert: (interpreter environment at: 'e') equals: 25.

	self interpret: 'var e = gcd(-200, -5);'.
	self assert: (interpreter environment at: 'e') equals: 5
]

{ #category : #running }
JbInterpreterTest >> testIfElseStatements [

	"Test if-else statements"

	"Test condition is met"

	| result |
	result := 'var x = 1; var y = 5; if (x==1) {x = x + 1;} else {x = x + 2; y = y - 5;};'.
	self interpret: result.
	self assert: (interpreter environment at: 'x') equals: 2.
	self assert: (interpreter environment at: 'y') equals: 5.

	"Test condition is not met"
	result := 'var x = 10; if (x==1) {x = x + 1;} else {x = x + 2;};'.
	self interpret: result.
	self assert: (interpreter environment at: 'x') equals: 12.

	self interpret:
		'var x = 2; var y = 5; if (x==1) {x = x + 1;} else {x = x + 2; y = y - 5;};'.
	self assert: (interpreter environment at: 'x') equals: 4.
	self assert: (interpreter environment at: 'y') equals: 0
]

{ #category : #running }
JbInterpreterTest >> testIfStatements [

	"Test if statements"

	"Test condition is not met"

	self interpret:
		'var x = 2; var y = 6; if (x == 1) {x = x + 1; y = y - 5;}'.
	self assert: (interpreter environment at: 'x') equals: 2.
	self assert: (interpreter environment at: 'y') equals: 6.

	"Test condition is met"
	self interpret:
		'var x = 1; var y = 6; if (x == 1) {x = x + 1; y = y - 5;}'.
	self assert: (interpreter environment at: 'x') equals: 2.
	self assert: (interpreter environment at: 'y') equals: 1
]

{ #category : #running }
JbInterpreterTest >> testInputStatements [

	"Test input statements without UIManager default"

	| testUI env |
	testUI := TestUIManager new.
	env := interpreter environment.
	testUI input: '42'.
	env jbUIManager: testUI.
	self interpret: 'var x = 0; inputnum x;'.
	self assert: (env at: 'x') equals: 42

	"Uncomment below to manually test with UIManager default. 
	Note: this is also tested/implemented in small programs"


	"self interpret: 'inputnum a;'.
	self assert: (interpreter environment at: 'a') equals: 45"
]

{ #category : #running }
JbInterpreterTest >> testNotFunction [

	"Tests not(a) function in interpreter standardLibrary"

	"Test code to develop function"

	self interpret:
		'var b = function (a) { if (a) {return false;} else {return true;} };'.
	self interpret: 'var x = 1 == 1; var y = 1 == 1; var z = b(y);'.
	self assert: (interpreter environment at: 'x') equals: true.
	self assert: (interpreter environment at: 'y') equals: true.
	self assert: (interpreter environment at: 'z') equals: false.

	"Test not(b) when b is true"
	self interpret: 'var c = not(100 > 1);'.
	self assert: (interpreter environment at: 'c') equals: false.

	"Test not(b) when b is false"
	self interpret: 'var d = not(1 > 100);'.
	self assert: (interpreter environment at: 'd') equals: true
]

{ #category : #running }
JbInterpreterTest >> testOrFunction [

	"Tests or(a,b) function in interpreter standardLibrary"

	"Test or(a,b)development code"

	self interpret: 'var c = function (a,b) { if (a) { return true; } 
		else { if (b) { return true; } 
			else { return false; } } };'.
	self interpret: 'var d = 1 == 1; var e = 2 > 1;'.
	self interpret: 'var f = c(d,e);'.
	self assert: (interpreter environment at: 'd') equals: true.
	self assert: (interpreter environment at: 'e') equals: true.
	self assert: (interpreter environment at: 'f') equals: true.

	"Test and (a,b) when a = true, b = false"
	self interpret: 'var g = c(d, 2 < 1);'.
	self assert: (interpreter environment at: 'g') equals: true.

	"Test or (a,b) when a = false, b = true"
	self interpret: 'var h = c(not(d), e);'.
	self assert: (interpreter environment at: 'h') equals: true.

	self interpret: 'var i = or(100 < 1, 50 > 1);'.
	self assert: (interpreter environment at: 'i') equals: true.

	"Test or (a,b) when a = true, b = true"
	self interpret: 'var j = or(100 > 1, 50 > 1);'.
	self assert: (interpreter environment at: 'j') equals: true.

	"Test and (a,b) when a = false, b = false"
	self interpret: 'var k = or(100 < 1, 50 < 1);'.
	self assert: (interpreter environment at: 'k') equals: false.

	self interpret: 'var l = not(or(100 < 1, 50 < 1));'.
	self assert: (interpreter environment at: 'l') equals: true
]

{ #category : #running }
JbInterpreterTest >> testPrintStatements [

	"Test  printStatements without Transcript"

	| test env |
	test := TestTranscript new.
	env := interpreter environment.
	test value: 80.
	env jbTranscript: test.
	self interpret: 'var x = 80; print x;'.
	self assert: (env at: 'x') equals: 80
]

{ #category : #running }
JbInterpreterTest >> testReturnStatements [

	"Test return statements throw exception"

	self
		should: [ self interpret: 'return 37;' ]
		raise: JbReturnException.

	self interpret: 'var x = 2;'.
	self
		should: [ self interpret: 'return x + 2;' ]
		raise: JbReturnException
]

{ #category : #running }
JbInterpreterTest >> testSquareRoot [

	"Newtons sqrt = 0.5 * (y + x/y) with y being a guess"

	"Test code to develop function"

	self interpret: 'var a = 16; var b = a / 2; var c = 100;  
		while (c > 1) {b = 0.5 * (b + a/b); c = c - 1;};'.
	self assert: (interpreter environment at: 'a') equals: 16.
	self assert: (interpreter environment at: 'b') equals: 4.

	self interpret:
		'var d = function (e) { var f = e / 2; var g = 100; while (g > 1) {f = 0.5 * (f + e/f); g = g - 1;} return f;}; var h = d(25);'.
	self assert: (interpreter environment at: 'h') equals: 5.

	self interpret: 'var i = sqrt(100);'.
	self assert: (interpreter environment at: 'i') equals: 10.

	"Test sqrt(1) returns 1"
	self interpret: 'var j = sqrt(1);'.
	self assert: (interpreter environment at: 'j') equals: 1.

	"Test sqrt(float)"
	self interpret: 'var k = sqrt(0.25);'.
	self assert: (interpreter environment at: 'k') equals: 0.5.

	"Test sqrt(x) returns a float"
	self interpret: 'var l = sqrt(7.29);'.
	self assert: (interpreter environment at: 'l') equals: 2.7.
	self interpret: 'var m = sqrt(0.000001);'.
	self assert: (interpreter environment at: 'm') equals: 0.001.

	"Test sqrt(0)"
	self interpret: 'var n = sqrt(0);'.
	self assert: (interpreter environment at: 'n') equals: 0
]

{ #category : #running }
JbInterpreterTest >> testWhileStatements [

	"Test while statements"

	"Test condition is not met"

	self interpret:
		'var x = 2; var y = 6; while (x < 2) {x = x + 1; y = y - 5;}'.
	self assert: (interpreter environment at: 'x') equals: 2.
	self assert: (interpreter environment at: 'y') equals: 6.

	"Test condition is met"
	self interpret:
		'var x = 1; var y = 6; while (x == 1) {x = x + 1; y = y - 5;}'.
	self assert: (interpreter environment at: 'x') equals: 2.
	self assert: (interpreter environment at: 'y') equals: 1.

	self interpret:
		'var x = 0; var y = 6; while (y > 0) {x = x + 1; y = y - 1;}'.
	self assert: (interpreter environment at: 'x') equals: 6.
	self assert: (interpreter environment at: 'y') equals: 0.

]
