baselines
baseline: spec
  <baseline>
  spec
	for: #common
	do: [
		spec postLoadDoIt: #addPostloadHacks.

		self   
			fuelPlatform: spec;
			smark: spec.

		spec
			package: 'Fuel-Core' with: [ spec requires: 'FuelPlatform' ];
			package: 'Fuel-Debug' with: [ spec requires: 'Core' ];
			package: 'Fuel-ProgressUpdate' with: [ spec requires: #('Core') ];
			package: 'Fuel-Benchmarks' with: [ spec requires: #('Core' 'SMark-Jenkins') ];
			
			package: 'Fuel-Tests-Core' with: [ spec requires: 'Core' ];
			package: 'Fuel-Tests-Debug' with: [ spec requires: #('Fuel-Debug' 'Tests') ];
			package: 'Fuel-Tests-ProgressUpdate' with: [ spec requires: #('Fuel-ProgressUpdate' 'Tests') ];
			package: 'Fuel-Tests-Benchmarks' with: [ spec requires: #('Fuel-Benchmarks' 'Tests') ].
					
		spec
			group: 'default' with: #('Core');
			group: 'Core' with: #('Fuel-Core');
			group: 'Tests' with: #('Core' 'Fuel-Tests-Core') ].

	self
		groupsForPharoCommon: spec;
		groupsForSqueakCommon: spec