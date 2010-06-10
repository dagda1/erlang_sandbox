-module(compiler).
-include_lib("eunit/include/eunit.hrl").
-export([compile/1]).

%{plus,{num,12},{num,3}}

compile({Operator, Left, Right}) ->
	LeftResult = compileExpression(Left),
	RightResult = compileExpression(Right),
	pop({Operator, LeftResult,RightResult});
compile(Ast) ->
	compile(Ast).

pop({mul, Left, Right}) ->
	Left * Right;
pop({dvd, Left, Right}) ->
	Left / Right;	
pop({plus, Left, Right}) ->
	Left + Right;
pop({minus, Left, Right}) ->
	Left - Right.
	
	

compileExpression({num, Number}) ->
	Number;
compileExpression(Ast) ->
	Res = compile(Ast),
	Res.	