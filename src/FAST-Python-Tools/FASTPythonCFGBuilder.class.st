"
I am a class taking a FAST Python entity and returning a Control Flow Graph.

If we have multiple end blocks in a method, we create a virtual `FASTNullBlock` to have only one end point. In the case of Python, this node represents a **`return None`** that is the implicite return of functions in Python.
"
Class {
	#name : 'FASTPythonCFGBuilder',
	#superclass : 'FASTGenericCFGBuilder',
	#category : 'FAST-Python-Tools-CFG/DataFlow',
	#package : 'FAST-Python-Tools',
	#tag : 'CFG/DataFlow'
}

{ #category : 'initialization' }
FASTPythonCFGBuilder >> initialize [

	super initialize.
	self cfgVisitor: FASTPythonCFGVisitor new
]
