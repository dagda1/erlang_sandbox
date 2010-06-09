-module(compiler).
-include_lib("eunit/include/eunit.hrl").
-export([compile/1]).

%{plus,{num,12},{num,3}}

compile(Ast) ->
	compile(Ast, []).
	
compile({Operator, Left, Right}, Stack) ->
	LeftResult = compileExpression(Left, Stack),
	RightResult = lists:reverse(compileExpression(Right, LeftResult)),
	?debugVal(LeftResult),
	?debugVal(RightResult),
	?debugVal(Operator),
	[[Operator|RightResult]|Stack].

compileExpression({num, Number}, Stack) ->
	[Number|Stack];
compileExpression(Ast, Stack) ->
	Res = compile(Ast, Stack),
	Res.	