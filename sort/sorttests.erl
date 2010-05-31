-module(sorttests).	
-include_lib("eunit/include/eunit.hrl").

sort_test() ->
	?assertEqual([1,2,3,4,5], quicksort:quicksort([2,1,3,5,4])).	
	
split_test() ->
	?assertEqual({[2,1,3], [5,4]}, mergesort:split([2,1,3,5,4])).

merge_test() ->
	?assertEqual([1,2,3,4,5,6,7,8,9,10], mergesort:mergesort([10,7,2,1,9,3,8,5,4,6])).	

