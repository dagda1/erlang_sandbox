-module(parser).
-include_lib("eunit/include/eunit.hrl").
-export([scan/1]).

scan(Text) ->
	scan(Text, [], {0, 1}).	
scan([$(|T], Scanned, {Depth, Column}) ->
	scan(T, [{open_bracket, "(", {Depth + 1, Column}}|Scanned], {Depth + 1, Column + 1});	
scan([$)|T], Scanned, {Depth, Column}) ->	
	scan(T, [{close_bracket, ")", {Depth, Column}}| Scanned], {Depth - 1, Column + 1});
scan([$+|T], Scanned, {Depth, Column}) -> 
	scan(T, [{operator, "+", {Depth, Column}}|Scanned], {Depth, Column + 1});
scan([H|T], Scanned, {Depth, Column}) when ((H >= $0) and (H =< $9)) ->
	{Number, Remainder} = get_number([H|T], []),
	scan(Remainder, [{number, Number, {Depth, Column}}|Scanned], {Depth, Column + 1});
scan([], Scanned, {_Depth, _Column}) ->
	%?debugVal(Depth),
	lists:sort(fun
				({_LIdentifier, _LCharacter, {LDepth, LColumn}}, {_RIdentifier, _RCharacter, {RDepth, RColumn}})	->
					if
						(LColumn < RColumn) ->
							true;
						true ->
							false
					end														
	end, Scanned).
%	lists:reverse(lists:map(fun
%								({Identifier, Character, {_Depth, _Column}}) ->
%										%?debugVal(Identifier)
%										Character
%							end, Scanned)).
							
get_number([H|T], Acc) 	when ((H >= $0) and (H =< $9)) ->
	get_number(T, [H|Acc]);
get_number([H|T], Acc) ->
	{lists:reverse(Acc), [H|T]}.					