var fill = new Array();
var stroke = new Array();

fill[0]   = "#0000FF";
stroke[0] = "#000088";

fill[1]   = "#FF0000";
stroke[1] = "#CC0000";

fill[2]   = "#00CC00";
stroke[2] = "#006600";

fill[3]   = "#FFFF00";
stroke[3] = "#FFCC00";

var square = function(ctx,color, x, y) {

	ctx.fillStyle=fill[color];
	ctx.fillRect(x*24,y*24,24,24);
	ctx.strokeStyle=stroke[color];
	ctx.lineWidth=2;
	ctx.strokeRect(x*24,y*24,24,24);
	
}
var draw = function() {
	var c=document.getElementById("myCanvas");
	var ctx=c.getContext("2d");
	square(ctx,0,1,1);
	square(ctx,0,1,0);
	square(ctx,0,2,0);
	square(ctx,0,3,0);

}