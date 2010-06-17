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
    file:close(IoDevice),
    ok.

loadRawDocument(Lines, IoDevice, LineNumber) ->
    case file:read_line(IoDevice) of
        {ok, Line} -> 
			A = parseLine(Line, LineNumber),
			loadRawDocument([Line|Lines], IoDevice, LineNumber + 1);
        eof -> lists:reverse(Lines)
    end.

parseLine(Line, LineNumber) ->
	OneLine = string:tokens(Line, "\r\n\t {,}->:;[]().|\\=/ ?"),
	Acc = lists:foldr(fun(Word, List) -> 
	CurrenyKey = string:to_lower(Word),
	Value = case lists:keyfind(CurrenyKey, 1, List) of
				false ->
					[];
				{_Y, Found} ->
					?debugVal(_Y),
					?debugVal(Found),
					Found
			end,
			?debugVal(Value),
			NewList = lists:keystore(CurrenyKey, 1, List, {CurrenyKey, [1|Value]}),
			?debugVal(NewList),
			NewList
		end, "", OneLine),
		Acc.

