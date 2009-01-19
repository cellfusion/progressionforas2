//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: RandomFade.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.display.transition.Transiter;
import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.geom.Point;

/**
 * 12x12矩形 ランダムフェード
 * 
 * @author  Y.Shindo
 * @see     Transiter	
 * @version $Rev: 4 $
 */
class spark.display.transition.RandomFade extends Transiter
{
	/**
	 * sourceが12x12の矩形単位でランダムにdestに現れてきます。
	 * 
	 * 0では全く描画されず、256に近づけば近づくほど抜けが少なくなります。
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
		
		var r:Rectangle = new Rectangle(0, 0, 12, 12);
		for(var y:Number=0; y<h; y+=12)
		{
			r.y = y;
			for(var x:Number=0; x<w; x+=12)
			{
				if((Math.random()*255) > phase)
				{
					r.x = x;
					dest.fillRect(r, 0x00000000);
				}
			}
		}
	}
}