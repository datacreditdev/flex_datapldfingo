package Data
{
	import flash.events.Event;
	
	public class EventSuplemento extends Event
	{
		public var customProp:DatosSuplemento;
		
		public function EventSuplemento(type:String, dataToStore:DatosSuplemento)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventSuplemento(type, customProp);
		}

	}
}