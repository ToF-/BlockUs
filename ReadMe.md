# A web game of blokus

Written in Haskell

## user stories 
(carpaccio)

1. display a blokus board with colored tiles 
 

## ideas for the board

the board is "guarded", meaning it's a 22x22 rather than a 20x20 grid, with the outer rows and colums filled with black squares. Black color is neutral with regard to adjacent pieces, but can't be overlapped with other pieces upon. The corners ((0,0),(0,21),(21,0),(21,21)) are respectively filled with colors blue, yellow, red, green.

These two setting taken together should allow for simplication of the rules of piece placement:
- not overlapping any piece
- not adjacent to a piece of same color
- connected by at least on corner to a piece of same color

the rendering of the board will make rows 0 and 21, cols 0 and 21 invisible.
