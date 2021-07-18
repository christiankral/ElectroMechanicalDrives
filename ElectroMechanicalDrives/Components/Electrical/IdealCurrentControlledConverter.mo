within ElectroMechanicalDrives.Components.Electrical;
model IdealCurrentControlledConverter
  "Ideal current controlled DC/DC converter"
  parameter Modelica.Units.SI.Time T=1E-6 "Internal integtration time constant";
  Modelica.Units.SI.Voltage v1=dc_p1.v - dc_n1.v "Voltage of pins 1";
  Modelica.Units.SI.Voltage v2=dc_p2.v - dc_n2.v "Voltage of pins 2";
  Modelica.Units.SI.Current i1=dc_p1.i "Current pins 1";
  Modelica.Units.SI.Power p1=v1*i1 "Power of pins 1";
  Modelica.Units.SI.Power p2=v2*i2 "Power of pins 2";
  Modelica.Electrical.Analog.Interfaces.PositivePin dc_p1
    "Positive DC input"
    annotation(Placement(transformation(extent = {{-110, 50}, {-90, 70}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin dc_n1
    "Negative DC input"
    annotation(Placement(transformation(extent = {{-110, -70}, {-90, -50}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin dc_p2
    "Positive DC output"
    annotation(Placement(transformation(extent = {{90, 50}, {110, 70}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin dc_n2
    "Negative DC output"
    annotation(Placement(transformation(extent = {{90, -70}, {110, -50}})));
  Modelica.Blocks.Interfaces.RealInput i2 "Current input i2"
    annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -120}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -120})));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalVoltage annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {100, 0})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {80, 20})));
  Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{40, 0}, {20, 20}})));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-60, 40})));
  Modelica.Blocks.Continuous.Integrator integrator(final k = -1 / T) annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-30, 10})));
  Modelica.Blocks.Math.Feedback feedback annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {0, 10})));
  Modelica.Blocks.Math.Gain inverse(final k = -1) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, 50})));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent annotation(Placement(transformation(extent = {{10, 10}, {-10, -10}}, rotation = 90, origin = {-60, 10})));
equation
  connect(i2, product.u2) annotation(Line(points = {{1.11022e-15, -120}, {1.11022e-15, -100}, {0, -100}, {0, -80}, {60, -80}, {60, 4}, {42, 4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(dc_p1, powerSensor.pc) annotation(Line(points = {{-100, 60}, {-60, 60}, {-60, 50}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(powerSensor.pv, powerSensor.pc) annotation(Line(points = {{-50, 40}, {-50, 50}, {-60, 50}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(powerSensor.nv, dc_n1) annotation(Line(points = {{-70, 40}, {-100, 40}, {-100, -60}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(product.y, feedback.u1) annotation(Line(points = {{19, 10}, {8, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(feedback.y, integrator.u) annotation(Line(points = {{-9, 10}, {-18, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(powerSensor.power, inverse.u) annotation(Line(points={{-71,50},{-80, 50},{-80,80},{0,80},{0,62}},                                                                                color = {0, 0, 127}, smooth = Smooth.None));
  connect(inverse.y, feedback.u2) annotation(Line(points = {{0, 39}, {0, 18}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(i2, signalVoltage.i) annotation(Line(points={{0,-120},{0,-80},{60,-80},{60,0},{76,0},{76,0},{88,0}},                                                                                       color = {0, 0, 127}, smooth = Smooth.None));
  connect(voltageSensor.p, dc_p2) annotation(Line(points = {{80, 30}, {80, 60}, {100, 60}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor.n, dc_n2) annotation(Line(points = {{80, 10}, {80, -60}, {100, -60}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor.v, product.u1) annotation(Line(points={{69,20},{60,20},{60,16},{42,16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(integrator.y, signalCurrent.i) annotation(Line(points={{-41,10},{-48,10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(powerSensor.nc, signalCurrent.p) annotation(Line(points = {{-60, 30}, {-60, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(signalCurrent.n, dc_n1) annotation(Line(points = {{-60, 0}, {-60, -60}, {-100, -60}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(dc_p2, signalVoltage.p) annotation(Line(points = {{100, 60}, {100, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(signalVoltage.n, dc_n2) annotation(Line(points = {{100, -10}, {100, -60}, {100, -60}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(defaultComponentName="converter",Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 127}), Line(points = {{-100, -100}, {100, 100}}, color = {0, 0, 127}, smooth = Smooth.None), Text(extent = {{-100, 40}, {-40, -40}}, lineColor = {0, 0, 255}, textString = "1"), Text(extent = {{40, 40}, {100, -40}}, lineColor = {0, 0, 255}, textString = "2"), Text(extent = {{-150, 140}, {150, 100}}, lineColor = {0, 0, 255}, textString = "%name"),
        Line(points={{92,60},{20,60}}, color={0,0,255}),
        Polygon(
          points={{20,60},{60,74},{60,46},{20,60}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,-98},{0,60}},
          color={0,0,255},
          pattern=LinePattern.Dash),
        Text(
          extent={{20,-100},{60,-140}},
          lineColor={0,0,255},
          pattern=LinePattern.Dash,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="i2"),
        Text(
          extent={{-80,80},{20,40}},
          lineColor={0,0,255},
          pattern=LinePattern.Dash,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="src"),
        Text(
          extent={{-40,-40},{60,-80}},
          lineColor={0,0,255},
          pattern=LinePattern.Dash,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="load")}),                                                                                                                                                                                                        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Documentation(info="<html>
<p>This is an ideal DC/DC converter.<p>
<ul>
<li><b>side 1</b> must be connected with voltage source</li>
<li><b>side 2</b> must be connected with load</li>
</ul>
<p>Signal input <code>i2</code> is the current flowing into the positive pin of side 2. 
In order to operate side 2 as a load the signal input current <code>i2</code> must be <strong>negative</strong>.</p>
</html>"));
end IdealCurrentControlledConverter;
