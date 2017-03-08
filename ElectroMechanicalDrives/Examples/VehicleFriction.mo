within ElectroMechanicalDrives.Examples;
model VehicleFriction "Rolling and athmospheric resistance"
  extends Modelica.Icons.Example;
  ElectroMechanicalDrives.Components.Vehicles.Vehicle vehicle annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  ElectroMechanicalDrives.Components.Translational.InitialVelocity initialVelocity(v0 = 10) annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 180, origin = {-50, 10})));
equation
  connect(initialVelocity.flange_a, vehicle.flangeT_a) annotation (Line(points={{-40,10},{-30,10},{-20,10}}, color={0,127,0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),           Icon(graphics), experiment(StopTime = 60));
end VehicleFriction;
