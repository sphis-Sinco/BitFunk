final antialiasing = false;
var loadedString = '';

var loadingText = new FlxText(520, 600, 400, '');

final loadingText_font = "vcr.ttf";
final loadingText_color = FlxColor.WHITE;
final loadingText_size = 32;
final loadingText_text = 'Now Loading...';
final loadingText_alignment = "center";
final loadingText_verticalPosition = 600;

var menuBG = new FlxSprite();

final menuBG_image = 'menuDesat';
final menuBG_color = 0xFFD16FFF;

var logo = new FlxSprite(0, 0).loadGraphic(Paths.image('pack'));

final logo_scale = 30;

function onCreate() {
	// game.stateChangeDelay = 3; // Force loading screen to stay for atleast 3 seconds, remove this once you're done working on your loading screen unless you're using it for something else.

	menuBG.loadGraphic(Paths.image(menuBG_image));
	menuBG.antialiasing = antialiasing;
	menuBG.setGraphicSize(Std.int(FlxG.width));
	menuBG.color = menuBG_color;
	menuBG.updateHitbox();
	addBehindBar(menuBG);

	loadingText.text = loadingText_text;
	loadingText.setFormat(Paths.font(loadingText_font), loadingText_size, loadingText_color, loadingText_alignment);
	addBehindBar(loadingText);

	logo.antialiasing = antialiasing;
	logo.scale.set(logo_scale, logo_scale);
	logo.updateHitbox();
	logo.screenCenter();
	addBehindBar(logo);

	Paths.clearUnusedMemory();

        precacheImage('pack');
}

var timePassed = 0;

function onUpdate(elapsed:Float) {
	// do something here every frame

        // trace(getLoaded());
	
        timePassed += elapsed;
	var dots:String = '';
	switch (Math.floor(timePassed % 1 * 3)) {
		case 0:
			dots = '.';
		case 1:
			dots = '..';
		case 2:
			dots = '...';
	}

	loadedString = 'Loading' + dots;

	loadingText.text = loadedString;
	loadingText.screenCenter();
	loadingText.y = loadingText_verticalPosition;
}

function precacheImage(name:String, ?allowGPU:Bool = true) {
        trace(
                'precache image: '+name
        );
        Paths.image(name, allowGPU);
};
function precacheSound(name:String) {
        Paths.sound(name);
};
function precacheSound(name:String) {
        Paths.music(name);
};