within ElectroMechanicalDrives.Components.Electrical;
model IdealBattery "Re-chargeable ideal battery without loss"
  extends ElectroMechanicalDrives.Components.Electrical.Battery(final RCell=0);
  annotation(defaultComponentName="battery",Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),           Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-120, 50}, {-20, 0}}, lineColor = {0, 0, 255}, textString = "+"), Line(points = {{-90, 0}, {-10, 0}}, color = {0, 0, 255}), Line(points = {{-10, 60}, {-10, -60}}, color = {0, 0, 255}), Line(points = {{10, 30}, {10, -30}}, color = {0, 0, 255}), Line(points = {{10, 0}, {90, 0}}, color = {0, 0, 255}), Text(extent = {{20, 50}, {120, 0}}, lineColor = {0, 0, 255}, textString = "-"), Text(extent = {{-150, 140}, {150, 100}}, lineColor = {0, 0, 255}, textString = "%name")}),
    Documentation(info="<html>
<p>This linear battery model is based on a linear capacitor which can be charged and discharged. 
The battery cell is parameterized by the upper and lower operationg voltage limit and the total
energy content <code>ECell</code> which is accessible for <code>V0cell &le; vCell &le; V1Cell</code>.
By default the battery starts fully charged. The battery internal resistance <code>RCell</code> is equal to zero.
</p>

<p>By default an assert is triggered with the battery is overcharged oder undercharged. 
These asserts can be avoided by setting the parameters <code>allowOvercharge</code> 
and <code>allowUndercharge</code> to <code>true</code>.</p>
</html>"));
end IdealBattery;
