-module(db)	.
-include_lib("eunit/include/eunit.hrl").
-export([new/0,write/3,read/2,match/2,delete/2]).

new() ->
	[].
	
write(Key, Value, Database) ->
	Record = {Key, Value},
	[Record|Database].
		
read(Key, Database)	->
	find(Database, Key).

match(Key, Database) ->
	filter(Database, Key, []).
	
delete(Key, Database) ->
	remove(Database, Key, []).
	
remove([], Key, Acc) ->
	Acc;
remove([H|T], Key, Acc)	->
	if
		element(1, H) /= Key -> 			
			[H| remove(T, Key, Acc)];
		true  -> 
			remove(T, Key, Acc)
	end.	
	
filter([], Key, Acc)	->
	Acc;
filter([H|T], Key, Acc) ->
	if
		element(2, H) =:= Key -> 
			[element(1, H)| filter(T, Key, Acc)];
		true  -> filter(T, Key, Acc)
	end.	
			
find([], Key) ->
	{error, instance};
find([H|T], Key) ->
	if
		element(1, H) =:= Key -> 
			element(2, H);
		true  -> find(T, Key)
	end.	

	
	
		
	

	

	
	

	