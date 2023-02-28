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
		public var repLegal:String;
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
		public var guardaDatos:Boolean;
		
		/*Variables que hacen referencia a la dirección de la Persona*/
		public var calle:String;
		public var entreCalles:String;
		public var telefono:String;
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
				
		/*Variables que hacen referencia a informacion de Prevención de Lavado de Dinero*/
		public var detPer:String;
		public var origen:String;
		public var destino:String;
		public var pep:String;
		public var propReal:String;
		public var nomPropReal:String;
		public var provRec:String;
		public var nomProvRec:String;
		public var guardaPLD:Boolean; 		
				
		public function DatosPersona()
		{
		}

	}
}