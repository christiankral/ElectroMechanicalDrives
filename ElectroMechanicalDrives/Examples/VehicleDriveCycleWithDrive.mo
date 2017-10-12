within ElectroMechanicalDrives.Examples;
model VehicleDriveCycleWithDrive "Driving cycle"
  extends Modelica.Icons.Example;
  parameter String fileName = Modelica.Utilities.Files.loadResource("modelica://ElectroMechanicalDrives/Resources/DriveCycles/nedc.txt")
    "File on which data is present";
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(tableOnFile = true, tableName = "velocity", fileName = fileName, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic) annotation(Placement(transformation(extent={{-100,40},
            {-80,60}})));
  Modelica.Mechanics.Translational.Sources.Speed speed(exact=false)  annotation(Placement(transformation(extent={{-60,40},
            {-40,60}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(Placement(transformation(extent={{20,40},
            {40,60}})));
  ElectroMechanicalDrives.Components.Vehicles.VehicleWithDrive vehicle(
    ns=42,
    np=1,
    V1Cell=4,
    V0Cell=3,
    ECell=1188E3,
    r=0.35,
    i=8.8,
    wBase=0.25*837.8,
    kBase=0.1492/0.25)   annotation (Placement(transformation(extent={{60,40},{80,60}})));
  Modelica.Blocks.Continuous.Integrator integrator(k=1000)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(combiTimeTable.y[1], speed.v_ref) annotation(Line(points={{-79,50},
          {-62,50}},                                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(forceSensor.f, integrator.u) annotation (Line(
      points={{22,39},{22,8.88178e-16},{38,8.88178e-16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator.y, vehicle.iMachine) annotation (Line(
      points={{61,4.44089e-16},{70,4.44089e-16},{70,38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(forceSensor.flange_a, speed.flange) annotation (Line(
      points={{20,50},{-40,50}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(forceSensor.flange_b, vehicle.flangeT_a) annotation (Line(points={{40,50},{60,50}}, color={0,127,0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),Icon(graphics),
    experiment(
      StopTime=13200,
      Interval=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Radau"),
    Documentation(info="<html>
<p>This example shows a self-powered electric vehicle which performs eleven NEDC drive cycles. 
The totally covered distance is 117.85 km. The battery is almost fully discharged at the end
of all driving cycles.</p>

<p>Investigate as a function of time:</p>
<ul>
<li><code>vehicle.s</code> = vehicle distance</li>
<li><code>vehicle.v</code> = vehicle velocity</li>
<li><code>vehicle.battery.V1Cell</code> = charge voltage, <code>vehicle.battery.V0Cell</code> = cut off voltage, 
    <code>vehicle.battery.vCell</code> = actual cell voltage</code></li>
<li><code>vehicle.battery.iCell</code> = cell current (positive = charged, negative = discharged)</li>
<li><code>vehicle.machine.power</code> = electric DC machine power</li>
<li><code>vehicle.machine.tauElectrical</code> = electrical torque of the electric DC machine</li>
<li><code>vehicle.machine.v</code> = artmature voltage of electrical DC machine (shows maximum power of 125 V)</li>
</ul>

</html>"));
end VehicleDriveCycleWithDrive;
