within ElectroMechanicalDrives.UsersGuide;
class ReleaseNotes "Release Notes"
  extends Modelica.Icons.ReleaseNotes;
  annotation (preferredView="info",Documentation(info="<html>

<h5>Version v1.1.0, 2017-10-10</h5>
<ul>
<li>Improved documentation of machine models</li>
<li>Fixed duplicate variables of machine models</li>
<li>Added inertia to machine models (without gear)</li>
</ul>

<p>As of version 1.0.0 no more non-backwards compatible changes will be introduced</p>

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
