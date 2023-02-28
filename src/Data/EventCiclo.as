package Data
{
	import flash.events.Event;
	
	public class EventCiclo extends Event
	{
		public var customProp:DatosCiclo;
		
		public function EventCiclo(type:String, dataToStore:DatosCiclo)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventCiclo(type, customProp);
		}

	}
}