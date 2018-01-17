% リスト操作

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

