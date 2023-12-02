"
I handle the parsing of numbers is Jauburn.  I'm basically the CPIntegerParser introduced in the class videos.
Updated to support integers and floats. Integer method was changed to Number method.

instance variables:

	digit
	digitNotZero
	number
"
Class {
	#name : #JbNumberParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'digitNotZero',
		'digit',
		'number'
	],
	#category : #'Jauburn-Parser-Core'
}

{ #category : #'non-terminals' }
JbNumberParser >> digit [

	^$0 asParser / digitNotZero
]

{ #category : #'non-terminals' }
JbNumberParser >> digitNotZero [

	^$1 asParser / $2 asParser / $3 asParser 
								/ $4 asParser / $5 asParser / $6 asParser
								/ $7 asParser / $8 asParser / $9 asParser
]

{ #category : #'non-terminals' }
JbNumberParser >> integer [

	^($- asParser optional , digitNotZero , digit star / $0 asParser) flatten 
			==> [ :str | str asNumber ]
]

{ #category : #'non-terminals' }
JbNumberParser >> number [

	"Parses a float or an integer"
	
^ ($- asParser optional , digitNotZero , digit star / $0 asParser
	   , ($. asParser , digit star) optional
	   / ($- asParser , $0 asParser , $. asParser , digit star)
	   / ($0 asParser , $. asParser , digit star)) flatten
	  ==> [ :str | str asNumber ]
]

{ #category : #accessing }
JbNumberParser >> start [

	"Answer the production to start this parser with."

	^ number
]
