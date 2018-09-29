within ElectroMechanicalDrives.Icons;
model Car "Car icon"

  annotation(Icon(graphics={  Polygon(points={{100,-40},{100,10},{80,20},{50,20},{20,80},{-80,80},{-100,20},{-100,-40},{100,-40}},                       lineColor=
              {0,0,0},
            fillPattern=FillPattern.Sphere,                                                                                                                           fillColor=
              {160,215,160}),                                                                                                                                                 Polygon(points={{42,18},{14,74},{-6,74},{-6,18},{42,18}},             lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, smooth = Smooth.None, fillColor = {255, 255, 255}), Polygon(points={{-22,18},{-22,74},{-58,74},{-58,66},{-58,18},{-22,18}},        lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, smooth = Smooth.None, fillColor = {255, 255, 255}), Polygon(points={{-76,18},{-90,18},{-90,28},{-76,74},{-76,50},{-76,18}},        lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, smooth = Smooth.None, fillColor = {255, 255, 255})}), Documentation(info="<html>
<p>Car model to be combined with <a href=\"modelica://ElectroMechanicalDrives.Components.Vehicles\">Vehicle</a> models.</p> 
</html>"));
end Car;
