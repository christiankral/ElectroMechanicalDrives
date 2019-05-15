within ElectroMechanicalDrives.Components.Rotational;
model GearConstantEfficiency "Gear with constant efficiency"
  extends Modelica.Mechanics.Rotational.Icons.Gear;
  extends Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2;
  parameter Real ratio(start=1)
    "Transmission ratio (flange_a.phi/flange_b.phi)";
  parameter Real efficiency = 1 "Constant efficiency coefficient";
  Modelica.SIunits.Angle phi_a
    "Angle between left shaft flange and support";
  Modelica.SIunits.Angle phi_b
    "Angle between right shaft flange and support";

  ConstantEfficiency constantEfficiency(
    final useSupport=useSupport,
    final efficiency=efficiency,
    final useHeatPort=useHeatPort) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(final useSupport=useSupport, final ratio=ratio) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT(useHeatPort=false);
equation
  phi_a = flange_a.phi - phi_support;
  phi_b = flange_b.phi - phi_support;
  if not useHeatPort then
    lossPower = constantEfficiency.lossPower;
  end if;

  connect(flange_a, idealGear.flange_a) annotation (Line(points={{-100,0},{-40,0}}, color={0,0,0}));
  connect(idealGear.flange_b, constantEfficiency.flange_a) annotation (Line(points={{-20,0},{20,0}}, color={0,0,0}));
  connect(constantEfficiency.flange_b, flange_b) annotation (Line(points={{40,0},{100,0}}, color={0,0,0}));
  connect(idealGear.support, support) annotation (Line(points={{-30,-10},{-30,-40},{0,-40},{0,-100}}, color={0,0,0}));
  connect(constantEfficiency.support, support) annotation (Line(points={{30,-10},{30,-40},{0,-40},{0,-100},{0,-100}}, color={0,0,0}));
  connect(constantEfficiency.heatPort, heatPort) annotation (Line(points={{20,-10},{20,-60},{-100,-60},{-100,-100}}, color={191,0,0}));
  annotation (defaultComponentName="gear",Documentation(info="<html>
<p>
This element characterizes any type of gear box which is fixed in the
ground and which has one driving shaft and one driven shaft.
The gear has constant efficiency but it does not have inertia, elasticity, damping
or backlash. If these effects have to be considered, the gear has to be
connected to other elements in an appropriate way.
</p>

</html>"),
       Icon(
    coordinateSystem(preserveAspectRatio=true,
      extent={{-100,-100},{100,100}}),
    graphics={
      Text(extent={{-151,151},{149,111}},
        lineColor={0,0,255},
        textString="%name"),
      Text(extent={{-146,-49},{154,-79}},
        lineColor={0,0,0},
      textString="ratio=%ratio"),
      Text(extent={{60,100},{100,59}},
        lineColor={0,0,0},
          textString="%%"),                                                                                                                                                                                                        Text(extent={{-150,-120},{150,-150}},    lineColor={0,0,0},
          textString="eff=%efficiency")}));
end GearConstantEfficiency;
