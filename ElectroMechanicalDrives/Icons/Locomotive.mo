within ElectroMechanicalDrives.Icons;
model Locomotive "Locomotive icon"

  annotation(Icon(graphics={  Polygon(points={{-100,-40},{-100,10},{-80,60},{-40,60},{40,60},{80,60},{100,10},{100,-40},{-100,-40}},                    lineColor=
              {0,0,0},
            fillPattern=FillPattern.Sphere,                                                                                                                           fillColor=
              {160,215,160}),                                                                                                                                                 Polygon(points = {{-86, 10}, {-70, 48}, {-60, 48}, {-60, 10}, {-86, 10}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, smooth = Smooth.None, fillColor = {255, 255, 255}), Polygon(points = {{60, 10}, {74, 10}, {84, 10}, {70, 48}, {60, 48}, {60, 10}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, smooth = Smooth.None, fillColor = {255, 255, 255}),
                                                                                                                                                                              Line(points = {{-60, 100}, {-20, 80}, {-60, 60}}, color = {0, 0, 0}, smooth = Smooth.None), Line(points = {{60, 100}, {20, 80}, {60, 60}}, color = {0, 0, 0}, smooth = Smooth.None)}), Documentation(info="<html>
<p>Locomotive model to be combined with <a href=\"modelica://ElectroMechanicalDrives.Components.Vehicles\">Vehicle</a> models.</p> 
</html>"));
end Locomotive;
