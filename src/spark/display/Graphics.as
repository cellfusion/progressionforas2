//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: Graphics.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import flash.display.BitmapData;
import flash.geom.Matrix;

/**
 * DisplayObjectに対するDrawAPIを使用した描画機能を提供します。
 * 
 * @author  Y.Shindo
 * @see     DisplayObject
 * @version $Rev: 4 $
 */
class spark.display.Graphics
{
	private var g:MovieClip;
	
	public function Graphics (g:MovieClip)
	{
		this.g = g;
	}
	
	public function beginBitmapFill (bitmap:BitmapData, matrix:Matrix, repeat:Boolean, smooth:Boolean) : Void
	{
		g.beginBitmapFill(bitmap, matrix, repeat, smooth);
	}
	
	public function beginFill (color:Number, alpha:Number) : Void
	{
		if(alpha == undefined) alpha = 100;
		g.beginFill(color, alpha);
	}
	
	public function beginGradientFill (type:String, colors:Array, alphas:Array, ratios:Array, matrix:Matrix, spreadMethod:String, interpolationMethod:String, focalPointRatio:Number) : Void
	{
		g.beginGradientFill(type, colors, alphas, ratios, matrix, spreadMethod, interpolationMethod, focalPointRatio);
	}
	
	public function clear () : Void
	{
		g.clear();
	}
	
	public function curveTo (controlX:Number, controlY:Number, anchorX:Number, anchorY:Number) : Void
	{
		g.curveTo(controlX, controlY, anchorX, anchorY);
	}
	
	public function drawCircle (x:Number, y:Number, radius:Number) : Void
	{
		var r:Number = radius;
		
		g.moveTo(x+r, y);
		g.curveTo(r+x,			Math.tan(Math.PI/8)*r+y,	Math.sin(Math.PI/4)*r+x,	Math.sin(Math.PI/4)*r+y);
		g.curveTo(Math.tan(Math.PI/8)*r+x,	r+y,			x,			r+y);
		
		g.curveTo(-Math.tan(Math.PI/8)*r+x,	r+y,			-Math.sin(Math.PI/4)*r+x,	Math.sin(Math.PI/4)*r+y);
		g.curveTo(-r+x,			Math.tan(Math.PI/8)*r+y,	-r+x,			y);
		
		g.curveTo(-r+x,			-Math.tan(Math.PI/8)*r+y,	-Math.sin(Math.PI/4)*r+x,	-Math.sin(Math.PI/4)*r+y);
		g.curveTo(-Math.tan(Math.PI/8)*r+x,	-r+y,			x,			-r+y);
		
		g.curveTo(Math.tan(Math.PI/8)*r+x, 	-r+y,			Math.sin(Math.PI/4)*r+x,	-Math.sin(Math.PI/4)*r+y);
		g.curveTo(r+x,			-Math.tan(Math.PI/8)*r+y,	r+x,			y);
	}
	
	public function drawRect (x:Number, y:Number, width:Number, height:Number) : Void
	{
		g.moveTo(x, y);
		g.lineTo(x+width, y);
		g.lineTo(x+width, y+height);
		g.lineTo(x, y+height);
		g.lineTo(x, y);
	}
	
	public function drawRoundRect (x:Number, y:Number, width:Number, height:Number, cornerRadius:Number) : Void
	{
		drawRoundRectComplex(x, y, width, height, cornerRadius, cornerRadius, cornerRadius, cornerRadius);
	}
	
	public function drawRoundRectComplex (x:Number, y:Number, width:Number, height:Number, topLeftRadius:Number, topRightRadius:Number, bottomLeftRadius:Number, bottomRightRadius:Number) : Void
	{
		var r:Number = bottomRightRadius;
		
		g.moveTo(x+width, y+height-r);
		g.curveTo(x+width, Math.tan(Math.PI/8)*r+y+height-r, Math.sin(Math.PI/4)*r+x+width-r, Math.sin(Math.PI/4)*r+y+height-r);
		g.curveTo(Math.tan(Math.PI/8)*r+x+width-r, y+height, x+width-r, y+height);
		
		r = bottomLeftRadius;
		
		g.lineTo(x+r, y+height);
		g.curveTo(-Math.tan(Math.PI/8)*r+x+r, y+height, -Math.sin(Math.PI/4)*r+x+r, Math.sin(Math.PI/4)*r+y+height-r);
		g.curveTo(x, Math.tan(Math.PI/8)*r+y+height-r, x, y+height-r);
		
		r = topLeftRadius;
		
		g.lineTo(x, y+r);
		g.curveTo(x, -Math.tan(Math.PI/8)*r+y+r, -Math.sin(Math.PI/4)*r+x+r, -Math.sin(Math.PI/4)*r+y+r);
		g.curveTo(-Math.tan(Math.PI/8)*r+x+r, y, x+r, y);
		
		r = topRightRadius;
		
		g.lineTo(x+width-r, y);
		g.curveTo(Math.tan(Math.PI/8)*r+x+width-r, y, Math.sin(Math.PI/4)*r+x+width-r, -Math.sin(Math.PI/4)*r+y+r);
		g.curveTo(x+width, -Math.tan(Math.PI/8)*r+y+r, x+width, y+r);
		
		g.lineTo(x+width, y+height-bottomRightRadius);
	}
	
	public function endFill () : Void
	{
		g.endFill();
	}
	
	public function lineGradientStyle (type:String, colors:Array, alphas:Array, ratios:Array, matrix:Matrix, spreadMethod, interpolationMethod:String, focalPointRatio:Number) : Void
	{
		g.lineGradientStyle(type, colors, alphas, ratios, matrix, spreadMethod, interpolationMethod, focalPointRatio);
	}
	
	public function lineStyle (tickness:Number, color:Number, alpha:Number, pixelHinting:Boolean, scaleMode:String, caps:String, joints:String, miterLimit:Number) : Void
	{
		if(alpha == undefined) alpha = 100;
		g.lineStyle(tickness, color, alpha, pixelHinting, scaleMode, caps, joints, miterLimit);
	}
	
	public function lineTo (x:Number, y:Number) : Void
	{
		g.lineTo(x, y);
	}
	
	public function moveTo (x:Number, y:Number) : Void
	{
		g.moveTo(x, y);
	}
}