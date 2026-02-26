"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fromImportModule` | `FASTPyImportFromStatement` | `import` | `FASTPyFromImportModule` | Module in which the imported entities should be looked for. `from datetime import date` has `datetime` as fromModule..|



"
Class {
	#name : 'FASTPyImportFromStatement',
	#superclass : 'FASTPyImport',
	#instVars : [
		'#fromImportModule => FMMany type: #FASTPyFromImportModule opposite: #import'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyImportFromStatement class >> annotation [

	<FMClass: #ImportFromStatement super: #FASTPyImport>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyImportFromStatement >> addFromImportModule: anObject [
	<generated>
	^ self fromImportModule add: anObject
]

{ #category : 'accessing' }
FASTPyImportFromStatement >> fromImportModule [
	"Relation named: #fromImportModule type: #FASTPyFromImportModule opposite: #import"

	<generated>
	<FMComment: 'Module in which the imported entities should be looked for. `from datetime import date` has `datetime` as fromModule..'>
	<derived>
	^ fromImportModule
]

{ #category : 'accessing' }
FASTPyImportFromStatement >> fromImportModule: anObject [

	<generated>
	fromImportModule value: anObject
]

{ #category : 'navigation' }
FASTPyImportFromStatement >> fromImportModuleGroup [
	<generated>
	<navigation: 'FromImportModule'>
	^ MooseSpecializedGroup withAll: self fromImportModule asSet
]
