//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: IEventDispatcher.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.events.Event;

/**
 * DOM3イベント配信機能を提供するインターフェイス
 * 
 * @author  Y.Shindo
 * @version $Rev: 4 $
 */
interface spark.events.IEventDispatcher
{
	public function addEventListener (type:String, listener:Function, useCapture:Boolean, priority:Number) : Void;
	public function removeEventListener (type:String, listener:Function, useCapture:Boolean) : Void;
	public function dispatchEvent (event:Event) : Boolean;
	public function hasEventListener (type:String) : Boolean;
	public function willTrigger (type:String) : Boolean;
}