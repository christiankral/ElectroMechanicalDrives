within ElectroMechanicalDrives.ComponentTesting;
model TestBattery "Test discharge of battery with internal resistor"
  extends Modelica.Icons.Example;
  Components.Electrical.Battery battery(V1Cell = 4, V0Cell = 3,                 ns = 10, np = 1,               RCell = 0.45E-3,
    allowUndercharge=true,
    ECell=1188000)                                                                                                              annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-40, 0})));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent(I = 300) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, 0})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{-50, -40}, {-30, -20}})));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation(Placement(transformation(extent = {{-10, 0}, {10, 20}})));
  Modelica.Blocks.Continuous.Integrator energy annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-10, -50})));
equation
  connect(battery.pin_n, constantCurrent.n) annotation(Line(points = {{-40, -10}, {40, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(battery.pin_n, ground.p) annotation(Line(points = {{-40, -10}, {-40, -20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(battery.pin_p, powerSensor.pc) annotation(Line(points = {{-40, 10}, {-10, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(powerSensor.nc, constantCurrent.p) annotation(Line(points = {{10, 10}, {40, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(powerSensor.pc, powerSensor.pv) annotation(Line(points = {{-10, 10}, {-10, 20}, {4.44089e-16, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(powerSensor.nv, battery.pin_n) annotation(Line(points = {{0, 0}, {0, -10}, {-40, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(powerSensor.power, energy.u) annotation(Line(points = {{-8, -1}, {-8, -20}, {-10, -20}, {-10, -38}, {-10, -38}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime=978.6, Tolerance=1e-06));
end TestBattery;
