within ElectroMechanicalDrives.ComponentTesting;
model IdealCurrentControlledConverter
  "Tests ideal current controlled DC/DC converter"
  extends Modelica.Icons.Example;
  Components.Electrical.IdealCurrentControlledConverter idealCurrentControlledConverter annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V = 100) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-40, -2})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(extent = {{-50, -60}, {-30, -40}})));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(Placement(transformation(extent = {{30, -60}, {50, -40}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 10) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, 0})));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 20, offset = -10) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, -50})));
equation
  connect(constantVoltage1.p, idealCurrentControlledConverter.dc_p1) annotation(Line(points = {{-40, 8}, {-40, 20}, {-20, 20}, {-20, 6}, {-10, 6}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(constantVoltage1.n, idealCurrentControlledConverter.dc_n1) annotation(Line(points = {{-40, -12}, {-40, -20}, {-20, -20}, {-20, -6}, {-10, -6}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(constantVoltage1.n, ground1.p) annotation(Line(points = {{-40, -12}, {-40, -40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealCurrentControlledConverter.dc_p2, resistor.p) annotation(Line(points = {{10, 6}, {20, 6}, {20, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealCurrentControlledConverter.dc_n2, resistor.n) annotation(Line(points = {{10, -6}, {20, -6}, {20, -20}, {40, -20}, {40, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor.n, ground2.p) annotation(Line(points = {{40, -10}, {40, -40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealCurrentControlledConverter.i2, ramp.y) annotation(Line(points = {{0, -12}, {0, -39}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end IdealCurrentControlledConverter;
