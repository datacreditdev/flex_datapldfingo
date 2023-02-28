package Data
{
	import flash.events.Event;
	
	public class EventCtaBancaria extends Event
	{
		public var customProp:DatosCtaBancaria;
		
		public function EventCtaBancaria(type:String, dataToStore:DatosCtaBancaria)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventCtaBancaria(type, customProp);
		}

	}
}