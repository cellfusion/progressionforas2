import mx.events.EventDispatcher;import jp.progression.events.TimerEvent;
/** *  * Progression for ActionScript 2.0 *  * @author	Copyright (c) 2007 Mk-10:cellfusion.jp, supported by Spark project. * @version	1.0.0 Alpha *  * @see		http://progression.jp/ * @see		http://usage.progression.jp/ * @see		http://progression.libspark.org/ *  * @see		http://cellfusion.jp/ * @see		http://www.libspark.org/ *  * Licensed under the Apache License, Version 2.0 (the "License"); * you may not use this file except in compliance with the License. * You may obtain a copy of the License at *  * http://www.apache.org/licenses/LICENSE-2.0 *  * Unless required by applicable law or agreed to in writing, software * distributed under the License is distributed on an "AS IS" BASIS, * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, * either express or implied. See the License for the specific language * governing permissions and limitations under the License. *  */
class jp.progression.utils.Timer extends EventDispatcher {
	private var _delay:Number, _repeatCount:Number, count:Number, intervalID:Number;
	private var time:Number, resumeDelay:Number, isResume:Boolean;
	private var startTime:Number;
		public function get delay():Number { return _delay; }	public function set delay(value:Number):Void { _delay = value; }		public function get running():Boolean { return _running; }	private var _running:Boolean;	
//	private var bestTime:Array;
	private var resumeTime:Number, pauseTime:Number;
	
	/**
	 * @param	time 時間（ミリ秒）
	 * @param	repeatCount 繰り返し回数（0は無限）
	 */
	public function Timer(time:Number, repeatCount:Number) {
		super();
//		OnEnterFrameBeacon.init();
		if (repeatCount == undefined) repeatCount = 1;
		_delay = time;
		_repeatCount = repeatCount;
		_running = false;
		
//		bestTime = new Array();
//		for (var i:Number = 0; i<repeatCount; i++) bestTime[i] = _delay * (i + 2);
		
		reset();
	}
	
	/**
	 * timerをスタート
	 */
	function start() {
		reset();
		
		_running = true;
		startTime = getTimer();
		
		intervalID = _global.setInterval(this, "checkTime", delay);
		dispatchEvent(new TimerEvent(TimerEvent.START, this));
	}
	
	/**
	 * 中止
	 */
	public function abort() {
		if (_running)
		{
			_global.clearInterval(intervalID);
			pauseTime = getTimer();
			resumeDelay = delay - (getTimer() - time);
//			MovieClip.removeListener(this);
			
			_running = false;
			isResume = true;
			
			dispatchEvent(new TimerEvent(TimerEvent.ABORT, this));
		}
	}
	
	/**
	 * リジューム
	 */
	public function resume() {
		if (!_running && isResume)
		{
			resumeTime += getTimer() - pauseTime;
			time = getTimer();
//			MovieClip.addListener(this);
			
			_running = true;
			isResume = false;
			
			intervalID = _global.setInterval(this, "checkTime", delay);
			
			dispatchEvent(new TimerEvent(TimerEvent.RESUME, this));
		}
	}
	
	/**
	 * timerをストップ
	 */
	function stop()
	{
		if (_running)
		{
//			MovieClip.removeListener(this);
			
			_running = false;
			
			_global.clearInterval(intervalID);
			dispatchEvent(new TimerEvent(TimerEvent.STOP, this));
		}
	}
	
	/**
	 * timerをリセット
	 */
	function reset() {
//		MovieClip.removeListener(this);
		_global.clearInterval(intervalID);
		count = 0;
		time = getTimer();
		resumeDelay = Infinity;
		isResume = false;
		resumeTime = 0;
	}
	
	function get repeatCount():Number {
		return _repeatCount;
	}
	
	private function onEnterFrame()
	{
		checkTime();
	}
	
	
	private function checkTime() {
		_global.clearInterval(intervalID);
		
		var nowTime:Number = getTimer();
		var fixTime:Number = -nowTime + startTime + _delay * (++count + 1) + resumeTime;
		
		var dtime:Number = nowTime - startTime - resumeTime;
		dispatchEvent(new TimerEvent(TimerEvent.TIMER, this));
		
		if (repeatCount <= count && repeatCount != 0) {
			_running = false;
			dispatchEvent(new TimerEvent(TimerEvent.TIMER_COMPLETE));
		}
		else intervalID = _global.setInterval(this, "checkTime", fixTime);
	}
	
	private function progress(time:Number) {
//		dispatchEvent(new TimerEvent(TimerEvent.PROGRESS, this));
	}
	
	private function timerExecute() {
		count++;
		time = getTimer();
		dispatchEvent(new TimerEvent(TimerEvent.TIMER, this));
		
		if (repeatCount <= count && repeatCount != 0) {
//			_global.clearInterval(scope._interval);
			MovieClip.removeListener(this);
			
			_running = false;
			
			dispatchEvent(new TimerEvent(TimerEvent.TIMER_COMPLETE));
		}
	}
	
//	private function checkTime(scope:Object) {
//		scope._count++;
//		scope.dispatchEvent(new TimerEvent(TimerEvent.TIMER));
//		
//		if (scope._repeatCount <= scope._count && scope._repeatCount != 0) {
//			_global.clearInterval(scope._interval);
//			scope.dispatchEvent(new TimerEvent(TimerEvent.TIMER_COMPLETE));
//		}
//	}
}