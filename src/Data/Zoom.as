package Data
{
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class Zoom extends Sprite
	{
		// "loader" cargara la imagen a utilizar en la clase
		var loader:Loader;
		// Dentro de "image" sera donde dibujaremos la imagen cargada en "loader" en escala
		var image:Sprite = new Sprite();
		// "BitMap" y "BitMapData" guardaran la informacion de la imagen cargada en "loader"
		var BitMap:Bitmap;
		var BitMapData:BitmapData;
		// "zoom" sera el objeto que actuara como Lupa, "zoomWidth" y "zoomHeight" seran el ancho y largo respectivamente
		var zoom:Sprite = new Sprite();
		var zoomWidth:int;
		var zoomHeight:int;
		// "zoomAble" indicara si se debe o no, mostrar el Zoom dentro de la imagen
		var zoomAble:Boolean = false;
		// "imageWidth" y "imageHeight" seran el ancho y largo respectivamente de "BitMap" una vez escalado
		// Por el otro lado "dataWidth" y "dataHeight", tendran el ancho y largo de "BitMap" sin escalar
		var imageWidth:Number;
		var imageHeight:Number;
		var dataWidth:Number;
		var dataHeight:Number;
		// "imageScale" y "imageZoom" representan la relacion entre la imagen escalada, y el zoom que se le aplica
		var imageScale:Number;
		var imageZoom:Number;
		
		public function Zoom(url:String, width:Number, height:Number, scale:Number):void
		{
			// Asignamos los valores de acuerdo a los que se introdujeron en la clase
			imageScale = 1 / scale;
			imageZoom = 1 / imageScale;
			zoomWidth = width;
			zoomHeight = height;
			// Añadimos "image" al escenario
			addChild(image);
			image.x = x;
			image.y = y;
			// Cargamos la imagen dentro de "loader" y creamos un listener al terminar
			loader = new Loader();
			loader.load(new URLRequest(url));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, startApp);
		}
		
		function startApp(event:Event)
		{
			// Una vez cargada la imagen, llenamos "BitMap" y "BitMapData" con ella
			// Y guardamos las dimensiones de esta
			BitMap = Bitmap(loader.content);
			BitMapData = BitMap.bitmapData;
			dataWidth = BitMap.width;
			dataHeight = BitMap.height;
			BitMap.scaleX = imageScale;
			BitMap.scaleY = imageScale;
			imageWidth = BitMap.width;
			imageHeight = BitMap.height;
			image.addChild(BitMap);
			// Eliminamos el Listener de "loader" al ser cargada su imagen
			// Y añadimos un par Listeners para eventos del cursor (al dar click y al moverlo)
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, startApp);
			this.addEventListener(MouseEvent.CLICK, imageClick);
			addEventListener(MouseEvent.MOUSE_MOVE, imageMove);
			image.addChild(zoom);
		}
	
		// Funcion encargada de llenar el cuadro de Zoom con la imagen correspondiente
		function setNewZoom(a:Number, b:Number):void
		{
			var curBd:BitmapData;
			var curBmp:Bitmap;
			var xbeg:Number = a - zoomWidth / 2;
			var ybeg:Number = b - zoomHeight / 2;
			if (xbeg < 0){xbeg = 0;}
			if (ybeg < 0){ybeg = 0;}
			if (xbeg > dataWidth - zoomWidth){xbeg = dataWidth - zoomWidth;}
			if (ybeg > dataHeight - zoomHeight){ybeg = dataHeight - zoomHeight;}
			//
			// Copiamos los pixeles correspondientes a la posicion en la que se esta haciendo el Zoom
			curBmp = new Bitmap(new BitmapData(zoomWidth, zoomHeight));
			curBmp.bitmapData.copyPixels(BitMapData, new Rectangle(xbeg, ybeg, zoomWidth, zoomHeight), new Point(0, 0));
			curBd = curBmp.bitmapData;
			//
			// Pegamos esos pixeles dentro de "zoom"
			zoom.graphics.clear();
			zoom.graphics.lineStyle();
			zoom.graphics.beginBitmapFill(curBd);
			zoom.graphics.drawRect(0, 0, zoomWidth, zoomHeight);
			zoom.graphics.endFill();
		}
	
		// Funcion encargada de activar/desactivar la variable "zoomAble"
		function imageClick(event:MouseEvent):void
		{
			zoomAble = zoomAble ? false : true;
		}
		
		// Funcion encargada de mover el cuadro de Zoom en su debido espacio
		// Ademas de remover este cuando se ha salido del area activa de "zoom"
		function imageMove(event:MouseEvent):void
		{
			// Si, si esta activado el efecto de Zoom este debe de estar visible
			if(zoomAble)
			{
				var locX:Number = image.mouseX;
				var locY:Number = image.mouseY;
				zoom.x = locX - zoomWidth / 2;
				zoom.y = locY - zoomHeight / 2;
				setNewZoom(imageZoom * locX, imageZoom * locY);
				Mouse.hide();
			
				// Si el mouse sale de sus limites, desactivamos "zoomAble"
				if((mouseX > image.x + BitMap.width) || (mouseY > image.y + BitMap.height) || (mouseX < image.x) || (mouseY < image.y))
				{
					zoomAble = false;
				}
			}
			else
			{
				// Borramos los pixeles del efecto Zoom, sea cual sea la razon.
				zoom.graphics.clear();
				Mouse.show();
			}
		}
	}
}