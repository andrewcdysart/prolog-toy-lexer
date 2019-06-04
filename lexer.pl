/*
 * Provided under the MIT license.
 * See License.md for license details
 * Copyright (c) 2019 Andrew Dysart
 */

:- use_module(tokenizer).
:- use_module('fileio/filereader').

interpret(X) :- X = 'h', !,
   write_ln("l - Lex direct input"),
   write_ln("r - Read a file into the lexer"),
   write_ln("e - Exit the program"),
   go.
interpret(X) :- X = 'r', !,
   write("Filename: "),
   read(File),
   read_file(File,String),
   lex(String),
   go.
interpret(X) :- X = 'l', !,
   write_ln("Lexing Direct Input"),
   write("Input: "),
   read(Y),
   lex(Y),
   go.
interpret(X) :- X = 'e', !,
   write_ln("Bye!"),
   halt.
interpret(_) :-
   interpret('h'),
   go.

lex(X) :- string_chars(X,Chars),
   tokenize(Chars,T),write_ln(T).

go() :- current_prolog_flag(argv,[Arg|[]]), !,
   interpret(Arg).
go() :-
   write("Command: "),
   read(X),
   interpret(X).
