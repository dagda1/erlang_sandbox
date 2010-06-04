-module(parser).
-include_lib("eunit/include/eunit.hrl").
-export([parse/1]).

parse(Text) ->
	{Ast, []} = expression(Text),
	Ast.

expression(Text) -> 
	{Ast, Txt1} = term(Text),
	adds(Ast, Txt1).
	
term(Text) ->
	{Ast, Txt1} = operand(Text),
	muls(Ast, Txt1).
	
operand([$(|Text]) ->
  {Ast, [$) | Txt1]} = expression(Text),                 
  {Ast, Txt1};
operand([H|T]) when ((H >= $0) and (H =< $9)) ->	
	{Number, Remaining} = get_number([H|T], []),
	{{num, list_to_integer(Number)},Remaining}.
	
muls(Ast, []) -> {Ast, []};
muls(Ast, [$*|Txt]) ->    
  {Ast1, Txt1} = operand(Txt),
  Ast2 = {mul, Ast, Ast1},
  muls(Ast2, Txt1);
muls(Ast, [$/|Txt]) ->                         
  {Ast1, Txt1} = operand(Txt),
  Ast2 = {dvd, Ast, Ast1},
  muls(Ast2, Txt1);
muls(Ast, Txt) -> {Ast, Txt}.	
	
adds(Ast,[]) -> {Ast, []};
adds(Ast,[$+|Text]) ->
	{Ast1, Txt1} = term(Text),
	Ast2 = {plus, Ast, Ast1},
	adds(Ast2, Txt1);
adds(Ast,[$-|Text]) ->
	{Ast1, Txt1} = term(Text),
	Ast2 = {minus, Ast, Ast1},
	adds(Ast2, Txt1);	
adds(Ast, Text) -> {Ast, Text}.
	
get_number([H|T], Acc) 	when ((H >= $0) and (H =< $9)) ->
	get_number(T, [H|Acc]);
get_number([H|T], Acc) ->
	{lists:reverse(Acc), [H|T]}.