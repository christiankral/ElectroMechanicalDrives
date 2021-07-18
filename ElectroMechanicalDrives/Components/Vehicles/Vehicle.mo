within ElectroMechanicalDrives.Components.Vehicles;
model Vehicle "Vehicle with friction"
  extends ElectroMechanicalDrives.BaseClasses.Vehicle;
  annotation (defaultComponentName="vehicle", Documentation(info="<html>
<p>This vehicle model considers<p>
<ul>
<li><a href=\"modelica://ElectroMechanicalDrives.Components.Translational.RollingFriction\">Rolling friction</a></li>
<li><a href=\"modelica://ElectroMechanicalDrives.Components.Translational.AthmosphericFriction\">Athmospheric friction</a></li>
<li>The effect of effective mass increase due to inertias</li>
<li>The impact of going up or down an inclined way by means of the constant angle parameter <code>constantAnge</code>
or the signal input <code>variableAngle</code>.</li>
<li>The vehicle has to translational sides and two roational axes to be driven</li>
</ul>
<h5>Note</h5>
<p>Do not change <code>v_linear</code> except this is required for numerical reasons</p>
</html>"));
end Vehicle;
