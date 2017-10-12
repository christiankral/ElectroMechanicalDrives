within ElectroMechanicalDrives.ComponentTesting;
model Efficiency "Investigating efficiency"
  extends Modelica.Icons.Example;
  Components.Translational.ConstantEfficiency efficiency1(efficiency=0.8)
    annotation (Placement(transformation(extent={{-30,50},{-10,70}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensorSupply1 annotation(Placement(transformation(extent = {{-60, 50}, {-40, 70}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensorLoad1 annotation(Placement(transformation(extent = {{0, 50}, {20, 70}})));
  Modelica.Mechanics.Translational.Sources.Force force1(flange(s(start=0,fixed=true))) annotation(Placement(transformation(extent = {{50, 50}, {30, 70}})));
  Modelica.Blocks.Sources.Ramp ramp(height = -2, duration = 1, offset = 1, startTime = 0) annotation(Placement(transformation(extent = {{100, -10}, {80, 10}})));
  Modelica.Mechanics.Translational.Sources.ConstantSpeed constantSpeed1(v_fixed = 1,flange(f(start=0))) annotation(Placement(transformation(extent = {{-90, 50}, {-70, 70}})));
  Components.Translational.ConstantEfficiency efficiency2(efficiency=0.8)
    annotation (Placement(transformation(extent={{-10,10},{-30,30}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensorSupply2 annotation(Placement(transformation(extent = {{-60, 10}, {-40, 30}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensorLoad2 annotation(Placement(transformation(extent = {{0, 10}, {20, 30}})));
  Modelica.Mechanics.Translational.Sources.Force force2(flange(s(start=0,fixed=true))) annotation(Placement(transformation(extent = {{50, 10}, {30, 30}})));
  Modelica.Mechanics.Translational.Sources.ConstantSpeed constantSpeed2(v_fixed = 1) annotation(Placement(transformation(extent = {{-90, 10}, {-70, 30}})));
Components.Translational.ConstantEfficiency efficiency4(efficiency=0.8)
  annotation (Placement(transformation(extent={{-10,-70},{-30,-50}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensorSupply4 annotation(Placement(transformation(extent = {{-60, -70}, {-40, -50}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensorLoad4 annotation(Placement(transformation(extent = {{0, -70}, {20, -50}})));
  Modelica.Mechanics.Translational.Sources.Force force4(flange(s(start=0,fixed=true))) annotation(Placement(transformation(extent = {{50, -70}, {30, -50}})));
  Modelica.Mechanics.Translational.Sources.ConstantSpeed constantSpeed4(v_fixed = 1) annotation(Placement(transformation(extent = {{-90, -70}, {-70, -50}})));
equation
  connect(ramp.y, force1.f) annotation(Line(points = {{79, 6.66134e-16}, {70, 6.66134e-16}, {70, 60}, {52, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(powerSensorLoad1.flange_b, force1.flange) annotation(Line(points = {{20, 60}, {30, 60}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(efficiency1.flange_b, powerSensorLoad1.flange_a) annotation(Line(points = {{-10, 60}, {0, 60}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(powerSensorSupply1.flange_b, efficiency1.flange_a) annotation(Line(points = {{-40, 60}, {-30, 60}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(constantSpeed1.flange, powerSensorSupply1.flange_a) annotation(Line(points = {{-70, 60}, {-60, 60}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(powerSensorLoad2.flange_b, force2.flange) annotation(Line(points = {{20, 20}, {30, 20}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(constantSpeed2.flange, powerSensorSupply2.flange_a) annotation(Line(points = {{-70, 20}, {-60, 20}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(powerSensorSupply2.flange_b, efficiency2.flange_b) annotation(Line(points = {{-40, 20}, {-30, 20}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(efficiency2.flange_a, powerSensorLoad2.flange_a) annotation(Line(points = {{-10, 20}, {0, 20}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(force2.f, ramp.y) annotation(Line(points = {{52, 20}, {70, 20}, {70, 6.66134e-16}, {79, 6.66134e-16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(powerSensorLoad4.flange_b, force4.flange) annotation(Line(points = {{20, -60}, {30, -60}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(constantSpeed4.flange, powerSensorSupply4.flange_a) annotation(Line(points = {{-70, -60}, {-60, -60}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(powerSensorSupply4.flange_b, efficiency4.flange_b) annotation(Line(points = {{-40, -60}, {-30, -60}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(efficiency4.flange_a, powerSensorLoad4.flange_a) annotation(Line(points = {{-10, -60}, {0, -60}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(force4.f, ramp.y) annotation(Line(points = {{52, -60}, {70, -60}, {70, 6.66134e-16}, {79, 6.66134e-16}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(experiment(Interval = 0.001,Tolerance=1E-6),Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Efficiency;
