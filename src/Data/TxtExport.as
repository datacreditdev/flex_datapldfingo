 package Data
{
    	import flash.errors.*;
    	import flash.events.*;
    	import flash.external.*;
    	import flash.net.URLRequest;
    	import flash.net.URLRequestMethod;
    	import flash.net.URLVariables;
    	import flash.net.navigateToURL;	
		
	public class TxtExport{
		
		public var global:Globales;
 		public var urlTxtExport:String;
 			 
		public function cargaCadena(info:String, titulo:String):void {
	        global = new Globales();
	        urlTxtExport = global.urlExpTxt;
	        
	        var variables:URLVariables = new URLVariables(); 
			variables.texto	= info;
			variables.titulo = titulo;
 
			var u:URLRequest = new URLRequest(urlTxtExport);
			u.data = variables;
			u.method = URLRequestMethod.POST;
 
			navigateToURL(u,"_self");
		} 
	}
}