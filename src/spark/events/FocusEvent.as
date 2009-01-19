//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: FocusEvent.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.events.Event;
import spark.display.InteractiveObject;

/**
 * フォーカスに関するイベントで配信されるイベントクラスです。
 * 
 * @author  Y.Shindo
 * @see     Event	
 * @version $Rev: 4 $
 */
class spark.events.FocusEvent extends Event
{
	public var keyCode:Number;
	public var relatedObject:InteractiveObject;
	public var shiftKey:Boolean;
	
	public function FocusEvent (type:String, bubbles:Boolean, cancelable:Boolean, relatedObject:InteractiveObject, shiftKey:Boolean, keyCode:Number)
	{
		super(type, bubbles, cancelable);
		
		if(relatedObject==undefined) relatedObject = null;
		if(shiftKey==undefined) shiftKey = false;
		if(keyCode==undefined) keyCode = 0;
		
		this.relatedObject = relatedObject;
		this.shiftKey = shiftKey;
		this.keyCode = keyCode;
	}
}