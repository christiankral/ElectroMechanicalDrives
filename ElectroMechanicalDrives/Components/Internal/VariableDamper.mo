within ElectroMechanicalDrives.Components.Internal;
model VariableDamper "Linear 1D translational damper"
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  Modelica.Blocks.Interfaces.RealInput d "Damping coefficient" annotation(Placement(transformation(extent = {{-140, -80}, {-100, -40}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -120})));
  extends
    Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
equation
  f = d * v_rel;
  lossPower = f * v_rel;
  annotation(Documentation(info = "<html>
<p>
<i>Linear, velocity dependent damper</i> element. It can be either connected
between a sliding mass and the housing (model Fixed), or
between two sliding masses.
</p>

</html>"),
     Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-90, 0}, {-60, 0}}, color = {0, 0, 0}), Line(points = {{-60, -30}, {-60, 30}}, color = {0, 0, 0}), Line(points = {{-60, -30}, {60, -30}}, color = {0, 0, 0}), Line(points = {{-60, 30}, {60, 30}}, color = {0, 0, 0}), Rectangle(extent = {{-60, 30}, {30, -30}}, lineColor = {0, 0, 0}, fillColor = {192, 192, 192},
            fillPattern =                                                                                                   FillPattern.Solid), Line(points = {{30, 0}, {90, 0}}, color = {0, 0, 0}), Polygon(points = {{50, -90}, {20, -80}, {20, -100}, {50, -90}}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128},
            fillPattern =                                                                                                   FillPattern.Solid), Line(points = {{-60, -90}, {20, -90}}, color = {0, 0, 0}), Text(extent = {{-150, 90}, {150, 50}}, textString = "%name", lineColor = {0, 0, 255}), Text(extent = {{-150, -45}, {150, -75}}, lineColor = {0, 0, 0}, textString = "d=%d"), Line(visible = useHeatPort, points = {{-100, -100}, {-100, -20}, {-14, -20}}, color = {191, 0, 0}, pattern = LinePattern.Dot, smooth = Smooth.None)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-90, 0}, {-60, 0}}, color = {0, 0, 0}), Line(points = {{-60, -30}, {-60, 30}}, color = {0, 0, 0}), Line(points = {{-60, -30}, {60, -30}}, color = {0, 0, 0}), Line(points = {{-60, 30}, {60, 30}}, color = {0, 0, 0}), Rectangle(extent = {{-60, 30}, {30, -30}}, lineColor = {0, 0, 0}, fillColor = {192, 192, 192},
            fillPattern =                                                                                                   FillPattern.Solid), Line(points = {{30, 0}, {90, 0}}, color = {0, 0, 0}), Line(points = {{-50, 60}, {50, 60}}, color = {128, 128, 128}), Polygon(points = {{50, 63}, {60, 60}, {50, 57}, {50, 63}}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128},
            fillPattern =                                                                                                   FillPattern.Solid), Text(extent = {{-58, 68}, {42, 78}}, lineColor = {128, 128, 128}, textString = "der(s_rel)")}));
end VariableDamper;
