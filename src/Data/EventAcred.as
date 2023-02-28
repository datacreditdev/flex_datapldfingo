package Data
{
	import flash.events.Event;
	 
	public class EventAcred extends Event
	{
		public var customProp:DatosAcred;
		
		public function EventAcred(type:String, dataToStore:DatosAcred)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventAcred(type, customProp);
		}

	}
}