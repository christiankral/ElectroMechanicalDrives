within ElectroMechanicalDrives.Components.Rotational;
model ConstantEfficiencyControlled "Efficiency model considering constant efficiency"
  extends Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlangesAndSupport;
  parameter Real efficiency = 0.9 "Efficiency coefficient";
  parameter Modelica.SIunits.Time T = 1E-6 "Internal controller time constant";
  parameter Modelica.SIunits.AngularVelocity wRef = 1 "Rereference angular velocity of controller";
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
  ElectroMechanicalDrives.Components.Rotational.VariableDamper variableDamper(useHeatPort=useHeatPort) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={0,30})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor_a annotation(Placement(transformation(extent = {{-80, 70}, {-60, 90}})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor_b annotation(Placement(transformation(extent = {{80, 70}, {60, 90}})));
  Modelica.Blocks.Math.Gain efficiency_a(final k = +(1 - efficiency)) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-70, 40})));
  Modelica.Blocks.Math.Gain efficiency_b(final k = +(1 - efficiency)) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {70, 40})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor_loss annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, -38})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(final threshold = 0) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-90, -30})));
  Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(extent = {{-60, -60}, {-40, -40}})));
  Modelica.Blocks.Math.Feedback feedback annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-30, -30})));
  Modelica.Blocks.Continuous.Integrator integrator(final k = wRef ^ 2 / T, final initType = Modelica.Blocks.Types.Init.InitialState, final y_start = 0) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-30, 0})));
equation
  lossPower = 0;
  connect(flange_a, powerSensor_a.flange_a) annotation(Line(points = {{-100, 0}, {-90, 0}, {-90, 80}, {-80, 80}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(powerSensor_b.flange_a, flange_b) annotation(Line(points = {{80, 80}, {90, 80}, {90, 0}, {100, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(powerSensor_a.flange_b, powerSensor_b.flange_b) annotation(Line(points = {{-60, 80}, {60, 80}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(powerSensor_a.power, efficiency_a.u) annotation(Line(points = {{-78, 69}, {-78, 60}, {-70, 60}, {-70, 52}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(powerSensor_b.power, efficiency_b.u) annotation(Line(points = {{78, 69}, {78, 60}, {70, 60}, {70, 52}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(greaterThreshold.y, switch1.u2) annotation(Line(points = {{-90, -41}, {-90, -50}, {-62, -50}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(efficiency_a.y, switch1.u1) annotation(Line(points = {{-70, 29}, {-70, -42}, {-62, -42}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(powerSensor_a.power, greaterThreshold.u) annotation(Line(points = {{-78, 69}, {-78, 60}, {-86, 60}, {-86, -10}, {-90, -10}, {-90, -18}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(efficiency_b.y, switch1.u3) annotation(Line(points = {{70, 29}, {70, -70}, {-70, -70}, {-70, -58}, {-62, -58}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(feedback.u2, powerSensor_loss.power) annotation(Line(points = {{-22, -30}, {-11, -30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(feedback.u1, switch1.y) annotation(Line(points = {{-30, -38}, {-30, -50}, {-39, -50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(integrator.u, feedback.y) annotation(Line(points = {{-30, -12}, {-30, -21}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(integrator.y, variableDamper.d) annotation(Line(points = {{-30, 11}, {-30, 30}, {-12, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(variableDamper.heatPort, heatPort) annotation(Line(points = {{-10, 40}, {-50, 40}, {-50, 20}, {-76, 20}, {-76, -100}, {-100, -100}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(powerSensor_a.flange_b, powerSensor_loss.flange_a) annotation(Line(points = {{-60, 80}, {20, 80}, {20, -20}, {0, -20}, {0, -28}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(powerSensor_loss.flange_b, variableDamper.flange_b) annotation(Line(points = {{0, -48}, {28, -48}, {28, 20}, {-1.33227e-15, 20}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(variableDamper.flange_a, internalSupport) annotation(Line(points = {{2.22045e-16, 40}, {36, 40}, {36, -60}, {0, -60}, {0, -80}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid, fillColor = {255, 255, 255}), Text(extent = {{-150, 150}, {150, 110}}, textString = "%name", lineColor = {0, 0, 255}), Text(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}, textString = "%%")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end ConstantEfficiencyControlled;
