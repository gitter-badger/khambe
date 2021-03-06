//
// Flambe - Rapid game development
// https://github.com/aduros/flambe/blob/master/LICENSE.txt

package khambe.platform.kha;

import khambe.input.Acceleration;
import khambe.input.Attitude;
import khambe.subsystem.MotionSystem;
import khambe.util.Signal1;

class KhaMotion implements MotionSystem
{
	public var accelerationSupported (get, null) :Bool;
	public var acceleration (default, null) :Signal1<Acceleration>;
	public var accelerationIncludingGravity (default, null) :Signal1<Acceleration>;
	public var attitudeSupported (get, null) :Bool;
	public var attitude (default, null) :Signal1<Attitude>;

	public function new() : Void
	{

	}

	private inline function get_accelerationSupported() : Bool
	{
		return false;
	}

	private inline function get_attitudeSupported() : Bool
	{
		return false;
	}
}