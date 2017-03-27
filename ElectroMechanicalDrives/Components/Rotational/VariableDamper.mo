within ElectroMechanicalDrives.Components.Rotational;
model VariableDamper "Linear 1D rotational damper"
  extends Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
  Modelica.Blocks.Interfaces.RealInput d "Damping coefficient" annotation(Placement(transformation(extent = {{-140, -80}, {-100, -40}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -120})));
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
equation
  tau = d * w_rel;
  lossPower = tau * w_rel;
  annotation(Documentation(info = "<html>
<p>
<b>Linear, velocity dependent damper</b> element. It can be either connected
between an inertia or gear and the housing (component Fixed), or
between two inertia/gear elements.
</p>

<p>
See also the discussion
<a href=\"modelica://Modelica.Mechanics.Rotational.UsersGuide.StateSelection\">State Selection</a>
in the User's Guide of the Rotational library.
</p>
</html>"),
     Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-90, 0}, {-60, 0}}, color = {0, 0, 0}), Line(points = {{-60, -30}, {-60, 30}}, color = {0, 0, 0}), Line(points = {{-60, -30}, {60, -30}}, color = {0, 0, 0}), Line(points = {{-60, 30}, {60, 30}}, color = {0, 0, 0}), Rectangle(extent = {{-60, 30}, {30, -30}}, lineColor = {0, 0, 0}, fillColor = {192, 192, 192},
          fillPattern =                                                                                                   FillPattern.Solid), Line(points = {{30, 0}, {90, 0}}, color = {0, 0, 0}), Text(extent = {{-150, 80}, {150, 40}}, textString = "%name", lineColor = {0, 0, 255}), Line(visible = useHeatPort, points = {{-100, -100}, {-100, -40}, {-20, -40}, {-20, 0}}, color = {191, 0, 0}, smooth = Smooth.None, pattern = LinePattern.Dot), Line(points = {{0, -30}, {0, -100}}, color = {0, 0, 0}, pattern = LinePattern.Dash, smooth = Smooth.None)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-96, 0}, {-60, 0}}, color = {0, 0, 0}), Line(points = {{-60, -30}, {-60, 30}}, color = {0, 0, 0}), Line(points = {{-60, -30}, {60, -30}}, color = {0, 0, 0}), Line(points = {{-60, 30}, {60, 30}}, color = {0, 0, 0}), Rectangle(extent = {{-60, 30}, {30, -30}}, lineColor = {0, 0, 0}, fillColor = {192, 192, 192},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Line(points = {{30, 0}, {96, 0}}, color = {0, 0, 0}), Line(points = {{-68, 0}, {-68, 65}}, color = {128, 128, 128}), Text(extent = {{-40, 66}, {33, 85}}, lineColor = {0, 0, 255}, textString = "phi_rel"), Line(points = {{-68, 60}, {72, 60}}, color = {128, 128, 128}), Line(points = {{72, 0}, {72, 65}}, color = {128, 128, 128}), Polygon(points = {{62, 63}, {72, 60}, {62, 57}, {62, 63}}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}));
end VariableDamper;
