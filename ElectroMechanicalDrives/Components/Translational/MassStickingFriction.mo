within ElectroMechanicalDrives.Components.Translational;
model MassStickingFriction
  extends Interfaces.PartialMassFriction;
  parameter Real peak = 1
    "Peak sticking friction w.r.t. sliding friction";
equation
  f_friction = if v >= 2 * v_linear then +f_frictionSliding else if v > v_linear and v < 2 * v_linear then (+(2 * peak - 1) * f_frictionSliding) - (peak - 1) * f_frictionSliding * v / v_linear else if v >= (-v_linear) and v <= v_linear then +peak * f_frictionSliding * v / v_linear else if v < (-v_linear) and v > (-2 * v_linear) then (-(2 * peak - 1) * f_frictionSliding) - (peak - 1) * f_frictionSliding * v / v_linear else -f_frictionSliding;
  annotation(defaultComponentName="mass",Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points={{-60,-56},{-74,-20}},
                                                                                                                                      color = {0, 0, 0}, smooth = Smooth.None),                                                                                                                                                                                              Text(extent={{-150,-110},{150,-140}},    lineColor={0,0,0},
          textString="mu=%mu")}),
      Documentation(info="<html>
<p>
In this model considers the inertial mass <code>m</code> including the following effects:
</p>
<ul>
<li>Inclination or declination, being constant (<code>useConstantAngle = true</code>) or time dependent (<code>useConstantAngle = false</code>)</li>
<li>Rolling and friction force determined by friction coefficient <code>mu</code></li>
<li>Sticking frcition determined by coefficient <code>peak*mu</code></li>
</ul>
<p>This model is extended by <a href=\"modelica://ElectroMechanicalDrives.Components.Vehicles\">vehicle</a> models which also consider
athmospheric friction and optional electric drives. The vehicle models do <em>not</em> consider sticking friction, though.</p>
<h5>Note</h5>
<p>Do not change <code>v_linear</code> except this is required for numerical reasons</p>
</html>"));
end MassStickingFriction;
