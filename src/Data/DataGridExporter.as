package Data
{
    	import flash.errors.*;
    	import flash.events.*;
    	import flash.external.*;
    	import flash.net.URLRequest;
    	import flash.net.URLRequestMethod;
    	import flash.net.URLVariables;
    	import flash.net.navigateToURL;	
		
	public class DataGridExporter
        {        	
	        //Aplicação servidor que gerará o excel
	        public var global:Globales;
	        
 			public var urlExcelExportXls:String;
 
	        // Converte a datagrid para uma tabela html
	        private function convertDGToHTMLTable(dg:*, dgTot:* = null, titulo:String = null):String {
	        	var font:String = dg.getStyle('fontFamily');
	        	var size:String = (int(dg.getStyle('fontSize'))-2).toString(); //Reduz em 2, o tamanho da fonte.
	        	var str:String = '';
	        	var colors:String = '';
	        	var style:String = 'style="font-family:'+font+';font-size:'+size+'pt;"';				
	        	var hcolor:Array;
 
	        	if(dg.getStyle("headerColor") != undefined) {
	        		hcolor = [dg.getStyle("headerColor")];
	        	} else {
	        		hcolor = dg.getStyle("headerColors");
	        	}				
 
	        	if (titulo != null)
	        		str+= '<table width="'+dg.width+'"><tr><th>' + titulo + '</th></tr><tr></tr><thead><tr width="'+dg.width+'" style="background-color:#' +Number((hcolor[0])).toString(16)+'">';
	        	else
	        		str+= '<table width="'+dg.width+'"><thead><tr width="'+dg.width+'" style="background-color:#' +Number((hcolor[0])).toString(16)+'">';
	        	
 
	        	for(var i:int = 0;i<dg.columns.length;i++) {
	        		colors = dg.getStyle("themeColor");
 
	        		if(dg.columns[i].headerText != undefined){ //&& dg.columns[i].visible == true) {
	        			str+="<th "+style+">"+dg.columns[i].headerText+"</th>";
	        		} else {//if (dg.columns[i].visible == true) {
	        			str+= "<th "+style+">"+dg.columns[i].dataField+"</th>";
	        		}
	        	}
	        	str += "</tr></thead><tbody>";
	        	colors = dg.getStyle("alternatingRowColors");
 
	        	for(var j:int =0;j<dg.dataProvider.length;j++) {					
	        		str+="<tr width=\""+Math.ceil(dg.width)+"\">";
 
	        		for(var k:int=0; k < dg.columns.length; k++) {
	        			if(dg.dataProvider.getItemAt(j) != undefined && dg.dataProvider.getItemAt(j) != null /*&& dg.columns[k].visible == true*/ && dg.columns[k].dataField != "Melhor") {
	        				if(dg.columns[k].labelFunction != undefined && dg.columns[k].labelFunction != null /*&& dg.columns[k].visible == true*/) {
	        					str += "<td nowrap=\"nowrap\" width=\""+Math.ceil(dg.columns[k].width)+"\" "+style+">"+dg.columns[k].labelFunction(dg.dataProvider[j],dg.columns[k])+"</td>";
	        				} else {
	        					if(dg.dataProvider.getItemAt(j)[dg.columns[k].dataField] != undefined)
	        						str += "<td nowrap=\"nowrap\" width=\""+Math.ceil(dg.columns[k].width)+"\" "+style+">"+dg.dataProvider.getItemAt(j)[dg.columns[k].dataField]+"</td>";
	        					else
	        						str += "<td nowrap=\"nowrap\" width=\""+Math.ceil(dg.columns[k].width)+"\" "+style+"></td>";
	        				}
	        			}
	        		}
	        		str += "</tr>";
	        	}
	        	
	        	if (dgTot != null)
		        {	
		        	for(j=0;j<dgTot.dataProvider.length;j++) {					
		        		str+="<tr width=\""+Math.ceil(dgTot.width)+"\">";
	 
		        		for(k=0; k < dgTot.columns.length; k++) {
		        			if(dgTot.dataProvider.getItemAt(j) != undefined && dgTot.dataProvider.getItemAt(j) != null && dgTot.columns[k].visible == true && dgTot.columns[k].dataField != "Melhor") {
		        				if(dgTot.columns[k].labelFunction != undefined && dgTot.columns[k].labelFunction != null && dgTot.columns[k].visible == true) {
		        					str += "<td nowrap=\"nowrap\" width=\""+Math.ceil(dgTot.columns[k].width)+"\" "+style+">"+dgTot.columns[k].labelFunction(dgTot.dataProvider[j],dgTot.columns[k])+"</td>";
		        				} else {
		        					if(dgTot.dataProvider.getItemAt(j)[dgTot.columns[k].dataField] != undefined)
	        							str += "<td nowrap=\"nowrap\" width=\""+Math.ceil(dgTot.columns[k].width)+"\" "+style+">"+dgTot.dataProvider.getItemAt(j)[dgTot.columns[k].dataField]+"</td>";
	        						else
	        							str += "<td nowrap=\"nowrap\" width=\""+Math.ceil(dgTot.columns[k].width)+"\" "+style+"></td>";
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
	        	var font:String = dgIni.getStyle('fontFamily');
	        	var size:String = (int(dgIni.getStyle('fontSize'))-2).toString(); //Reduz em 2, o tamanho da fonte.
	        	var str:String = '';
	        	var colors:String = '';
	        	var style:String = 'style="font-family:'+font+';font-size:'+size+'pt;"';				
	        	var hcolor:Array;
 
	        	if(dgIni.getStyle("headerColor") != undefined) {
	        		hcolor = [dgIni.getStyle("headerColor")];
	        	} else {
	        		hcolor = dgIni.getStyle("headerColors");
	        	}				
 
	        	str+= '<table width="'+dgIni.width+'"><tr><th>'+titulo+'</th></tr><tr></tr><thead><tr width="'+dgIni.width+'" style="background-color:#' +Number((hcolor[0])).toString(16)+'">';
 
	        	for(var i:int = 0;i<dgIni.columns.length;i++) {
	        		colors = dgIni.getStyle("themeColor");
 
	        		if(dgIni.columns[i].headerText != undefined && dgIni.columns[i].visible == true) {
	        			str+="<th "+style+">"+dgIni.columns[i].headerText+"</th>";
	        		} else if (dgIni.columns[i].visible == true) {
	        			str+= "<th "+style+">"+dgIni.columns[i].dataField+"</th>";
	        		}
	        	}
	        	str += "</tr></thead><tbody>";
	        	colors = dgIni.getStyle("alternatingRowColors");
 
	        	for(var j:int =0;j<dgIni.dataProvider.length;j++) {					
	        		str+="<tr width=\""+Math.ceil(dgIni.width)+"\">";
 
	        		for(var k:int=0; k < dgIni.columns.length; k++) {
	        			if(dgIni.dataProvider.getItemAt(j) != undefined && dgIni.dataProvider.getItemAt(j) != null && dgIni.columns[k].visible == true && dgIni.columns[k].dataField != "Melhor") {
	        				if(dgIni.columns[k].labelFunction != undefined && dgIni.columns[k].labelFunction != null && dgIni.columns[k].visible == true) {
	        					str += "<td nowrap=\"nowrap\" width=\""+Math.ceil(dgIni.columns[k].width)+"\" "+style+">"+dgIni.columns[k].labelFunction(dgIni.dataProvider[j],dgIni.columns[k])+"</td>";
	        				} else {
	        					if(dgIni.dataProvider.getItemAt(j)[dgIni.columns[k].dataField] != undefined)
	        						str += "<td nowrap=\"nowrap\" width=\""+Math.ceil(dgIni.columns[k].width)+"\" "+style+">"+dgIni.dataProvider.getItemAt(j)[dgIni.columns[k].dataField]+"</td>";
	        					else
	        						str += "<td nowrap=\"nowrap\" width=\""+Math.ceil(dgIni.columns[k].width)+"\" "+style+"></td>";
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
		        			str+="<th "+style+">"+dgFin.columns[i].headerText+"</th>";
		        		} else if (dgFin.columns[i].visible == true) {
		        			str+= "<th "+style+">"+dgFin.columns[i].dataField+"</th>";
		        		}
		        	}
	        		str += "</tr></thead><tbody>";
	        		colors = dgFin.getStyle("alternatingRowColors");
		        	
		        	for(j = 0;j<dgFin.dataProvider.length;j++) {					
		        		str+="<tr width=\""+Math.ceil(dgFin.width)+"\">";
	 
		        		for(k = 0; k < dgFin.columns.length; k++) {
		        			if(dgFin.dataProvider.getItemAt(j) != undefined && dgFin.dataProvider.getItemAt(j) != null && dgFin.columns[k].visible == true && dgFin.columns[k].dataField != "Melhor") {
		        				if(dgFin.columns[k].labelFunction != undefined && dgFin.columns[k].labelFunction != null && dgFin.columns[k].visible == true) {
		        					str += "<td nowrap=\"nowrap\" width=\""+Math.ceil(dgFin.columns[k].width)+"\" "+style+">"+dgFin.columns[k].labelFunction(dgFin.dataProvider[j],dgFin.columns[k])+"</td>";
		        				} else {
		        					if(dgFin.dataProvider.getItemAt(j)[dgFin.columns[k].dataField] != undefined)
	        							str += "<td nowrap=\"nowrap\" width=\""+Math.ceil(dgFin.columns[k].width)+"\" "+style+">"+dgFin.dataProvider.getItemAt(j)[dgFin.columns[k].dataField]+"</td>";
	        						else
	        							str += "<td nowrap=\"nowrap\" width=\""+Math.ceil(dgFin.columns[k].width)+"\" "+style+"></td>";
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