import mx.events.EventDispatcher;import mx.utils.Delegate;import jp.progression.Progression;import jp.progression.commands.ParallelList;import jp.progression.commands.SerialList;import jp.progression.commands.proto.Command;import jp.progression.commands.proto.CommandList;import jp.progression.core.SceneId;import jp.progression.core.collections.SceneList;import jp.progression.events.Event;import jp.progression.events.ProcessEvent;import jp.progression.events.SceneEvent;import jp.progression.events.EventIntegrator;import jp.progression.utils.ObjectUtil;/** *  * Progression for ActionScript 2.0 *  * @author	Copyright (c) 2007 Mk-10:cellfusion.jp, supported by Spark project. * @version	1.0.0 Alpha *  * @see		http://progression.jp/ * @see		http://usage.progression.jp/ * @see		http://progression.libspark.org/ *  * @see		http://cellfusion.jp/ * @see		http://www.libspark.org/ *  * Licensed under the Apache License, Version 2.0 (the "License"); * you may not use this file except in compliance with the License. * You may obtain a copy of the License at *  * http://www.apache.org/licenses/LICENSE-2.0 *  * Unless required by applicable law or agreed to in writing, software * distributed under the License is distributed on an "AS IS" BASIS, * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, * either express or implied. See the License for the specific language * governing permissions and limitations under the License. *  */class jp.progression.scenes.proto.SceneObject extends EventIntegrator{	private var _sceneChangeDelegate:Function;		public function get name():String { return _name; }	private var _name:String;		public function get sceneId():SceneId	{		// 親が存在しなければ null を返す		if (!parent) return null;				// 親が自分であれば		if (parent == this) return new SceneId("/"+name);				return new SceneId(String(parent.sceneId) + "/" + name);	}		public function get scenes():SceneList { return getScenes(); }	private function getScenes():SceneList { return _scenes; }	private function setScenes(value:SceneList):Void { _scenes = value; }	private var _scenes:SceneList;		public function get numChildren():Number { return _scenes["getNumChildren"](); }		public function get progression():Progression { return getProgression(); }	private function getProgression():Progression { return _progression; }	private function setProgression(value:Progression):Void	{		// 設定が存在していれば		if (_progression) {			// リスナーを解除する			_progression.removeEventListener(ProcessEvent.PROCESS_SCENE, _processSceneDelegate);		}				// 値を設定する		_progression = value;				if (_progression) {			// リスナーを登録する			_progression.addExclusivelyEventListener(ProcessEvent.PROCESS_SCENE, _processSceneDelegate);		}				// 子の関連性を再設定する		for (var idx:String in scenes) {			var scene:SceneObject = scenes[idx];			scene["setProgression"](value);		}	}	private var _progression:Progression;		public function get root():SceneObject { return getRoot(); }	private function getRoot():SceneObject { return _rootScene; }	private function setRoot(value:SceneObject):Void	{		_rootScene = value;				// 子の関連性を再設定する		for (var idx:String in scenes) {			var scene:SceneObject = scenes[idx];			scene["setRoot"](root);		}	}	private var _rootScene:SceneObject;		public function get parent():SceneObject { return getParent(); }	private function getParent():SceneObject { return _parent; }	private function setParent(value:SceneObject):Void	{		_parent = value;				// 子の関連性を再設定する		for (var idx:String in scenes) {			var scene:SceneObject = scenes[idx];			scene["setParent"](this);		}	}	private var _parent:SceneObject;
		public function get next():SceneObject	{		if (!parent) return null;				return parent.scenes["getNextScene"](this);	}		public function get previous():SceneObject	{		if (!parent) return null;				return parent.scenes["getPreviousScene"](this);	}		public function get isCurrent():Boolean { return _isCurrent; }	private var _isCurrent:Boolean;		public function get isParent():Boolean { return _isParent; }	private var _isParent:Boolean;		public function get isChild():Boolean { return _isChild; }	private var _isChild:Boolean;		public function get parallelMode():Boolean { return (_commands instanceof ParallelList); }	public function set parallelMode(value:Boolean):Void	{		// 既存コマンドを取得する		var list:Array = _commands["getCommands"]().concat();				// 初期化する		_commands = (value) ? new ParallelList() : new SerialList();				// コマンドを追加する		var l:Number = list.length;		for (var i:Number = 0; i < l; i++) {			_commands.addCommand(Command(list[i]));		}	}		public function get readed():Boolean { return _readed; }	private var _readed:Boolean;		private function getExtra():Object { return _extra; }	private function setExtra(value:Object):Void { _extra = value; }	private var _extra:Object;		private function getCommands():CommandList { return _commands; }
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
	private function _onSceneRemoved():Void {};		public function get onSceneStateChange():Function { return typeof(__onSceneStateChange) == "function" ? __onSceneStateChange : _onSceneStateChange; }	public function set onSceneStateChange(value:Function):Void { __onSceneStateChange = value; }	private var __onSceneStateChange:Function;	private function _onSceneStateChange():Void {};
	
//	public function get onLoadComplete():Function { return typeof(__onLoadComplete) == "function" ? __onLoadComplete : _onLoadComplete; }
//	public function set onLoadComplete(value:Function):Void { __onLoadComplete = value; }
//	private var __onLoadComplete:Function;
//	private function _onLoadComplete():Void;
//	
//	public function get onLoadError():Function { return typeof(__onLoadError) == "function" ? __onLoadError : _onLoadError; }
//	public function set onLoadError(value:Function):Void { __onLoadError = value; }
//	private var __onLoadError:Function;
//	private function _onLoadError():Void;		private var _loadDelegate:Function;	private var _descendDelegate:Function;	private var _initDelegate:Function;	private var _gotoDelegate:Function;	private var _ascendDelegate:Function;	private var _unloadDelegate:Function;	private var _sceneAddedDelegate:Function;	private var _sceneRemovedDelegate:Function;	private var _sceneStateChangeDelegate:Function;	private var _processSceneDelegate:Function;		/**	 * シーンオブジェクトを作成	 */	public function SceneObject(name:String)	{		_scenes = new SceneList();
		_commands = new SerialList();		_name = name;				_loadDelegate = Delegate.create(this, _load);		_descendDelegate = Delegate.create(this, _descend);		_initDelegate = Delegate.create(this, _init);		_gotoDelegate = Delegate.create(this, _goto);		_unloadDelegate = Delegate.create(this, _unload);		_sceneAddedDelegate = Delegate.create(this, _sceneAdded);		_sceneRemovedDelegate = Delegate.create(this, _sceneRemoved);		_sceneStateChangeDelegate = Delegate.create(this, _sceneStateChange);		_processSceneDelegate = Delegate.create(this, _processScene);				_isCurrent = false;		_isParent = false;		_isChild = false		_readed = false;				// リスナーを登録する		addExclusivelyEventListener(SceneEvent.LOAD, _loadDelegate);		addExclusivelyEventListener(SceneEvent.DESCEND, _descendDelegate);		addExclusivelyEventListener(SceneEvent.INIT, _initDelegate);		addExclusivelyEventListener(SceneEvent.GOTO, _gotoDelegate);		addExclusivelyEventListener(SceneEvent.ASCEND, _ascendDelegate);		addExclusivelyEventListener(SceneEvent.UNLOAD, _unloadDelegate);		addExclusivelyEventListener(SceneEvent.SCENE_ADDED,_sceneAddedDelegate);		addExclusivelyEventListener(SceneEvent.SCENE_REMOVED, _sceneRemovedDelegate);		addExclusivelyEventListener(SceneEvent.SCENE_STATE_CHANGE, _sceneStateChangeDelegate);	}		/**	 * シーンオブジェクトを追加	 */	public function addScene(scene:SceneObject):SceneObject	{		// 子シーンに登録する		_scenes["addScene"](scene);						scene.setProgression(progression);		scene.setParent(this);		scene.setRoot(root);				scene.dispatchEvent(new SceneEvent(SceneEvent.SCENE_ADDED, scene));				return scene;	}		public function addSceneAt(scene:SceneObject, index:Number, addAbove:Boolean):SceneObject	{		if (addAbove != undefined) addAbove = false;				// 子シーンに登録する		scenes["addSceneAt"](scene, index, addAbove);				// 関係性を設定する		scene.setProgression(progression);		scene.setRoot(root);		scene.setParent(this);				// イベントを送出する		scene.dispatchEvent(new SceneEvent(SceneEvent.SCENE_ADDED, scene));				return scene;	}		public function removeScene(scene:SceneObject):SceneObject	{		// イベントを送出する		scene.dispatchEvent(new SceneEvent(SceneEvent.SCENE_REMOVED));				// 関係性を削除する		scene.setProgression(null);		scene.setParent(null);		scene.setRoot(null);				// 子シーンから削除する		scenes["removeScene"](scene);				return scene;	}		public function removeSceneAt(index:Number):SceneObject	{		// イベントを送出する		scene.dispatchEvent(new SceneEvent(SceneEvent.SCENE_REMOVED, scene));				// 関係性を削除する		scene.setProgression(null);		scene.setParent(null);		scene.setRoot(null);				// 子シーンから削除する		var scene:SceneObject = scenes["removeSceneAt"](index);				return scene;	}		public function removeAllScene():Void	{		for (var idx:String in scenes) {			var scene:SceneObject = scenes[idx];			removeScene(scene);		}	}
	
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
	}		public function setSceneIndex(scene:SceneObject, index:Number, addAbove:Boolean):Void	{		scenes["setSceneIndex"](scene, index, addAbove);	}
		public function swapScenes(scene1:SceneObject, scene2:SceneObject):Void	{		scenes["swapScenes"](scene1, scene2);	}		public function swapScenesAt(scene1:Number, scene2:Number):Void	{		scenes["swapScenesAt"](scene1, scene2);	}	
	public function addCommand():Void
	{		// コマンドがない場合は終了する		if (arguments.length == 0) return;		
		var l:Number = arguments.length;
		for (var i:Number = 0; i < l; i++)
		{
			_commands.addCommand(Command(arguments[i]));
		}
	}
	
	public function clearCommand():Void
	{
		_commands = (parallelMode) ? new ParallelList() : new SerialList();	}		public function setProperties(props:Object):SceneObject	{		ObjectUtil.setProperties(this, props);		return this;	}		public function toString():String	{		return "[object SceneObject]";	}		// 	// ここからイベントハンドラメソッド	//		private function _load(e:SceneEvent):Void	{		onLoad.apply(this, []);	}		private function _unload(e:SceneEvent):Void	{		onUnLoad.apply(this, []);	}		private function _init(e:SceneEvent):Void	{		// 未読であれば		if (!_readed)		{			// 既読にする			_readed = true;						dispatchEvent(new SceneEvent(SceneEvent.SCENE_STATE_CHANGE, this));		}				onInit.apply(this, []);	}		private function _goto(e:SceneEvent):Void	{		onGoto.apply(this, []);	}		private function _descend(e:SceneEvent):Void	{		onDescend.apply(this, []);	}		private function _ascend(e:SceneEvent):Void	{		onAscend.apply(this, []);	}		private function _sceneAdded(e:SceneEvent):Void	{		onSceneAdded.apply(this, []);	}		private function _sceneRemoved(e:SceneEvent):Void	{		onSceneRemoved.apply(this, []);	}		private function _sceneStateChange(e:SceneEvent):Void	{		onSceneStateChange.apply(this, []);	}		private function _processScene(e:ProcessEvent):Void	{		// カレントシーンに該当するかどうか		_isCurrent = (this == e.scene);				// 親シーンに該当するか		_isParent = !(_isCurrent || e.scene.sceneId.contains(sceneId));				// 子シーンに該当するかどうか		_isChild = (!_isCurrent && e.scene.sceneId.contains(sceneId));				// イベントを送出する		dispatchEvent(new SceneEvent(SceneEvent.SCENE_STATE_CHANGE, this));	}}