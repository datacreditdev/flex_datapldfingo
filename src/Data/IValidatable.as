package Data
{
	/**
	 *  The interface that components implement to
	 *  support validation of fields. This component
	 *  bypasses the need to use Validators.
	 *  Custom ui components implement this interface
	 *  therefore all custom ui component in the application can be
	 *  iterated through during a validation process
	 *  and set to show its error state or clear its error state.
	 */
	public interface IValidatable
	{
		/**
	     *  Every <cod>IValidatable</code> component will have a proper error
	     *  skin. Setting <code>showError</code> to true will invoke this setter
	     *  and flag the component to display the error skin on the next
	     *  <cod>commitPropeties</code>.
	     *
	     *  <p>Calling <code>showError</code> is similar to setting <code>errorString</code>
	     *  except that some components may not need to display an error string but still show
	     *  its error skin.</p>
	     * 	<p>IValidatable components in the application can display error skins regardless of setting an
	     *  errorString. This is important to note for child components whose parent containers
	     *  will set or show an error string or who wont show an error message at all but simply
	     *  display a skin or icon for its errored state</p>
	     *
	 	*/
		function get showError():Boolean;
		function set showError(value:Boolean):void;
	}
}