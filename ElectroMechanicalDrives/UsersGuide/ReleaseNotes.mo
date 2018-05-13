within ElectroMechanicalDrives.UsersGuide;
class ReleaseNotes "Release Notes"
  extends Modelica.Icons.ReleaseNotes;
  annotation (preferredView="info",Documentation(info="<html>

<h5>Version v1.6.0, 2018-05-13</h5>
<ul>
<li>Moved parameter <code>v_linear</code> to tab Tuning, see 
    <a href=\"https://github.com/christiankral/ElectroMechanicalDrives/issues/13\">#13</a></li>
<li>Limited parameter <code>efficiency</code> to <code>0 &lt; efficiency &le; 1</code>, see
    <a href=\"https://github.com/christiankral/ElectroMechanicalDrives/issues/14\">#14</a></li></li>
</ul>


<h5>Version v1.5.1, 2018-01-15</h5>
<ul>
<li>Added <code>partial</code> to all partial <a href=\"modelica://ElectroMechanicalDrives.Interfaces\">Interfaces</a> models</li>
</ul>

<h5>Version v1.5.0, 2018-01-15</h5>
<ul>
<li>Added parameters to icon representation, see
    <a href=\"https://github.com/christiankral/ElectroMechanicalDrives/issues/10\">#10</a></li>
<li>Removed inertia and parameter J from models
    <ul>
    <li><a href=\"modelica://ElectroMechanicalDrives.Components.Machines.AngularSpeedControlledMachine\">AngularSpeedControlledMachine</a></li>
    <li><a href=\"modelica://ElectroMechanicalDrives.Components.Machines.AngularSpeedControlledMachine\">AngularTorqueControlledMachine</a></li>
    </ul>
    as they are a design flaw; see 
    <a href=\"https://github.com/christiankral/ElectroMechanicalDrives/issues/11\">#11</a>
</li>
<li>Changed gear machine icon to better distinguish from non-gear machine</li>
    
</ul>

<h5>Version v1.4.0, 2017-11-20</h5>
<ul>
<li>Added <a href=\"modelica://ElectroMechanicalDrives.Components.Rotational.GearConstantEfficiency\">gear</a> 
    with constant efficiency</li>
<li>Added some more default component names</li>
</ul>

<h5>Version v1.3.1, 2017-10-15</h5>
<ul>
<li>Added alias variables to partial vehicle and partial mass friction model to calculate the total grafient force and power (forgotten in version 1.3.0)</li>
</ul>

<h5>Version v1.3.0, 2017-10-15</h5>
<ul>
<li>Added alias variables to partial vehicle model to calculate the total friction force and all friction power terms</li>
</ul>

<h5>Version v1.2.0, 2017-10-12</h5>
<ul>
<li>Improved documentation of examples</li>
<li>Set all initial conditions of examples</li>
<li>Added alias variables to partial vehicle model to better identify friction forces</li>
<li>Improved simulation tolerance and reduced plotting intervals of examples</li>
</ul>

<h5>Version v1.1.0, 2017-10-10</h5>
<ul>
<li>Improved documentation</li>
<li>Fixed duplicate variables of machine models</li>
<li>Added inertia to machine models (without gear)</li>
<li>Removed obsolete and unused models</li>
<ul><li>ElectroMechanicalDrives.Components.Internal.Obsolete.MassFullFrictionGradient</li>
    <li>ElectroMechanicalDrives.Components.Internal.Obsolete.MassFullFrictionVariableGradient</li>
    <li>ElectroMechanicalDrives.Components.Internal.Obsolete.WheelFriction</li>
    <li>ElectroMechanicalDrives.Components.Internal.Obsolete.Translational.ConstantEfficiencyControlled</li>
    <li>ElectroMechanicalDrives.Components.Internal.Obsolete.Rotational.ConstantEfficiencyControlled</li>
    <li>ElectroMechanicalDrives.Components.Internal.VariableDamper</li>
    <li>ElectroMechanicalDrives.Components.Internal.Blocks.ConditionalAngle</li>
</ul>
<li>Updated and added icons</li>
<li>Re-structured battery model by using a partial battery model</p>
</ul>

<h5>Version v1.0.0, 2017-10-01</h5>
<ul>
<li>Switched license to BSD-3-Clause</li>
</ul>
<p>Non backwards compatible changes</p>
<ul>
<li>Removed controlled efficiency models</li>
<li>Removed obsolete Resistance Rcell of VehicleWithDrive</li>
<li>Removed obsolete GenericAthmosphericFriction</li>
</ul>

<h5>Version v0.14.0, 2017-09-30</h5>
<ul>
<li>Alternative implementation of rotational and translational efficiency models based on
    <a href=\"https://github.com/christiankral/ElectroMechanicalDrives/issues/6\">#6</a></li>
</ul>

<h5>Version v0.13.0, 2017-08-24</h5>
<ul>
<li>Updated drive cycles to avoid problems with table implementation and power peaks</li>
<li>Changed subfolder name Souces to Sources</li>
</ul>

<h5>Version v0.12.0, 2017-02-10</h5>
<ul>
<li>Added some more teaching examples</li>
<li>Separated examples and component testing examples</li>
<li>Changed icon of internal package</li>
<li>Added controlled efficiency models</li>
</ul>

<h5>Version v0.10.1, 2016-12-04</h5>
<ul>
<li>Fixed wrong sign of current in vehicle with loss model</li>
<li>Set Dymola specific solvers to achieve numerically stable solutions as there are some issues which may be caused by non-triggered events</li>
</ul>

<h5>Version v0.10.0, 2016-11-30</h5>
<ul>
<li>Change sign of current input of vehicle (non backwards compatible change)</li>
<li>Added force, torque, and angular variable to partial vehicle model</li>
<li>Added unit to current input of vehicle models with drive</li>
</ul>

<h5>Version v0.9.0, 2016-10-29</h5>
<ul>
<li>Revised TorqueLimiter block</li>
<li>Added second axle to vehicle model</li>
<li>Updated icons</li>
<li>Improved documentation</li>
</ul>

<h5>Version v0.8.0, 2016-09-02</h5>
<ul>
<li>Restructured version with backwards incompatibilities to v0.7.0</li>
<li>Improved documentation</li>
</ul></html>"));
end ReleaseNotes;
