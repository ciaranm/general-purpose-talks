include "globals.mzn";

array[1..4] of var 1..: xs;
var 145..: y;

constraint sum([x^5 | x in xs]) = y^5;
constraint increasing(xs);
solve minimize y;
