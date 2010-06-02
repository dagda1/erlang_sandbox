-module(parser).
-include_lib("eunit/include/eunit.hrl").
-export([scan/1]).

scan(Text) ->
	scan(Text, [], 1, in_text).
	
scan([$(|T], Scanned, Column, in_text) ->
	scan(T, [{open_bracket, "(", Column}|Scanned], Column + 1, open_bracket);	
scan([$)|T], Scanned, Column, _State) ->	
	scan(T, [{close_bracket, ")", Column}| Scanned], Column + 1, _State);
scan([$+|T], Scanned, Column, on_number) -> 
	scan(T, [{on_plus, "+", Column}|Scanned], Column + 1, on_number);
scan([H|T], Scanned, Column, open_bracket) when ((H >= $0) and (H =< $9)) ->
	scan(T, [{on_number, H - 48, Column}|Scanned], Column + 1, on_number);
scan([H|T], Scanned, Column, on_number) when ((H >= $0) and (H =< $9)) -> 	
	scan(T, [{on_number, H - 48, Column}|Scanned], Column + 1, on_number);
scan([], Scanned, Column, _State) ->
	lists:reverse(lists:map(fun
								({Identifier, Character, _Pos}) ->
										?debugVal(Identifier),
										Character
							end, Scanned)).