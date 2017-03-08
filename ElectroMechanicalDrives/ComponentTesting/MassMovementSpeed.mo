within ElectroMechanicalDrives.ComponentTesting;
model MassMovementSpeed "Movement of mass without propulsion"
  extends Modelica.Icons.Example;
  Modelica.Mechanics.Translational.Sources.Speed speed(exact = true) annotation(Placement(transformation(extent = {{-40, -10}, {-20, 10}})));
  Components.Translational.MassFriction massFriction1(m = 1000)                 annotation(Placement(transformation(extent = {{0, 10}, {20, 30}})));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, startTime = 1, height = 0.02, offset = -0.01) annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}})));
  Components.Translational.MassStickingFriction massFriction2(m = 1000, peak = 2) annotation(Placement(transformation(extent = {{0, -30}, {20, -10}})));
equation
  connect(speed.flange, massFriction1.flange_a) annotation(Line(points = {{-20, 6.66134e-16}, {-10, 6.66134e-16}, {-10, 20}, {-4.44089e-16, 20}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(ramp.y, speed.v_ref) annotation(Line(points = {{-59, 0}, {-42, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(massFriction2.flange_a, speed.flange) annotation(Line(points = {{-4.44089e-16, -20}, {-10, -20}, {-10, 0}, {-20, 0}}, color = {0, 127, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime = 3, Interval = 0.0001, Tolerance = 1e-06));
end MassMovementSpeed;
