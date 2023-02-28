package Data
{
	import flash.events.Event;
	
	public class EventProd extends Event
	{
		public var customProp:DatosProd;
		
		public function EventProd(type:String, dataToStore:DatosProd)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventProd(type, customProp);
		}

	}
}