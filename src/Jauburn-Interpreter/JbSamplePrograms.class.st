"
Just a place to house a few sample programs 

gcdInputNum computes the gcd of a number 
sqrtInputNUm computes the sqrt of a number
"
Class {
	#name : #JbSamplePrograms,
	#superclass : #Object,
	#category : #'Jauburn-Interpreter-SamplePrograms'
}

{ #category : #'sample programs' }
JbSamplePrograms class >> assignAndPrint [

	"self run: self assignAndPrint"

	^ '
var x = 19;
var y = 32 * ( x + 5 ) * x;
print x;
print y;
print 5*y;'
]

{ #category : #'sample programs' }
JbSamplePrograms class >> gcdInputNum [

	"Computes the gcd of two numbers based on Euclid's algorithm "

	"self run: self gcdInputNum"

	Transcript
		show:
			'Please enter 2 numbers in the input boxes and this program will calculate the gcd(a,b)';
		cr.

	^ '	inputnum x; 
		inputnum y;
		var result = gcd(x,y);
		print result;'
]

{ #category : #'sample programs' }
JbSamplePrograms class >> noFunctions [

	"self run: self noFunctions"

	^ 'var x = 4;
var y = 10 * x + 2;
print y;
'
]

{ #category : #utilities }
JbSamplePrograms class >> run: aString [

	"Look at sample programs for examples of using this method."

	^ JbInterpreter newWithStandardLibrary run: aString
]

{ #category : #'sample programs' }
JbSamplePrograms class >> sqrtInputNum [

	"Computes the sqrt of a number using Newtons sqrt = 0.5 * (y + x/y) with y being a guess"

	"self run: self sqrtInputNum"

	Transcript
		show:
			'Please enter a number > 0 and this program will calculate the sqrt!';
		cr.
	^ '	inputnum num; 
		var result = sqrt(num);
		print result;'
]

{ #category : #'sample programs' }
JbSamplePrograms class >> testProgram [

	"self run: self testProgram"

	^ 'var x = and ( 3 > 1, 1 < 2 );
		print x;'
]
