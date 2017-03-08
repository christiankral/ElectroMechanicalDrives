within ElectroMechanicalDrives.ComponentTesting;
model Clutch "Clutch for coupling two masses"
  extends Modelica.Icons.Example;
  Components.Translational.InitialVelocity initialVelocity(v0 = 1) annotation(Placement(transformation(extent = {{-70, -10}, {-50, 10}})));
  Components.Translational.Clutch clutch(fn_max = 2000) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 1000) annotation(Placement(transformation(extent = {{-40, -10}, {-20, 10}})));
  Modelica.Mechanics.Translational.Components.Mass mass2(m = 1000) annotation(Placement(transformation(extent = {{20, -10}, {40, 10}})));
  Modelica.Blocks.Sources.Trapezoid trapezoid(amplitude = 1, rising = 0.1, width = 0.4, falling = 0.1, period = 1, startTime = 0.4) annotation(Placement(transformation(extent = {{-30, 20}, {-10, 40}})));
  Components.Translational.InitialVelocity initialVelocity1(v0 = 0) annotation(Placement(transformation(extent = {{70, -10}, {50, 10}})));
equation
  connect(initialVelocity.flange_a, mass1.flange_a) annotation(Line(points = {{-50, 6.66134e-16}, {-46, 6.66134e-16}, {-46, 0}, {-40, 0}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(mass1.flange_b, clutch.flange_a) annotation(Line(points = {{-20, 0}, {-10, 0}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(clutch.flange_b, mass2.flange_a) annotation(Line(points = {{10, 0}, {20, 0}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(trapezoid.y, clutch.f_normalized) annotation(Line(points = {{-9, 30}, {0, 30}, {0, 11}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(initialVelocity1.flange_a, mass2.flange_b) annotation(Line(points = {{50, 0}, {40, 0}}, color = {0, 127, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Clutch;
