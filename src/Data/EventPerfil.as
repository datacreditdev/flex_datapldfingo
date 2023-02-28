package Data
{
	import flash.events.Event;
	
	public class EventPerfil extends Event
	{
		public var customProp:DatosPerfil;
		
		public function EventPerfil(type:String, dataToStore:DatosPerfil)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventPerfil(type, customProp);
		}

	}
}