import jp.progression.Progression;import jp.progression.scenes.SceneId;import jp.progression.scenes.SceneObject;
/**
 * 
 * Progression for ActionScript 2.0
 * 
 * @author	Copyright (c) 2007 Mk-10:cellfusion.jp, supported by Spark project.
 * @version	1.0.0 Alpha
 * 
 * @see		http://progression.jp/
 * @see		http://usage.progression.jp/
 * @see		http://progression.libspark.org/
 * 
 * @see		http://cellfusion.jp/
 * @see		http://www.libspark.org/
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language
 * governing permissions and limitations under the License.
 * 
 */class jp.progression.scenes.proto.RootSceneObject extends SceneObject {	public function get sceneID():SceneId { 		return new SceneId("/" + name); 	}	public function get root():RootSceneObject { 		return this; 	}	public function get parent():SceneObject { 		return this; 	}	public function RootSceneObject(name:String, progression:Progression)	{		super(name);
		
		_progression = progression;	}}