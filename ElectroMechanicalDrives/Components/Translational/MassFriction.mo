within ElectroMechanicalDrives.Components.Translational;
model MassFriction "Constant force with linear range around zero speed"
  extends ElectroMechanicalDrives.BaseClasses.MassFriction;
equation
  f_friction = smooth(1, if v > v_linear then f_frictionSliding else if v < (-v_linear) then -f_frictionSliding else f_frictionSliding * v / v_linear);
  annotation (defaultComponentName="mass",Documentation(info="<html>
<p>
In this model considers the inertial mass <code>m</code> including the following effects:
</p>
<ul>
<li>Inclination or declination, being constant (<code>useConstantAngle = true</code>) or time dependent (<code>useConstantAngle = false</code>)</li>
<li><a href=\"modelica://ElectroMechanicalDrives.Components.Translational.RollingFriction\">Rolling friction</a> 
    force determined by friction coefficient <code>mu</code></li>
</ul>
<p>This model is extended by <a href=\"modelica://ElectroMechanicalDrives.Components.Vehicles\">vehicle</a> models which also consider
athmospheric friction and optional electric drives.</p>
<h5>Note</h5>
<p>Do not change <code>v_linear</code> except this is required for numerical reasons</p>
</html>"),
    Icon(graphics={                                                                                                                                                                                                        Text(extent={{-150,-110},{150,-140}},    lineColor={0,0,0},
          textString="mu=%mu")}));
end MassFriction;
