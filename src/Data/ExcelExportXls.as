package Data
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	import mx.controls.Alert;
	
	public class ExcelExportXls extends EventDispatcher{
	    private var global:Globales;
	 	private var du:Utils;
	 	private var urlExcelExport:String;
	    private var titulo:String;
	 	private var disp:ExcelExportJsonDispatcher;
	 	public var isXls:Boolean = true;
	 	public var header:Boolean = false;
			
		public function ExcelExportXls():void{
	    }
	    
		//Envia el contenido XML al servidor
		public function loadDGInExcel(dg:*, dgTot:* = null, titulo:String = null):void {
	        this.titulo = titulo;
	        du = new Utils();
	        du.rCursor();
	        disp = new ExcelExportJsonDispatcher(dg, dgTot, this.header);
	        disp.addEventListener(Event.COMPLETE, complete);
	        disp.run();			
		}
		
		//Una vez completado el proceso, se ejecuta este metodo
		private function complete(event:Event):void {
			global = new Globales();
			var u:URLRequest = new URLRequest(global.urlExpXls);
			var variables:URLVariables = new URLVariables();
			variables.infoEnc = disp.strEnc; //Llenado de archivo JSON de encabezado	       
			variables.info = disp.str; //Llenado de archivo XML en un Obj string 
			variables.titulo = this.titulo;
			variables.xls = getIsXls() == true? "1":"0";	//1= xls, 0 = xlsx	
			variables.hideHeader = this.header;	
			u.data = variables;
			u.method = URLRequestMethod.POST;
			navigateToURL(u,"_self");
			dispatchEvent(new Event(Event.COMPLETE));
		}  
		
		public function setIsXls(isXls:Boolean):void{
			this.isXls = isXls;
		}
		
		public function getIsXls():Boolean{
			return this.isXls;
		}
		
		public function hideHeader(header:Boolean):void{
			this.header = header;
		}
	}
}