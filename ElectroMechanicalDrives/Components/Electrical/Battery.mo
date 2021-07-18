within ElectroMechanicalDrives.Components.Electrical;
model Battery "Re-chargeable battery with internal resistor"
  extends ElectroMechanicalDrives.BaseClasses.Battery;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={
        Line(points={{-20,0},{0,0}},       color = {0, 0, 255}),
        Line(points={{80,0},{90,0}},      color = {0, 0, 255}),
        Rectangle(
          extent={{-20,-12},{-70,12}},
          lineColor={0,0,255}),
        Line(points = {{-70, 0}, {-90, 0}}, color = {0, 0, 255}, smooth = Smooth.None),
        Rectangle(extent={{10,20},{80,-20}}, lineColor={0,0,255}),
        Rectangle(extent={{0,12},{10,-12}}, lineColor={0,0,255}),
        Rectangle(extent={{20,12},{30,-12}}, lineColor={0,0,255}),
        Rectangle(
          extent={{40,12},{50,-12}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{60,12},{70,-12}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Text(extent={{-150,-40},{150,-80}},
        lineColor={0,0,0},
          textString="Ecell=%Ecell")}),
    Documentation(info="<html>
<p>This linear battery model is based on a linear capacitor which can be charged and discharged. 
The battery cell is parameterized by the upper and lower operationg voltage limit and the total
energy content <code>ECell</code> which is accessible for <code>V0cell &le; vCell &le; V1Cell</code>.
By default the battery starts fully charged. The battery internal resistance <code>RCell</code> is considered.
</p>

<p>By default an assert is triggered with the battery is overcharged oder undercharged. 
These asserts can be avoided by setting the parameters <code>allowOvercharge</code> 
and <code>allowUndercharge</code> to <code>true</code>.</p>
</html>"));
end Battery;
