within ElectroMechanicalDrives.ComponentTesting;
model RotationalConstantFriction "Testing rotational constant friction"
  extends Modelica.Icons.Example;
  Components.Rotational.RollingFriction constantFriction(
    tau_constant=1,
    w_linear=0.1,
    useHeatPort=false)
    annotation (Placement(transformation(extent={{50,-10},{30,10}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed(exact = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp(height = 2, duration = 1, offset = -1, startTime = 0) annotation(Placement(transformation(extent = {{-50, -10}, {-30, 10}})));
equation
  connect(ramp.y, speed.w_ref) annotation(Line(points = {{-29, 0}, {-12, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(speed.flange, constantFriction.flange) annotation(Line(points = {{10, 0}, {30, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(experiment(Interval=0.0001, Tolerance=1e-06), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end RotationalConstantFriction;
