//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: ITransiter.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import flash.display.BitmapData;

/**
 * BitmapDataのトランジションを提供するインターフェイス。
 * 
 * @author  Y.Shindo
 * @version $Rev: 4 $
 */
interface spark.display.transition.ITransiter
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
	public function draw (dest:BitmapData, source:BitmapData, phase:Number) : Void;
}