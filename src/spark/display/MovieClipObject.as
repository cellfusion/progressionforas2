//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: MovieClipObject.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.display.Sprite;
import spark.events.Event;
import spark.events.EventType;
import spark.errors.ArgumentError;
import spark.errors.RangeError;

/**
 * タイムラインを持つSprite。
 * 
 * @author  Y.Shindo
 * @see     Sprite	
 * @version $Rev: 4 $
 */
dynamic class spark.display.MovieClipObject extends Sprite
{
	public function MovieClipObject ()
	{
	}
	
	public function get currentFrame () : Number
	{
		return displayObject._currentframe;
	}
	public function get currentLabel () : String
	{
		return "";
	}
	public function get currentScene () : String
	{
		return "";
	}
	public function get framesLoaded () : Number
	{
		return displayObject._framesloaded;
	}
	public function get totalFrames () : Number
	{
		return displayObject._totalframes;
	}
	public function set trackAsMenu (b:Boolean) : Void
	{
		displayObject.trackAsMenu = b;
	}
	public function get trackAsMenu () : Boolean
	{
		return displayObject.trackAsMenu;
	}
	
	public function gotoAndPlay (frame:Object, scene:String) : Void
	{
		displayObject.gotoAndPlay(frame, scene);
	}
	public function gotoAndStop (frame:Object, scene:String) : Void
	{
		displayObject.gotoAndStop(frame, scene);
	}
	public function nextFrame () : Void
	{
		displayObject.nextFrame();
	}
	public function nextScene () : Void
	{
		displayObject.nextScene();
	}
	public function play () : Void
	{
		displayObject.play();
	}
	public function prevFrame () : Void
	{
		displayObject.prevFrame();
	}
	public function prevScene () : Void
	{
		displayObject.prevScene();
	}
	public function stop () : Void
	{
		displayObject.stop();
	}
}