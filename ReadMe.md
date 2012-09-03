# A web game of blokus

Written in Haskell

## user stories

1. given a list of games, I create a new game and wait for other players
2. given a list of games, I enter a game waiting for players, and I am given a color
3. given a game situation, I see the board and the pieces I can play
4. given a game situation, I play a correct move, have the game displayed again and one piece less
5. given a game situation where I cannot play any piece, I'm noticed and see other players moves
6. given a game situation, I play an incorrect move and I'm noticed and invited to play another move
7. given that no more player can play, I'm noticed of the score made by each player including me

## ideas for the board

the board is "guarded", meaning it's a 22x22 rather than a 20x20 grid, with the outer rows and colums filled with black squares. Black color is neutral with regard to adjacent pieces, but can't be overlapped with other pieces upon. The corners ((0,0),(0,21),(21,0),(21,21)) are respectively filled with colors blue, yellow, red, green.

These two setting taken together should allow for simplication of the rules of piece placement:
- not overlapping any piece
- not adjacent to a piece of same color
- connected by at least on corner to a piece of same color

the rendering of the board will make rows 0 and 21, cols 0 and 21 invisible.
