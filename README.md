# FAST-Python

Famix AST representation for Python based on TreeSitter

## Installation

To install this project on your Pharo image, execute the following script: 

```Smalltalk
Metacello new
	githubUser: 'moosetechnology' project: 'FAST-Python' commitish: 'main' path: 'src';
	baseline: 'FASTPython';
	load
```

To add this project to your baseline:

```Smalltalk
spec
	baseline: 'FASTPython'
	with: [ spec repository: 'github://moosetechnology/FAST-Python:main/src' ]
```

Note you can replace the #master by another branch such as #development or a tag such as #v1.0.0, #v1.? or #v1.2.? .

## Quick start

In order to parse a chain of character or a file you can do this:

```st
    FASTPythonImporter parse: 'if x > 0:
    if x < 10:
        1
    else:
        2
else:
    3'
```

Or

```st
    FASTPythonImporter parseFile: myFile
```

# Documentation

Incoming

## Moose versions compatibility

| Version 	| Compatible Moose versions    |
|-------------	|------------------------------|
| main       	| Moose 13 |

## Contact

If you have any questions or problems do not hesitate to open an issue or contact cyril (a) ferlicot.fr
