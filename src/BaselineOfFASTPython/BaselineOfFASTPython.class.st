"
I am a baseline to define the structure and dependencies of the FASTPython project.
"
Class {
	#name : 'BaselineOfFASTPython',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFASTPython',
	#package : 'BaselineOfFASTPython'
}

{ #category : 'baselines' }
BaselineOfFASTPython >> baseline: spec [

	<baseline>
	spec for: #common do: [
			"Dependencies"
			self
				fast: spec;
				treeSitter: spec.
			
			"Packages"
			spec
				package: 'FAST-Python-Model' with: [ spec requires: #( 'FAST' 'TreeSitter' ) ];
				package: 'FAST-Python-Model-Generator';
				package: 'FAST-Python-Model-Tests' with: [ spec requires: #( 'FAST-Python-Model' ) ].

			"Groups"
			spec
				group: 'Core' with: #( 'Famix-Python-Model' );
				group: 'Generator' with: #( 'FAST-Python-Model-Generator' );
				group: 'Tests' with: #( 'Famix-Python-Model-Tests' ) ]
]

{ #category : 'dependencies' }
BaselineOfFASTPython >> fast: spec [

	spec baseline: 'FAST' with: [
			spec
				loads: #( 'default' );
				repository: 'github://moosetechnology/FAST:v3/src' ]
]

{ #category : 'accessing' }
BaselineOfFASTPython >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : 'dependencies' }
BaselineOfFASTPython >> treeSitter: spec [
	spec
		baseline: 'TreeSitter' with: [ spec repository: 'github://Evref-BL/Pharo-Tree-Sitter:main/src' ]
]
