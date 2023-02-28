package Data
{
	import flash.events.Event;
	
	public class EventSector extends Event
	{
		public var customProp:DatosSector;
		
		public function EventSector(type:String, dataToStore:DatosSector)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventSector(type, customProp);
		}

	}
}