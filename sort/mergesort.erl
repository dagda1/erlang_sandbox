
-module(mergesort).
-include_lib("eunit/include/eunit.hrl").
-export([split/1,mergesort/1,length/1,floor/1,ceiling/1]).

mergesort([]) ->
	[];
mergesort(List) when length(List) > =/= 0 ->
	List;
mergesort(List) ->
	debugMsg("Got here").
	

split([]) ->
	[];
split(List) ->
	Mid = ceiling(length(List, 0) / 2),
	?debugVal(Mid),
	{Left,Right} = split([], List, Mid, 0),
	?debugVal({Left,Right}),
	{Left, Right}.		
	
split(Left, [H|T], Mid, Pos) when Mid > Pos ->
	split(Left ++ [H], T, Mid, (Pos + 1));	
split(Left, Right, Mid, Pos) when Pos =:= Mid ->
	{Left, Right}.		

length([]) ->
	0;
length(List)	->
	length(List, 0).
	
length([], Acc)	->
	Acc;
length([H|T], Acc) ->
	length(T, (Acc + 1)).
	
floor(X) ->
    T = erlang:trunc(X),
    case (X - T) of
        Neg when Neg < 0 -> T - 1;
        Pos when Pos > 0 -> T;
        _ -> T
    end.

ceiling(X) ->
    T = erlang:trunc(X),
    case (X - T) of
        Neg when Neg < 0 -> T;
        Pos when Pos > 0 -> T + 1;
        _ -> T
    end.
	