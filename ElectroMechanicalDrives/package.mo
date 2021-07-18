within ;
package ElectroMechanicalDrives "Library for the simulation of electro mechanical drives and vehicles"
  extends Modelica.Icons.Package;
  import Modelica.Constants.pi;

  annotation(version="3.0.0", versionDate = "2021-07-18",
   conversion(
     from(version={"2.4.0", "2.3.0", "2.2.0", "2.1.1", "2.1.0", "2.0.3", "2.0.2", "2.0.1", "2.0.0"},
     script="modelica://ElectroMechanicalDrives/Resources/Scripts/Conversion/ConvertFromElectroMechanicalDrives_2.X.X_to_3.X.X.mos")),
  uses(Modelica(version="4.0.0")),
  Documentation(info="<html>
<p>The ElectroMechanicalDrives library is an educational library to investigate simple industrial drives and electric vehicles</p>
</html>"));
end ElectroMechanicalDrives;
