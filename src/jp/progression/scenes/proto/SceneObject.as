﻿import mx.events.EventDispatcher;
	
	private function setCommands(value:CommandList):Void { _commands = value; }
	private var _commands:CommandList;
	
	public function get onLoad():Function { return typeof(__onLoad) == "function" ? __onLoad : _onLoad; }
	public function set onLoad(value:Function):Void { __onLoad = value; }
	private var __onLoad:Function;
	private function _onLoad():Void {};
	
	public function get onUnLoad():Function { return typeof(__onUnLoad) == "function" ? __onUnLoad : _onUnLoad; }
	public function set onUnLoad(value:Function):Void { __onUnLoad = value; }
	private var __onUnLoad:Function;
	private function _onUnLoad():Void {};
	
	public function get onInit():Function { return typeof(__onInit) == "function" ? __onInit : _onInit; }
	public function set onInit(value:Function):Void { __onInit = value; }
	private var __onInit:Function;
	private function _onInit():Void {};
	
	public function get onGoto():Function { return typeof(__onGoto) == "function" ? __onGoto : _onGoto; }
	public function set onGoto(value:Function):Void { __onGoto = value; }
	private var __onGoto:Function;
	private function _onGoto():Void {};
	
	public function get onDescend():Function { return typeof(__onDescend) == "function" ? __onDescend : _onDescend; }
	public function set onDescend(value:Function):Void { __onDescend = value; }
	private var __onDescend:Function;
	private function _onDescend():Void {};
	
	public function get onAscend():Function { return typeof(__onAscend) == "function" ? __onAscend : _onAscend; }
	public function set onAscend(value:Function):Void { __onAscend = value; }
	private var __onAscend:Function;
	private function _onAscend():Void {};
	
	public function get onSceneAdded():Function { return typeof(__onSceneAdded) == "function" ? __onSceneAdded : _onSceneAdded; }
	public function set onSceneAdded(value:Function):Void { __onSceneAdded = value; }
	private var __onSceneAdded:Function;
	private function _onSceneAdded():Void {};
	
	public function get onSceneRemoved():Function { return typeof(__onSceneRemoved) == "function" ? __onSceneRemoved : _onSceneRemoved; }
	public function set onSceneRemoved(value:Function):Void { __onSceneRemoved = value; }
	private var __onSceneRemoved:Function;
	private function _onSceneRemoved():Void {};
	
//	public function get onLoadComplete():Function { return typeof(__onLoadComplete) == "function" ? __onLoadComplete : _onLoadComplete; }
//	public function set onLoadComplete(value:Function):Void { __onLoadComplete = value; }
//	private var __onLoadComplete:Function;
//	private function _onLoadComplete():Void;
//	
//	public function get onLoadError():Function { return typeof(__onLoadError) == "function" ? __onLoadError : _onLoadError; }
//	public function set onLoadError(value:Function):Void { __onLoadError = value; }
//	private var __onLoadError:Function;
//	private function _onLoadError():Void;
		_commands = new SerialList();
	
	public function contains(scene:SceneObject):Boolean
	{
		return scenes["contains"](scene);
	}
	
	public function getSceneAt(index:Number):SceneObject
	{
		return scenes["getSceneAt"](index);
	}
	
	public function getSceneByName(name:String):SceneObject
	{
		return scenes["getSceneByName"](name);
	}
	
	public function getSceneIndex(scene:SceneObject):Number
	{
		return scenes["getSceneIndex"](scene);
	}
	
	public function addCommand():Void
	{
		var l:Number = arguments.length;
		for (var i:Number = 0; i < l; i++)
		{
			_commands.addCommand(Command(arguments[i]));
		}
	}
	
	public function clearCommand():Void
	{
		_commands = (parallelMode) ? new ParallelList() : new SerialList();