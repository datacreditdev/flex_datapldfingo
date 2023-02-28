package Data
{
	import flash.events.Event;
	
	public class EventTasa extends Event
	{
		public var customProp:DatosTasa;
		
		public function EventTasa(type:String, dataToStore:DatosTasa)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventTasa(type, customProp);
		}

	}
}