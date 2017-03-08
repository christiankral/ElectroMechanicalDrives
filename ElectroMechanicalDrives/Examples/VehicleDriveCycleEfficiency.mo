within ElectroMechanicalDrives.Examples;
model VehicleDriveCycleEfficiency "Test of NEDC drive cycle of car"
  extends Modelica.Icons.Example;
  parameter String fileName = Modelica.Utilities.Files.loadResource("modelica://ElectroMechanicalDrives/Resources/DriveCycles/nedc.txt")
    "File on which data is present" annotation(Dialog(loadSelector(filter = "Text files (*.txt)", caption = "Open text file to read parameters of the form \"name = value\"")));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(tableOnFile = true, tableName = "velocity", extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, fileName = fileName) annotation(Placement(transformation(extent = {{-100, -10}, {-80, 10}})));
  Modelica.Mechanics.Translational.Sources.Speed speed(exact = false) annotation(Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensor annotation(Placement(transformation(extent = {{-20, 10}, {0, -10}})));
  Modelica.Blocks.Continuous.Integrator energy annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 270, origin = {-10, 50})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(Placement(transformation(extent = {{20, -10}, {40, 10}})));
  ElectroMechanicalDrives.Components.Vehicles.Vehicle vehicle(j=0.1)
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  ElectroMechanicalDrives.Components.Translational.ConstantEfficiency           constantEfficiency
  annotation (Placement(transformation(extent={{50,-10},{70,10}})));
equation
  connect(combiTimeTable.y[1], speed.v_ref) annotation(Line(points = {{-79, 4.44089e-16}, {-74, 4.44089e-16}, {-74, 0}, {-70, 0}, {-70, 8.88178e-16}, {-62, 8.88178e-16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(speed.flange, powerSensor.flange_a) annotation(Line(points = {{-40, 0}, {-20, 0}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(energy.u, powerSensor.power) annotation(Line(points = {{-10, 38}, {-10, 20}, {-18, 20}, {-18, 11}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(powerSensor.flange_b, forceSensor.flange_a) annotation(Line(points = {{4.44089e-16, 0}, {20, 0}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(forceSensor.flange_b, constantEfficiency.flange_a) annotation(Line(points = {{40, 0}, {50, 0}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(constantEfficiency.flange_b, vehicle.flangeT_a) annotation (Line(
      points={{70,0},{76,0},{76,6.66134e-16},{80,6.66134e-16}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,-100},{100,100}}),      graphics), Icon(graphics), experiment(StopTime = 1200, Interval = 0.1, Tolerance = 1e-06));
end VehicleDriveCycleEfficiency;
