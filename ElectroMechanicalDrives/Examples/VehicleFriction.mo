within ElectroMechanicalDrives.Examples;
model VehicleFriction "Rolling and atmospheric resistance"
  extends Modelica.Icons.Example;
  ElectroMechanicalDrives.Components.Vehicles.Vehicle vehicle(s(start=0,fixed=true)) annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  ElectroMechanicalDrives.Components.Translational.InitialVelocity initialVelocity(v0 = 10) annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 180, origin = {-50, 10})));
equation
  connect(initialVelocity.flange_a, vehicle.flangeT_a) annotation (Line(points={{-40,10},{-30,10},{-20,10}}, color={0,127,0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),           Icon(graphics), experiment(
      StopTime=60,
      __Dymola_NumberOfIntervals=6000,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>This example demonstrates the coast to standstill of a vehicle due to rolling friction and atmospheric friction<p>

<p>Investigate as a function of time:</p>
<ul>
<li><code>vehicle.c</code> = vehicle velocity</li>
<li><code>vehicel.fRollingFriction</code> = vehicle rolling friction force,    
    <code>vehicel.fAtmosphericFriction</code> = vehicle atmospheric friction force</li>
</ul>
</html>"));
end VehicleFriction;
