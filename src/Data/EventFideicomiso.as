package Data
{
	import flash.events.Event;
	
	public class EventFideicomiso extends Event
	{
		public var customProp:DatosFideicomiso;
		
		public function EventFideicomiso(type:String, dataToStore:DatosFideicomiso)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventFideicomiso(type, customProp);
		}

	}
}