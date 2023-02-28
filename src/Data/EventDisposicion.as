package Data
{
	import flash.events.Event;
	
	public class EventDisposicion extends Event
	{
		public var customProp:DatosDisposicion;
		
		public function EventDisposicion(type:String, dataToStore:DatosDisposicion)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventDisposicion(type, customProp);
		}

	}
}