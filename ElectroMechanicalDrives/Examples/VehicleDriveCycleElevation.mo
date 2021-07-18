within ElectroMechanicalDrives.Examples;
model VehicleDriveCycleElevation "Test of NEDC drive cycle of car including elevation"
  extends Modelica.Icons.Example;
  parameter String fileName = Modelica.Utilities.Files.loadResource("modelica://ElectroMechanicalDrives/Resources/DriveCycles/nedc.txt")
    "File on which data is present" annotation(Dialog(loadSelector(filter = "Text files (*.txt)", caption = "Open text file to read parameters of the form \"name = value\"")));
  parameter Modelica.Units.SI.Distance sNEDC=10713.5
    "Distance of one drive cycle";
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(tableOnFile = true, tableName = "velocity", extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, fileName = fileName) annotation(Placement(transformation(extent = {{-100, -10}, {-80, 10}})));
  Modelica.Mechanics.Translational.Sources.Speed speed(exact = false) annotation(Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
  Modelica.Mechanics.Translational.Sensors.PowerSensor powerSensor annotation(Placement(transformation(extent = {{-20, 10}, {0, -10}})));
  Modelica.Blocks.Continuous.Integrator energy annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 270, origin = {-10, 50})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(Placement(transformation(extent = {{20, -10}, {40, 10}})));
  ElectroMechanicalDrives.Components.Vehicles.Vehicle vehicle(j=0.1, useConstantAngle=false)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Continuous.Integrator distance(y_start=0)
    "Integrates velocity to determine distance" annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-50,-50})));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds(table=[0,0; sNEDC,0;
      sNEDC + 1000,0.04; 2*sNEDC,0.04; 2*sNEDC + 1000,0; 3*sNEDC,0])
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
equation
  connect(combiTimeTable.y[1], speed.v_ref) annotation(Line(points = {{-79, 4.44089e-16}, {-74, 4.44089e-16}, {-74, 0}, {-70, 0}, {-70, 8.88178e-16}, {-62, 8.88178e-16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(speed.flange, powerSensor.flange_a) annotation(Line(points = {{-40, 0}, {-20, 0}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(energy.u, powerSensor.power) annotation(Line(points = {{-10, 38}, {-10, 20}, {-18, 20}, {-18, 11}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(powerSensor.flange_b, forceSensor.flange_a) annotation(Line(points = {{4.44089e-16, 0}, {20, 0}}, color = {0, 127, 0}, smooth = Smooth.None));
  connect(forceSensor.flange_b, vehicle.flangeT_a) annotation (Line(
      points={{40,0},{52,0},{52,4.44089e-16},{60,4.44089e-16}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(distance.u, combiTimeTable.y[1]) annotation (Line(points={{-62,-50},{-70,
          -50},{-70,-10},{-70,0},{-79,0}},           color={0,0,127}));
  connect(distance.y, combiTable1Ds.u)
    annotation (Line(points={{-39,-50},{-30,-50},{-22,-50}}, color={0,0,127}));
connect(combiTable1Ds.y[1], vehicle.variableAngle) annotation (Line(points=
        {{1,-50},{26,-50},{48,-50},{48,-6},{58,-6}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
          -100},{100,100}})),                                                                       Icon(graphics), experiment(
      StopTime=6000,
      Interval=0.1,
      Tolerance=1e-07),
    Documentation(info="<html>
<p>This example extends 
<a href=\"modelica://ElectroMechanicalDrives.Examples.VehicleDriveCycleWithDrive\">VehicleDriveCycleWithDrive</a>
by:</p>
<ul>
<li>Additional inclinations of the vehicle street</li>
</ul>

<p>Investigate the variables as function of <code>vehicle.s</code> (vehicle distance):</p>
<ul>
<li><code>vehicle.variableAngle</code> = inclination angle of street</li>
</ul>

</html>"));
end VehicleDriveCycleElevation;
