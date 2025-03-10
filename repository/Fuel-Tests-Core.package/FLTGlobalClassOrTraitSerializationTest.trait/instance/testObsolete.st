tests
testObsolete
	"Tests that serializer does not serialize as global an obsolete class or trait."
	
	| classOrTrait |
	classOrTrait := self newClassOrTrait.
	self classFactory deleteBehavior: classOrTrait.

	self 
		should: [self serialize: classOrTrait ] 
		raise: FLObsolete
		whoseDescriptionIncludes: classOrTrait name
		description: 'Should raise an error when serializing as global an obsolete class or trait.' 