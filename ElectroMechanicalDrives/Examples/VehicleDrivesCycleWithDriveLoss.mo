within ElectroMechanicalDrives.Examples;
model VehicleDrivesCycleWithDriveLoss "Driving cycle"
  extends Modelica.Icons.Example;
  parameter String fileName = Modelica.Utilities.Files.loadResource("modelica://ElectroMechanicalDrives/Resources/DriveCycles/nedc.txt")
    "File on which data is present";
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(tableOnFile = true, tableName = "velocity", fileName = fileName, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic) annotation(Placement(transformation(extent={{-100,40},
            {-80,60}})));
  Modelica.Mechanics.Translational.Sources.Speed speed(exact = true) annotation(Placement(transformation(extent={{-60,40},
            {-40,60}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(Placement(transformation(extent={{20,40},
            {40,60}})));
  ElectroMechanicalDrives.Components.Vehicles.VehicleWithDriveLoss vehicle(
    ns=42,
    np=1,
    V1Cell=4,
    V0Cell=3,
    ECell=1188E3,
    r=0.35,
    i=8.8,
    wBase=0.25*837.8,
    kBase=0.1492/0.25,
    allowOvercharge=true,
    allowUndercharge=true,
    Ra=0.02,
    RCell=0.43E-3,
    s(start=0,fixed=true))     annotation (Placement(transformation(extent={{60,40},{80,60}})));
  Modelica.Blocks.Continuous.Integrator integrator(k=1000)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(combiTimeTable.y[1], speed.v_ref) annotation(Line(points={{-79,50},
          {-62,50}},                                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(forceSensor.f, integrator.u) annotation (Line(
      points={{22,39},{22,0},{38,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator.y, vehicle.iMachine) annotation (Line(
      points={{61,0},{70,0},{70,38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(forceSensor.flange_a, speed.flange) annotation (Line(
      points={{20,50},{-40,50}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(forceSensor.flange_b, vehicle.flangeT_a) annotation (Line(points={{40,50},{50,50},{60,50}}, color={0,127,0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Icon(graphics),
    experiment(
      StopTime=13200,
      Interval=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Radau"),
    Documentation(info="<html>
<p>This example extends 
<a href=\"modelica://ElectroMechanicalDrives.Examples.VehicleDriveCycleWithDrive\">VehicleDriveCycleWithDrive</a>
by:</p>
<ul>
<li>Additional cell resistance of battery</li>
<li>Additional armature resistance of electric DC machine</li>
</ul>
</html>"));
end VehicleDrivesCycleWithDriveLoss;
