within ElectroMechanicalDrives.Components.Rotational;
model RollingFriction
  "Constant friction torque with linear range around zero"
  extends Modelica.Mechanics.Rotational.Interfaces.PartialTorque;
  parameter Modelica.SIunits.Torque tau_constant(final min = 0)
    "Constant friction torque (if negative, force is acting as load)";
  parameter Modelica.SIunits.AngularVelocity w_linear(final min = 0) = 0.1
    "Region of linear torque vs angular speed";
  Modelica.SIunits.Torque tau "Friction torque";
  Modelica.SIunits.AngularVelocity w "Angular velocity";
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
equation
  w = der(phi);
  tau = smooth(1, if w > w_linear then tau_constant else if w < (-w_linear) then -tau_constant else tau_constant * w / w_linear);
  lossPower = -tau * w;
  tau = -flange.tau;
  annotation(defaultComponentName="friction",Icon(graphics={  Ellipse(extent = {{-60, 60}, {60, -60}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175},
          fillPattern =                                                                                                   FillPattern.Solid), Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
          fillPattern =                                                                                                   FillPattern.Solid), Ellipse(extent = {{-12, 50}, {8, 30}}, lineColor = {0, 0, 0},
          fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{-10, -30}, {10, -50}}, lineColor = {0, 0, 0},
          fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{24, -10}, {44, -30}}, lineColor = {0, 0, 0},
          fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{22, 34}, {42, 14}}, lineColor = {0, 0, 0},
          fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{-44, 30}, {-24, 10}}, lineColor = {0, 0, 0},
          fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{-44, -12}, {-24, -32}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{-30, 30}, {30, -30}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175},
            fillPattern =                                                                                                   FillPattern.Solid), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                   FillPattern.Solid),
                                                                             Text(
              extent={{-150,-120},{150,-170}},
              lineColor={0,0,0},
          textString="tau_constant=%tau_constant")}),                                                                                             Documentation(info="<html>
<p>
The friction model is implemented as a constant breaking torque similar to 
<a href=\"modelica://ElectroMechanicalDrives.Components.Translational.RollingFriction\">Translational.RollingFriction</a>.
</p>
</html>"));
end RollingFriction;
