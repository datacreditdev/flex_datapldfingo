package Data
{
	//Se heredan las propiedades de la Clase Persona
	public class DatosAcred extends DatosPersona
	{
		/*Variables que hacen referencia a la dirección del Negocio*/
		public var calleNeg:String;
		public var noInt:String;
		public var noExt:String;
		public var entreCallesNeg:String;
		public var telefonoNeg:String;
		public var codPostalNeg:String;
		public var cdgDirEntFedNeg:String;
		public var dirEntFedNeg:String;
		public var cdgMunNeg:String;
		public var municipioNeg:String;
		public var cdgLocNeg:String;
		public var localidadNeg:String;
		public var cdgColNeg:String;
		public var coloniaNeg:String;
		public var guardaDirNeg:Boolean;
		
		/*Variables que hacen referencia a otros datos del Acreditado*/
		public var edoCivil:String;
		public var nivelEsc:String;
		public var depend:Number;
		public var nivelRiesgo:String;
		public var marca:Number;
		public var enano:Number;
		public var cantEnano:Number;
		public var guardaOtros:Boolean;
		
		/*Variables que hacen referencia al asesor de crédito*/
		public var cdgPr:String;
		public var promotor:String;
		public var cdgRec:String;
		public var recuperador:String;
		public var guardaOficial:Boolean;
		
		public function DatosAcred()
		{
		}

	}
}