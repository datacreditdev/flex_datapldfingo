package Data
{
	import flash.events.Event;
	
	public class EventGarantia extends Event
	{
		public var customProp:DatosGarantia;
		
		public function EventGarantia(type:String, dataToStore:DatosGarantia)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventGarantia(type, customProp);
		}

	}
}