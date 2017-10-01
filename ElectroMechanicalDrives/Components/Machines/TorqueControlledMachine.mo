within ElectroMechanicalDrives.Components.Machines;
model TorqueControlledMachine "Signal torque input machine"
  extends ElectroMechanicalDrives.Icons.GearMachine;
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange annotation(Placement(transformation(extent = {{90, -10}, {110, 10}})));

  parameter Boolean useFieldWeakening = false
    "True, if field weakening is considered";
  parameter Modelica.SIunits.Torque tauLimit = Modelica.Constants.inf
    "Torque limit";
  parameter Modelica.SIunits.AngularVelocity wBase = Modelica.Constants.inf
    "Base angular frequency"  annotation(Dialog(enable=useFieldWeakening));

  Modelica.Blocks.Interfaces.RealInput tau_ref(unit = "N.m")
    "Reference torque as input signal"
    annotation(Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));

  Modelica.SIunits.AngularVelocity w = speedSensor.w "Angular velcocity";
  Modelica.SIunits.Angle phi "Absolute rotation angle";
  Modelica.SIunits.AngularAcceleration a "Absolute rotational acceleration";
  Modelica.SIunits.Torque tau = torqueSensor.tau "Torque";
  Modelica.SIunits.Power power = powerSensor.power "Power";

  Modelica.Mechanics.Rotational.Sources.Torque torque annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,0})));
  TorqueLimiter torqueLimiter(
    final useFieldWeakening=useFieldWeakening,
    final tauLimit=tauLimit,
    final wBase=wBase)        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,0})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,-20})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,0})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,0})));
equation
  der(phi) = w;
  der(w) = a;

  connect(torqueLimiter.tauLimited, torque.tau) annotation (Line(points={{-59,0},{-42,0}},   color={0,0,127}));
  connect(torqueLimiter.tau, tau_ref) annotation (Line(points={{-82,0},{-120,0}},
                                                           color={0,0,127}));
  connect(speedSensor.flange, torque.flange) annotation (Line(points={{6.66134e-16,-10},{0,-10},{0,-2},{0,-2},{0,0},{-20,0}}, color={0,0,0}));
  connect(speedSensor.w, torqueLimiter.w) annotation (Line(points={{-6.66134e-16,-31},{-6.66134e-16,-40},{-70,-40},{-70,-12}}, color={0,0,127}));
  connect(speedSensor.flange, torqueSensor.flange_a) annotation (Line(points={{6.66134e-16,-10},{0,-10},{0,-4},{0,-4},{0,0},{20,0}}, color={0,0,0}));
  connect(torqueSensor.flange_b, powerSensor.flange_a) annotation (Line(points={{40,0},{60,0}}, color={0,0,0}));
  connect(powerSensor.flange_b, flange) annotation (Line(points={{80,0},{100,0}}, color={0,0,0}));
  annotation(defaultComponentName = "machine", Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}})),                                                                                                    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(origin = {90, 0}, lineColor = {64, 64, 64}, fillColor = {191, 191, 191},
            fillPattern =                                                                                                   FillPattern.HorizontalCylinder, extent = {{-10, -10}, {10, 10}}), Text(extent = {{-140, 60}, {-100, 20}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.HorizontalCylinder, fillColor = {175, 175, 175}, textString = "tau"), Text(extent = {{-150, 120}, {150, 80}}, textString = "%name", lineColor = {0, 0, 255}), Line(points = {{-100, 0}, {-60, 0}}, color = {0, 0, 0}, smooth = Smooth.None)}),
    Documentation(info="<html>
<p>This is an idealized torque controlled electric machine model. 
The actual torque of the <b>electric machine</b> can be adjusted by means of the signal input.</p>

<p>This machine model considers the following effects:</p>
<ul>
<li>Internal gear ratio to produce more output torque</li>
<li>Total mechanical efficiency due to friction and gear</li>
<li>Inertial with respect to electric machine side</li>
<li>Optional field weaking is considered by<li>
    <ul>
    <li>the maximum torque of the machine, <code>tauLimit</code> for <code>w &le; wBase</code></li>
    <li>the base speed limit <code>wBase</code><li>
    <li>torque reduction proportial to <code>wBase/w</code> for <code>w &gt; wBase</code></li> 
    </ul>
</ul>

</html>"));
end TorqueControlledMachine;
