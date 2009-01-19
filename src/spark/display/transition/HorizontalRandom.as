//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: HorizontalRandom.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.display.transition.Transiter;
import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.geom.Point;

/**
 * 水平ランダムラスタ
 * 
 * @author  Y.Shindo
 * @see     Transition	
 * @version $Rev: 4 $
 */
class spark.display.transition.HorizontalRandom extends Transiter
{
	/**
	 * 0に近ければ近いほど水平ラインを左右にずらして描画します。
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
		
		dest.fillRect(dest.rectangle, 0x00000000);
		
		var z:Number = 256 - phase;
		var z2:Number = z >> 1;
		
		var r:Rectangle = new Rectangle(0, 0, w, 1);
		var p:Point = new Point(0, 0);
		
		for(var y:Number=0; y<h; ++y)
		{
			r.y = y;
			p.y = y;
			p.x = Math.random()*z - z2;
			dest.copyPixels(source, r, p);
		}
	}
}