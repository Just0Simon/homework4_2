-module(lesson3_task3).
-export([split/2]).

split(Binary, Splitter) when is_binary(Binary) ->
    split(Binary, Splitter, erlang:byte_size(Splitter), <<>>, []).

split(<<>>, _Splitter, _ByteSize, Acc, Words) ->
    lists:reverse([Acc | Words]);

split(Binary, Splitter, ByteSize, Acc, Words) ->
    case byte_size(Binary) >= ByteSize of
        true ->
            <<PotentialSplitter:ByteSize/binary, Rest/binary>> = Binary,
            case PotentialSplitter of
                Splitter ->
                    split(Rest, Splitter, ByteSize, <<>>, [Acc | Words]);
                _ ->
                    <<Char:1/binary, CharRest/binary>> = Binary,
                    split(CharRest, Splitter, ByteSize, <<Acc/binary, Char/binary>>, Words)
            end;
        false ->
            lists:reverse([<<Acc/binary, Binary/binary>> | Words])
    end.