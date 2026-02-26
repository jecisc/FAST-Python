"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `import` | `FASTPyFromImportModule` | `fromImportModule` | `FASTPyImportFromStatement` | Import declaring me as from import module.|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `segments` | `String` | nil | The segments of the module path. For example if you declare `xml.etree.ElementTree` as module, the segments will be { 'xml' . 'etree' . 'ElementTree'}.|

"
Class {
	#name : 'FASTPyFromImportModule',
	#superclass : 'FASTPyEntity',
	#instVars : [
		'#import => FMOne type: #FASTPyImportFromStatement opposite: #fromImportModule',
		'#segments => FMProperty'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyFromImportModule class >> annotation [

	<FMClass: #FromImportModule super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyFromImportModule >> addSegments: aCollection [

	segments := segments , aCollection
]

{ #category : 'accessing' }
FASTPyFromImportModule >> import [
	"Relation named: #import type: #FASTPyImportFromStatement opposite: #fromImportModule"

	<generated>
	<FMComment: 'Import declaring me as from import module.'>
	<container>
	<derived>
	^ import
]

{ #category : 'accessing' }
FASTPyFromImportModule >> import: anObject [

	<generated>
	import := anObject
]

{ #category : 'navigation' }
FASTPyFromImportModule >> importGroup [
	<generated>
	<navigation: 'Import'>
	^ MooseSpecializedGroup with: self import
]

{ #category : 'accessing' }
FASTPyFromImportModule >> segments [

	<FMProperty: #segments type: #String>
	<generated>
	<multivalued>
	<FMComment: 'The segments of the module path. For example if you declare `xml.etree.ElementTree` as module, the segments will be { ''xml'' . ''etree'' . ''ElementTree''}.'>
	^ segments
]

{ #category : 'accessing' }
FASTPyFromImportModule >> segments: anObject [
	<generated>
	segments := anObject
]
