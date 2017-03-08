within ElectroMechanicalDrives.Icons;
partial model Machine

  annotation(Icon(graphics={  Rectangle(extent = {{-40, 60}, {80, -60}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                     FillPattern.HorizontalCylinder, fillColor = {255, 0, 0}), Rectangle(extent = {{-40, 60}, {-60, -60}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.HorizontalCylinder, fillColor = {128, 128, 128}), Rectangle(extent = {{80, 10}, {100, -10}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.HorizontalCylinder, fillColor = {95, 95, 95}), Rectangle(extent = {{-40, 70}, {40, 50}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95},
            fillPattern =                                                                                                   FillPattern.Solid), Polygon(points = {{-50, -90}, {-40, -90}, {-10, -20}, {40, -20}, {70, -90}, {80, -90}, {80, -100}, {-50, -100}, {-50, -90}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Solid)}), Documentation(info = "<html>
<p>
This icon is designed for a <b>FundamentalWave machine</b> model.
</p>
</html>"));
end Machine;
