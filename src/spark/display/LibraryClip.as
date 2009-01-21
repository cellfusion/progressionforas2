//******************************************************************************
// Spark - ActionScript2.0 Game Framework
// Copyright(C) 2005 BeInteractive!, all rights reserved.
//
// $Id: LibraryClip.as 4 2007-03-26 03:31:45Z yossy $
//******************************************************************************
import jp.progression.utils.ObjectUtil;import spark.display.MovieClipObject;

/**
 * リンケージを設定したライブラリ内のMCを生成します。
 * 
 * @author  Y.Shindo
 * @see     MovieClipObject	
 * @version $Rev: 4 $
 */
dynamic class spark.display.LibraryClip extends MovieClipObject
{
	private var id:String;
	
	/**
	 * 新しいLibraryClipクラスのインスタンスを生成します。
	 * 
	 * idで指定されたリンケージのMovieClipに関連付けられます。
	 * 
	 * @param   id リンケージ名
	 * @see   MovieClipObject
	 */
	public function LibraryClip (id:String)
	{
		this.id = id;
	}
	
	private function createDisplayObject () : Void
	{
		var d:MovieClip = parentObject["displayObject"];
		var n:Number = d.getNextHighestDepth();
		
		displayObject = d.attachMovie(id, "display"+n, n);
		
		// createDisplayObject 以前に設定したプロパティを設定する
		ObjectUtil.setProperties(displayObject, properties);
		
		// mask が設定されている場合は設定する
		if (maskObject) mask = maskObject;
		
		buildGraphics();
	}
}