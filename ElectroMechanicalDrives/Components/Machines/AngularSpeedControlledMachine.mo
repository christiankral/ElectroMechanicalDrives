within ElectroMechanicalDrives.Components.Machines;
model AngularSpeedControlledMachine "Signal angular speed input machine"
  extends ElectroMechanicalDrives.Icons.Machine;
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "Shaft flange"
    annotation(Placement(transformation(extent = {{90, -10}, {110, 10}})));
  parameter Boolean exact = true
    "true/false exact treatment/filtering the input signal";
  parameter Modelica.Units.SI.Frequency f_crit=50
    "if exact=false, critical frequency of filter to filter input signal"
    annotation (Dialog(enable=not exact));

  Modelica.Blocks.Interfaces.RealInput w_ref(unit = "rad/s",displayUnit = "rpm")
    "Reference angular speed as input signal"
    annotation(Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));

  Modelica.Units.SI.Angle phiMachine "Absolute rotation angle of machine";
  Modelica.Units.SI.AngularVelocity wMachine=speedMachineSensor.w
    "Angular velcocity of machine";
  Modelica.Units.SI.AngularAcceleration aMachine
    "Absolute rotational acceleration of machine";
  Modelica.Units.SI.Torque tauMachine=torqueMachineSensor.tau
    "Torque of machine";
  Modelica.Units.SI.Power powerMachine=powerMachineSensor.power
    "Power of machine";

protected
  parameter Modelica.Units.SI.AngularFrequency w_crit=2*Modelica.Constants.pi*
      f_crit "Critical frequency";
public
  Modelica.Mechanics.Rotational.Sources.Speed speed(final exact = exact, final f_crit = f_crit) annotation(Placement(transformation(extent={{-90,-10},{-70,10}})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueMachineSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={10,0})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerMachineSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,0})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedMachineSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,30})));
equation
  der(phiMachine) = wMachine;
  der(wMachine) = aMachine;

  connect(speed.w_ref, w_ref) annotation(Line(points={{-92,0},{-120,0}},      color = {0, 0, 127}, smooth = Smooth.None));
  connect(speedMachineSensor.flange, speed.flange) annotation (Line(points={{-60,20},{-60,0},{-70,0}}, color={0,0,0}));
  connect(speed.flange, torqueMachineSensor.flange_a) annotation (Line(points={{-70,0},{0,0}}, color={0,0,0}));
  connect(torqueMachineSensor.flange_b, powerMachineSensor.flange_a) annotation (Line(points={{20,0},{30,0},{30,0},{40,0}}, color={0,0,0}));
  connect(powerMachineSensor.flange_b, flange) annotation (Line(points={{60,0},{80,0},{80,0},{100,0}}, color={0,0,0}));
  annotation(defaultComponentName = "machine", Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,-100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(origin = {90, 0}, lineColor = {64, 64, 64}, fillColor = {191, 191, 191},
            fillPattern = FillPattern.HorizontalCylinder, extent = {{-10, -10}, {10, 10}}), Text(extent = {{-140, 60}, {-100, 20}}, lineColor = {0, 0, 0},
            fillPattern = FillPattern.HorizontalCylinder, fillColor = {175, 175, 175}, textString = "w"), Text(extent = {{-150, 120}, {150, 80}}, textString = "%name", lineColor = {0, 0, 255}), Line(points = {{-100, 0}, {-60, 0}}, color = {0, 0, 0}, smooth = Smooth.None)}),
    Documentation(info="<html>
<p>This is an idealized angular speed controlled electric machine model. 
The actual angular speed of the <em>electric machine</em> can be adjusted by means of the signal input. 
Make sure that speed discontinuouties do not occur.</p>

<p>
<img src=\"modelica://ElectroMechanicalDrives/Resources/Images/Machine.png\"o>
<br>
Fig. 1: Principle of controlled machine model without gear
</p>

<p>The following variables are calculated in the model</p>
<ul>
<li>Machine</li>
    <ul>
    <li><code>aMachine</code> = angular acceleration of machine</li>
    <li><code>phiMachine</code> = mechanical angle of machine</li>
    <li><code>wMachine</code> = angular velocity of machine</li>
    <li><code>tauMachine</code> = (electrical) torque of machine</li>
    <li><code>powerMachine</code> = power of machine</li>
    </ul>

</ul>

<h5>Notes</h5>
<ul>
<li>Electrical connections are not modeled. The machine will always drive at the controlled input speed.</li>
<li>In case of numerical issues, change parameter <code>exact</code> to <code>false</code></li>
</ul>
</html>"));
end AngularSpeedControlledMachine;
