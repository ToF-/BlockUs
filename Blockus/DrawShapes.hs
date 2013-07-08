module Blockus.DrawShapes
where


preamble :: [String]
preamble = 
	["  var fs = new Array(); sc[0]=\"#0000FF\"; sc[1]=\"#00FF00\"; sc[2]=\"#00CC00\"; sc[3]=\"#FFFF00\";"
	,"  var ss = new Array(); sc[0]=\"#0000CC\"; sc[1]=\"#00CC00\"; sc[2]=\"#006600\"; sc[3]=\"#FFCC00\";"
	,"  var sq = function(ctx,c,x,y) {"
	,"    ctx.fillStyle=fs[c]; ctx.fillRect(x*24,y*24,24,24);" 
	,"    ctx.strokeStyle=ss[c]; ctx.lineWidth=2; ctx.strokeRect(x*24,y*24,24,24)"
	,"  }"
	]
	
drawShapes :: [String]
drawShapes = ["var drawShapes = function() {"
			 ,"}"]