within ElectroMechanicalDrives.Components.Translational;
model Clutch "Clutch based on Coulomb friction"
  // extends Modelica.Mechanics.Rotational.Icons.Clutch;
  extends Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  parameter Real mue_pos[:, 2] = [0, 0.5]
    "[v,mue] positive sliding friction coefficient (v_rel>=0)";
  parameter Real peak(final min = 1) = 1
    "peak*mue_pos[1,2] = maximum value of mue for v_rel==0";
  parameter Real cgeo(final min = 0) = 1
    "Geometry constant containing friction distribution assumption";
  parameter Modelica.SIunits.Force fn_max(final min = 0, start = 1)
    "Maximum normal force";
  extends Modelica.Mechanics.Translational.Interfaces.PartialFriction;
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
  Real mue0 "Friction coefficient for v=0 and forward sliding";
  Modelica.SIunits.Force fn "Normal force (fn=fn_max*f_normalized)";
  Modelica.SIunits.Acceleration a_rel(start = 0)
    "Relative angular acceleration (= der(v_rel))";
  Modelica.Blocks.Interfaces.RealInput f_normalized
    "Normalized force signal 0..1 (normal force = fn_max*f_normalized; clutch is engaged if > 0)"     annotation(Placement(transformation(origin = {0, 110}, extent = {{20, -20}, {-20, 20}}, rotation = 90)));
equation
  a_rel = der(v_rel);
  // Constant auxiliary variable
  mue0 = Modelica.Math.tempInterpol1(0, mue_pos, 2);
  // Relative quantities
  v_relfric = v_rel;
  a_relfric = a_rel;
  // Normal force and friction torque for w_rel=0
  fn = fn_max * f_normalized;
  free = fn <= 0;
  f0 = mue0 * cgeo * fn;
  f0_max = peak * f0;
  // Friction torque
  f = if locked then sa * unitForce else if free then 0 else cgeo * fn * (if startForward then Modelica.Math.tempInterpol1(v_rel, mue_pos, 2) else if startBackward then -Modelica.Math.tempInterpol1(-v_rel, mue_pos, 2) else if pre(mode) == Forward then Modelica.Math.tempInterpol1(v_rel, mue_pos, 2) else -Modelica.Math.tempInterpol1(-v_rel, mue_pos, 2));
  lossPower = f * v_relfric;
  annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-150, -110}, {150, -70}}, textString = "%name", lineColor = {0, 0, 255}), Line(visible = useHeatPort, points = {{-100, -100}, {-100, -40}, {0, -40}}, color = {191, 0, 0}, pattern = LinePattern.Dot, smooth = Smooth.None), Rectangle(extent = {{-80, 30}, {20, 10}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {128, 128, 128}), Rectangle(extent = {{-20, -10}, {80, -30}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {128, 128, 128}), Polygon(lineColor = {0, 0, 127}, fillColor = {0, 0, 127},
            fillPattern =                                                                                                   FillPattern.Solid, points = {{0, 30}, {10, 60}, {-10, 60}, {0, 30}}), Polygon(lineColor = {0, 0, 127}, fillColor = {0, 0, 127},
            fillPattern =                                                                                                   FillPattern.Solid, points = {{0, -30}, {10, -60}, {-10, -60}, {0, -30}}), Line(points = {{0, 90}, {0, 80}, {0, 70}, {0, 60}}, color = {0, 0, 127}), Line(points = {{-80, 20}, {-100, 20}, {-100, 0}}, color = {0, 127, 0}, smooth = Smooth.None), Line(points = {{100, 0}, {100, -20}, {80, -20}}, color = {0, 127, 0}, smooth = Smooth.None)}), Documentation(info="<html>
<p>This translational clutch model is implemented based on the rotational 
<a href=\"modelica://Modelica.Mechanics.Rotational.Components.Clutch\">clutch</a> version.</p>
</html>"),
     Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Clutch;
