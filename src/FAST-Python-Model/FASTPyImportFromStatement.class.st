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
		'#fromImportModule => FMOne type: #FASTPyFromImportModule opposite: #import'
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

{ #category : 'accessing' }
FASTPyImportFromStatement >> fromImportModule [
	"Relation named: #fromImportModule type: #FASTPyFromImportModule opposite: #import"

	<generated>
	<FMComment: 'Module in which the imported entities should be looked for. `from datetime import date` has `datetime` as fromModule..'>
	^ fromImportModule
]

{ #category : 'accessing' }
FASTPyImportFromStatement >> fromImportModule: anObject [

	<generated>
	fromImportModule := anObject
]

{ #category : 'navigation' }
FASTPyImportFromStatement >> fromImportModuleGroup [
	<generated>
	<navigation: 'FromImportModule'>
	^ MooseSpecializedGroup with: self fromImportModule
]
