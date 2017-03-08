within ElectroMechanicalDrives.Components.Internal.Obsolete;
model MassFullFrictionVariableGradient "Mass with friction"
  extends Modelica.Icons.ObsoleteModel;
  Modelica.Blocks.Interfaces.RealInput angle "Gradient of inclination" annotation(Placement(transformation(extent = {{-140, -80}, {-100, -40}}), iconTransformation(extent = {{-140, -80}, {-100, -40}})));
  extends Modelica.Mechanics.Translational.Interfaces.PartialElementaryTwoFlangesAndSupport2;
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
  parameter Modelica.SIunits.Mass m(min = 0, start = 1)
    "Mass of the sliding mass";
  parameter Real mu "Friction coefficient";
  final parameter Real f_pos[:, 2] = [0, m * Modelica.Constants.g_n * mu]
    "[v, f] Positive sliding friction characteristic (v>=0)";
  parameter Real peak(final min = 1) = 1
    "peak*f_pos[1,2] = Maximum friction force for v==0";
  extends Modelica.Mechanics.Translational.Interfaces.PartialFriction;
  Modelica.SIunits.Position s "Position of flange_a";
  Modelica.SIunits.Force f "Friction force of level movement";
  Modelica.SIunits.Velocity v
    "Absolute velocity of flange_a and flange_b";
  Modelica.SIunits.Acceleration a
    "Absolute acceleration of flange_a and flange_b";
  Modelica.SIunits.Force f_gradient "Friction force including gradient";
equation
  // Constant auxiliary variables
  f0 = Modelica.Math.tempInterpol1(0, f_pos, 2);
  f0_max = peak * f0;
  free = false;
  s = flange_a.s - s_support;
  flange_a.s = flange_b.s;
  // Velocity and acceleration of flanges
  v = der(s);
  a = der(v);
  v_relfric = v;
  a_relfric = a;
  // Friction force
  flange_a.f + flange_b.f - f_gradient = m * a + m * Modelica.Constants.g_n * sin(angle);
  // Friction force
  f = if locked then sa * unitForce else if startForward then Modelica.Math.tempInterpol1(v, f_pos, 2) else if startBackward then -Modelica.Math.tempInterpol1(-v, f_pos, 2) else if pre(mode) == Forward then Modelica.Math.tempInterpol1(v, f_pos, 2) else -Modelica.Math.tempInterpol1(-v, f_pos, 2);
  f_gradient = f * cos(angle);
  lossPower = f_gradient * v_relfric;
  annotation(defaultComponentName = "massFriction", Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-100, 0}, {-54, 0}}, color = {0, 127, 0}), Line(points = {{54, 0}, {100, 0}}, color = {0, 127, 0}), Text(extent = {{-150, 100}, {150, 60}}, textString = "%name", lineColor = {0, 0, 255}), Text(extent = {{-150, -47}, {150, -77}}, lineColor = {0, 0, 0}, textString = "m=%m"), Line(points = {{-100, -60}, {100, -20}}, color = {0, 0, 0}, smooth = Smooth.None), Polygon(points = {{-46, -40}, {60, -18}, {46, 42}, {-58, 20}, {-46, -40}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, smooth = Smooth.None, fillColor = {128, 128, 128})}));
end MassFullFrictionVariableGradient;
