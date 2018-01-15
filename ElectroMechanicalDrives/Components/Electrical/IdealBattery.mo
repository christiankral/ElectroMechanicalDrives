within ElectroMechanicalDrives.Components.Electrical;
model IdealBattery "Re-chargeable ideal battery without loss"
  extends ElectroMechanicalDrives.Interfaces.PartialBattery(final RCell=0);
  annotation(defaultComponentName="battery",Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),           Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={
        Line(points={{-90,30},{-70,30}}, color={28,108,200}),
        Line(points={{-80,20},{-80,40}}, color={28,108,200}),
        Line(points={{60,30},{80,30}}, color={28,108,200}),
        Text(extent={{-150,110},{150,70}},
        lineColor = {0, 0, 255}, textString = "%name"),
        Line(points={{40,0},{90,0}},      color = {0, 0, 255}),
        Rectangle(extent={{-30,20},{40,-20}}, lineColor={0,0,255}),
        Rectangle(extent={{-40,12},{-30,-12}}, lineColor={0,0,255}),
        Rectangle(extent={{-20,12},{-10,-12}}, lineColor={0,0,255}),
        Rectangle(
          extent={{0,12},{10,-12}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{20,12},{30,-12}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,0},{-40,0}},    color = {0, 0, 255}),
        Text(extent={{-150,-40},{150,-80}},
        lineColor={0,0,0},
          textString="Ecell=%Ecell")}),
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
