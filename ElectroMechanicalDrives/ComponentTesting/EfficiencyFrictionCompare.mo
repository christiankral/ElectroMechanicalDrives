within ElectroMechanicalDrives.ComponentTesting;
model EfficiencyFrictionCompare "Investigating efficiency"
  extends Modelica.Icons.Example;
  Components.Translational.ConstantEfficiency efficiency1(efficiency=0.8)
  annotation (Placement(transformation(extent={{-20,70},{0,90}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensorSupply1 annotation(Placement(transformation(extent = {{-50, 70}, {-30, 90}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensorLoad1 annotation(Placement(transformation(extent = {{10, 70}, {30, 90}})));
  Modelica.Mechanics.Translational.Sources.ConstantSpeed constantSpeed1(v_fixed = 1,flange(f(start=0))) annotation(Placement(transformation(extent = {{-80, 70}, {-60, 90}})));
  Modelica.Mechanics.Translational.Sources.ConstantForce friction1(f_constant = -1,s(start=0,fixed=true)) annotation(Placement(transformation(extent = {{60, 70}, {40, 90}})));

  Components.Translational.ConstantEfficiency efficiency2(efficiency=0.8)
  annotation (Placement(transformation(extent={{-20,30},{0,50}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensorSupply2 annotation(Placement(transformation(extent = {{-50, 30}, {-30, 50}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensorLoad2 annotation(Placement(transformation(extent = {{10, 30}, {30, 50}})));
  Modelica.Mechanics.Translational.Sources.ConstantSpeed constantSpeed2(v_fixed = 1,flange(f(start=0))) annotation(Placement(transformation(extent = {{-80, 30}, {-60, 50}})));
  Components.Translational.RollingFriction friction2(f_constant=1,s(start=0,fixed=true))
  annotation (Placement(transformation(extent={{62,30},{42,50}})));

  Components.Translational.ConstantEfficiency efficiency4(efficiency=0.8)
  annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensorSupply4 annotation(Placement(transformation(extent = {{-50, -50}, {-30, -30}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensorLoad4 annotation(Placement(transformation(extent = {{10, -50}, {30, -30}})));
  Modelica.Mechanics.Translational.Sources.ConstantSpeed constantSpeed4(v_fixed = 1,flange(f(start=0))) annotation(Placement(transformation(extent = {{-80, -50}, {-60, -30}})));
  Components.Translational.MassFriction friction4(mu = 1, m = 1 / Modelica.Constants.g_n,s(start=0,fixed=true)) annotation(Placement(transformation(extent = {{60, -50}, {40, -30}})));

  Components.Translational.ConstantEfficiency efficiency5(efficiency=0.8)
  annotation (Placement(transformation(extent={{-20,-90},{0,-70}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensorSupply5 annotation(Placement(transformation(extent = {{-50, -90}, {-30, -70}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensorLoad5 annotation(Placement(transformation(extent = {{10, -90}, {30, -70}})));
  Modelica.Mechanics.Translational.Sources.ConstantSpeed constantSpeed5(v_fixed = 1,flange(f(start=0))) annotation(Placement(transformation(extent = {{-80, -90}, {-60, -70}})));
  Components.Translational.MassStickingFriction friction5(mu = 1, m = 1 / Modelica.Constants.g_n,s(start=0,fixed=true)) annotation(Placement(transformation(extent = {{60, -90}, {40, -70}})));
equation
  connect(efficiency1.flange_b, powerSensorLoad1.flange_a) annotation(Line(points = {{0, 80}, {10, 80}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(powerSensorSupply1.flange_b, efficiency1.flange_a) annotation(Line(points = {{-30, 80}, {-20, 80}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(constantSpeed1.flange, powerSensorSupply1.flange_a) annotation(Line(points = {{-60, 80}, {-50, 80}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(constantSpeed2.flange, powerSensorSupply2.flange_a) annotation(Line(points = {{-60, 40}, {-50, 40}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(powerSensorLoad1.flange_b, friction1.flange) annotation(Line(points = {{30, 80}, {40, 80}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(powerSensorLoad2.flange_b, friction2.flange) annotation(Line(points = {{30, 40}, {42, 40}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(constantSpeed4.flange, powerSensorSupply4.flange_a) annotation(Line(points = {{-60, -40}, {-50, -40}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(powerSensorLoad4.flange_b, friction4.flange_b) annotation(Line(points = {{30, -40}, {40, -40}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(powerSensorSupply2.flange_b, efficiency2.flange_a) annotation(Line(points = {{-30, 40}, {-20, 40}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(efficiency2.flange_b, powerSensorLoad2.flange_a) annotation(Line(points = {{0, 40}, {10, 40}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(powerSensorSupply4.flange_b, efficiency4.flange_a) annotation(Line(points = {{-30, -40}, {-20, -40}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(efficiency4.flange_b, powerSensorLoad4.flange_a) annotation(Line(points = {{4.44089e-16, -40}, {10, -40}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(constantSpeed5.flange, powerSensorSupply5.flange_a) annotation(Line(points = {{-60, -80}, {-50, -80}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(powerSensorLoad5.flange_b, friction5.flange_b) annotation(Line(points = {{30, -80}, {40, -80}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(powerSensorSupply5.flange_b, efficiency5.flange_a) annotation(Line(points = {{-30, -80}, {-20, -80}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(efficiency5.flange_b, powerSensorLoad5.flange_a) annotation(Line(points = {{0, -80}, {10, -80}}, color = {0, 127, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(Interval = 0.001), __Dymola_experimentSetupOutput);
end EfficiencyFrictionCompare;
