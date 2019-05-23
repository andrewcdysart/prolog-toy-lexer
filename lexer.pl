/*
 * Provided under the MIT license.
 * See License.md for license details
 * Copyright (c) 2019 Andrew Dysart
 */

:- use_module(tokenizer).
:- use_module('fileio/filereader').

interpret(X) :- string_chars(X,Chars),
   tokenize(Chars,T),write_ln(T).

transform_lines([X|[]],StringLines) :-
   StringLines=X.
transform_lines([X|OtherLines],StringLines) :-
   atom_codes('\n',NlCode),
   append(X,NlCode,Line),
   transform_lines(OtherLines,Lines),
   append(Line,Lines,StringLines).

go() :- current_prolog_flag(argv,[Arg|[]]), !,
   interpret(Arg).
go() :-
   write("Command: "),
   read(X),
   interpret(X).
