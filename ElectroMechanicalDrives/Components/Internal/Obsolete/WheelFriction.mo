within ElectroMechanicalDrives.Components.Internal.Obsolete;
model WheelFriction
  "Constant force with linear range around zero speed"
  extends Modelica.Icons.ObsoleteModel;
  extends Modelica.Mechanics.Translational.Interfaces.PartialForce;
  parameter Modelica.SIunits.Force N(final min = 0) "Normal force";
  parameter Modelica.SIunits.Diameter D "Diameter of wheel";
  parameter Modelica.SIunits.Diameter d "Diameter of bearing pin";
  parameter Modelica.SIunits.Length lf = 0.5E-3
    "Lever arm of rolling friction";
  parameter Real mu = 0.005 "Friction coefficient of bearing";
  parameter Real c = 0.003 "Coefficient of rim friction";
  parameter Modelica.SIunits.Velocity v_linear(final min = 0) = 0.01
    "Speed limit of constant friction";
  final parameter Modelica.SIunits.Force f_constant = N * (2 / D * (mu * d / 2 + lf) + c)
    "Total friction force";
  Modelica.SIunits.Velocity v "Speed";
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
equation
  v = der(s);
  f = smooth(1, if v > v_linear then f_constant else if v < (-v_linear) then -f_constant else f_constant * v / v_linear);
  lossPower = f * v;
  annotation(defaultComponentName = "friction", Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-60, 60}, {60, -60}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175},
            fillPattern =                                                                                                   FillPattern.Solid), Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                   FillPattern.Solid), Ellipse(extent = {{-12, 50}, {8, 30}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{-10, -30}, {10, -50}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{24, -10}, {44, -30}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{22, 34}, {42, 14}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{-44, 30}, {-24, 10}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{-44, -12}, {-24, -32}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{-30, 30}, {30, -30}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175},
            fillPattern =                                                                                                   FillPattern.Solid), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                   FillPattern.Solid)}));
end WheelFriction;
