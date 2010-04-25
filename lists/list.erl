-module(list).
-include_lib("eunit/include/eunit.hrl").
-export([reverse/1,filter/2,concat/1]).

filter(L, Index) ->
	filter(L, [], 0, Index).
	
filter(T, Acc, Current, Current)	->
	reverse(Acc);
filter([H|T], Acc, Current, Index) ->
	filter(T, [H|Acc], Current + 1, Index).

reverse(L) -> 
	reverse(L,[]).
	
reverse([],Acc) -> 
	Acc;
reverse([H|T],Acc) -> 
	reverse(T, [H|Acc]).
	
concat(L) ->
	concat(L, []).
	
concat([], Acc)	->
	Acc;
concat([H|T], Acc) ->
	concat(T, merge(H,Acc)).
	
merge([],Acc) ->
	reverse(Acc);
merge([H|T],Acc) ->
	merge(T, [H|Acc]).
	
	