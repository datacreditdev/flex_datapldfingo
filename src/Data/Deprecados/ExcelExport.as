 package Data
{
	import flash.errors.*;
	import flash.events.*;
	import flash.external.*;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;	
		
	public class ExcelExportXls{
        public var global:Globales;
 		public var urlExcelExportXls:String;
 
        // Converte a datagrid para uma tabela html
        private function convertDGToHTMLTable(dg:*, dgTot:* = null, titulo:String = null):String {
        	var size:String = (int(dg.getStyle('fontSize'))-2).toString(); //Reduz em 2, o tamanho da fonte.
        	var str:String = '';
        	var colors:String = '';		
        	var hcolor:Array;
        	var texto:String;
 
        	if(dg.getStyle("headerColor") != undefined) {
        		hcolor = [dg.getStyle("headerColor")];
        	} else {
        		hcolor = dg.getStyle("headerColors");
        	}				
 
        	if (titulo != null)
        		str+= '<table border=1><tr><th width="'+Math.ceil(dg.columns[0].width)+'">' + titulo + '</th></tr><tr></tr><thead><tr>';
        	else
        		str+= '<table border=1><thead><tr>';
 
        	for(var i:int = 0;i<dg.columns.length;i++) {
        		colors = dg.getStyle("themeColor");
 
        		if(dg.columns[i].headerText != undefined){ //&& dg.columns[i].visible == true) {
        			str+="<th bgcolor='#c0c0c0'>"+dg.columns[i].headerText+"</th>";
        		} else {//if (dg.columns[i].visible == true) {
        			str+= "<th bgcolor='#c0c0c0'>"+dg.columns[i].dataField+"</th>";
        		}
        	}
        	str += "</tr></thead><tbody>";
        	colors = dg.getStyle("alternatingRowColors");

 
        	for(var j:int =0;j<dg.dataProvider.length;j++) {					
        		str+="<tr>";
 
        		for(var k:int=0; k < dg.columns.length; k++) {
        			texto = "";
        			if(dg.dataProvider.getItemAt(j) != undefined && dg.dataProvider.getItemAt(j) != null /*&& dg.columns[k].visible == true*/ && dg.columns[k].dataField != "Melhor") {
        				if(dg.columns[k].labelFunction != undefined && dg.columns[k].labelFunction != null /*&& dg.columns[k].visible == true*/) {
        					texto = dg.columns[k].labelFunction(dg.dataProvider[j],dg.columns[k]).toString();
        					if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != "." && (texto.substr(2,1) != "/" && texto.substr(5,1) != "/"))
        						str += "<td>=\""+texto+"\"</td>";
        					else if(texto.substr(0,1) == "'")
        						str += "<td>=\""+texto.substr(1,texto.length-1)+"\"</td>";
        					else
        						str += "<td>"+texto+"</td>";
        				} else {
        					if(dg.dataProvider.getItemAt(j)[dg.columns[k].dataField] != undefined){
        						texto = dg.dataProvider.getItemAt(j)[dg.columns[k].dataField].toString();
        						if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != "." && (texto.substr(2,1) != "/" && texto.substr(5,1) != "/"))
        							str += "<td>=\""+texto+"\"</td>";
        						else if(texto.substr(0,1) == "'")
        							str += "<td>=\""+texto.substr(1,texto.length-1)+"\"</td>";
        						else
        							str += "<td>"+texto+"</td>";
        					}
        					else
        						str += "<td></td>";
        				}
        			}
        		}
        		str += "</tr>";
        	}
        	
        	if (dgTot != null)
	        {	
	        	for(j=0;j<dgTot.dataProvider.length;j++) {					
	        		str+="<tr>";
	        		for(k=0; k < dgTot.columns.length; k++) {
	        			texto = "";
	        			if(dgTot.dataProvider.getItemAt(j) != undefined && dgTot.dataProvider.getItemAt(j) != null && dgTot.columns[k].visible == true && dgTot.columns[k].dataField != "Melhor") {
	        				if(dgTot.columns[k].labelFunction != undefined && dgTot.columns[k].labelFunction != null && dgTot.columns[k].visible == true) {
	        					texto = dgTot.columns[k].labelFunction(dgTot.dataProvider[j],dgTot.columns[k]).toString();
	        					if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != "." && (texto.substr(2,1) != "/" && texto.substr(5,1) != "/"))	
	        						str += "<td>=\""+texto+"\"</td>";
	        					else if(texto.substr(0,1) == "'")
        							str += "<td>=\""+texto.substr(1,texto.length-1)+"\"</td>";
	        					else
	        						str += "<td>"+texto+"</td>";
	        				} else {
	        					if(dgTot.dataProvider.getItemAt(j)[dgTot.columns[k].dataField] != undefined){
	        						texto = dgTot.dataProvider.getItemAt(j)[dgTot.columns[k].dataField].toString();
        							if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != "." && (texto.substr(2,1) != "/" && texto.substr(5,1) != "/"))
        								str += "<td>=\""+texto+"\"</td>";
        							else if(texto.substr(0,1) == "'")
        								str += "<td>=\""+texto.substr(1,texto.length-1)+"\"</td>";
        							else
        								str += "<td>"+texto+"</td>";
        						}
        						else
        							str += "<td></td>";
	        				}
	        			}
	        		}
	        		str += "</tr><tr></tr>";
	        	}
	        }
        	str+="</tbody></table>";
 
        	return str;
        }
			
		private function convertDGSToHTMLTable(dgIni:*, titulo:String, dgFin:* = null):String {
        	var size:String = (int(dgIni.getStyle('fontSize'))-2).toString(); //Reduz em 2, o tamanho da fonte.
        	var str:String = '';
        	var colors:String = '';				
        	var hcolor:Array;
        	var texto:String;
 
        	if(dgIni.getStyle("headerColor") != undefined) {
        		hcolor = [dgIni.getStyle("headerColor")];
        	} else {
        		hcolor = dgIni.getStyle("headerColors");
        	}				
 
        	str+= '<table border=1><tr><th width="'+Math.ceil(dgIni.columns[0].width)+'">'+titulo+'</th></tr><tr></tr><thead><tr>';
 
        	for(var i:int = 0;i<dgIni.columns.length;i++) {
        		colors = dgIni.getStyle("themeColor");
 
        		if(dgIni.columns[i].headerText != undefined && dgIni.columns[i].visible == true) {
        			str+="<th bgcolor='#c0c0c0'>"+dgIni.columns[i].headerText+"</th>";
        		} else if (dgIni.columns[i].visible == true) {
        			str+= "<th bgcolor='#c0c0c0'>"+dgIni.columns[i].dataField+"</th>";
        		}
        	}
        	str += "</tr></thead><tbody>";
        	colors = dgIni.getStyle("alternatingRowColors");
 
        	for(var j:int =0;j<dgIni.dataProvider.length;j++) {					
        		str+="<tr>";
        		for(var k:int=0; k < dgIni.columns.length; k++) {
        			texto = "";
        			if(dgIni.dataProvider.getItemAt(j) != undefined && dgIni.dataProvider.getItemAt(j) != null && dgIni.columns[k].visible == true && dgIni.columns[k].dataField != "Melhor") {
        				if(dgIni.columns[k].labelFunction != undefined && dgIni.columns[k].labelFunction != null && dgIni.columns[k].visible == true) {
        					texto = dgIni.columns[k].labelFunction(dgIni.dataProvider[j],dgIni.columns[k]).toString();
        					if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != "." && (texto.substr(2,1) != "/" && texto.substr(5,1) != "/"))
        						str += "<td>=\""+texto+"\"</td>";
        					else if(texto.substr(0,1) == "'")
        							str += "<td>=\""+texto.substr(1,texto.length-1)+"\"</td>";
        					else
        						str += "<td>"+texto+"</td>";
        				} else {
        					if(dgIni.dataProvider.getItemAt(j)[dgIni.columns[k].dataField] != undefined){
        						texto = dgIni.dataProvider.getItemAt(j)[dgIni.columns[k].dataField].toString(); 
        						if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != "." && (texto.substr(2,1) != "/" && texto.substr(5,1) != "/"))
        							str += "<td>=\""+texto+"\"</td>";
        						else if(texto.substr(0,1) == "'")
        							str += "<td>=\""+texto.substr(1,texto.length-1)+"\"</td>";
        						else
        							str += "<td>"+texto+"</td>";
        					}
        					else
        						str += "<td></td>";
        				}
        			}
        		}
        		str += "</tr>";
        	}
        	if (dgFin != null)
	        {	
	        	for(i = 0;i<dgFin.columns.length;i++) {
        			colors = dgFin.getStyle("themeColor");
 					if(dgFin.columns[i].headerText != undefined && dgFin.columns[i].visible == true) {
	        			str+="<th bgcolor='#c0c0c0'>"+dgFin.columns[i].headerText+"</th>";
	        		} else if (dgFin.columns[i].visible == true) {
	        			str+= "<th bgcolor='#c0c0c0'>"+dgFin.columns[i].dataField+"</th>";
	        		}
	        	}
        		str += "</tr></thead><tbody>";
        		colors = dgFin.getStyle("alternatingRowColors");
	        	
	        	for(j = 0;j<dgFin.dataProvider.length;j++) {					
	        		str+="<tr>";
 
	        		for(k = 0; k < dgFin.columns.length; k++) {
	        			if(dgFin.dataProvider.getItemAt(j) != undefined && dgFin.dataProvider.getItemAt(j) != null && dgFin.columns[k].visible == true && dgFin.columns[k].dataField != "Melhor") {
	        				if(dgFin.columns[k].labelFunction != undefined && dgFin.columns[k].labelFunction != null && dgFin.columns[k].visible == true) {
	        					texto = dgFin.columns[k].labelFunction(dgFin.dataProvider[j],dgFin.columns[k]).toString();
	        					if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != "." && (texto.substr(2,1) != "/" && texto.substr(5,1) != "/"))
	        						str += "<td>=\""+texto+"\"</td>";
	        					else if(texto.substr(0,1) == "'")
        							str += "<td>=\""+texto.substr(1,texto.length-1)+"\"</td>";
	        					else
	        						str += "<td>"+texto+"</td>";
	        				} else {
	        					if(dgFin.dataProvider.getItemAt(j)[dgFin.columns[k].dataField] != undefined){
        							texto = dgFin.dataProvider.getItemAt(j)[dgFin.columns[k].dataField].toString();
        							if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != "." && (texto.substr(2,1) != "/" && texto.substr(5,1) != "/"))
        								str += "<td>=\""+texto+"\"</td>";
        							else if(texto.substr(0,1) == "'")
        								str += "<td>=\""+texto.substr(1,texto.length-1)+"\"</td>";
        							else
        								str += "<td>"+texto+"</td>";
        						}
        						else
        							str += "<td></td>";
	        				}
	        			}
	        		}
	        		str += "</tr>";
	        	}
	        }
        	str+="</tbody></table>";
 
        	return str;
        }	
			 
		// Envia o HTML para a aplicação servidor
		public function loadDGInExcel(dg:*, dgTot:* = null, titulo:String = null):void{
        	global = new Globales();
	        urlExcelExportXls = global.urlExp;
	        
	        var variables:URLVariables = new URLVariables(); 
			variables.htmltable	= convertDGToHTMLTable(dg, dgTot, titulo);
 
			var u:URLRequest = new URLRequest(urlExcelExportXls);
			u.data = variables;
			u.method = URLRequestMethod.POST;
 
			navigateToURL(u,"_self");
	  	}  
	           
		public function loadDGSInExcel(dgIni:*, titulo:String, dgFin:* = null):void{
	        global = new Globales();
	        urlExcelExportXls = global.urlExp;
	        
	        var variables:URLVariables = new URLVariables(); 
			variables.htmltable	= convertDGSToHTMLTable(dgIni, titulo, dgFin);
 
			var u:URLRequest = new URLRequest(urlExcelExportXls);
			u.data = variables;
			u.method = URLRequestMethod.POST;
 
			navigateToURL(u,"_self");
	    }  	
	}
}