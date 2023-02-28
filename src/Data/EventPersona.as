package Data
{
	import flash.events.Event;
	 
	public class EventPersona extends Event
	{
		public var customProp:DatosPersona;
		
		public function EventPersona(type:String, dataToStore:DatosPersona)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventPersona(type, customProp);
		}

	}
}