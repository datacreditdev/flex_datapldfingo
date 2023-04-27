package Data
{
	import flash.errors.*;
	import flash.events.*;
	import flash.external.*;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	import flash.utils.*;

	public class ExcelExportXls{
        public var global:Globales;
 		public var urlExcelExportXls:String;
 
        //Convierte el contenido del datagrid en una cadana de formato XML
        private function convertDGToHTMLTable(dg:*, dgTot:* = null, titulo:String = null):String {
        	var size:String = (int(dg.getStyle('fontSize'))-2).toString(); //Reduce dos unidades el tamaño de la fuente.
        	var str:String = '';
        	var colors:String = '';		
        	var hcolor:Array;
        	var texto:String;
 
        	if(dg.getStyle("headerColor") != undefined) {
        		hcolor = [dg.getStyle("headerColor")];
        	} else {
        		hcolor = dg.getStyle("headerColors");
        	}				
 
 			str += "<?xml version='1.0'?>";				
 			str += "<Workbook xmlns='urn:schemas-microsoft-com:office:spreadsheet' xmlns:ss='urn:schemas-microsoft-com:office:spreadsheet' xmlns:x='urn:schemas-microsoft-com:office:excel' xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:html='http://www.w3.org/TR/REC-html40'>";
 			str += "<Styles><Style ss:ID='Default' ss:Name='Normal'><Alignment/><Borders/><Font/><Interior/><NumberFormat/><Protection/></Style><Style ss:ID='encabezado'><ss:Alignment ss:Horizontal='Center'/><Borders><Border ss:Position='Bottom' ss:Color='#000000' ss:Weight='1' ss:LineStyle='Continuous'/><Border ss:Position='Top' ss:Color='#000000' ss:Weight='1' ss:LineStyle='Continuous'/><Border ss:Position='Left' ss:Color='#000000' ss:Weight='1' ss:LineStyle='Continuous'/><Border ss:Position='Right' ss:Color='#000000' ss:Weight='1' ss:LineStyle='Continuous'/></Borders><Font ss:Color='#000000' ss:Bold='1'/><Interior ss:Color='#c0c0c0' ss:Pattern='Solid'/></Style><Style ss:ID='titulo'><Alignment ss:Vertical='Bottom' ss:Horizontal='Center' ss:WrapText='1'/><Font ss:Bold='1'/></Style></Styles>";
        	str += "<Worksheet ss:Name='Hoja1'>";
        	str += "<Table ss:DefaultColumnWidth='80'>";
        	
        	str += "<Row>";
        	str += "<Cell ss:StyleID='titulo'><Data ss:Type='String'>"+titulo+"</Data></Cell>";
 			str += "</Row>";
        	
        	str += "<Row>";
 			str += "</Row>";
 			str += "<Row>";
 			str += "</Row>";
         	
        	str+="<Row>";
        	for(var i:int = 0;i<dg.columns.length;i++){
 				if(dg.columns[i].headerText != undefined){ //&& dg.columns[i].visible == true) {
        			str+="<Cell ss:StyleID='encabezado'><Data ss:Type='String'>"+dg.columns[i].headerText+"</Data></Cell>";
        		} else {//if (dg.columns[i].visible == true) {
        			str+="<Cell ss:StyleID='encabezado'><Data ss:Type='String'>"+dg.columns[i].dataField+"</Data></Cell>";
        		}
        	}
        	str += "</Row>";
        					
        	for(var j:int =0;j<dg.dataProvider.length;j++) {					
        		str+="<Row>";
 
        		for(var k:int=0; k < dg.columns.length; k++) {
        			texto = "";
        			if(dg.dataProvider.getItemAt(j) != undefined && dg.dataProvider.getItemAt(j) != null /*&& dg.columns[k].visible == true*/ && dg.columns[k].dataField != "Melhor") {
        				if(dg.columns[k].labelFunction != undefined && dg.columns[k].labelFunction != null /*&& dg.columns[k].visible == true*/) {
        					texto = dg.columns[k].labelFunction(dg.dataProvider[j],dg.columns[k]).toString();
        					if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != "." && (texto.substr(2,1) != "/" && texto.substr(5,1) != "/"))
        						str += "<Cell><Data ss:Type='String'>"+texto+"</Data></Cell>";
        					else{
        						if(!isNaN(Number(texto)))
        							str += "<Cell><Data ss:Type='Number'>"+texto+"</Data></Cell>";
        						else if(isNaN(Number(texto)))
        							str += "<Cell><Data ss:Type='String'>"+texto+"</Data></Cell>";
        					}
        				} else {
        					if(dg.dataProvider.getItemAt(j)[dg.columns[k].dataField] != undefined){
        						texto = dg.dataProvider.getItemAt(j)[dg.columns[k].dataField].toString();
        						if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != "." && (texto.substr(2,1) != "/" && texto.substr(5,1) != "/"))
        							str += "<Cell><Data ss:Type='String'>"+texto+"</Data></Cell>";
        						else{
        							if(!isNaN(Number(texto)))
        								str += "<Cell><Data ss:Type='Number'>"+texto+"</Data></Cell>";
        							else if(isNaN(Number(texto)))
        								str += "<Cell><Data ss:Type='String'>"+texto+"</Data></Cell>";	
        						}
        					}
        					else
        						str += "<Cell><Data ss:Type='String'></Data></Cell>";
        				}
        			}
        		}
        		str += "</Row>";
        	}
        	
        	/*if (dgTot != null)
	        {	
	        	for(j=0;j<dgTot.dataProvider.length;j++) {					
	        		str+="<tr>";
	        		for(k=0; k < dgTot.columns.length; k++) {
	        			texto = "";
	        			if(dgTot.dataProvider.getItemAt(j) != undefined && dgTot.dataProvider.getItemAt(j) != null && dgTot.columns[k].visible == true && dgTot.columns[k].dataField != "Melhor") {
	        				if(dgTot.columns[k].labelFunction != undefined && dgTot.columns[k].labelFunction != null && dgTot.columns[k].visible == true) {
	        					texto = dgTot.columns[k].labelFunction(dgTot.dataProvider[j],dgTot.columns[k]).toString();
	        					if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != ".")	
	        						str += "<td>=\""+texto+"\"</td>";
	        					else
	        						str += "<td>"+texto+"</td>";
	        				} else {
	        					if(dgTot.dataProvider.getItemAt(j)[dgTot.columns[k].dataField] != undefined){
	        						texto = dgTot.dataProvider.getItemAt(j)[dgTot.columns[k].dataField].toString();
        							if(texto.substr(0,1) == "0" && texto.length > 1 && texto.substr(1,1) != ".")
        								str += "<td>=\""+texto+"\"</td>";
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
	        }*/
        	str+="</Table></Worksheet></Workbook>";
 
        	return str;
        }
			
		//Envia el contenido XML al servidor
		public function loadDGInExcel(dg:*, dgTot:* = null, titulo:String = null):void {
	        global = new Globales();
	        urlExcelExportXls = global.urlExp;
	        
	        var variables:URLVariables = new URLVariables(); 
			variables.htmltable	= convertDGToHTMLTable(dg, dgTot, titulo);
 
			var u:URLRequest = new URLRequest(urlExcelExportXls);
			u.data = variables;
			u.method = URLRequestMethod.POST;
 
			navigateToURL(u,"_self");
		}  
	}
}