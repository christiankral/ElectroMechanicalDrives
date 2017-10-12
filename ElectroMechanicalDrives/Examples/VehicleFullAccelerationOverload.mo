within ElectroMechanicalDrives.Examples;
model VehicleFullAccelerationOverload "Full acceleration of vehicle"
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
    wBase=0.25*837.8,
    kBase=0.1492/0.25,
    s(start=0,fixed=true),
    v(start=0,fixed=true)) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Step current(y(unit="A"), height=213.3*1.4)
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
equation
  connect(current.y, vehicle.iMachine) annotation (Line(
      points={{-19,-30},{0,-30},{0,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-100, 80}, {100, 60}}, lineColor={0,0,255},
          textString="w_base/w_max= 0.25"),                                                                                                                                                                           Text(extent = {{-100, 50}, {100, 30}}, lineColor = {0, 0, 255}, textString = "full overload u = 1.4")}),
    experiment(
      StopTime=200,
      Interval=0.1,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>Acceleration test with 140% of nominal current. The electric machine is different from
<a href=\"modelica://ElectroMechanicalDrives.Examples.VehicleFullAcceleration\">VehicleFullAcceleration</a>: </p>
<ul>
<li>Reduced base angular velocity</li>
<li>Same nominal power and nominal (rated) voltage</li>
<li>Higher magnetic flux (due to redued base angular velocity) and thus bigger machine volume and mass</li>
</ul>

<p>Investigate as a function of time:</p>
<ul>
<li><code>vehicle.v</code> = vehicle velocity</li>
<li><code>vehicle.machine.power</code> = electric DC machine power</li>
<li><code>vehicle.machine.tauElectrical</code> = electrical torque of the electric DC machine</li>
<li><code>vehicle.machine.v</code> = artmature voltage of electrical DC machine (shows maximum power of 125 V)</li>
</ul>

<p>Investigate as a function of vehicle velocity <code>vehicle.v</code>:</p>
<ul>
<li><code>vehicle.machine.k</code> = transformation coefficient of machine</li>
<li><code>vehicle.machine.power</code> = electric DC machine power</li>
<li><code>vehicle.machine.tauElectrical</code> = electrical torque of the electric DC machine</li>
<li><code>vehicle.machine.v</code> = artmature voltage of electrical DC machine (shows maximum power of 125 V)</li>
</ul>

</html>"));
end VehicleFullAccelerationOverload;
