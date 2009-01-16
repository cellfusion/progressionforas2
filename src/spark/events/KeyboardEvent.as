//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: KeyboardEvent.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.events.Event;

/**
 * キーボードに関するイベントで配信されるイベントクラスです。
 * 
 * @author  Y.Shindo
 * @see     Event	
 * @version $Rev: 4 $
 */
class spark.events.KeyboardEvent extends Event
{
	public var altKey:Boolean;
	public var charCode:Number;
	public var ctrlKey:Boolean;
	public var keyCode:Number;
	public var keyLocation:Number;
	public var shiftKey:Boolean;
	
	public function KeyboardEvent (type:String, bubbles:Boolean, cancelable:Boolean, charCode:Number, keyCode:Number, keyLocation:Number, ctrlKey:Boolean, altKey:Boolean, shiftKey:Boolean)
	{
		super(type, bubbles, cancelable);
		
		if(charCode==undefined) charCode = 0;
		if(keyCode==undefined) keyCode = 0;
		if(keyLocation==undefined) keyLocation = 0;
		if(ctrlKey==undefined) ctrlKey = false;
		if(altKey==undefined) altKey = false;
		if(shiftKey==undefined) shiftKey = false;
		
		this.charCode = charCode;
		this.keyCode = keyCode;
		this.keyLocation = keyLocation;
		this.ctrlKey = ctrlKey;
		this.altKey = altKey;
		this.shiftKey = shiftKey;
	}
}