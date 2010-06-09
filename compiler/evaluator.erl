-module (evaluator).
-include_lib("eunit/include/eunit.hrl").
-export([evaluate/1]).

evaluate({Operator, Left, Right}) -> 
	LeftResult = compute(Left),
	RightResult = compute(Right),
	Res = factor(Operator, LeftResult, RightResult),
	Res;
evaluate({Operator, Right}) ->
	RightResult = compute(Right),
	factor(Operator, RightResult).
	
compute({num, Number}) ->
	Number;
compute({Operator, Left, Right}) ->
	Ast = {Operator, Left, Right},
	evaluate(Ast).

factor(Operator, Left, Right) ->
	case Operator of
		plus ->
			(Left  + Right);
		minus ->
			(Left - Right);
		dvd ->
			(Left / Right);
		mul ->
			(Left * Right)	
	end.
factor(Operator, Right) ->
	case Operator of
		unary_minus ->
			(0 - Right)
	end.
	