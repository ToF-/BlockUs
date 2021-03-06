C=ghc
F=--make -threaded 

image: Spikes/ASimpleImage.hs
	$(C) $(F) Spikes/ASimpleImage.hs -o bin/ASimpleImage
table: Spikes/ASimpleTable.hs
	$(C) $(F) Spikes/ASimpleTable.hs -o bin/ASimpleTable

canvas: Spikes/ASimpleCanvas.hs
	$(C) $(F) Spikes/ASimpleCanvas.hs -o bin/ASimpleCanvas
	
server: Blockus/Server.hs
	$(C) $(F) Blockus/Server.hs -o bin/server

clean:
	rm *.hi
	rm *.o