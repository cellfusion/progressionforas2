﻿//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: DisplayObject.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.events.*;
import spark.display.DisplayObjectContainer;
import spark.display.StageObject;
import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.geom.Point;
import flash.geom.Transform;
import mx.utils.Delegate;

/**
 * ディスプレイ上に表示される全てのオブジェクトの基礎となる抽象クラス。
 * 
 * @author  Y.Shindo
 * @see     EventDispatcher	
 * @version $Rev: 4 $
 */
dynamic class spark.display.DisplayObject extends EventDispatcher
{
	private var displayObject:MovieClip = null;
	
	private var parentObject:DisplayObjectContainer = null;
	private var rootObject:DisplayObject = null;
	private var stageObject:StageObject = null;
	
	// MovieClipをラップする
	//（但し、通常はDisplayObjectのコンストラクタを呼ぶような
	// 使い方はしないこと。）
	public function DisplayObject (displayObject:MovieClip)
	{
		this.displayObject = displayObject;
	}
	
	// addChildした時に呼び出される。
	// ホントはAS3みたいにコンストラクタに書きたいコードはここへ
	public function construct () : Void
	{
	}
	
	// これを呼び出して親を設定
	private function setParent (parent:DisplayObjectContainer) : Void
	{
		parentObject = parent;
	}
	// これを呼び出してrootを設定
	private function setRoot (root:DisplayObject) : Void
	{
		rootObject = root;
	}
	// これを呼び出してstageを設定
	private function setStage (stage:StageObject) : Void
	{
		stageObject = stage;
	}
	// 必要あらばこれをオーバーライドしてaddChild時のMC生成処理を書く
	private function createDisplayObject () : Void
	{
		var d:MovieClip = parentObject["displayObject"];
		var n:Number = d.getNextHighestDepth();
		
		displayObject = d.createEmptyMovieClip("display"+n, n);
	}
	// 必要あらばこれをオーバーライドしてremoveChild時のMC解体処理を書く
	private function removeDisplayObject () : Void
	{
		displayObject.removeMovieClip();
	}
	// 謎のプロパティはMCに委譲
	public function __resolve (name:String) : Object
	{
		return displayObject[name];
	}
	
	
	// properties
	
	public function set alpha (n:Number) : Void
	{
		displayObject._alpha = n;
	}
	public function get alpha () : Number
	{
		return displayObject._alpha;
	}
	
	public function set blendMode (o:Object) : Void
	{
		displayObject.blendMode = o;
	}
	public function get blendMode () : Object
	{
		return displayObject.blendMode;
	}
	
	public function set cacheAsBitmap (b:Boolean) : Void
	{
		displayObject.cacheAsBitmap = b;
	}
	public function get cacheAsBitmap () : Boolean
	{
		return displayObject.cacheAsBitmap;
	}
	
	public function set filters (a:Array) : Void
	{
		displayObject.filters = a;
	}
	public function get filters () : Array
	{
		return displayObject.filters;
	}
	
	public function set height (n:Number) : Void
	{
		displayObject._height = height;
	}
	public function get height () : Number
	{
		return displayObject._height;
	}
	
	private var maskObject:DisplayObject = null;
	public function set mask (o:DisplayObject) : Void
	{
		if(o == null)
		{
			displayObject.setMask(null);
		}
		else
		{
			displayObject.setMask(o["getDisplayObject"]());
		}
		
		maskObject = o;
	}
	public function get mask () : DisplayObject
	{
		return maskObject;
	}
	
	public function get mouseX () : Number
	{
		return displayObject._xmouse;
	}
	public function get mouseY () : Number
	{
		return displayObject._ymouse;
	}
	
	public function set name (s:String) : Void
	{
		displayObject._name = s;
	}
	public function get name () : String
	{
		return displayObject._name;
	}
	
	public function set opaqueBackground (n:Number) : Void
	{
		displayObject.opaqueBackground = n;
	}
	public function get opaqueBackground () : Number
	{
		return displayObject.opaqueBackground;
	}
	
	public function get parent () : DisplayObjectContainer
	{
		return parentObject;
	}
	public function get root () : DisplayObject
	{
		return rootObject;
	}
	
	public function set rotation (n:Number) : Void
	{
		displayObject._rotation = n;
	}
	public function get rotation () : Number
	{
		return displayObject._rotation;
	}
	
	public function set scale9Grid (r:Rectangle) : Void
	{
		displayObject.scale9Grid = r;
	}
	public function get scale9Grid () : Rectangle
	{
		return displayObject.scale9Grid;
	}
	
	public function set scaleX (n:Number) : Void
	{
		displayObject._xscale = n;
	}
	public function get scaleX () : Number
	{
		return displayObject._xscale;
	}
	
	public function set scaleY (n:Number) : Void
	{
		displayObject._yscale = n;
	}
	public function get scaleY () : Number
	{
		return displayObject._yscale;
	}
	
	public function set scrollRect (r:Rectangle) : Void
	{
		displayObject.scrollRect = r;
	}
	public function get scrollRect () : Rectangle
	{
		return Rectangle(displayObject.scrollRect);
	}
	
	public function get stage () : StageObject
	{
		return stageObject;
	}
	
	public function set transform (t:Transform) : Void
	{
		displayObject.transform = t;
	}
	public function get transform () : Transform
	{
		return displayObject.transform;
	}
	
	public function set visible (b:Boolean) : Void
	{
		displayObject._visible = b;
	}
	public function get visible () : Boolean
	{
		return displayObject._visible;
	}
	
	public function set width (n:Number) : Void
	{
		displayObject._width = n;
	}
	public function get width () : Number
	{
		return displayObject._width;
	}
	
	public function set x (n:Number) : Void
	{
		displayObject._x = n;
	}
	public function get x () : Number
	{
		return displayObject._x;
	}
	
	public function set y (n:Number) : Void
	{
		displayObject._y = n;
	}
	public function get y () : Number
	{
		return displayObject._y;
	}
	
	// methods
	
	public function getBounds (targetCoordinateSpace:DisplayObject) : Rectangle
	{
		var o:Object = displayObject.getBounds(targetCoordinateSpace.displayObject);
		
		return (new Rectangle(o.xMin, o.yMin, o.xMax, o.yMax));
	}
	
	public function globalToLocal (pt:Point) : Point
	{
		var p:Point = pt.clone();
		displayObject.globalToLocal(p);
		
		return p;
	}
	
	public function hitTestObject (obj:DisplayObject) : Boolean
	{
		return displayObject.hitTest(obj.displayObject);
	}
	
	public function hitTestPoint (x:Number, y:Number, shapeFlag:Boolean) : Boolean
	{
		return displayObject.hitTest(x, y, shapeFlag);
	}
	
	public function localToGlobal (pt:Point) : Point
	{
		var p:Point = pt.clone();
		displayObject.localToGlobal(p);
		
		return p;
	}
	
	public function createBitmapData () : BitmapData
	{
		var b:BitmapData = new BitmapData(width, height, true, 0);
		b.draw(displayObject);
		
		return b;
	}
	
	public function dispatchEvent (event:Event) : Boolean
	{
		// 自分の親から根元までのリストを作る
		var path:Array = getDispatchPath();
		
		event["setTarget"](this);
		
		if(path.length > 0)
		{
			// Capture Phase
			event["setEventPhase"](EventPhase.CAPTURING_PHASE);
			var len:Number = path.length;
			// 根元→親まで辿る
			for(var i:Number=0; i<len; ++i)
			{
				path[i].dispatchMyListeners(event);
				
				// stopPropagation()呼び出しで終了
				if(event["getContinue"]()==1)
				{
					return;
				}
			}
			
			// Target
			event["setEventPhase"](EventPhase.AT_TARGET);
			dispatchMyListeners(event);
			
			// Bubbling Phase
			// （bubblingが許可されていれば）
			if(event.bubbles)
			{
				event["setEventPhase"](EventPhase.BUBBLING_PHASE);
				// 親→根元まで辿る
				for(var i:Number=(len-1); i>=0; --i)
				{
					path[i].dispatchMyListeners(event);
					
					// stopPropagation()呼び出しで終了
					if(event["getContinue"]()==1)
					{
						break;
					}
				}
			}
		}
		else
		{
			event["setEventPhase"](EventPhase.AT_TARGET);
			dispatchMyListeners(event);
		}
		
		return event.isDefaultPrevented();
	}
	private var dispatchPath:Array;
	private function getDispatchPath () : Array
	{
		if(dispatchPath == undefined)
		{
			updateDispatchPath();
		}
		return dispatchPath;
	}
	private function parentIsChanged () : Void
	{
		updateDispatchPath();
	}
	private function updateDispatchPath () : Void
	{
		dispatchPath = new Array();
		createDispatchPath(dispatchPath);
		// 自分自身が含まれているので削除
		dispatchPath.pop();
	}
	private function createDispatchPath (path:Array) : Void
	{
		if(parentObject != null)
		{
			// rootのparentはStageとなるので、Stageで終了すれば良い
			parentObject["createDispatchPath"](path);
		}
		
		path.push(this);
	}
	
	public function willTrigger (type:String) : Boolean
	{
		// 自分の親から根元までのリストを作る
		var path:Array = new Array();
		createDispatchPath(path);
		
		var len:Number = path.length;
		for(var i:Number=0; i<len; ++i)
		{
			if(path[i].hasEventListener(type)) return true;
		}
		
		return false;
	}
	
	public function addEventListener (type:String, listener:Function, useCapture:Boolean, priority:Number) : Void
	{
		super.addEventListener(type, listener, useCapture, priority);
		
		// リスナーが登録されてからはじめてイベント配信を始める
		// （そうしないと全クリップで毎フレームdispatchEnterFrameが呼び出されて恐ろしい事に・・・）
		if(type == EventType.ENTER_FRAME)
		{
			if(displayObject.onEnterFrame==null)
			{
				displayObject.onEnterFrame = Delegate.create(this, dispatchEnterFrame);
				
				if(eventEnterFrame == null)
				{
					eventEnterFrame = new Event(EventType.ENTER_FRAME, false, false);
					eventEnterFrame["setEventPhase"](EventPhase.AT_TARGET);
					eventEnterFrame["setTarget"](this);
				}
			}
		}
	}
	public function removeEventListener (type:String, listener:Function, useCapture:Boolean) : Void
	{
		super.removeEventListener(type, listener, useCapture);
		
		if(type == EventType.ENTER_FRAME && !hasEventListener(type))
		{
			displayObject.onEnterFrame = null;
		}
	}
	
	private var eventEnterFrame:Event = null;
	private function dispatchEnterFrame () : Void
	{
		dispatchMyListeners(eventEnterFrame);
	}
	
	private function getDisplayObject () : Object
	{
		return displayObject;
	}
	
	private function toString () : String
	{
		return getDisplayObject().toString();
	}
}