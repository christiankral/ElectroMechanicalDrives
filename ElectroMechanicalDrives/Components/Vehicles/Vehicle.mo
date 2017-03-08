within ElectroMechanicalDrives.Components.Vehicles;
model Vehicle "Vehicle with friction"
  extends ElectroMechanicalDrives.Interfaces.PartialVehicle;
  annotation (defaultComponentName="vehicle", Documentation(info="<html>
<p>This vehicle model considers<p>
<ul>
<li><a href=\"modelica://ElectroMechanicalDrives.Components.Translational.RollingFriction\">Rolling friction</a></li>
<li><a href=\"modelica://ElectroMechanicalDrives.Components.Translational.AthmosphericFriction\">Athmospheric friction</a></li>
<li>The effect of effective mass increase due to inertias</li>
</ul>
</html>"));
end Vehicle;
