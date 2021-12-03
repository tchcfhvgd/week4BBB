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

		var selectorImage = new FlxSprite(0, 0).loadGraphic(Paths.image('bigChungus'), true, 415, 415);
		selectorImage.antialiasing = true;
		selectorImage.animation.add('base', [0, 1], 0, false, false);
		selectorImage.alpha = 0;
		selectorImage.scrollFactor.set();
		add(selectorImage);
		selectorImage.animation.play('base');

		FlxTween.tween(bg, {alpha: 0.6}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(selectorImage, {alpha: 1, y: 20}, 0.4, {ease: FlxEase.quartInOut});
		//FlxTween.tween(selectorImage, {alpha: 1}, 0.4, {ease: FlxEase.quartInOut});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		
		var leftP = controls.LEFT_P;
		var rightP = controls.RIGHT_P;
		var accepted = controls.ACCEPT;

		if (leftP)
		{
			curSelected -= 1;
   
		}else if (rightP)
		{
			curSelected += 1;
		}
		if(curSelected == 1)
			selectorImage.animation.curAnim.curFrame = 0;
		else
			selectorImage.animation.curAnim.curFrame = 1;
		
		if (controls.BACK)
		{
			close();
		}
		if (accepted)
		{
			LoadingState.loadAndSwitchState(new FreeplayState());
		}
		
	}
}