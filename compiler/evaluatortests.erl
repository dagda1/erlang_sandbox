-module (evaluatortests).
-include_lib("eunit/include/eunit.hrl").

simple_evaluator_test() ->
	Ast = parser:parse("(12+3)"),
	Res = evaluator:evaluate(Ast),
	?debugVal(Res).

