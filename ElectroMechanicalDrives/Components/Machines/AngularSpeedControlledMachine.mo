within ElectroMechanicalDrives.Components.Machines;
model AngularSpeedControlledMachine "Signal angular speed input machine"
  extends ElectroMechanicalDrives.Icons.Machine;
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "Shaft flange"
                                                           annotation(Placement(transformation(extent = {{90, -10}, {110, 10}})));
  parameter Boolean exact = true
    "true/false exact treatment/filtering the input signal";
  parameter Modelica.SIunits.Frequency f_crit = 50
    "if exact=false, critical frequency of filter to filter input signal"
    annotation(Dialog(enable = not exact));
  parameter Modelica.SIunits.Inertia J = 0
    "Total inertia of machine w.r.t machine speed" annotation(Evaluate = true);

  Modelica.Blocks.Interfaces.RealInput w_ref(unit = "rad/s")
    "Reference angular speed as input signal"
    annotation(Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));

  Modelica.SIunits.Angle phiMachine "Absolute rotation angle of machine";
  Modelica.SIunits.AngularVelocity wMachine=speedMachineSensor.w "Angular velcocity of machine";
  Modelica.SIunits.AngularAcceleration aMachine "Absolute rotational acceleration of machine";
  Modelica.SIunits.Torque tauMachine=torqueMachineSensor.tau "Torque of machine";
  Modelica.SIunits.Power powerMachine=powerMachineSensor.power "Power of machine";

  Modelica.SIunits.Angle phiShaft = phiMachine "Absolute rotation angle";
  Modelica.SIunits.AngularVelocity wShaft = wMachine "Angular velcocity";
  Modelica.SIunits.AngularAcceleration aShaft = aMachine  "Absolute rotational acceleration";
  Modelica.SIunits.Torque tauShaft=torqueShaftSensor.tau "Torque";
  Modelica.SIunits.Power powerShaft=powerShaftSensor.power "Power";
protected
  parameter Modelica.SIunits.AngularFrequency w_crit = 2 * Modelica.Constants.pi * f_crit
    "Critical frequency";
public
  Modelica.Mechanics.Rotational.Sources.Speed speed(final exact = exact, final f_crit = f_crit) annotation(Placement(transformation(extent={{-90,-10},{-70,10}})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueMachineSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,0})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerMachineSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-40,0})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedMachineSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,30})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(final J = J) annotation(Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueShaftSensor annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin={50,0})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerShaftSensor annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin={80,0})));
equation
  der(phiMachine) = wMachine;
  der(wMachine) = aMachine;

  connect(powerMachineSensor.flange_b, torqueMachineSensor.flange_a) annotation (Line(
      points={{-30,0},{-20,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(speed.w_ref, w_ref) annotation(Line(points={{-92,0},{-120,0}},      color = {0, 0, 127}, smooth = Smooth.None));
  connect(speed.flange, powerMachineSensor.flange_a) annotation (Line(
      points={{-70,4.44089e-16},{-70,0},{-50,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(speedMachineSensor.flange, speed.flange) annotation (Line(points={{-60,20},{-60,0},{-70,0}}, color={0,0,0}));
  connect(inertia.flange_b,torqueShaftSensor. flange_a) annotation(Line(points={{30,0},{40,0}},            color = {0, 0, 0}, smooth = Smooth.None));
  connect(torqueShaftSensor.flange_b,powerShaftSensor. flange_a) annotation(Line(points={{60,0},{70,0}},                     color = {0, 0, 0}, smooth = Smooth.None));
  connect(torqueMachineSensor.flange_b, inertia.flange_a) annotation (Line(points={{0,0},{6,0},{6,0},{10,0}}, color={0,0,0}));
  connect(powerShaftSensor.flange_b, flange) annotation (Line(points={{90,0},{100,0},{100,0}}, color={0,0,0}));
  annotation(defaultComponentName = "machine", Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,-100},{100,100}})),                Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(origin = {90, 0}, lineColor = {64, 64, 64}, fillColor = {191, 191, 191},
            fillPattern =                                                                                                   FillPattern.HorizontalCylinder, extent = {{-10, -10}, {10, 10}}), Text(extent = {{-140, 60}, {-100, 20}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.HorizontalCylinder, fillColor = {175, 175, 175}, textString = "w"), Text(extent = {{-150, 120}, {150, 80}}, textString = "%name", lineColor = {0, 0, 255}), Line(points = {{-100, 0}, {-60, 0}}, color = {0, 0, 0}, smooth = Smooth.None)}),
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
<li>Shaft</li>
    <ul>
    <li><code>aShaft</code> = angular acceleration of shaft</li>
    <li><code>phiShaft</code> = mechanical angle of shaft</li>
    <li><code>wShaft</code> = angular velocity of shaft</li>
    <li><code>tauShaft</code> = torque of shaft</li>
    <li><code>powerShaft</code> = power of shaft</li>
    </ul>
</ul>

<p>This machine model considers the following effect:</p>
<ul>
<li>Inertia with respect to electric machine side</li>
</ul>

<h5>Notes</h5>
<ul>
<li>Electrical connections are not modeled. The machine will always drive at the controlled input speed.</li>
<li>In case of numerical issues, change parameter <code>exact</code> to <code>false</code></li>
</ul>
</html>"));
end AngularSpeedControlledMachine;
