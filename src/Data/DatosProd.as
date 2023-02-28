package Data
{
	[Bindable]
	public class DatosProd
	{
		/*Variables que hacen referencia a los generales del producto*/
		public var cdgTipoProd:String;
		public var cdgProd:String;
		public var nombreProd:String;
		public var moneda:String;
		public var tipoCred:String;
		public var montoMin:Number;
		public var montoMax:Number; 
		public var valido:String;
		public var baseCalc:String;
		public var guarda:Boolean;
		
		/*Variables que hacen referencia a la periodicidad y calendario del producto*/
		public var periodicidad:String;
		public var fijaPer:String;
		public var multPerio:Number;
		public var diaEsp:Number;
		public var fijaMultPer:String;
		public var duracion:Number;
		public var fijaPlazo:String;
		public var pagoCapital:Number;
		public var fijaPGC:String;
		public var pagoInteres:Number;
		public var fijaPGI:String;
		public var guardaCalendario:Boolean;
		
		/*Variables que haen referencia a la Periodicidad de Pago de Capital e Interes*/
		public var perPagoCap:String;
		public var perCapital:String;
		public var multPerCap:Number;
		public var fijaPagoCap:String;
		public var capInt:String;
		public var guardaCapInt:Boolean;
		
		/*Variables que hacen referencia a las tasas del producto*/
		public var metodoCobro:String;
		public var fijaMCI:String;
		public var formaDist:String;
		public var fijaFDI:String;
		public var instrumento:String;
		public var interes:Number;
		public var fijaTas:String;
		public var guardaTasas:Boolean;
		
		/*Variables que hacen referencia a los Recargos del producto*/
		public var tipoTasa:String;
		public var aplican:String;
		public var metodoAplic:String;
		public var fijaMAP:String;
		public var tasaFija:String;
		public var factorTasa:String;
		public var fijaRec:String;
		public var guardaRecargos:Boolean;
		
		/*Variables que hacen referencia a la Entrega del producto*/
		public var formaEntre:String;
		public var fijaEnt:String;
		public var guardaEntre:Boolean;
		
		/*Variables que hacen referencia a las Condiciones del producto*/
		public var sexo:String;
		public var edadMin:Number;
		public var edadMax:Number;
		public var plazoMin:Number;
		public var plazoMax:Number;
		public var guardaCond:Boolean;
		
		/*Variables que hacen referencia a las Comisiones del Producto*/
		public var tipoMov:Array;
		public var montoCom:Array;
		public var porcCom:Array;
		public var tipoCargo:Array;
		public var opcional:Array;
		public var guardaCom:Boolean;
		
		/*Variables que hacen referencia a la Prelacion de Pagos del Producto*/
		public var orden:Array;
		public var artefacto:Array;
		public var guardaPre:Boolean;
		
		public function DatosProd()
		{
		}
	}
}