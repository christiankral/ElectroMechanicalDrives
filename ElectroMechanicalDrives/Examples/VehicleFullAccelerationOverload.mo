within ElectroMechanicalDrives.Examples;
model VehicleFullAccelerationOverload "Full acceleration of vehicle"
  extends Modelica.Icons.Example;
  ElectroMechanicalDrives.Components.Vehicles.VehicleWithDrive vehicle(
    ns=42,
    np=1,
    V1Cell=4,
    V0Cell=3,
    ViniCell=4,
    ECell=1188E3,
    r=0.35,
    i=8.8,
    wBase=0.25*837.8,
    kBase=0.1492/0.25) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Step current(y(unit="A"), height=213.3*1.4)
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
equation
  connect(current.y, vehicle.iMachine) annotation (Line(
      points={{-19,-30},{0,-30},{0,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-100, 80}, {100, 60}}, lineColor={0,0,255},
          textString="w_base/w_max= 0.25"),                                                                                                                                                                           Text(extent = {{-100, 50}, {100, 30}}, lineColor = {0, 0, 255}, textString = "full overload u = 1.4")}),
    experiment(StopTime=200, Interval=0.1));
end VehicleFullAccelerationOverload;
