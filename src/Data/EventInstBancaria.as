package Data
{
	import flash.events.Event;
	
	public class EventInstBancaria extends Event
	{
		public var customProp:DatosInstBancaria;
		
		public function EventInstBancaria(type:String, dataToStore:DatosInstBancaria)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventInstBancaria(type, customProp);
		}

	}
}