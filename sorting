program test;
uses sysutils;
var
    nr, i : Integer;
    strings: array [0..100] of string;
    tmp,tmp2,tmp3 : string;
begin
    write('n : ');
    readln(nr); //max 100 
    for i:=0 to nr - 1 do
        begin
        str(i,tmp3);
        write('String['+tmp3+'] = ');
        ReadLn(strings[i]);
    end;

//sorting part

    i:=0;
    repeat
        tmp:=UpperCase(strings[i]);
        tmp2:=UpperCase(strings[i+1]);
        if tmp > tmp2 then
            begin
            tmp:=strings[i];
            strings[i]:=strings[i+1];
            strings[i+1]:=tmp;
            i:=-1;
            end;
        i += 1;
    until i=nr -1 ;

//out

    for i:=0 to nr - 1 do
    begin
        WriteLn(strings[i]);
    end;
    Readln;
end.
