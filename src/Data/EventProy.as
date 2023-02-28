package Data
{
	import flash.events.Event;
	
	public class EventProy extends Event
	{
		public var customProp:DatosProy;
		
		public function EventProy(type:String, dataToStore:DatosProy)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventProy(type, customProp);
		}

	}
}