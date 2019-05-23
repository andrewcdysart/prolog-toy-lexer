:- use_module('syntax_definitions/words').
:- use_module('syntax_definitions/numbers').
:- use_module('syntax_definitions/operators').
:- use_module('syntax_definitions/punctuation').
:- use_module('syntax_definitions/identifiers').
:- use_module('syntax_definitions/strings').
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
