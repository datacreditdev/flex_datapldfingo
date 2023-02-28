package Data
{
	import flash.events.Event;
	
	public class EventTipoProd extends Event
	{
		public var customProp:DatosTipoProd;
		
		public function EventTipoProd(type:String, dataToStore:DatosTipoProd)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventTipoProd(type, customProp);
		}

	}
}