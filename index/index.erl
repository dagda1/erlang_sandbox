-module (index).
-include_lib("eunit/include/eunit.hrl").
-export ([index/1]).
% lists:foldl(fun(X, Sum) -> X + Sum end, 0, [1,2,3,4,5]).

index(Filename) ->
    case file:open(Filename, read) of
        {ok, IoDevice} ->
            indexFile(IoDevice),
            file:close(IoDevice);
        {error, Reason} -> {error, Reason}
    end.

indexFile(IoDevice) ->
    RawDocument = loadRawDocument([], IoDevice),
    file:close(IoDevice),
    ok.

loadRawDocument(Lines, IoDevice) ->
    case file:read_line(IoDevice) of
        {ok, Line} -> loadRawDocument([Line|Lines], IoDevice);
        eof -> lists:reverse(Lines)
    end.

