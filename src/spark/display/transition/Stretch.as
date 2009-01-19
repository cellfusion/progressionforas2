//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: Stretch.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.display.transition.Transiter;
import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.geom.Point;

/**
 * ストレッチ
 * 
 * @author  Y.Shindo
 * @see     Transition	
 * @version $Rev: 4 $
 */
class spark.display.transition.Stretch extends Transiter
{
	/**
	 * ぐにょーんと垂直に引き伸ばされて上から描画されていく感じです。
	 * 
	 * @param   dest   描画先ビットマップデータ
	 * @param   source トランジションさせるビットマップデータ
	 * @param   phase  トランジションの度合い（0-256）
	 */
	public function draw (dest:BitmapData, source:BitmapData, phase:Number) : Void
	{
		if(checkPhase(dest, source, phase)) return;
		
		var w:Number = source.width;
		var h:Number = source.height;
		
		dest.draw(source);
		
		var y:Number = (h*phase) >> 8;
		
		var r:Rectangle = new Rectangle(0, y, 1, h-y);
		
		for(var x:Number=0; x<w; ++x)
		{
			r.x = x;
			dest.fillRect(r, source.getPixel32(x, y));
		}
	}
}