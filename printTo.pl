myWrite(Code,_,_):- Code =1.

myWrite(Code,Data,FileName):- Code=0,
    dataToText(Data,DataText),
    myPrint(DataText,FileName),
    abort.

myWrite(Code,_,FileName):- Code= -1,
    myPrint('Error while parsing input file',FileName),nl,
    abort.

myWrite(Code,_,FileName):- Code= -2,
    myPrint('invalid machine/task',FileName),nl,
    abort.

myWrite(Code,_,FileName):- Code= -3,
    myPrint('invalid task',FileName),nl,
    abort.

myWrite(Code,_,FileName):- Code= -4,
    myPrint('invalid penalty',FileName),nl,
    abort.

myWrite(Code,_,FileName):- Code= -5,
    myPrint('machine penalty error',FileName),nl,
    abort.

myWrite(Code,_,FileName):- Code= -6,
    myPrint('partial assignment error',FileName),nl,
    abort.

myWrite(Code,_,FileName):- Code= -7,
    myPrint('No valid solution possible!',FileName),nl,
    abort.



myPrint(Msg,FileName):- open(FileName,write,Str),
    write(Str,Msg),
    close(Str).


dataToText([A,B,C,D,E,F,G,H,PenDub],OutText):- 
    numToAtom(A,Anum),
    numToAtom(B,Bnum),
    numToAtom(C,Cnum),
    numToAtom(D,Dnum),
    numToAtom(E,Enum),
    numToAtom(F,Fnum),
    numToAtom(G,Gnum),
    numToAtom(H,Hnum),

    Pen is round(PenDub),

    number_atom(Pen,PenText),

    atom_concat('Solution',Anum,Mid1),
    atom_concat(Mid1,Bnum,Mid2),
    atom_concat(Mid2,Cnum,Mid3),
    atom_concat(Mid3,Dnum,Mid4),
    atom_concat(Mid4,Enum,Mid5),
    atom_concat(Mid5,Fnum,Mid6),
    atom_concat(Mid6,Gnum,Mid7),
    atom_concat(Mid7,Hnum,Mid8),
    atom_concat(Mid8,'; Quality: ',Mid9),
    atom_concat(Mid9, PenText, OutText).
    


%'Solution A B C D E H G F; Quality: 45'

numToAtom(1,' A').
numToAtom(2,' B').
numToAtom(3,' C').
numToAtom(4,' D').
numToAtom(5,' E').
numToAtom(6,' F').
numToAtom(7,' G').
numToAtom(8,' H').
