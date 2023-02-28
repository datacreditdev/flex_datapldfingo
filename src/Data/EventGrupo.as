package Data
{
	import flash.events.Event;
	
	public class EventGrupo extends Event
	{
		public var customProp:DatosGrupo;
		
		public function EventGrupo(type:String, dataToStore:DatosGrupo)
		{
			super(type);
			this.customProp = dataToStore;
		}
		
		override public function clone():Event 
		{
			return new EventGrupo(type, customProp);
		}

	}
}