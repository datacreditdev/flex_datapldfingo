package Data
{
	import flash.events.Event;
	
	public class EventDir extends Event
	{
		public var customProp:DatosDir;
		
		public function EventDir(type:String, dataToStore:DatosDir)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventDir(type, customProp);
		}

	}
}