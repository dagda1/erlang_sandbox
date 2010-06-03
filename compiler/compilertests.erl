-module(compilertests).	
-include_lib("eunit/include/eunit.hrl").

compile_test() ->
	List = parser:scan("(12+3)"),
	?debugVal(List).
	%?assertEqual(List, "[12,+,3]").
	%?assertEqual("{plus, {num, 2}, {num,3}}", parser:scan("(2+3)")).