package Data
{
	import flash.display.Sprite;
	import mx.containers.TitleWindow;

	public class TitleWindowCustom extends Sprite
	{
		private var contenedor:Sprite;
		
		public function TitleWindowCustom():void{
			contenedor = new Sprite();
			addChild(contenedor);
			var control:TitleWindow = new TitleWindow();
			contenedor.addChild(control);
		}
	}
}