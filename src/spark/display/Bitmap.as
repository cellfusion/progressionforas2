//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: Bitmap.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.display.DisplayObject;
import flash.display.BitmapData;

/**
 * 関連付けられたBitmapDataを表示するDisplayObject。
 * 
 * @author  Y.Shindo
 * @see     DisplayObject	
 * @version $Rev: 4 $
 */
class spark.display.Bitmap extends DisplayObject
{
	public var bitmapData:BitmapData;
	public var pixelSnapping:String = "auto";
	public var smoothing:Boolean = true;
	
	public function Bitmap (bitmapData:BitmapData)
	{
		this.bitmapData = bitmapData;
	}
	
	private function createDisplayObject () : Void
	{
		super.createDisplayObject();
		
		displayObject.attachBitmap(bitmapData, 0, pixelSnapping, smoothing);
	}
}