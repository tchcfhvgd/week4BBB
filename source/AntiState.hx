package;
import flixel.*;
import flixel.addons.text.FlxTextField;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxAxes;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import openfl.Assets;

#if windows
import Sys;
import sys.FileSystem;
#end

class AntiState extends FlxState
{

	public function new() 
     {
         super();
     }

	override public function create():Void 
	{
		var bg:FlxSprite = new FlxSprite();
		
		bg.loadGraphic(Paths.image("evilScreen", "shared"));
		bg.antialiasing = true;
		add(bg);
        FlxG.sound.playMusic(Paths.music("evilbloop","shared"),1,false);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed); 
			
		if(FlxG.keys.pressed.ENTER)
		{
			Sys.sleep(2);
			new FlxTimer().start(0.1, function(tmr:FlxTimer)
			{
				Sys.exit(0);
			});
		}
	}
}