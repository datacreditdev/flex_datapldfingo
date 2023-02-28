package Data
{
	import flash.events.Event;
	
	public class EventOrgFond extends Event
	{
		public var customProp:DatosOrgFond;
		
		public function EventOrgFond(type:String, dataToStore:DatosOrgFond)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventOrgFond(type, customProp);
		}

	}
}