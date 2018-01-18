% リスト操作

:- initialization(main, main).

% 先頭要素を取得する
car([Car|_], Car).

% 先頭の要素を除いた残りの要素のリストを取得する
cdr([_|Cdr], Cdr).

% リスト List の先頭に要素 Element を追加して新しいリストを作る
cons(Element, List, [Element | List]).

% リスト [Car | Cdr] の N 番目の要素を取得する
retrieve([Car|_], 1, Car).
retrieve([_|Cdr], N, X) :-　N > 1,　N1 is N - 1,　retrieve(Cdr, N1, X).

% nth0(?Index, ?List, ?Elem)
% Elem が リスト List の Index 番目の要素なら true。カウントは0から始まる。

% nth1(?Index, ?List, ?Elem)
% Elem がリスト List の Index 番目の要素なら true。カウントは1から始まる。

% nth0(?N, ?List, ?Elem, ?Rest)
% 指定した要素を取り出したり挿入したりする。
% Elemが Listの N 番目の要素で、Rectがその残りのリストなら true。

% nth1(?N, ?List, ?Elem, ?Rest)
% nth0と同様だが、カウントが1から始まる。

% main :- cons(1, [2], X), writeln(X). % => [1, 2]
% main :- loop(2, writeln(334)).       % => 334\n334
% main :- mul(2, 3, X), writeln(X),    % => 6
% 		mul(2, Y, 6), writeln(Y),      % => 3.0
% 		mul(Z, 3, 6), writeln(Z).      % => 2.0


% 節 Clause を指定した回数呼び出す
loop(1, Clause) :- Clause.
loop(N, Clause) :- N > 1, N1 is N - 1, Clause, loop(N1, Clause).

% 整数A, BはCである ( そのうち変数は1つまで許容 )
mul(A, B, C) :- var(C), integer(A), integer(B), C is A * B.
mul(A, B, C) :- var(A), integer(B), integer(C), A is C / float(B).
mul(A, B, C) :- var(B), integer(A), integer(C), B is C / float(A).

rule1(Clause1, Clause2) :- Clause1, Clause2.
rule2(Clause1, Clause2) :- Clause1, !, Clause2.

rule3 :- rule4(X), text_to_string(X, StrX),
		string_concat(" ", StrX, Output), writeln(Output).
rule4(a).
rule4(b).

main :- writeln("rule1: "), not(rule1(rule3, false)),
		writeln("rule2: "), not(rule2(rule3, false)).

