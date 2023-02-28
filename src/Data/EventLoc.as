package Data
{
	import flash.events.Event;
	
	public class EventLoc extends Event
	{
		public var customProp:DatosLoc;
		
		public function EventLoc(type:String, dataToStore:DatosLoc)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventLoc(type, customProp);
		}

	}
}
