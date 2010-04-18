-module(listtests).	
-include_lib("eunit/include/eunit.hrl").

filter_test() ->
	?assertEqual([1,2,3], list:filter([1,2,3,4,5,6], 3)).

reverse_test() ->
	?assertEqual([3,2,1], list:reverse([1,2,3])).
	
concat_test() ->
	?assertEqual([1,2,3,4,five], list:concat([[1,2,3], [], [4, five]])).