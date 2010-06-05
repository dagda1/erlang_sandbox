-module(compilertests).	
-include_lib("eunit/include/eunit.hrl").

one_digit_test() ->
	?assertEqual({num,4}, parser:parse(4)).

simple_parser_test() ->
	List = parser:parse("(12+3)"),
	?assertEqual({plus,{num,12},{num,3}}, List).
	
complex_parser_test() ->
	List = parser:parse("((12+3)-4)"),
	?assertEqual({minus, {plus,{num,12},{num,3}}, {num, 4}}, List).

complex_multiply_parser_test() ->
	List = parser:parse("((2*3)+(3/4))"),
	?assertEqual({plus,{mul,{num,2},{num,3}},{dvd,{num,3},{num,4}}}, List).
	
unary_parser_test() ->	
	List = parser:parse("~((2*3)+(3*4))"),
	?assertEqual({unary_minus,{plus,{mul,{num,2},{num,3}},{mul,{num,3},{num,4}}}}, List).
		
		