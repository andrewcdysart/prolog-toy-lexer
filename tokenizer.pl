:- module(tokenizer,[tokenize/2]).
:- use_module('syntax_definitions/whitespace').

next_token([],[],[]).                        % Whitespace at the end of a file results in no token being found
next_token(X,Token,RestOfChars) :-           % Attempt to identify the next token, giving back unconsumed characters
   id_number(X,Token,RestOfChars), !;
   id_identifier(X,Token,RestOfChars), !;
   id_operator(X,Token,RestOfChars), !;
   [NextChar|OtherChars]=X,                  % Whitespace is skipped (unless it matches a previous token).
   whitespace(NextChar),
   next_token(OtherChars,Token,RestOfChars).
tokenize([],[]).
tokenize([],_).
tokenize(X,Tokens) :-                        % Attempt to tokenize the entire input
   next_token(X,Token,RestOfChars),
   Token \= [], !,                           % This predicate handles valid tokens (non-whitespace)
   tokenize(RestOfChars,OtherTokens),
   Tokens=[Token|OtherTokens].
tokenize(X,Tokens) :-
   next_token(X,_,RestOfChars), !,           % This predicate handles empty tokens by not adding them to the list
   tokenize(RestOfChars,OtherTokens),
   Tokens=OtherTokens.