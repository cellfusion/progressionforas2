//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: EventDispatcher.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.events.IEventDispatcher;
import spark.events.Event;
import spark.events.EventPhase;

/**
 * DOM3イベント配信機能を提供するクラスです。
 * 
 * @author  Y.Shindo
 * @see     IEventDispatcher	
 * @version $Rev: 4 $
 */
class spark.events.EventDispatcher implements IEventDispatcher
{
	private var target:IEventDispatcher = null;
	private var listeners:Array;
	
	public function EventDispatcher ()
	{
		if(arguments.length==1)
		{
			if(arguments[0] instanceof "IEventDispatcher")
			{
				target = arguments[0];
			}
		}
		
		listeners = new Array();
	}
	
	public function addEventListener (type:String, listener:Function, useCapture:Boolean, priority:Number) : Void
	{
		if(useCapture==undefined) useCapture = false;
		if(priority==undefined) priority = 0;
		
		if(listeners[type] == undefined)
		{
			listeners[type] = new Array();
		}
		
		removeEventListener(type, listener, useCapture);
		
		listeners[type].push({useCapture:useCapture, listener:listener, priority:priority});
	}
	
	public function removeEventListener (type:String, listener:Function, useCapture:Boolean) : Void
	{
		if(useCapture==undefined) useCapture = false;
		
		var _listeners:Array = listeners[type];
		var len:Number = _listeners.length;
		for(var i:Number=0; i<len; ++i)
		{
			var o:Object = _listeners[i];
			if(o.listener == listener && o.useCapture == useCapture)
			{
				_listeners.splice(i, 1);
				return;
			}
		}
	}
	
	public function dispatchEvent (event:Event) : Boolean
	{
		if(target != null)
		{
			event["setTarget"](target);
		}
		else
		{
			event["setTarget"](this);
		}
		
		event["setEventPhase"](EventPhase.AT_TARGET);
		
		dispatchMyListeners(event);
		
		return event.isDefaultPrevented();
	}
	
	private function dispatchMyListeners (event:Event) : Void
	{
		event["setCurrentTarget"](this);
		
		var useCapture:Boolean = (event.eventPhase==EventPhase.CAPTURING_PHASE);
		
		var _listeners:Array = listeners[event.type];
		
		var len:Number = _listeners.length;
		for(var i:Number=0; i<len; ++i)
		{
			var o:Object = _listeners[i];
			if(o.useCapture == useCapture)
			{
				o.listener(event);
			}
			if(event["getContinue"]()==2)
			{
				break;
			}
		}
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