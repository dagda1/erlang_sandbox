-module(mergesort).
-include_lib("eunit/include/eunit.hrl").
-export([split/1,mergesort/1,length/1,floor/1,ceiling/1]).

mergesort([]) ->
	[];
mergesort(List) when length(List) =:= 1 ->
	List;
mergesort(List) ->
	{Left, Right} = split(List),
	{LeftResult, RightResult} = {mergesort(Left), mergesort(Right)},
	merge(LeftResult, RightResult, []).
	
merge([L|Ltail], [R|RTail], Acc) when L =< R ->
	merge(Ltail, [R|RTail], [L|Acc]);
merge([L|Ltail], [R|RTail], Acc) when L > R ->
	merge([L|Ltail], RTail, [R|Acc]);
merge([H|T],[], Acc) ->
	merge(T, [], [H|Acc]);
merge([], [H|T], Acc) ->
	merge(T, [], [H|Acc]);	
merge([], [], Acc)	->
	lists:reverse(Acc).
	
split([]) ->
	[];
split(List)	when length(List) =:= 1 ->
	List;
split(List) ->
	Mid = ceiling(length(List, 0) / 2),
	{Left,Right} = split([], List, Mid, 0),
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
length([_H|T], Acc) ->
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
	