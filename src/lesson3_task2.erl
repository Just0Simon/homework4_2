-module(lesson3_task2).
-export([words/1]).

words(Binary) when is_binary(Binary) ->
    words(Binary, <<>>, []).

words(<<>>, Acc, Words) ->
    lists:reverse([Acc|Words]);
words(<<$\s, Rest/binary>>, <<>>, Words) -> % if char is space and Acc is empty
    words(Rest, <<>>, Words);
words(<<$\s, Rest/binary>>, Acc, Words) -> % if char is space and Acc has symblos
    words(Rest, <<>>, [Acc|Words]);
words(<<Char, Rest/binary>>, Acc, Words) -> % if char is not space -> Accumulate char
    words(Rest, <<Acc/binary,Char>>, Words).