-module(quicksort).
-include_lib("eunit/include/eunit.hrl").
-export([quicksort/1]).

quicksort([]) ->
	[];
quicksort([H|T]) ->
	{Left, Pivot, Right} = quicksort(H, [], [], T),	
	quicksort(Left) ++ [Pivot] ++ quicksort(Right).
	
quicksort(Pivot, Left, Right, []) ->
	{Left, Pivot, Right};
quicksort(Pivot, Left, Right, [H|T]) when H < Pivot ->
	quicksort(Pivot, [H|Left], Right, T);
quicksort(Pivot, Left, Right, [H|T]) ->
	quicksort(Pivot, Left, [H|Right], T).
	
	
	
	
	
	

	

	