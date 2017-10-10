within ElectroMechanicalDrives.Components.Electrical;
model Battery "Re-chargeable battery with internal resistor"
  extends ElectroMechanicalDrives.Interfaces.PartialBattery;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={
        Line(points = {{-20, 0}, {20, 0}}, color = {0, 0, 255}),
        Line(points = {{20, 60}, {20, -60}}, color = {0, 0, 255}),
        Line(points = {{40, 30}, {40, -30}}, color = {0, 0, 255}),
        Line(points = {{40, 0}, {90, 0}}, color = {0, 0, 255}),
        Rectangle(
          extent={{-20,-12},{-70,12}},
          lineColor={0,0,255}),
        Line(points = {{-70, 0}, {-90, 0}}, color = {0, 0, 255}, smooth = Smooth.None)}),
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
