package Data
{
	import flash.events.Event;
	
	public class EventSolic extends Event
	{
		public var customProp:DatosSolic;
		
		public function EventSolic(type:String, dataToStore:DatosSolic)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventSolic(type, customProp);
		}

	}
}