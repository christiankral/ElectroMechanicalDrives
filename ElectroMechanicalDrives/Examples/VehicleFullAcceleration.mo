within ElectroMechanicalDrives.Examples;
model VehicleFullAcceleration "Full acceleration of vehicle"
  extends Modelica.Icons.Example;
  ElectroMechanicalDrives.Components.Vehicles.VehicleWithDrive vehicle(
    ns=42,
    np=1,
    V1Cell=4,
    V0Cell=3,
    ViniCell=4,
    ECell=1188E3,
    r=0.35,
    i=8.8,
    wBase=0.8*837.8,
    kBase=0.1492/0.8,
    s(start=0,fixed=true),
    v(start=0,fixed=true)) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Step current(y(unit="A"), height=213.3)
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
equation
  connect(current.y, vehicle.iMachine) annotation (Line(
      points={{-19,-30},{0,-30},{0,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,-100},{100,100}}), graphics={  Text(extent = {{-100, 80}, {100, 60}}, lineColor={0,0,255},
          textString="w_base/w_max = 0.8")}),
    experiment(
      StopTime=200,
      Interval=0.1,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>This exaples shows an acceleration test with nominal current.</p>

<p>Investigate as a function of time:</p>
<ul>
<li><code>vehicle.v</code> = vehicle velocity</li>
<li><code>vehicle.machine.power</code> = electric DC machine power</li>
<li><code>vehicle.machine.tauElectrical</code> = electrical torque of the electric DC machine</li>
<li><code>vehicle.machine.v</code> = artmature voltage of electrical DC machine (shows maximum power of 125 V)</li>
</ul>

<p>Investigate as a function of vehicle velocity <code>vehicle.v</code>:</p>
<ul>
<li><code>vehicle.machine.power</code> = electric DC machine power</li>
<li><code>vehicle.machine.tauElectrical</code> = electrical torque of the electric DC machine</li>
<li><code>vehicle.machine.v</code> = artmature voltage of electrical DC machine (shows maximum power of 125 V)</li>
</ul>

</html>"));
end VehicleFullAcceleration;
