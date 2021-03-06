//
// Flambe - Rapid game development
// https://github.com/aduros/flambe/blob/master/LICENSE.txt

package khambe.platform;

/**
 * Internal helper for shared khambe_debug logic across all platforms.
 */
class khambe_debugLogic
{
	public function new (platform :Platform)
	{
		_platform = platform;

		platform.getKeyboard().down.connect(function (event) {
			if (event.key == O && platform.getKeyboard().isDown(Control)) {
				if (toggleOverdrawGraphics()) {
					Log.info("Enabled overdraw visualizer, press Ctrl-O again to disable");
				}
			}
		});
	}

	/**
	 * Toggles the overdraw khambe_debug renderer.
	 * @return Whether the overdraw renderer was enabled.
	 */
	public function toggleOverdrawGraphics () :Bool
	{
		var renderer = _platform.getRenderer();

		if (_savedGraphics != null) {
			renderer.graphics = _savedGraphics;
			_savedGraphics = null;

		} else if (renderer.graphics != null) {
			_savedGraphics = renderer.graphics;
			renderer.graphics = new OverdrawGraphics(_savedGraphics);
			return true;
		}

		return false;
	}

	private var _platform :Platform;

	/** The normal Graphics saved by toggleOverdrawGraphics so it can restored. */
	private var _savedGraphics :InternalGraphics;
}
