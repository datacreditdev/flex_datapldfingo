package Data
{
	import mx.controls.ComboBox;
	import mx.events.ValidationResultEvent;
 
	public class CustomComboBox extends ComboBox implements IValidatable{
		private var originalUpSkin:Object;
		private var originalOverSkin:Object;
		private var originalDownSkin:Object;
 
		private var _showError:Boolean = false;
 
		override protected function createChildren():void{
			super.createChildren();
 
			originalUpSkin		=	getStyle("upSkin");
			originalOverSkin	=	getStyle("overSkin");//
			originalDownSkin	=	getStyle("downSkin");//
 
			setBackgroundSkin();
		}
 
		public function set showError( value:Boolean ):void{
			_showError = value;
			invalidateProperties();
		}
 
		public function get showError():Boolean{
			return _showError;
		}
 
		override protected function commitProperties():void{
			super.commitProperties();
 
			if (_showError == false && errorString){//
				setBackgroundErrorSkin();
			}//
			if (errorString){
				setBackgroundErrorSkin();
			}
			else{
				if(errorString && errorString.length != 0){//
		    		errorString = '';
		    	}//
	        	setBackgroundSkin();
			}
		}
 
		private function setBackgroundSkin():void{
			setStyle("upSkin", originalUpSkin);
			setStyle("overSkin", originalOverSkin);
			setStyle("downSkin", originalDownSkin);
		}
 
		private function setBackgroundErrorSkin():void{
			setStyle("upSkin", getStyle("errorUpSkin"));
			setStyle("overSkin", getStyle("errorOverSkin"));
			setStyle("downSkin", getStyle("errorDownSkin"));
		}
	}
}