-module (evaluatortests).
-include_lib("eunit/include/eunit.hrl").

simple_evaluator_test() ->
	Ast = parser:parse("(12+3)"),
	Res = evaluator:evaluate(Ast),
	?assertEqual(15, Res).
	
complex_evaluator_test() ->
	Ast = parser:parse("((12+3)-4)"),
	Res = evaluator:evaluate(Ast),
	?assertEqual(11, Res).

complex_multiply_evaluator_test() ->
	Ast = parser:parse("((2*3)+(6/2))"),
	Res = evaluator:evaluate(Ast),
	?assertEqual(9.0, Res).
	
unary_parser_test() ->	
	Ast = parser:parse("~((2*3)+(3*4))"),
	Res = evaluator:evaluate(Ast),
	?assertEqual(-18, Res).