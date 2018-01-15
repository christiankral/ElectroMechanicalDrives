within ElectroMechanicalDrives.Components.Translational;
model AthmosphericFriction "Athomspheric friction"
  extends Modelica.Mechanics.Translational.Interfaces.PartialForce;
  parameter Modelica.SIunits.Density rho = 1.2 "Mass density of air";
  parameter Modelica.SIunits.Area A = 3 "Area of cross section";
  parameter Real cx = 0.3 "Drag coefficient (cw in German)";
  Modelica.SIunits.Velocity v "Velocity of flange";
  Modelica.Mechanics.Translational.Sources.QuadraticSpeedDependentForce quadraticSpeedDependentForce(final useSupport = useSupport, final f_nominal = -cx * rho * 1 ^ 2 * A / 2, final ForceDirection = false, final v_nominal = 1) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));
equation
  v = der(s);
  connect(quadraticSpeedDependentForce.support, support) annotation(Line(points = {{0, -10}, {0, -100}}, color = {0, 127, 0}, pattern = LinePattern.None, smooth = Smooth.None));
  connect(quadraticSpeedDependentForce.flange, flange) annotation(Line(points = {{10, 0}, {100, 0}}, color = {0, 127, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics={  Line(points = {{-76, -10}, {-72, -4}, {-64, -2}, {-54, -2}, {-46, -4}, {-40, -2}, {-34, 4}, {-26, 8}, {-18, 8}, {-14, 8}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-76, -10}, {-68, -6}, {-62, -6}, {-52, -10}, {-42, -12}, {-32, -8}, {-26, -4}, {-18, -4}, {-12, -6}, {-4, -10}, {6, -10}, {12, -6}, {20, 2}, {24, 12}, {22, 22}, {16, 26}, {10, 26}, {4, 24}, {-2, 26}, {-12, 24}, {-16, 18}, {-16, 12}, {-14, 8}, {-8, 2}, {0, 0}, {8, 4}, {8, 10}, {4, 14}, {0, 14}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-74, -10}, {-74, -10}, {-66, -8}, {-58, -12}, {-54, -18}, {-46, -20}, {-36, -18}, {-28, -14}, {-22, -14}, {-16, -18}, {-4, -26}, {6, -26}, {16, -24}, {24, -20}, {28, -16}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{24, 12}, {28, 16}, {38, 20}, {46, 20}, {50, 16}, {52, 10}, {58, 16}, {68, 18}, {76, 14}, {78, 6}, {76, 0}, {70, -4}, {64, -8}, {58, -8}, {56, -16}, {52, -20}, {46, -24}, {36, -24}, {30, -20}, {28, -16}, {28, -6}, {32, 2}, {36, 4}, {40, 4}, {44, 2}, {46, -6}, {44, -12}}, color = {0, 0, 255}, smooth = Smooth.None),
                                                                             Text(
              extent={{-150,-120},{150,-160}},
              lineColor={0,0,0},
          textString="cx=%cx")}),
    Documentation(info="<html>
<p>
This model calculates the athmospheric friction force as a function of the square of the speed accoding to
</p>
<pre>
  f = cx*A * rho * v^2/2
</pre>
</html>"));
end AthmosphericFriction;
