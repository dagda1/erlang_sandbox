-module(parser).
-include_lib("eunit/include/eunit.hrl").
-export([parse/1]).

parse(Text) ->
	{Ast, []} = expression(Text),
	Ast.
	
expression(Text) -> sum(Text).

sum(Text) -> 
	term(Text).
	
term(Text) ->
	{Ast, Txt1} = factor(Text),
	addops(Ast, Txt1).
	
factor([$(|Text]) ->
  {Ast, [$) | Txt1]} = sum(Text),                 
  {Ast, Txt1};
factor([H|T]) when ((H >= $0) and (H =< $9)) ->	
	{Number, Remaining} = get_number([H|T], []),
	{{num, list_to_integer(Number)},Remaining}.
	
addops(Ast,[]) -> {Ast, []};
addops(Ast,[$+|Text]) ->
	{Ast1, Txt1} = term(Text),
	Ast2 = {plus, Ast, Ast1},
	addops(Ast2, Txt1);
addops(Ast, Text) -> {Ast, Text}.
	
get_number([H|T], Acc) 	when ((H >= $0) and (H =< $9)) ->
	get_number(T, [H|Acc]);
get_number([H|T], Acc) ->
	{lists:reverse(Acc), [H|T]}.