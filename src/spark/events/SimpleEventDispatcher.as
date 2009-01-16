//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: SimpleEventDispatcher.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.events.IEventDispatcher;
import spark.events.Event;
import spark.events.EventPhase;

/**
 * DOM3式のイベント配信ではなく、従来のFlashのような、
 * シンプルなイベント配信（単純に登録されてるリスナにのみ配信）を提供します。
 * 
 * @author  Y.Shindo
 * @see     IEventDispatcher	
 * @version $Rev: 4 $
 */
class spark.events.SimpleEventDispatcher implements IEventDispatcher
{
	private var target:IEventDispatcher = null;
	private var listeners:Array;
	
	public function SimpleEventDispatcher ()
	{
		listeners = new Array();
	}
	
	/*
	useCaptureとpriorityは無視されます
	*/
	public function addEventListener (type:String, listener:Function, useCapture:Boolean, priority:Number) : Void
	{
		if(listeners[type] == undefined)
		{
			listeners[type] = new Array();
		}
		
		removeEventListener(type, listener);
		
		listeners[type].push(listener);
	}
	
	/*
	useCaptureは無視されます
	*/
	public function removeEventListener (type:String, listener:Function, useCapture:Boolean) : Void
	{
		var _listeners:Array = listeners[type];
		var i:Number = -1;
		var f:Function;
		while((f = _listeners[++i]))
		{
			if(f == listener)
			{
				_listeners.splice(i, 1);
				return;
			}
		}
	}
	
	public function dispatchEvent (event:Event) : Boolean
	{
		event["setTarget"](this);
		event["setEventPhase"](EventPhase.AT_TARGET);
		event["setCurrentTarget"](this);
		
		var _listeners:Array = listeners[event.type];
		var i:Number=-1;
		var f:Function;
		while((f = _listeners[i]))
		{
			f(event);
		}
		
		return false;
	}
	
	public function hasEventListener (type:String) : Boolean
	{
		return (listeners[type].length > 0);
	}
	
	public function willTrigger (type:String) : Boolean
	{
		return hasEventListener(type);
	}
}