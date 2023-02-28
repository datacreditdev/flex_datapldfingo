package Data
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class DatosSolic
	{
		/*Variables generales de la solicitud*/
		public var cdgGrupo:String;
		public var ciclo:String;
		
		/*Variables que hacen referencia al producto de la Solicitud*/
		public var cdgTipoProd:String;
		public var cdgProdCred:String;
		public var autorCrr:String;
		public var secuencia:String;
		public var guardaProd:Boolean;
		
		/*Variables que hacen referencia a los datos generales de la Solicitud*/
		public var fecSolic:String;
		public var fecEntre:String;
		public var situacion:String;
		public var moneda:String;
		public var solicitado:Number;
		public var autorizado:Number;
		public var proyecto:String;
		public var guardaDatos:Boolean;	
		
		//varibles utilizadas para el mantenimiento de prestamos 
		//****pertenece a los DATOS GENERALES DE LA SOLICITUD****
		public var entregado:Number;
		public var devolucion:Number;      
		public var devoluciones:Number;
		
		/*Variables que hacen referencia al calendario de la Solicitud*/
		public var periodicidad:String;
		public var deposita:String;
		public var diaJunta:String;
		public var reunion:String;
		public var multPerio:Number;
		public var horario:String;
		public var diasGracia:Number;
		public var duracion:Number;
		public var pagoCapital:Number;
		public var pagoInteres:Number;
		public var diaEsp:Number;
		public var guardaCalendario:Boolean;
		
		/*Variables que hacen referencia a las tasas de la Solicitud*/
		public var metodoCobro:String;
		public var formaDist:String;
		public var instrumento:String;
		public var interes:Number;
		public var guardaTasas:Boolean;
		
		/*Variables que hacen referencia a los Recargos de la Solicitud*/
		public var tipoTasa:String;
		public var aplican:String;
		public var metodoAplic:String;
		public var tasaFija:String;
		public var factorTasa:String;
		public var guardaRecargos:Boolean;
		
		/*Variables que hacen referencia a la procedencia de la Solicitud*/
		public var dependOf:String;
		public var presidente:String;
		public var secretario:String;
		public var tesorero:String;
		public var guardaProc:Boolean;
		
		/*Variables que hacen referencia a la Actividad Economica de la Solicitud (Individual)*/
		public var cdgProy:String;
		public var fechaAct:String;
		public var emplSostH:int;
		public var emplSostM:int;
		public var emplGenH:int;
		public var emplGenM:int;
		public var guardaActEco:Boolean;
		
		/*Variables que hacen referencia a la Entrega/Pagos de la Solicitud*/
		public var formaEntre:String;
		public var nombreCheq:String;
		public var cdgAcredCheq:String;
		public var domicilia:String;
		public var cdgCb:String;
		public var tipoDes:String;
		public var guardaEntre:Boolean;
		
		/*Variables que hacen referencia a la Comisión/DG de la Solicitud*/
		public var comision:ArrayCollection;
		
		/*Variables que hacen referencia a las Actividades de la Solicitud*/
		public var actividades:ArrayCollection;
		
		/*Variables que hacen referencia al lugar de reunion del grupo*/
		public var cdgAcred:String;
		public var acred:String;
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
		
		/*Variables que hacen referencia a las excepciones grupales*/
		public var excepcion:Array;
		public var observacion:String;
		public var excAcred:Array;
		public var lstAcred:Array;
		public var obsAcred:Array;
		public var guardaExc:Boolean;
		
		/*Variables que hacen referencia al Aval de la Solicitud*/
		public var aval:String;
		public var nomAval:String;
		public var guardaAval:Boolean;
		
		public function DatosSolic()
		{
		}

	}
}