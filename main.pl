:- initialization(main).

main:-
    argument_value(1,InputFile),
	argument_value(2,OutputFile),

    

    open(InputFile,read,Str),
    get_code(Str,Char), %%Char is first character of file
    checkCharAndReadRest(Char,Chars,Str), %%Chars is all characters of file as list of ints (ASCII)
    close(Str),
	
	splitTheText(Chars,ListOfList),
	
    getData(ListOfList,X,Rem0,Err0),
    myWrite(Err0,_,OutputFile),
    
	getData(Rem0,ForceAssig,Rem1,Err1),
    myWrite(Err1,_,OutputFile),

	getData(Rem1,Forbid,Rem2,Err2),
	myWrite(Err2,_,OutputFile),

	getData(Rem2,TooNear,Rem3,Err3),
	myWrite(Err3,_,OutputFile),

	getData(Rem3,MachPen,Rem4,Err4),
	myWrite(Err4,_,OutputFile),

	getData(Rem4,TooPen,Emp,Err5),
    myWrite(Err5,_,OutputFile),

	assigsWithZero([1,2,3,4,5,6,7,8],Assigns),

	
	loopRemoveNonForced(Assigns,ForceAssig,Assigns1),
	(length(Assigns1,0) *-> myWrite(-6,_,OutputFile); (loopRemoveTask(Assigns1,Forbid,Assigns2),

	loopRemoveClose(Assigns2,TooNear,Assigns3),

    loopTaskPenal(Assigns3,MachPen,Assigns4),

	loopClosePenal(Assigns4,TooPen,Assigns5),

	(length(Assigns5,0) *-> myWrite(-7,_,OutputFile); (mySort(Assigns5,AssignFin),

	myWrite(0,AssignFin,OutputFile))))).

    