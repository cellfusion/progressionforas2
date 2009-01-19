//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: DisplayObjectContainer.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.display.DisplayObject;
import spark.display.InteractiveObject;
import spark.events.Event;
import spark.events.EventType;
import spark.errors.ArgumentError;
import spark.errors.RangeError;

/**
 * DisplayObjectを子として持つことの出来るDisplayObject。
 * 
 * @author  Y.Shindo
 * @see     InteractiveObject	
 * @see     DisplayObject
 * @version $Rev: 4 $
 */
dynamic class spark.display.DisplayObjectContainer extends InteractiveObject
{
	private var children:Array;
	
	public function DisplayObjectContainer (displayObject:MovieClip)
	{
		super(displayObject);
		
		children = new Array();
	}
	
	// プロパティ
	
	public var mouseChildren:Boolean;
	
	public function get numChildren () : Number
	{
		return children.length;
	}
	
	public var tabChildren:Boolean;
	
	public function get textSnapshot () : TextSnapshot
	{
		return displayObject.getTextSnapshot();
	}
	
	// メソッド
	
	public function addChild (child:DisplayObject) : DisplayObject
	{
		// 自分自身は追加できない
		if(child.parent==this)
		{
			throw new ArgumentError();
		}
		
		// 既に子であるならそのコンテナから削除
		if(child.parent!=null)
		{
			child.parent.removeChild(child);
		}
		
		// 追加
		children.push(child);
		
		// 自分を親に設定
		child["setParent"](this);
		// 自分のrootを継承
		child["setRoot"](root);
		// 自分のstageを継承
		child["setStage"](stage);
		
		// displayObject(MC)を初期化
		child["createDisplayObject"]();
		
		// 親が変わったことを通知してイベント配信パスを再生成
		child["parentIsChanged"]();
		
		// コンストラクト
		child.construct();
		
		// addedイベント配信
		child.dispatchEvent(new Event(EventType.ADDED, true, false));
		
		return child;
	}
	
	/*
	indexの位置にchildを挿入（z-orderも適応調節）
	*/
	public function addChildAt (child:DisplayObject, index:Number) : DisplayObject
	{
		var _children:Array = children;
		
		// 範囲外チェック
		// (配列の最後に追加する場合もあると思うので >= ではなく > なのに注意)
		if(index < 0 || index > _children.length)
		{
			throw new RangeError();
		}
		
		// 自分自身は追加できない
		if(child==this)
		{
			throw new ArgumentError();
		}
		
		// 既に子であるならそのコンテナから削除
		if(child.parent!=null)
		{
			child.parent.removeChild(child);
		}
		
		// 追加
		_children.splice(index, 0, child);
		
		// 自分を親に設定
		child["setParent"](this);
		// 自分のrootを継承
		child["setRoot"](root);
		// 自分のstageを継承
		child["setStage"](stage);
		
		// displayObject(MC)を初期化
		child["createDisplayObject"]();
		
		// 親が変わったことを通知してイベント配信パスを再生成
		child["parentIsChanged"]();
		
		// 既存の子を適切な深度まで入れ替え
		var d:MovieClip = child["displayObject"];
		var i:Number = _children.length;
		while(--i > index)
		{
			d.swapDepths(_children[i]["displayObject"]);
		}
		
		// コンストラクト
		child.construct();
		
		// addedイベント配信
		child.dispatchEvent(new Event(EventType.ADDED, true, false));
		
		return child;
	}
	
	public function contains (child:DisplayObject) : Boolean
	{
		var l:Number = children.length;
		for (var i:Number = 0; i < l; i++) {
			if (children[i] == child) {
				return true;
			}
		}
		
		return false;
	}
	
	public function getChildAt (index:Number) : DisplayObject
	{
		// 範囲外チェック
		if(index < 0 || index >= children.length)
		{
			throw new RangeError();
		}
		
		// 単に配列から読む
		return children[index];
	}
	
	public function getChildByName (name:String) : DisplayObject
	{
		// 線形探索して名前が同じのを探す
		var _children:Array = children;
		var i:Number = -1;
		var c:DisplayObject;
		while((c = _children[++i]))
		{
			if(c.name == name)
			{
				return c;
			}
		}
		
		return null;
	}
	
	public function getChildIndex (child:DisplayObject) : Number
	{
		// 子リストを線形探索
		var _children:Array = children;
		var i:Number = -1;
		var c:DisplayObject;
		while((c = _children[++i]))
		{
			if(c == child)
			{
				return i;
			}
		}
		
		// そんなchildはいない
		throw new ArgumentError();
	}
	
	public function removeChild (child:DisplayObject) : DisplayObject
	{
		// getChildIndexでindexを取得してそのindexでremoveChildAt
		return removeChildAt(getChildIndex(child));
	}
	
	public function removeChildAt (index:Number) : DisplayObject
	{
		// 範囲外チェック
		if(index < 0 || index >= children.length)
		{
			throw new RangeError();
		}
		
		// リストから削除
		var c:DisplayObject = children.splice(index, 1)[0];
		
		// displayObject(MC)を解体
		c["removeDisplayObject"]();
		
		// removedイベント配信
		c.dispatchEvent(new Event(EventType.REMOVED, true, false));
		
		// 親はいなくなった
		c["setParent"](null);
		// rootはいなくなった
		c["setRoot"](null);
		// stageもいなくなった
		c["setStage"](null);
		
		// 親が変わったことを通知してイベント配信パスを再生成
		c["parentIsChanged"]();
		
		return c;
	}
	
	public function setChildIndex (child:DisplayObject, index:Number) : Void
	{
		var _children:Array = children;
		var len:Number = _children.length;
		
		// 範囲外チェック
		if(index < 0 || index >= len)
		{
			throw new RangeError();
		}
		
		// リストに子がいるか線形探索
		var i:Number = -1;
		var c:DisplayObject;
		while((c = _children[++i]))
		{
			// 見っけた
			if(c == child)
			{
				// 古いの削除
				_children.splice(i, 1);
				
				// 新しい位置へ
				_children.splice(index, 0, child);
				
				// 既存の子を適切な深度まで入れ替え
				var d:MovieClip = child["displayObject"];
				i = _children.length;
				while(--i > index)
				{
					d.swapDepths(_children[i]["displayObject"]);
				}
				
				// addedイベント配信
				child.dispatchEvent(new Event(EventType.ADDED, true, false));
				
				return;
			}
		}
		
		// そんなchildはいない
		throw new ArgumentError();
	}
	
	// internal メソッド
	
	private function parentIsChanged () : Void
	{
		updateDispatchPath();
		
		// 自分の子にも親が変わったことを通知
		// (当然、自分の親は子の親でもあるため)
		var _children:Array = children;
		var i:Number = -1;
		var c:DisplayObject;
		while((c = _children[i]))
		{
			c["parentIsChanged"]();
		}
	}
}