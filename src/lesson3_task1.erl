-module(lesson3_task1).
-export([first_word/1]).

first_word(Binary) when is_binary(Binary) ->
    first_word(Binary, <<>>).

first_word(<<Char, Rest/binary>>, Acc) ->
    case Char of
        $\s ->
            Acc;
        _ ->
            first_word(Rest, <<Acc/binary, Char>>)
    end;
first_word(<<>>, Acc) ->
    Acc.