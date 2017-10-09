within ElectroMechanicalDrives.Components.Machines;
model AngularSpeedControlledMachine "Signal angular speed input machine"
  extends ElectroMechanicalDrives.Icons.Machine;
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange annotation(Placement(transformation(extent = {{90, -10}, {110, 10}})));
  parameter Boolean exact = true
    "true/false exact treatment/filtering the input signal";
  parameter Modelica.SIunits.Frequency f_crit = 50
    "if exact=false, critical frequency of filter to filter input signal"
    annotation(Dialog(enable = not exact));

  Modelica.Blocks.Interfaces.RealInput w_ref(unit = "rad/s")
    "Reference angular speed as input signal"
    annotation(Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));

  Modelica.SIunits.AngularVelocity w = speedSensor.w "Angular velcocity";
  Modelica.SIunits.Angle phi "Absolute rotation angle";
  Modelica.SIunits.AngularAcceleration a "Absolute rotational acceleration";
  Modelica.SIunits.Torque tau = torqueSensor.tau "Torque";
  Modelica.SIunits.Power power = powerSensor.power "Power";
protected
  parameter Modelica.SIunits.AngularFrequency w_crit = 2 * Modelica.Constants.pi * f_crit
    "Critical frequency";
public
  Modelica.Mechanics.Rotational.Sources.Speed speed(final exact = exact, final f_crit = f_crit) annotation(Placement(transformation(extent={{-90,-10},{-70,10}})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,0})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-40,0})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,30})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J) annotation(Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueShaftSensor annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin={50,0})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerShaftSensor annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin={80,0})));
equation
  der(phi) = w;
  der(w) = a;

  connect(powerSensor.flange_b, torqueSensor.flange_a) annotation (Line(
      points={{-30,0},{-20,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(speed.w_ref, w_ref) annotation(Line(points={{-92,0},{-120,0}},      color = {0, 0, 127}, smooth = Smooth.None));
  connect(speed.flange, powerSensor.flange_a) annotation (Line(
      points={{-70,4.44089e-16},{-70,0},{-50,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(speedSensor.flange, speed.flange) annotation (Line(points={{-60,20},{-60,0},{-70,0}},         color={0,0,0}));
  connect(inertia.flange_b,torqueShaftSensor. flange_a) annotation(Line(points={{30,0},{40,0}},            color = {0, 0, 0}, smooth = Smooth.None));
  connect(torqueShaftSensor.flange_b,powerShaftSensor. flange_a) annotation(Line(points={{60,0},{70,0}},                     color = {0, 0, 0}, smooth = Smooth.None));
  connect(torqueSensor.flange_b, inertia.flange_a) annotation (Line(points={{0,0},{6,0},{6,0},{10,0}}, color={0,0,0}));
  connect(powerShaftSensor.flange_b, flange) annotation (Line(points={{90,0},{100,0},{100,0}}, color={0,0,0}));
  annotation(defaultComponentName = "machine", Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,-100},{100,100}})),                Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(origin = {90, 0}, lineColor = {64, 64, 64}, fillColor = {191, 191, 191},
            fillPattern =                                                                                                   FillPattern.HorizontalCylinder, extent = {{-10, -10}, {10, 10}}), Text(extent = {{-140, 60}, {-100, 20}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.HorizontalCylinder, fillColor = {175, 175, 175}, textString = "w"), Text(extent = {{-150, 120}, {150, 80}}, textString = "%name", lineColor = {0, 0, 255}), Line(points = {{-100, 0}, {-60, 0}}, color = {0, 0, 0}, smooth = Smooth.None)}),
    Documentation(info="<html>
<p>This is an idealized angular speed controlled electric machine model. 
The actual angular speed of the <em>electric machine</em> can be adjusted by means of the signal input. 
Make sure that speed discontinuouties do not occur.</p>

<p>This machine model considers the following effects:</p>
<ul>
<li>Internal gear ratio to produce more output torque</li>
<li>Total mechanical efficiency due to friction and gear</li>
<li>Inertial with respect to electric machine side</li>
</ul>


<h5>Notes</h5>
<ul>
<li>Electrical connections are not modeled. The machine will always drive at the controlled input speed.</li>
<li>In case of numerical issues, change parameter <code>exact</code> to <code>false</code></li>
</ul>
</html>"));
end AngularSpeedControlledMachine;
