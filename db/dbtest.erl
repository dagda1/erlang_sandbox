-module(dbtest).	
-include_lib("eunit/include/eunit.hrl").

db_new_test() ->
	Db = db:new(),
	?assertEqual([], Db).
	
db_write_test() ->
	Db = db:new(),
	Db1 = db:write(francesco, london, Db),
	?assertEqual([{francesco, london}], Db1).
	
db_write_many_test() ->
	Db = db:new(),
	Db1 = db:write(francesco, london, Db),
	Db2 = db:write(lelle, stockholm, Db1),
	Db3 = db:write(joern, stockholm, Db2),
	?assertEqual([{joern, stockholm}, {lelle, stockholm},{francesco, london}], Db3).
	
db_read_test() ->
	Db = db:new(),
	Db1 = db:write(francesco, london, Db),
	Db2 = db:write(lelle, stockholm, Db1),
	?assertEqual(london, db:read(francesco, Db2)).
	
db_no_read_test() ->
	Db = db:new(),
	Db1 = db:write(francesco, london, Db),
	Db2 = db:write(lelle, stockholm, Db1),		
	Db3 = db:write(joern, stockholm, Db2),		
	?assertEqual({error, instance}, db:read(ola, Db3)).
	
db_match_test() ->
	Db = db:new(),
	Db1 = db:write(francesco, london, Db),
	Db2 = db:write(lelle, stockholm, Db1),		
	Db3 = db:write(joern, stockholm, Db2),
	?assertEqual([joern, lelle], db:match(stockholm, Db3)).
	
db_delete_test() ->
	Db = db:new(),
	Db1 = db:write(francesco, london, Db),
	Db2 = db:write(lelle, stockholm, Db1),		
	Db3 = db:write(joern, stockholm, Db2),
	Db4 = db:delete(lelle, Db3),
	?assertEqual([joern], db:match(stockholm, Db4)).
		
		