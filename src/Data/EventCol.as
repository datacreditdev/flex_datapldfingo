package Data
{
	import flash.events.Event;
	
	public class EventCol extends Event
	{
		public var customProp:DatosCol;
		
		public function EventCol(type:String, dataToStore:DatosCol)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventCol(type, customProp);
		}

	}
}