within ElectroMechanicalDrives.ComponentTesting;
model MassFrictionCompare "Mass on slope with friction"
  extends Modelica.Icons.Example;
Components.Translational.MassStickingFriction massFriction1(
    m=1000,
    mu=0.02,
    peak=1,
    s(start=0,fixed=true),
    v(start=0,fixed=true)) annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(Placement(transformation(extent = {{50, 20}, {30, 40}})));
  Components.Translational.MassFriction massFriction2(
    m = 1000,
    mu = 0.02,
    s(start=0,fixed=true),
    v(start=0,fixed=true)) annotation(Placement(transformation(extent = {{0, -40}, {20, -20}})));
  Modelica.Mechanics.Translational.Sources.Force force2 annotation(Placement(transformation(extent = {{50, -40}, {30, -20}})));
  Modelica.Blocks.Sources.Constant const(k = 300) annotation(Placement(transformation(extent = {{100, -10}, {80, 10}})));
equation
  connect(massFriction1.flange_b, force1.flange) annotation(Line(points = {{20, 30}, {30, 30}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(const.y, force2.f) annotation(Line(points = {{79, 4.44089e-16}, {70, 4.44089e-16}, {70, -30}, {52, -30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(massFriction2.flange_b, force2.flange) annotation(Line(points = {{20, -30}, {30, -30}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(const.y, force1.f) annotation(Line(points = {{79, 0}, {70, 0}, {70, 30}, {52, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-100, 0}, {0, -60}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.VerticalCylinder, fillColor = {255, 255, 255}, fontSize = 16, textString = "Simplified friction model 
with linear region"),
                  Text(extent = {{-100, 60}, {0, 0}}, lineColor = {255, 0, 0},
            fillPattern =                                                                    FillPattern.VerticalCylinder, fillColor = {255, 255, 255}, fontSize = 16, textString = "Advanced friction model
with sticktion based on
MSL friction model"),
                  Text(extent = {{-90, 70}, {90, 50}}, lineColor = {255, 0, 0},
            fillPattern =                                                                     FillPattern.VerticalCylinder, fillColor = {255, 255, 255}, textString = "Upper model causes initialization problems with speed sources", fontSize = 16)}));
end MassFrictionCompare;
