package Data
{
	import flash.events.Event;
	
	public class EventDispersion extends Event
	{
		public var customProp:DatosDispersion;
		
		public function EventDispersion(type:String, dataToStore:DatosDispersion)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventDispersion(type, customProp);
		}
	}
}