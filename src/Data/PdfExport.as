 package Data
{
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.net.URLRequest;
    import flash.net.URLRequestMethod;
    import flash.net.navigateToURL;	
		
	public class PdfExport
    {
	    public var global:Globales;
 		public var urlPdfExport:String;
 		private var listData:Array;
		
		public function PdfExport(){
			global = new Globales();
		}	
			
		//Funcion que permite cargar un documento PDF en una nueva ventana
		public function cargaPdf(cadParam:String):void{
	        urlPdfExport = cadParam;
			var u:URLRequest = new URLRequest(urlPdfExport);
			u.method = URLRequestMethod.GET;
			navigateToURL(u,"_new");
		}  	
	}
}