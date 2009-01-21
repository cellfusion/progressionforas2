//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: Sprite.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.display.DisplayObject;
import spark.display.DisplayObjectContainer;
import spark.display.Graphics;
import flash.geom.Rectangle;

/**
 * Gprahics（DrawAPI）による描画機能を持ち、子を持つ子の出来るDisplayObject。
 * 
 * @author  Y.Shindo
 * @see     DisplayObjectContainer	
 * @version $Rev: 4 $
 */
dynamic class spark.display.Sprite extends DisplayObjectContainer
{
	private var _graphics:Graphics = null;
	
	public function Sprite ()
	{
	}
	
	private function createDisplayObject () : Void
	{
		super.createDisplayObject();
		
		buildGraphics();
		
		// hitArea が設定されている場合は設定する
		if (_hitArea) hitArea = _hitArea;
	}
	
	// Graphicsオブジェクトの構築
	private function buildGraphics () : Void
	{
		_graphics = new Graphics(displayObject);
	}
	
	public function set buttonMode (b:Boolean) : Void
	{
	}
	public function get buttonMode () : Boolean
	{
		return false;
	}
	
	public function get dropTarget () : DisplayObject
	{
		return null;
	}
	
	public function set enabled (b:Boolean) : Void
	{
		displayObject.enabled = b;
		properties.enabled = b;
	}
	public function get enabled () : Boolean
	{
		return displayObject ? displayObject.enabled : properties.enabled;
	}
	
	public function get graphics () : Graphics
	{
		return _graphics;
	}
	
	private var _hitArea:Sprite;
	public function set hitArea (s:Sprite) : Void
	{
		displayObject.hitArea = _hitArea = s["displayObject"];
	}
	public function get hitArea () : Sprite
	{
		return _hitArea;
	}
	
	public function set useHandCursor (b:Boolean) : Void
	{
		displayObject.useHandCursor = b;
		properties.useHandCursor = b;
	}
	public function get useHandCursor () : Boolean
	{
		return displayObject ? displayObject.useHandCursor : properties.useHandCursor;
	}
	
	public function startDrag (lockCenter:Boolean, bounds:Rectangle) : Void
	{
		if(bounds!=undefined)
		{
			displayObject.startDrag(lockCenter, bounds.left, bounds.top, bounds.right, bounds.bottom);
		}
		else
		{
			displayObject.startDrag(lockCenter);
		}
	}
	public function stopDrag () : Void
	{
		displayObject.stopDrag();
	}
}