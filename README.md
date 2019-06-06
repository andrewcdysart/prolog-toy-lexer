# Andrew's Experimental Lexer

## Purpose

To explore the concept of lexers, as well as the Prolog language,
by building my own syntax.

## Installation and Usage

The codebase is written using [SWI Prolog][SWI Site], a free Prolog
implementation. The main module is [*lexer.pl*][lexer]. Compilation
is performed using clang. Makefiles assume that LLVM is installed at
C:/LLVM and that the 64-bit version of SWI Prolog is installed at the
default location. In the future, these paths will be handled with
environment variables.

Once compilation is completed, *lexer.exe* may be found in build/image.
It should be passed a filename, which will then be processed. The file
*test.txt* shows examples of parseable input!

## Background

I was reading [Faiçal Tchirou's excellent tutorial][LexicalAnalysis]
on lexical analysis a couple of days after beginning my foray into
Prolog. During his breakdown of finite state machines in the lexing
process, it occurred to me that Prolog would be an ideal choice for
defining language rules. Due to its fact-based and relation-based
design, I have been able to implement some of Tchirou's rules with
(to my mind) less friction than I might have encountered using an
imperative language.

Ultimately, I'd love to use Prolog's powerful grammar to build more
advanced parsers to assist in my work, be it transforming data or
building [fun apps for my friends][UESRPGCharGen].

## License

This project is licensed under the MIT license. You can read the full
license [here][MIT License].

[SWI Site]: https://swi-prolog.org
[lexer]: https://github.com/andrewcdysart/prolog-toy-lexer/blob/master/lexer.pl
[LexicalAnalysis]: https://hackernoon.com/lexical-analysis-861b8bfe4cb0
[UESRPGCharGen]: https://github.com/andrewcdysart/UESRPGCharGen
[MIT License]: https://github.com/andrewcdysart/prolog-toy-lexer/blob/master/License.md
