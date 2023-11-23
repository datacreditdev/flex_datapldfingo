package Data
{
	//Se heredan las propiedades de la Clase Persona
	public class DatosAcred extends DatosPersona
	{
		/*Variables que hacen referencia a otros datos del Acreditado*/
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
		public var contacto1:String;
		public var telCon1:String;
		public var emailCon1:String;
		public var contacto2:String;
		public var telCon2:String;
		public var emailCon2:String;
		public var guardaOficial:Boolean;
		
		public function DatosAcred()
		{
		}
	}
}