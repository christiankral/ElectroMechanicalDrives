within ElectroMechanicalDrives.Examples;
model TrainDriveCyle "Test of drive cycle of railjet"
  extends Modelica.Icons.Example;
  parameter String fileName = Modelica.Utilities.Files.loadResource("modelica://ElectroMechanicalDrives/Resources/DriveCycles/railjet.txt")
    "File on which data is present" annotation(Dialog(loadSelector(filter = "Text files (*.txt)", caption = "Open text file to read parameters of the form \"name = value\"")));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(tableOnFile = true, tableName = "velocity", extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, fileName = fileName) annotation(Placement(transformation(extent = {{-100, -10}, {-80, 10}})));
  Modelica.Mechanics.Translational.Sources.Speed speed(exact = false) annotation(Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensor annotation(Placement(transformation(extent={{-40,10},{-20,-10}})));
  Modelica.Blocks.Continuous.Integrator energy(u(unit="W"),y(unit="J")) annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 270, origin={-30,50})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
  ElectroMechanicalDrives.Components.Vehicles.Vehicle locomotive(
    j=0.1,
    mu=0.002,
    A=12,
    cx=0.5,
    m=21500,
    constantAngle=0) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  ElectroMechanicalDrives.Components.Vehicles.Vehicle wagons(
    j=0.1,
    A=5*1.45 + 5.40,
    cx=1,
    m=420000,
    constantAngle=0) annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensorLW annotation (Placement(transformation(extent={{50,-10},{70,10}})));
equation
  connect(combiTimeTable.y[1], speed.v_ref) annotation(Line(points={{-79,4.44089e-16},{-74,4.44089e-16},{-74,0},{-72,0},{-72,8.88178e-16}},                                color = {0, 0, 127}, smooth = Smooth.None));
  connect(speed.flange, powerSensor.flange_a) annotation(Line(points={{-50,0},{-40,0}},      color = {0, 127, 0}, smooth = Smooth.None));
  connect(energy.u, powerSensor.power) annotation(Line(points={{-30,38},{-30,20},{-38,20},{-38,11}},          color = {0, 0, 127}, smooth = Smooth.None));
  connect(powerSensor.flange_b, forceSensor.flange_a) annotation(Line(points={{-20,0},{-10,0}},             color = {0, 127, 0}, smooth = Smooth.None));
  connect(forceSensor.flange_b, locomotive.flangeT_a) annotation (Line(
      points={{10,0},{20,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(locomotive.flangeT_b, forceSensorLW.flange_a) annotation (Line(points={{40,0},{50,0}}, color={0,127,0}));
  connect(forceSensorLW.flange_b, wagons.flangeT_a) annotation (Line(points={{70,0},{80,0}}, color={0,127,0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,-100},{100,100}})),                Icon(graphics), experiment(
      StopTime=1200,
      Interval=0.1,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>This examples demonstrate a locomotive plus several wagons performing a drive cycle, powered by the external <code>speed</code> source.

<p>Investigate as a function of time:</p>
<ul>
<li><code>vehicle.s</code> = vehicle distance</li>
<li><code>vehicle.v</code> = vehicle velocity</li>
<li><code>forceSensor.f</code> = traction force required to move the vehicle,
    <code>forceSensorLW.f</code> = drag force between locomotive and (first) wagon</li>
<li><code>powerSensor.power</code> = power required to move the vehicle</li>
<li><code>energy.y</code> = energy required to move the entire train</li>
</ul>

</html>"));
end TrainDriveCyle;
