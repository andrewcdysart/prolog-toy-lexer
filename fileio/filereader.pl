/*
 * Provided under the MIT license.
 * See License.md for license details
 * Copyright (c) 2019 Andrew Dysart
 */

:- module('fileio/filereader',[read_file/1]).

:- use_module(library(pio)).
lines([]) --> call(eos), !.
lines([Line|Lines]) --> line(Line), lines(Lines).
eos([],[]).
line([]) --> ( "\n"; call(eos) ), !.
line([L|Ls]) --> [L], line(Ls).

read_file(F) :-
   phrase_from_file(lines(AllLines),F),
   transform_lines(AllLines,CombinedLines),
   string_chars(What,CombinedLines),
   interpret(What).