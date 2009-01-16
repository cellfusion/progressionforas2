//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: Fade.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.display.transition.Transiter;
import flash.display.BitmapData;
import flash.geom.ColorTransform;

/**
 * シンプルなフェード
 * 
 * @author  Y.Shindo
 * @see     Transiter	
 * @version $Rev: 4 $
 */
class spark.display.transition.Fade extends Transiter
{
	private var ct:ColorTransform;
	
	public function Fade ()
	{
		ct = new ColorTransform();
		ct.alphaMultiplier = 0;
	}
	
	/**
	 * phaseの割合でフェードします。
	 * 
	 * @param   dest   描画先ビットマップデータ
	 * @param   source トランジションさせるビットマップデータ
	 * @param   phase  トランジションの度合い（0-256）
	 */
	public function draw (dest:BitmapData, source:BitmapData, phase:Number) : Void
	{
		if(checkPhase(dest, source, phase)) return;
		
		dest.draw(source);
		
		ct.alphaOffset = phase;
		dest.colorTransform(dest.rectangle, ct);
	}
}