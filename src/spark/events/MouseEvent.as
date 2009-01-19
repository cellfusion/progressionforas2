//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: MouseEvent.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.events.Event;
import spark.display.InteractiveObject;

/**
 * マウスに関するイベントで配信されるイベントクラスです。
 * 
 * @author  Y.Shindo
 * @see     Event	
 * @version $Rev: 4 $
 */
class spark.events.MouseEvent extends Event
{
	public var altKey:Boolean;
	public var buttonDown:Boolean;
	public var ctrlKey:Boolean;
	public var delta:Number;
	public var localX:Number;
	public var localY:Number;
	public var releatedObject:InteractiveObject;
	public var shiftKey:Boolean;
	
	public function MouseEvent (type:String, bubbles:Boolean, cancelable:Boolean, localX:Number, localY:Number, relatedObject:InteractiveObject, ctrlKey:Boolean, altKey:Boolean, shiftKey:Boolean, buttonDown:Boolean, delta:Number)
	{
		super(type, bubbles, cancelable);
		
		if(localX==undefined) localX = 0;
		if(localY==undefined) localY = 0;
		if(relatedObject==undefined) relatedObject = null;
		if(ctrlKey==undefined) ctrlKey = false;
		if(altKey==undefined) altKey = false;
		if(shiftKey==undefined) shiftKey = false;
		if(buttonDown==undefined) buttonDown = false;
		if(delta==undefined) delta = 0;
		
		this.localX = localX;
		this.localY = localY;
		this.releatedObject = relatedObject;
		this.ctrlKey = ctrlKey;
		this.altKey = altKey;
		this.shiftKey = shiftKey;
		this.buttonDown = buttonDown;
		this.delta = delta;
	}
	
	public function get stageX () : Number
	{
		return localX;
	}
	public function get stageY () : Number
	{
		return localY;
	}
}