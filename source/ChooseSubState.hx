package;

import openfl.Lib;
import Controls.Control;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

using StringTools;

class ChooseSubState extends MusicBeatSubstate
{

	var curSelected:Int = 1;	
	var selectorImage:FlxSprite;

	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0;
		bg.scrollFactor.set();
		add(bg);

		selectorImage = new FlxSprite(600, 430).loadGraphic(Paths.image('bigChungus'));
		selectorImage.antialiasing = true;
		selectorImage.alpha = 0;
		selectorImage.scrollFactor.set();
		selectorImage.screenCenter(X);
		add(selectorImage);

		FlxTween.tween(bg, {alpha: 0.8}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(selectorImage, {alpha: 1}, 0.4, {ease: FlxEase.quartInOut});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		
		var leftP = controls.LEFT_P;
		var rightP = controls.RIGHT_P;
		var accepted = controls.ACCEPT;

		if (leftP && curSelected >= 1)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'));
			curSelected -= 1;
   
		}else if (rightP && curSelected <= 1)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'));
			curSelected += 1;
		}
		if(curSelected == 1)
			trace('gay');
		else if (curSelected == 2)
			trace('homo');
		else
			trace('i fucked up');
		if (controls.BACK)
		{
			close();
			LoadingState.loadAndSwitchState(new TitleState());
		}
		if (accepted)
		{
			LoadingState.loadAndSwitchState(new FreeplayState());
		}
		
	}
}