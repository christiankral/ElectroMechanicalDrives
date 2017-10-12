within ElectroMechanicalDrives.ComponentTesting;
model CoastingCompare "Mass on slope with friction"
  extends Modelica.Icons.Example;
Components.Translational.MassStickingFriction         massFriction1(
    m=1000,
    mu=0.02,
    peak=2,
    s(start=0,fixed=true)) annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Components.Translational.InitialVelocity initialVelocity1(v0 = 1) annotation(Placement(transformation(extent = {{-40, 10}, {-20, 30}})));
  Components.Translational.MassFriction massFriction2(
    m = 1000,
    mu = 0.02,
    v_linear = 0.1,
    s(start=0,fixed=true)) annotation(Placement(transformation(extent = {{-10, -30}, {10, -10}})));
  Components.Translational.InitialVelocity initialVelocity2(v0 = 1) annotation(Placement(transformation(extent = {{-40, -30}, {-20, -10}})));
equation
  connect(initialVelocity1.flange_a, massFriction1.flange_a) annotation(Line(points = {{-20, 20}, {-10, 20}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(initialVelocity2.flange_a, massFriction2.flange_a) annotation(Line(points = {{-20, -20}, {-10, -20}}, color = {0, 127, 0}, smooth = Smooth.None));
  annotation(experiment(
      Interval=1E-4,
      Tolerance=1e-06),Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-88, 60}, {92, 40}}, lineColor = {255, 0, 0},
            fillPattern =                                                                                                   FillPattern.VerticalCylinder, fillColor = {255, 255, 255}, fontSize = 16, textString = "massFriction1 shows constant friction force"), Text(extent = {{-88, -40}, {92, -60}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.VerticalCylinder, fillColor = {255, 255, 255}, fontSize = 16, textString = "massFriction2 friction force linearly decreases with speed 
below vlimit")}));
end CoastingCompare;
