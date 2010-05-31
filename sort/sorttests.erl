<<<<<<< Updated upstream
-module(sorttests).	
-include_lib("eunit/include/eunit.hrl").

%sort_test() ->
%	?assertEqual([1,2,3,4,5], quicksort:quicksort([2,1,3,5,4])).	
%
	
split_test() ->
	?assertEqual({[2,1,3], [5,4]}, mergesort:split([2,1,3,5,4])).
=======
-module(sorttests).	
-include_lib("eunit/include/eunit.hrl").

%sort_test() ->
%	?assertEqual([1,2,3,4,5], quicksort:quicksort([2,1,3,5,4])).	
	
split_test() ->
	?assertEqual({[2,1,3], [5,4]}, mergesort:split([2,1,3,5,4])).

%merge_test() ->
%	?assertEqual([1,2,3,4,5], mergesort:mergesort([2,1,3,5,4])).	
>>>>>>> Stashed changes
