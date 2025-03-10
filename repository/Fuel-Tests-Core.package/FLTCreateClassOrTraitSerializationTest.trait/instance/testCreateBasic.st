tests
testCreateBasic
	"Tests materialization a class or trait not defined in the image."

	| aClassOrTrait materializedClassOrTrait environment category name |
	aClassOrTrait := self newClassOrTrait.
	environment := aClassOrTrait environment.
	category := aClassOrTrait category.
	name := aClassOrTrait name.
	
	materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: aClassOrTrait.

	self deny: aClassOrTrait identicalTo: materializedClassOrTrait.
	"This is the test environment wrapper, so we need to cheat"
	self
		assertCollection: environment associations
		hasSameElements: materializedClassOrTrait environment associations.
	"Classes are not direclty inserted in the system organization so we can only test #basicCategory and not #category."
	self assert: category equals: materializedClassOrTrait basicCategory.
	self assert: name equals: materializedClassOrTrait name.

     "It is important to notice that Fuel does not add the materialized class or trait into Smalltalk globals."
    self deny: (self environmentOfTest includesKey: name)
