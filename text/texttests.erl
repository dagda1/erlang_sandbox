-module(texttests).	
-include_lib("eunit/include/eunit.hrl").

text_test() ->
	?assertEqual(true, textparser:parse("Text")).