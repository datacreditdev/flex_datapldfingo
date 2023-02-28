package Data
{
	[Bindable]
	public class DatosProy
	{
		/*Variables que hacen referencia a los datos generales del Proyecto*/
		public var codigo:String;
		public var cdgSector:String;
		public var cdgGiro:String;
		public var cdgActEco:String;
		public var nombre:String;
		public var texto:String;
		public var actualiza:String;
		public var guardaDatos:Boolean;
		
		/*Variables que hacen referencia a los datos de la empresa*/
		public var empresa:String;
		public var rfc:String;
		public var tamano:String;
		public var tipo:String;
		public var guardaEmp:Boolean;	
		
		public function DatosProy()
		{
		}

	}
}