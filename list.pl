% リスト操作

% 先頭要素を取得する
car([Car | Cdr], Car).

% 先頭の要素を除いた残りの要素のリストを取得する
cdr([Car | Cdr], Cdr).

% リスト List の先頭に要素 Element を追加して新しいリストを作る
cons(Element, List, [Element | List]).

% リスト [Car | Cdr] の N 番目の要素を取得する
retrieve([Car | Cdr], 1, Car).
retrieve([Car | Cdr], N, X) :-　N > 1,　N1 is N - 1,　retrieve(Cdr, N1, X).
