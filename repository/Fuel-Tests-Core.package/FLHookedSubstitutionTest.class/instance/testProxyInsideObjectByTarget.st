tests
testProxyInsideObjectByTarget
	| aProxyClass result original pair |
	aProxyClass := self classFactory silentlyNewClassWithClassVariableNames: 'target'.
	self classFactory
		silentlyCompile:  'target: x  target := x' in: aProxyClass;
		silentlyCompile: 'fuelAccept: aVisitor
			^ aVisitor
				visitSubstitution: self
				by: target' in: aProxyClass.

	original := aProxyClass new
		target: 5;
		yourself.

	pair := FLPair new
		left: original;
		right: 'foo'.

	result := self resultOfSerializeAndMaterialize: pair.

	self assert: result left equals: 5.
	self assert: result right equals: 'foo'