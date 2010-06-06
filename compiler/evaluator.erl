-module (evaluator).
-include_lib("eunit/include/eunit.hrl").
-export([evaluate/1]).

evaluate(Ast) -> 
	Ast.