%All arithemetic operations take place using the top two positions on the stack; one operand push and pop instructions are used to access
%memory; push a push b add. pop c
%pop_two(Stack) ->
%	[Alpha|[Bravo|Remain]] = Stack,
%	{Alpah, Bravo, Remain}.
%
%eval(["+"|Rest], Stack) ->
%	{Alpha, Bravo, Remain} = pop_two(Stack),
%   Sum = Alpha + Bravo,
%   eval(Rest, [Sum|Remain]).
-module (compilertests).
-include_lib("eunit/include/eunit.hrl").

simple_compiler_test() ->
	Ast = parser:parse("(12+3)"),
	Res = compiler:compile(Ast),
	?assertEqual(15, Res).
	
complex_compiler_test() ->
	Ast = parser:parse("((12+3)-4)"),
	Res = compiler:compile(Ast),
	?assertEqual(11, Res).

complex_multiply_compiler_test() ->
	Ast = parser:parse("((2*3)+(6/2))"),
	Res = compiler:compile(Ast),
	?assertEqual(9.0, Res).

