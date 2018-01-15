within ElectroMechanicalDrives.Components.Machines;
model TorqueControlledMachine "Signal torque input machine"
  extends ElectroMechanicalDrives.Icons.Machine;
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "Shaft flange"
                                                           annotation(Placement(transformation(extent = {{90, -10}, {110, 10}})));

  parameter Boolean useFieldWeakening = false
    "True, if field weakening is considered";
  parameter Modelica.SIunits.Torque tauLimit = Modelica.Constants.inf
    "Torque limit";
  parameter Modelica.SIunits.AngularVelocity wBase = Modelica.Constants.inf
    "Base angular frequency"  annotation(Dialog(enable=useFieldWeakening));

  Modelica.Blocks.Interfaces.RealInput tau_ref(unit = "N.m")
    "Reference torque as input signal"
    annotation(Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));

  Modelica.Mechanics.Rotational.Sources.Torque torque annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,0})));
  TorqueLimiter torqueLimiter(
    final useFieldWeakening=useFieldWeakening,
    final tauLimit=tauLimit,
    final wBase=wBase)        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-80,0})));

  Modelica.SIunits.AngularVelocity wMachine=speedMachineSensor.w "Angular velcocity of machine";
  Modelica.SIunits.Angle phiMachine "Absolute rotation angle of machine";
  Modelica.SIunits.AngularAcceleration aMachine "Absolute rotational acceleration of machine";
  Modelica.SIunits.Torque tauMachine=torqueMachineSensor.tau "Torque of machine";
  Modelica.SIunits.Power powerMachine=powerMachineSensor.power "Power of machine";

  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedMachineSensor annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-30,-20})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueMachineSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={10,0})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerMachineSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,0})));
equation
  der(phiMachine) = wMachine;
  der(wMachine) = aMachine;

  connect(torqueLimiter.tauLimited, torque.tau) annotation (Line(points={{-69,0},{-62,0}},   color={0,0,127}));
  connect(torqueLimiter.tau, tau_ref) annotation (Line(points={{-92,0},{-120,0}},
                                                           color={0,0,127}));
  connect(speedMachineSensor.flange, torque.flange) annotation (Line(points={{-30,-10},{-30,0},{-40,0}}, color={0,0,0}));
  connect(speedMachineSensor.w, torqueLimiter.w) annotation (Line(points={{-30,-31},{-30,-40},{-80,-40},{-80,-12}}, color={0,0,127}));
  connect(speedMachineSensor.flange, torqueMachineSensor.flange_a) annotation (Line(points={{-30,-10},{-30,0},{0,0}},
                                                                                                                color={0,0,0}));
  connect(torqueMachineSensor.flange_b, powerMachineSensor.flange_a) annotation (Line(points={{20,0},{40,0}},                                         color={0,0,0}));
  connect(powerMachineSensor.flange_b, flange) annotation (Line(points={{60,0},{100,0}}, color={0,0,0}));
  annotation(defaultComponentName = "machine", Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}})),                                                                                                    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(origin = {90, 0}, lineColor = {64, 64, 64}, fillColor = {191, 191, 191},
            fillPattern =                                                                                                   FillPattern.HorizontalCylinder, extent = {{-10, -10}, {10, 10}}), Text(extent = {{-140, 60}, {-100, 20}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.HorizontalCylinder, fillColor = {175, 175, 175}, textString = "tau"), Text(extent = {{-150, 120}, {150, 80}}, textString = "%name", lineColor = {0, 0, 255}), Line(points = {{-100, 0}, {-60, 0}}, color = {0, 0, 0}, smooth = Smooth.None)}),
    Documentation(info="<html>
<p>This is an idealized torque controlled electric machine model. 
The actual torque of the <em>electric machine</em> can be adjusted by means of the signal input.</p>

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

<p>This machine model considers the following effect:</p>
<ul>
<li>Optional field weaking is considered by<li>
    <ul>
    <li>the maximum torque of the machine, <code>tauLimit</code> for <code>w &le; wBase</code></li>
    <li>the base speed limit <code>wBase</code><li>
    <li>torque reduction proportial to <code>wBase/w</code> for <code>w &gt; wBase</code></li> 
    </ul>
</ul>

</html>"));
end TorqueControlledMachine;
