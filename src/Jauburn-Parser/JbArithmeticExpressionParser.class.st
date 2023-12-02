"
I parse arithmetic expressions
"
Class {
	#name : #JbArithmeticExpressionParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'arithmeticExpression',
		'numberExpression',
		'identifierExpression',
		'identifier',
		'arithmeticTerm',
		'arithmeticFactor'
	],
	#category : #'Jauburn-Parser-Core'
}

{ #category : #accessing }
JbArithmeticExpressionParser class >> dependencies [

	^ { JbNumberParser }
]

{ #category : #'non-terminals' }
JbArithmeticExpressionParser >> arithmeticExpression [

	^ ((arithmeticTerm separatedBy: ('+' asParser / '-' asParser) trim) 
		   foldLeft: [ :a :op :b | 
			   op = '+'
				   ifTrue: [ 
					   JbAdditionNode new
						   lhs: a;
						   rhs: b;
						   yourself ]
				   ifFalse: [ 
					   JbSubtractionNode new
						   lhs: a;
						   rhs: b;
						   yourself ] ]) / arithmeticTerm
]

{ #category : #'non-terminals' }
JbArithmeticExpressionParser >> arithmeticFactor [

	^ '(' asParser trim , arithmeticExpression , ')' asParser trim
	  ==> [ :arr | arr second ] / numberExpression
	   / identifierExpression
]

{ #category : #'non-terminals' }
JbArithmeticExpressionParser >> arithmeticTerm [

	^ ((arithmeticFactor separatedBy:
		    ('*' asParser / '/' asParser / '%' asParser) trim) foldLeft: [ 
		   :a 
		   :op 
		   :b | 
		   op = '*'
			   ifTrue: [ 
				   JbMultiplicationNode new
					   lhs: a;
					   rhs: b;
					   yourself ]
			   ifFalse: [ 
				   op = '/'
					   ifTrue: [ 
						   JbDivisionNode new
							   lhs: a;
							   rhs: b;
							   yourself ]
					   ifFalse: [ 
						   JbModuloNode new
							   lhs: a;
							   rhs: b;
							   yourself ] ] ]) / arithmeticFactor
]

{ #category : #'non-terminals' }
JbArithmeticExpressionParser >> identifier [

	^ (#letter asParser
	   , (#letter asParser / #digit asParser / $_ asParser) star) flatten
		  trim
]

{ #category : #'non-terminals' }
JbArithmeticExpressionParser >> identifierExpression [

	^ identifier ==> [ :arr | 
	  JbIdentifierExpressionNode new
		  identifier: arr;
		  yourself ]
]

{ #category : #'non-terminals' }
JbArithmeticExpressionParser >> numberExpression [

	^ (self dependencyAt: JbNumberParser) number ==> [ :n | 
	  JbConstantExpressionNode new
		  value: n;
		  yourself ]
]

{ #category : #accessing }
JbArithmeticExpressionParser >> start [ 

	^arithmeticExpression 
]
