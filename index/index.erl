-module (index).
-include_lib("eunit/include/eunit.hrl").
-export ([index/1]).

index(Filename) ->
    case file:open(Filename, read) of
        {ok, IoDevice} ->
            indexFile(IoDevice),
            file:close(IoDevice);
        {error, Reason} -> 
			?debugVal(Reason),
			{error, Reason}
    end.

indexFile(IoDevice) ->
    RawDocument = loadRawDocument([], IoDevice, 1),
	?debugVal(RawDocument),
    file:close(IoDevice),
    ok,
	printDocument(RawDocument).
	
printDocument(Document) ->
	?debugVal(Document).

loadRawDocument(Index, IoDevice, LineNumber) ->
    case file:read_line(IoDevice) of
        {ok, Line} -> 
			NewIndex = parseLine(Line, LineNumber, Index),
			loadRawDocument(NewIndex, IoDevice, LineNumber + 1);
        eof -> lists:reverse(Index)
    end.

parseLine(Line, LineNumber, Index) ->
	OneLine = lists:reverse(string:tokens(Line, "\r\n\t {,}->:;[]().|\\=/ ?")),
	updateIndex(OneLine, LineNumber, Index).
	
updateIndex([], _LineNumber, Index) ->
	Index;
updateIndex([H|T], LineNumber, Index) ->
	CurrenyKey = string:to_lower(H),
	Value = case lists:keyfind(CurrenyKey, 1, Index) of
				false ->
					[];
				{_Y, Found} ->
					Found
				end,
	NewIndex = lists:keystore(CurrenyKey, 1, Index, {CurrenyKey, lists:sort([LineNumber|Value])}),
	updateIndex(T, LineNumber, NewIndex).

