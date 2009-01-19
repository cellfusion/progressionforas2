//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: InteractiveObject.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

import spark.display.DisplayObject;
import spark.events.*;
import mx.utils.Delegate;

/**
 * ユーザーの入力を受け取ることの出来るDisplayObject。
 * 
 * @author  Y.Shindo
 * @see     DisplayObject	
 * @version $Rev: 4 $
 */
dynamic class spark.display.InteractiveObject extends DisplayObject
{
	private var _mouseEnabled:Boolean = true;
	private var capture:Boolean = true;
	
	public function InteractiveObject (displayObject:MovieClip)
	{
		super(displayObject);
	}
	
	// プロパティ
	
	public function set contextMenu (c:ContextMenu) : Void
	{
		displayObject.menu = c;
	}
	public function get contextMenu () : ContextMenu
	{
		return displayObject.menu;
	}
	
	public function set focusRect (o:Object) : Void
	{
		displayObject._focusrect = Boolean(o);
	}
	public function get focusRect () : Object
	{
		return displayObject._focusrect;
	}
	
	public function set mouseEnabled (b:Boolean) : Void
	{
		_mouseEnabled = b;
	}
	public function get mouseEnabled () : Boolean
	{
		return _mouseEnabled;
	}
	
	public function set tabEnabled (b:Boolean) : Void
	{
		displayObject.tabEnabled = b;
	}
	public function get tabEnabled () : Boolean
	{
		return displayObject.tabEnabled;
	}
	
	public function set tabIndex (n:Number) : Void
	{
		displayObject.tabIndex = n;
	}
	public function get tabIndex () : Number
	{
		return displayObject.tabIndex;
	}
	
	// メソッド
	
	// onReleaseOutsideとかonDragOutとかonDragOverとか取得出来るようにする
	public function setCapture () : Void
	{
		capture = true;
	}
	public function releaseCapture () : Void
	{
		capture = false;
	}
	
	// イベント
	
	public function addEventListener (type:String, listener:Function, useCapture:Boolean, priority:Number) : Void
	{
		super.addEventListener(type, listener, useCapture, priority);
		
		// リスナーが登録されてからはじめてイベント配信を始める
		switch(type)
		{
			case MouseEventType.CLICK:
			{
				registerClickEvent();
			}
			break;
			
			case MouseEventType.DOUBLE_CLICK:
			{
				registerDoubleClickEvent();
			}
			break;
			
			case FocusEventType.FOCUS_IN:
			{
				registerFocusInEvent();
			}
			break;
			
			case FocusEventType.FOCUS_OUT:
			{
				registerFocusOutEvent();
			}
			break;
			
			case KeyboardEventType.KEY_DOWN:
			{
				registerKeyDownEvent();
			}
			break;
			
			case FocusEventType.KEY_FOCUS_CHANGE:
			{
				registerKeyFocusChangeEvent();
			}
			break;
			
			case KeyboardEventType.KEY_UP:
			{
				registerKeyUpEvent();
			}
			break;
			
			case MouseEventType.MOUSE_DOWN:
			{
				registerMouseDownEvent();
			}
			break;
			
			case FocusEventType.MOUSE_FOCUS_CHANGE:
			{
				registerMouseFocusChangeEvent();
			}
			break;
			
			case MouseEventType.MOUSE_MOVE:
			{
				registerMouseMoveEvent();
			}
			break;
			
			case MouseEventType.MOUSE_OUT:
			{
				registerMouseOutEvent();
			}
			break;
			
			case MouseEventType.MOUSE_OVER:
			{
				registerMouseOverEvent();
			}
			break;
			
			case MouseEventType.MOUSE_UP:
			{
				registerMouseUpEvent();
			}
			break;
			
			case MouseEventType.MOUSE_WHEEL:
			{
				registerMouseWheelEvent();
			}
			break;
			
			case EventType.TAB_CHILDREN_CHANGE:
			{
				registerTabChildrenChangeEvent();
			}
			break;
			
			case EventType.TAB_ENABLED_CHANGE:
			{
				registerTabEnabledChangeEvent();
			}
			break;
			
			case EventType.TAB_INDEX_CHANGE:
			{
				registerTabIndexChangeEvent();
			}
			break;
		}
	}
	
	private function registerClickEvent () : Void
	{
		displayObject.onRelease = Delegate.create(this, dispatchClickEvent);
	}
	private function dispatchClickEvent () : Void
	{
		if(_mouseEnabled)
		{
			dispatchEvent(new MouseEvent(MouseEventType.CLICK, true, false));
		}
	}
	
	private function registerDoubleClickEvent () : Void
	{
	}
	
	private function registerFocusInEvent () : Void
	{
		displayObject.onSetFocus = Delegate.create(this, dispatchFocusInEvent);
	}
	private function dispatchFocusInEvent () : Void
	{
		dispatchEvent(new FocusEvent(FocusEventType.FOCUS_IN, false, false));
	}
	
	private function registerFocusOutEvent () : Void
	{
		displayObject.onKillFocus = Delegate.create(this, dispatchFocusOutEvent);
	}
	private function dispatchFocusOutEvent () : Void
	{
		dispatchEvent(new FocusEvent(FocusEventType.FOCUS_OUT, true, false));
	}
	
	private function registerKeyDownEvent () : Void
	{
		displayObject.onKeyDown = Delegate.create(this, dispatchKeyDownEvent);
	}
	private function dispatchKeyDownEvent () : Void
	{
		dispatchEvent(new KeyboardEvent(KeyboardEventType.KEY_DOWN, true, false));
	}
	
	private function registerKeyFocusChangeEvent () : Void
	{
	}
	
	private function registerKeyUpEvent () : Void
	{
		displayObject.onKeyUp = Delegate.create(this, dispatchKeyUpEvent);
	}
	private function dispatchKeyUpEvent () : Void
	{
		dispatchEvent(new KeyboardEvent(KeyboardEventType.KEY_UP, true, false));
	}
	
	private function registerMouseDownEvent () : Void
	{
		displayObject.onMouseDown = Delegate.create(this, dispatchMouseDownEvent);
	}
	private function dispatchMouseDownEvent () : Void
	{
		if(_mouseEnabled)
		{
			dispatchEvent(new MouseEvent(MouseEventType.MOUSE_DOWN, true, true));
		}
	}
	
	private function registerMouseFocusChangeEvent () : Void
	{
	}
	
	private function registerMouseMoveEvent () : Void
	{
		displayObject.onMouseMove = Delegate.create(this, dispatchMouseMoveEvent);
	}
	private function dispatchMouseMoveEvent () : Void
	{
		if(_mouseEnabled)
		{
			dispatchEvent(new MouseEvent(MouseEventType.MOUSE_MOVE, true, true));
		}
	}
	
	private function registerMouseOutEvent () : Void
	{
		displayObject.onRollOut = Delegate.create(this, dispatchMouseOutEvent);
		displayObject.onDragOut = Delegate.create(this, dispatchMouseOutEventIfCapture);
	}
	private function dispatchMouseOutEvent () : Void
	{
		if(_mouseEnabled)
		{
			dispatchEvent(new MouseEvent(MouseEventType.MOUSE_OUT, true, true));
		}
	}
	private function dispatchMouseOutEventIfCapture () : Void
	{
		if(capture)
		{
			dispatchMouseOutEvent();
		}
	}
	
	private function registerMouseOverEvent () : Void
	{
		displayObject.onRollOver = Delegate.create(this, dispatchMouseOverEvent);
		displayObject.onDragOver = Delegate.create(this, dispatchMouseOverEventIfCapture);
	}
	private function dispatchMouseOverEvent () : Void
	{
		if(_mouseEnabled)
		{
			dispatchEvent(new MouseEvent(MouseEventType.MOUSE_OVER, true, true));
		}
	}
	private function dispatchMouseOverEventIfCapture () : Void
	{
		if(capture)
		{
			dispatchMouseOverEvent();
		}
	}
	
	private function registerMouseUpEvent () : Void
	{
		displayObject.onMouseUp = Delegate.create(this, dispatchMouseUpEvent);
	}
	private function dispatchMouseUpEvent () : Void
	{
		if(_mouseEnabled)
		{
			dispatchEvent(new MouseEvent(MouseEventType.MOUSE_UP, true, true));
		}
	}
	
	private function registerMouseWheelEvent () : Void
	{
		displayObject.onMouseWheel = Delegate.create(this, dispatchMouseWheelEvent);
	}
	private function dispatchMouseWheelEvent () : Void
	{
		if(_mouseEnabled)
		{
			dispatchEvent(new MouseEvent(MouseEventType.MOUSE_WHEEL, true, true));
		}
	}
	
	private function registerTabChildrenChangeEvent () : Void
	{
	}
	private function registerTabEnabledChangeEvent () : Void
	{
	}
	private function registerTabIndexChangeEvent () : Void
	{
	}
}