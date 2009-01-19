//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: EventPhase.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************

/**
 * DOM3 Events イベントフェーズを表現します。
 * 
 * @author  Y.Shindo
 * @version $Rev: 4 $
 */
class spark.events.EventPhase
{
	static public var CAPTURING_PHASE:Number = 1;
	static public var AT_TARGET:Number = 2;
	static public var BUBBLING_PHASE:Number = 3;
}