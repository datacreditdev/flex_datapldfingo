package Data
{
	import flash.events.Event;
	
	public class EventInstrumento extends Event
	{
		public var customProp:DatosInstrumento;
		
		public function EventInstrumento(type:String, dataToStore:DatosInstrumento)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventInstrumento(type, customProp);
		}

	}
}