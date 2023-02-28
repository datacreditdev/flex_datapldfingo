package Data
{
	[Bindable]
	public class DatosGrupo
	{
		/*Variables que hacen referencia a los datos generales del Grupo*/
		public var codigo:String;
		public var nombre:String;
		public var fecha:String;
		public var coordinacion:String;
		public var cdgCoord:String;
		public var codPostal:String;
		public var entidad:String;
		public var cdgEnt:String
		public var municipio:String;
		public var cdgMun:String;
		public var localidad:String;
		public var cdgLoc:String;
		public var colonia:String;
		public var cdgCol:String;
		public var guardaDatos:Boolean;
		
		/*Variables que hacen referencia al lugar de reunión del Grupo*/
		public var calle:String;
		public var lugarCodPostal:String;
		public var lugarEntFed:String;
		public var cdgLugarEntFed:String;
		public var lugarMun:String;
		public var cdgLugarMun:String;
		public var lugarLocalidad:String;
		public var cdgLugarLoc:String;
		public var lugarColonia:String;
		public var cdgLugarCol:String;
		public var guardaLugar:Boolean;	
		
		/*Variables que hacen referencia al lugar de reunión del Grupo*/
		public var cdgPr:String;
		public var promotor:String;
		public var cdgRec:String;
		public var recuperador:String;
		public var guardaOficial:Boolean;
		
		public function DatosGrupo()
		{
		}

	}
}