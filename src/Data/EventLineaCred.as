package Data
{
	import flash.events.Event;
	
	public class EventLineaCred extends Event
	{
		public var customProp:DatosLineaCred;
		
		public function EventLineaCred(type:String, dataToStore:DatosLineaCred)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventLineaCred(type, customProp);
		}

	}
}