%Instead of copy/pasting a chunk of text into erl every time I wanted to test it, I made the indexer load a file from disk. 
%I also aligned the line numbers, having them all start on the same column made a big difference visually.œ
-module (indextests).
-include_lib("eunit/include/eunit.hrl").

should_index_one_line_test() ->
	index:index("text.txt").

