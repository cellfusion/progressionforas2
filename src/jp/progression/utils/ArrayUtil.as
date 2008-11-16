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
 */
class jp.progression.utils.ArrayUtil {
	
	public function ArrayUtil()
	{
		throw new Error("ArrayUtil クラスはインスタンスを生成できません。");
	}
	
	/**
	 * 指定したオブジェクトが既に配列にあるか調べます
	 * @author	Mk-10
	 * @param	arr	調べる配列
	 * @param	obj	調べるオブジェクト
	 * @return	調べた結果を返します
	 */
	static public function arrayContains(arr:Array, obj:Object):Boolean
	{
		var index = getItemIndex(arr, obj);
		return (index >= 0);
	}
	
	/**
	 * 指定したオブジェクトが配列のどこにあるのか調べます
	 * @author	Mk-10
	 * @param	
	 */
	static public function getItemIndex(arr:Array, obj:Object):Number
	{
		for (var i=0; i<arr.length; i++) if (arr[i] == obj) return i; 
		return - 1;
	}
	
	/**
	 * 
	 */
	static public function searchItemIndex(arr:Array, name:String, obj:Object):Number
	{
		for (var i=0; i<arr.length; i++) if (arr[i][name] == obj) return i; 
		return - 1;
	}
}