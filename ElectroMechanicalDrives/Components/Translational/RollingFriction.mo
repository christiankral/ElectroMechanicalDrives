within ElectroMechanicalDrives.Components.Translational;
model RollingFriction
  "Constant rolling force with linear range around zero speed"
  extends Modelica.Mechanics.Translational.Interfaces.PartialForce;
  parameter Modelica.SIunits.Force f_constant(final min = 0)
    "Constant friction force";
  parameter Modelica.SIunits.Velocity v_linear(final min = 0) = 0.01
    "Speed limit of constant friction";
  Modelica.SIunits.Velocity v "Speed";
  extends
    Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
equation
  v = der(s);
  f = smooth(1, if v > v_linear then f_constant else if v < (-v_linear) then -f_constant else f_constant * v / v_linear);
  lossPower = f * v;
  annotation(defaultComponentName = "friction", Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-80, -40}, {-20, -40}, {20, 40}, {80, 40}}, color = {0, 0, 255}, smooth = Smooth.None)}),
    Documentation(info="<html>
<p>
<img src=\"modelica://ElectroMechanicalDrives/Resources/Images/friction.png\">
</p>

<p>Characteristica of the rolling friction model</p>
<ul>
<li>constant friction force for <code>v </code>&ge;<code> v_linear</code></li>
<li>friction force changes sign linearly for <code>v </code>&lt;<code> v_linear</code> to achieve a continuous transistion</li>
<li>parameter <code>v_linear</code> shall not be change except for numerical reasons</li>
</ul>
</p></html>"));
end RollingFriction;
