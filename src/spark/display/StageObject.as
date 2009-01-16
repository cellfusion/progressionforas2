//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: StageObject.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.display.DisplayObject;
import spark.display.DisplayObjectContainer;
import spark.display.InteractiveObject;

/**
 * DisplayObjectツリーの最上位に位置するステージ。
 * 
 * @author  Y.Shindo
 * @see     DisplayObjectContainer	
 * @version $Rev: 4 $
 */
class spark.display.StageObject extends DisplayObjectContainer
{
	private function StageObject (stage:MovieClip, root:DisplayObject)
	{
		super(stage);
		
		setRoot(root);
		setStage(this);
	}
	
	// public だけど internal（同一packageからアクセス可能） と思って
	public static function create (stage:MovieClip, root:DisplayObject) : StageObject
	{
		return (new StageObject(stage, root));
	}
	
	public function createDisplayObject () : Void
	{
		throw new Error();
	}
	public function removeDisplayObject () : Void
	{
		throw new Error();
	}
	
	public function set name (s:String) : Void
	{
	}
	public function get name () : String
	{
		return "stage";
	}
	
	public function set align (s:String) : Void
	{
		Stage.align = s;
	}
	public function get align () : String
	{
		return Stage.align;
	}
	
	public function set focus (o:InteractiveObject) : Void
	{
		Selection.setFocus(o["getDisplayObject"]());
	}
	public function get focus () : InteractiveObject
	{
		return null;
	}
	
	public function set quality (s:String):Void
	{
		_quality = s;
	}
	public function get quality () : String
	{
		return _quality;
	}
	
	public function set scaleMode (s:String) : Void
	{
		Stage.scaleMode = s;
	}
	public function get scaleMode () : String
	{
		return Stage.scaleMode;
	}
	
	public function set showDefaultContextMenu (b:Boolean) : Void
	{
		Stage.showMenu = b;
	}
	public function get showDefaultContextMenu () : Boolean
	{
		return Stage.showMenu;
	}
	
	public function set stageFocusRect (b:Boolean) : Void
	{
	}
	public function get stageFocusRect () : Boolean
	{
		return null;
	}
	
	public function set stageHeight (n:Number) : Void
	{
		Stage.height = n;
	}
	public function get stageHeight () : Number
	{
		return Stage.height;
	}
	
	public function set stageWidth (n:Number) : Void
	{
		Stage.width = n;
	}
	public function get stageWidth () : Number
	{
		return Stage.width;
	}
}