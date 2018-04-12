mySort(Assigns,BestAssigns):- penalGet(Assigns, Pens),
    sort(Pens,[H|PensSorted]),
    nth(BestInd,Assigns,[_,_,_,_,_,_,_,_,H]),
    nth(BestInd,Assigns,BestAssigns).


penalGet([],[]).
penalGet([H|Assigns],Pens):- drop(8,H,HPen),
    penalGet(Assigns,Mid),
    append(HPen,Mid,Pens).

