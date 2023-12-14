package Data
{
	public class DatosPersona
	{
		/*variables que hacen referencia a los datos personales*/
		public var codigo:String;
		public var nombre:String;
		public var segNombre:String;
		public var aPaterno:String;
		public var aMaterno:String;
		public var tipoPers:String;
		public var arrRepLegal:Array;
	    public var nomRepLegal:String;
		public var sexo:String;
		public var cdgco:String;
		public var fecha:String;
		public var cdgNacPais:String;
		public var cdgNacEntFed:String;
		public var cdgNac:String;
		public var rfc:String;
		public var curp:String;
		public var ife:String;
		public var figura:String;
		public var nomCom:String;
		public var fiel:String;
		public var telefono2:String;
		public var email1:String;
		public var email2:String;
		public var guardaDatos:Boolean;
		
		/*Variables que hacen referencia a la dirección de la Persona*/
		public var calle:String;
		public var noExt:String;
		public var noInt:String;
		public var entreCalles:String;
		public var telefono:String;
		public var cdgPais:String;
		public var pais:String;
		public var codPostal:String;
		public var cdgEntFed:String;
		public var entFed:String;
		public var cdgMun:String;
		public var municipio:String;
		public var cdgLoc:String;
		public var localidad:String;
		public var cdgCol:String;
		public var colonia:String;
		public var guardaDir:Boolean;
		
		/*Variables que hacen referencia a la dirección del Negocio*/
		public var calleNeg:String;
		public var noExtNeg:String;
		public var noIntNeg:String;
		public var entreCallesNeg:String;
		public var telefonoNeg:String;
		public var cdgPaisNeg:String;
		public var paisNeg:String;
		public var codPostalNeg:String;
		public var cdgEntFedNeg:String;
		public var entFedNeg:String;
		public var cdgMunNeg:String;
		public var municipioNeg:String;
		public var cdgLocNeg:String;
		public var localidadNeg:String;
		public var cdgColNeg:String;
		public var coloniaNeg:String;
		public var guardaDirNeg:Boolean;
		
		/*Variables que hacen referencia a otros datos de la Persona*/
		public var edoCivil:String;
		public var nivelEsc:String;		
				
		/*Variables que hacen referencia a informacion de KYC*/
		public var giro:String;
		public var origen:String;
		public var destino:String;
		public var otroDesRec:String;
		public var pep:String;
		public var arrPropReal:Array;
		public var nomPropReal:String;
		public var arrProvRec:Array;
		public var nomProvRec:String;
		public var actVul:String;
		public var arrFideicomit:Array;
		public var arrFideicomis:Array;
		public var arrDelegado:Array;
		public var arrApodLegal:Array;
		public var arrSecOrgGob:Array;
		public var arrNomOrgGob:Array;
		public var arrFecNacOrgGob:Array;
		public var arrTipoComOrgGob:Array;
		public var guardaKYC:Boolean; 	
		
		/*Variables que hacen referencia a informacion de PLD*/
		public var puesto:String;
		public var puestoDesc:String;
		public var periodo:String;
		public var puestoFam:String;
		public var nomFam:String;
		public var parentescoFam:String;
		public var puestoDescFam:String;
		public var periodoFam:String;
		public var guardaPLD:Boolean; 	
				
		public var finalidad:String;
		public var instFiduc:String;
		public var patFid:String;
		public var aport:String;
		public var guardaFid:Boolean;		
				
		public function DatosPersona()
		{
		}
	}
}