Class {
	#name : 'FASTPythonEntityTest',
	#superclass : 'TestCase',
	#category : 'FAST-Python-Model-Tests',
	#package : 'FAST-Python-Model-Tests'
}

{ #category : 'tests' }
FASTPythonEntityTest >> testInstantiation [
	"This test is here as a first basic test to setup the CI."

	self shouldnt: [ FASTPythonEntity new ] raise: Error
]
