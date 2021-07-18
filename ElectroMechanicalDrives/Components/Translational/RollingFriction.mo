within ElectroMechanicalDrives.Components.Translational;
model RollingFriction
  "Constant rolling force with linear range around zero speed"
  extends Modelica.Mechanics.Translational.Interfaces.PartialForce;
  parameter Modelica.Units.SI.Force f_constant(final min=0)
    "Constant friction force (if negative, force is acting as load)";
  parameter Modelica.Units.SI.Velocity v_linear=0.01
    "Speed limit of constant rolling friction (do not change unless required)"
    annotation (Dialog(tab="Tuning", groupImage=
          "modelica://ElectroMechanicalDrives/Resources/Images/v_linearBase.png"));
  Modelica.Units.SI.Velocity v "Speed";
  extends
    Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
equation
  v = der(s);
  f = smooth(1, if v > v_linear then f_constant else if v < (-v_linear) then -f_constant else f_constant * v / v_linear);
  lossPower = f * v;
  annotation(defaultComponentName = "friction", Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-80, -40}, {-20, -40}, {20, 40}, {80, 40}}, color = {0, 0, 255}, smooth = Smooth.None),
                                                                             Text(
              extent={{-150,-120},{150,-170}},
              lineColor={0,0,0},
          textString="f_constant=%f_constant")}),
    Documentation(info="<html>
<p>
<img src=\"modelica://ElectroMechanicalDrives/Resources/Images/friction.png\">
</p>

<p>Characteristica of the rolling friction model</p>
<ul>
<li>constant friction force for <code>v </code>&ge;<code> v_linear</code></li>
<li>friction force changes sign linearly for <code>v </code>&lt;<code> v_linear</code> to achieve a continuous transition</li>
<li>parameter <code>v_linear</code> shall not be change except for numerical reasons</li>
</ul>
</p></html>"));
end RollingFriction;
