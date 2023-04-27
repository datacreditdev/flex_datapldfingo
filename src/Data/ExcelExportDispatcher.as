package Data
{
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.external.ExternalInterface;
	
	public class ExcelExportDispatcher extends EventDispatcher {
	    public var global:Globales;
	    private var savedIndex:int;
	    private var dg:*;
	    private var dgTot:*;
	    private var hideHeader:Boolean;
	    public var datos:Array;
	    public var str:String;
	    private static var enterFrameDispatcher:Shape = new Shape();
	    
	 	/* Determina cuantos ciclos se entrara antes de ejecutar 
	 	el siguiente ENTER_FRAME event */
		private static const MAX_ITERATIONS:int = 2000;
	    
	    public function ExcelExportDispatcher(dg:*, dgTot:* = null, hideHeader:Boolean = false):void{
	     	this.dg = dg;
	        this.dgTot = dgTot;
	        this.hideHeader = hideHeader;
	    }
		 		
	 	public function run():void{
	 		savedIndex = 0;
	 		global = new Globales();	 	
	 		str = "<NewDataSet>";
		 		 			
		 	if(hideHeader == false){
		 		for(var i:int = 0;i<dg.columns.length;i++){
		 			str += "<Table>";
		 			if(dg.columns[i].headerText != undefined){ 
		    			str+="<Encabezado>"+dg.columns[i].headerText+"</Encabezado>";
		    		} else {
		    			str+="<Encabezado>"+dg.columns[i].dataField+"</Encabezado>";
		    		}
		    		str += "</Table>";
				}
			}
			enterFrameDispatcher.addEventListener(Event.ENTER_FRAME, loopHandler, false, 0, true);
			// call the first iteration immediately
			loopHandler(null);
	 	}
	 
	 	// ENTER_FRAME loop for asynchronous processing
		private function loopHandler(event:Event):void{			    
	    	var texto:String;
	    	var index:int;	  		 					
				
	    	for(var j:int = savedIndex; j < dg.dataProvider.length; j++) {
	    		index = j;		
	    		if (j - savedIndex >= MAX_ITERATIONS){
					savedIndex = j;
					ExternalInterface.call("console.log", "index guardado en posicion:"+savedIndex+" | total datos llenados: str.lenght ="+ str.length );
					return;
				}		
	    		str += "<Info>";
	    		for(var k:int = 0; k < dg.columns.length; k++) {
					texto = "";
				 	if(dg.dataProvider.getItemAt(j) != undefined && dg.dataProvider.getItemAt(j) != null && dg.columns[k].visible == true) {
	    				if(dg.columns[k].labelFunction != undefined && dg.columns[k].labelFunction != null && dg.columns[k].visible == true) {
	    					texto = dg.columns[k].labelFunction(dg.dataProvider[j],dg.columns[k]).toString();
	    					texto = global.modificaTextoFecha(texto);
	    					if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != "." && (texto.substr(2,1) != "/" && texto.substr(5,1) != "/"))
	    						str += "<col"+k.toString()+">'"+texto+"</col"+k.toString()+">";
	    					else if(texto.substr(0,1) == "'")
	    						str += "<col"+k.toString()+">'"+texto.substr(1,texto.length-1)+"</col"+k.toString()+">";
	    					else
	    						str += "<col"+k.toString()+">"+texto+"</col"+k.toString()+">";
    					} 
    					else{
	    					if(dg.dataProvider.getItemAt(j)[dg.columns[k].dataField] != undefined){
	    						texto = dg.dataProvider.getItemAt(j)[dg.columns[k].dataField].toString();
	    						texto = global.modificaTextoFecha(texto); 
	    						if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != "." && (texto.substr(2,1) != "/" && texto.substr(5,1) != "/"))
	    							str += "<col"+k.toString()+">'"+texto+"</col"+k.toString()+">";
	    						else if(texto.substr(0,1) == "'")
	    							str += "<col"+k.toString()+">'"+texto.substr(1,texto.length-1)+"</col"+k.toString()+">";
	    						else
	    							str += "<col"+k.toString()+">"+texto+"</col"+k.toString()+">";
	    					}
	    					else
	    						str += "<col"+k.toString()+"></col"+k.toString()+">";
	    				}
	    			} 
	    		}
	    		str += "</Info>";		    		
	    	}
	    	str += "</NewDataSet>";
	    	ExternalInterface.call("console.log", "Return.savedIndex:"+savedIndex+" | Return: str.lenght ="+ str.length );
	    	enterFrameDispatcher.removeEventListener(Event.ENTER_FRAME, loopHandler, false);
			dispatchEvent(new Event(Event.COMPLETE));	 
		}	   
	}
}