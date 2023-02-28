package Data
{
	import flash.events.Event;
	
	public class EventSucBancaria extends Event
	{
		public var customProp:DatosSucBancaria;
		
		public function EventSucBancaria(type:String, dataToStore:DatosSucBancaria)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventSucBancaria(type, customProp);
		}

	}
}