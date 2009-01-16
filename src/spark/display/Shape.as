//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: Shape.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.display.DisplayObject;
import spark.display.Graphics;

/**
 * Graphics（DrawAPI）による描画機能を持つDisplayObject。
 * 
 * @author  Y.Shindo
 * @see     DisplayObject	
 * @version $Rev: 4 $
 */
class spark.display.Shape extends DisplayObject
{
	private var g:Graphics;
	
	public function Shape ()
	{
	}
	
	public function get graphics () : Graphics
	{
		return g;
	}
	
	private function createDisplayObject () : Void
	{
		super.createDisplayObject();
		
		g  = new Graphics(displayObject);
	}
}