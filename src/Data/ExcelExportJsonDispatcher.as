package Data
{
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.external.ExternalInterface;
	
	public class ExcelExportJsonDispatcher extends EventDispatcher {
	    private var global:Globales;
	    private var savedIndex:int;
	    private var dg:*;
	    private var dgTot:*;
	    private var hideHeader:Boolean;
	    public var str:String;
	    public var strEnc:String;
	    private static var enterFrameDispatcher:Shape = new Shape();
	    
	 	/* Determina cuantos ciclos se entrara antes de ejecutar 
	 	el siguiente ENTER_FRAME event */
		private static const MAX_ITERATIONS:int = 2000;
	    
	    public function ExcelExportJsonDispatcher(dg:*, dgTot:* = null, hideHeader:Boolean = false):void{
	     	this.dg = dg;
	        this.dgTot = dgTot;
	        this.hideHeader = hideHeader;
	    }
		 		
	 	public function run():void{
	 		var strAux:String = "";
	 		savedIndex = 0;
	 		global = new Globales();	 	
	 		strEnc = "{";
		 		 			
		 	if(hideHeader == false){
		 		strEnc += "\"encabezado\":[";
		 		for(var i:int = 0;i<dg.columns.length;i++){
		 			if(dg.columns[i].headerText != undefined){ 
		    			strAux += (strAux != "" ? "," : "") + "{\"titulo\":\""+dg.columns[i].headerText+"\"}";
		    		} else {
		    			strAux += (strAux != "" ? "," : "") + "{\"titulo\":\""+dg.columns[i].dataField+"\"}";
		    		}
				}
				strEnc += strAux;
				strEnc += "]}";
			}
			ExternalInterface.call("console.log", strEnc);
			enterFrameDispatcher.addEventListener(Event.ENTER_FRAME, loopHandler, false, 0, true);
			// call the first iteration immediately
			loopHandler(null);
	 	}
	 
	 	// ENTER_FRAME loop for asynchronous processing
		private function loopHandler(event:Event):void{			    
	    	var strCol:String = "";
	    	var strFila:String = "";
	    	var texto:String;
	    	var index:int;	  		 					
				
			str = "{\"info\":[";	
	    	for(var j:int = savedIndex; j < dg.dataProvider.length; j++) {
	    		index = j;		
	    		strFila += (strFila != "" ? "," : "") + "{";
	    		if (j - savedIndex >= MAX_ITERATIONS){
					savedIndex = j;
					ExternalInterface.call("console.log", "index guardado en posicion:"+savedIndex+" | total datos llenados: str.lenght ="+ str.length );
					return;
				}		
	    		//str += (str != "" ? "," : "") + "{";
	    		strCol = "";
	    		for(var k:int = 0; k < dg.columns.length; k++) {
					texto = "";
				 	if(dg.dataProvider.getItemAt(j) != undefined && dg.dataProvider.getItemAt(j) != null && dg.columns[k].visible == true) {
	    				if(dg.columns[k].labelFunction != undefined && dg.columns[k].labelFunction != null && dg.columns[k].visible == true) {
	    					texto = dg.columns[k].labelFunction(dg.dataProvider[j],dg.columns[k]).toString();
	    					texto = global.modificarTextoFecha(texto);
	    					if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != "." && (texto.substr(2,1) != "/" && texto.substr(5,1) != "/"))
	    						strCol += (strCol != "" ? "," : "") + "\"col"+k.toString()+"\":\"'"+texto+"\"";
	    					else if(texto.substr(0,1) == "'")
	    						strCol += (strCol != "" ? "," : "") + "\"col"+k.toString()+"\"':\"'"+texto.substr(1,texto.length-1)+"\"";
	    					else
	    						strCol += (strCol != "" ? "," : "") + "\"col"+k.toString()+"\":\""+texto+"\"";
    					} 
    					else{
	    					if(dg.dataProvider.getItemAt(j)[dg.columns[k].dataField] != undefined){
	    						texto = dg.dataProvider.getItemAt(j)[dg.columns[k].dataField].toString();
	    						texto = global.modificarTextoFecha(texto); 
	    						if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != "." && (texto.substr(2,1) != "/" && texto.substr(5,1) != "/"))
	    							strCol += (strCol != "" ? "," : "") + "\"col"+k.toString()+"\":\"'"+texto+"\"";
	    						else if(texto.substr(0,1) == "'")
	    							strCol += (strCol != "" ? "," : "") + "\"col"+k.toString()+"\"':\"'"+texto.substr(1,texto.length-1)+"\"";
	    						else
	    							strCol += (strCol != "" ? "," : "") + "\"col"+k.toString()+"\":\""+texto+"\"";
	    					}
	    					else
	    						strCol += (strCol != "" ? "," : "") + "\"col"+k.toString()+"\":\"\"";
	    				}
	    			} 
	    		}
	    		strFila += strCol + "}";		    		
	    	} 
	    	str += strFila + "]}";
	    	ExternalInterface.call("console.log", str);
	    	//ExternalInterface.call("console.log", "Return.savedIndex:"+savedIndex+" | Return: str.lenght ="+ str.length );
	    	enterFrameDispatcher.removeEventListener(Event.ENTER_FRAME, loopHandler, false);
			dispatchEvent(new Event(Event.COMPLETE));	 
		}	   
	}
}