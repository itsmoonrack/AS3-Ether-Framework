package fr.wedesign.tween
{
	import flash.geom.ColorTransform;

	public function interpolateColor(start:ColorTransform, end:ColorTransform, t:Number):ColorTransform {
		var result:ColorTransform = new ColorTransform();
		result.redMultiplier = start.redMultiplier + (end.redMultiplier - start.redMultiplier)*t;
		result.greenMultiplier = start.greenMultiplier + (end.greenMultiplier - start.greenMultiplier)*t;
		result.blueMultiplier = start.blueMultiplier + (end.blueMultiplier - start.blueMultiplier)*t;
		result.alphaMultiplier = start.alphaMultiplier + (end.alphaMultiplier - start.alphaMultiplier)*t;
		result.redOffset = start.redOffset + (end.redOffset - start.redOffset)*t;
		result.greenOffset = start.greenOffset + (end.greenOffset - start.greenOffset)*t;
		result.blueOffset = start.blueOffset + (end.blueOffset - start.blueOffset)*t;
		result.alphaOffset = start.alphaOffset + (end.alphaOffset - start.alphaOffset)*t;
		return result;
	}
}