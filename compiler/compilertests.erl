-module(compilertests).	
-include_lib("eunit/include/eunit.hrl").

simple_compile_test() ->
	List = parser:parse("(12+3)"),
	?assertEqual({plus,{num,12},{num,3}}, List).
	