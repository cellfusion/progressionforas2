//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: Transiter.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.display.transition.ITransiter;
import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.geom.Point;

/**
 * ITransiterの実装。
 * 
 * 全てのトランジションはこのクラスから派生させると良いです。
 * 
 * @author  Y.Shindo
 * @see     ITransiter	
 * @version $Rev: 4 $
 */
class spark.display.transition.Transiter implements ITransiter
{
	/**
	 * phaseで指定した度合いのトランジションが行われた後のsourceをdestに描画します。
	 * 
	 * モノによっては、速度優先のため、destの内容（元からあったデータ）は破壊されます。
	 * トランジション後の画像に背景を付けたいときなどは、Bitmapを分けるなどしてください。
	 * 
	 * @param   dest   描画先ビットマップデータ
	 * @param   source トランジションさせるビットマップデータ
	 * @param   phase  トランジションの度合い（0-256）
	 */
	public function draw (dest:BitmapData, source:BitmapData, phase:Number) : Void
	{
		if(checkPhase(dest, source, phase)) return;
	}
	
	/* protected */ private function checkPhase (dest:BitmapData, source:BitmapData, phase:Number) : Boolean
	{
		if(phase <= 0)
		{
			dest.fillRect(dest.rectangle, 0x00000000);
			return true;
		}
		if(phase >= 256)
		{
			dest.draw(source);
			return true;
		}
		return false;
	}
}