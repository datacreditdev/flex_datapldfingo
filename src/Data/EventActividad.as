package Data
{
	import flash.events.Event;
	
	public class EventActividad extends Event
	{
		public var customProp:DatosActividad;
		
		public function EventActividad(type:String, dataToStore:DatosActividad)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventActividad(type, customProp);
		}

	}
}