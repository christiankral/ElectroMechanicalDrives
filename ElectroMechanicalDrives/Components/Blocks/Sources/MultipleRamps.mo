within ElectroMechanicalDrives.Components.Blocks.Sources;
block MultipleRamps "Generate multiple ramp signals"
  parameter Integer n = 1 "Number of ramps";
  parameter Real height[n] = ones(n) "Height of ramps";
  parameter Modelica.Units.SI.Time duration[n](each min=0.0, each start=2)
    "Duration of ramp (= 0.0 gives a Step)";
  parameter Real offset = 0 "Offset of output signal";
  parameter Modelica.Units.SI.Time startTime[n]=zeros(n)
    "Output = offset for time < startTime";
  extends Modelica.Blocks.Interfaces.SO;
  Modelica.Blocks.Sources.Ramp ramp[n](final startTime = startTime, final height = height, final duration = duration, offset = fill(offset, n)) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Sum sum1(final nin = n, final k = ones(n)) annotation(Placement(transformation(extent = {{40, -10}, {60, 10}})));
equation
  connect(ramp.y, sum1.u) annotation(Line(points = {{11, 0}, {38, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(sum1.y, y) annotation(Line(points = {{61, 4.44089e-16}, {82.5, 4.44089e-16}, {82.5, 0}, {110, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-80, 68}, {-80, -80}}, color = {192, 192, 192}), Polygon(points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192},
            fillPattern =                                                                                                   FillPattern.Solid), Line(points = {{-90, -70}, {82, -70}}, color = {192, 192, 192}), Polygon(points = {{90, -70}, {68, -62}, {68, -78}, {90, -70}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192},
            fillPattern =                                                                                                   FillPattern.Solid), Line(points={{
              -80,-70},{-60,-70},{-26,-8}},                                                                                                    color = {0, 0, 0}), Text(extent = {{-150, -150}, {150, -110}}, lineColor = {0, 0, 0}, textString = "duration=%duration"), Line(points={{
              48,38},{86,38}},                                                                                                    color = {0, 0, 0}),
                                                                                            Line(points={{
              -26,-8},{2,-8},{48,38}},                                                                                                    color = {0, 0, 0})}),                                                                                                    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(info="<html>
<p>
This model extends the <a href=\"modelica:Modelica.Blocks.Sources.Ramp//\">Ramp</a> included in the Modelica Standard Library (MSL). 
The Real output y the MultipleRamps model is superpsition by several ramp signals:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Ramp.png\"
     alt=\"Ramp.png\">
</p>

<p>
If on element of the parameter duration is set to 0.0, the limiting case of a step signal is achieved. 
</p>
</html>"));
end MultipleRamps;
