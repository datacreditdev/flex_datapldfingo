package Data
{
	import flash.events.Event;
	
	public class EventReg extends Event
	{
		public var customProp:DatosReg;
		
		public function EventReg(type:String, dataToStore:DatosReg)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventReg(type, customProp);
		}

	}
}