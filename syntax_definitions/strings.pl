/*
 * Provided under the MIT license.
 * See License.md for license details
 * Copyright (c) 2019 Andrew Dysart
 */

:- module('syntax_definitions/strings',[is_string/1]).

is_string_innerchar(X) :- letter(X), !; punctuation(X), !; digit(X), !; space(X).
is_string([X|[]]) :- !, quote(X).                        % Strings must end in a quote.
is_string([X|RestOfChars]) :-
   !, is_string_innerchar(X),
   is_string(RestOfChars).
is_string(X) :- string_chars(X,[FirstChar|RestOfChars]), % Strings must begin in a quote.
   !, quote(FirstChar),
   is_string(RestOfChars).