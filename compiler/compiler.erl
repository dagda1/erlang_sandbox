-module(compiler).
-include_lib("eunit/include/eunit.hrl").
-export([compile/1]).

compile(_Text) ->
	?debugVal(_Text).