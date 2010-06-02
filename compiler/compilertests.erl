-module(compilertests).	
-include_lib("eunit/include/eunit.hrl").

compile_test() ->
	List = lists:concat(parser:scan("(2+3)")),
	?debugVal(List).
	%?assertEqual("{plus, {num, 2}, {num,3}}", parser:scan("(2+3)")).