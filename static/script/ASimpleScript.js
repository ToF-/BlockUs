
var square = function(ctx, x, y) {
	ctx.fillStyle="#FF0000";
	ctx.fillRect(x*24,y*24,24,24);
	ctx.strokeStyle="#CC0000";
	ctx.lineWidth=2;
	ctx.strokeRect(x*24,y*24,24,24);
	
}
var draw = function() {
	var c=document.getElementById("myCanvas");
	var ctx=c.getContext("2d");
	square(ctx,1,1);
	square(ctx,1,0);
	square(ctx,2,0);
	square(ctx,3,0);

}