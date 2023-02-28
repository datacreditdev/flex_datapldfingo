package Data
{
	import flash.events.Event;
	
	public class EventGiro extends Event
	{
		public var customProp:DatosGiro;
		
		public function EventGiro(type:String, dataToStore:DatosGiro)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventGiro(type, customProp);
		}

	}
}