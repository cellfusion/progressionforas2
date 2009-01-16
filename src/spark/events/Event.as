//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: Event.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

/**
 * イベントで配信されるイベントクラスです。
 * 
 * @author  Y.Shindo
 * @version $Rev: 4 $
 */
class spark.events.Event
{
	private var _bubbles:Boolean;
	private var _cancelable:Boolean;
	private var _currentTarget:Object;
	private var _eventPhase:Number;
	private var _target:Object;
	private var _type:String;
	
	private var defaultPrevented:Boolean = false;
	private var continueDispatch:Number = 0;
	
	public function Event (type:String, bubbles:Boolean, cancelable:Boolean)
	{
		if(bubbles==undefined) bubbles = false;
		if(cancelable==undefined) cancelable = false;
		
		_type = type;
		_bubbles = bubbles;
		_cancelable = cancelable;
	}
	
	public function get bubbles () : Boolean
	{
		return _bubbles;
	}
	public function get cancelable () : Boolean
	{
		return _cancelable;
	}
	public function get currentTarget () : Object
	{
		return _currentTarget;
	}
	public function get eventPhase () : Number
	{
		return _eventPhase;
	}
	public function get target () : Object
	{
		return _target;
	}
	public function get type () : String
	{
		return _type;
	}
	
	private function setCurrentTarget (target:Object) : Void
	{
		_currentTarget = target;
	}
	private function setEventPhase (phase:Number) : Void
	{
		_eventPhase = phase;
	}
	private function setTarget (target:Object) : Void
	{
		_target = target;
	}
	private function getContinue () : Number
	{
		return continueDispatch;
	}
	
	public function isDefaultPrevented () : Boolean
	{
		return defaultPrevented;
	}
	public function preventDefault () : Void
	{
		defaultPrevented = true;
	}
	
	public function stopImmediatePropagation () : Void
	{
		continueDispatch = 2;
	}
	
	public function stopPropagation () : Void
	{
		continueDispatch = 1;
	}
}