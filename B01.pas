program B01;

var
    s, a : string;

function crypttool(var input: string): string;
    const
        key = 'Nakano_Miku_is_the_best_girl';
    var
        i, len: integer;
        result : string;
    begin
        len := length(input);
        if len > length(key) then
            len := Length(key);
        SetLength(result, len);
        for i := 1 to len do
            result[i] := chr(ord(input[i]) xor ord(key[i]));
            crypttool := result
    end;
     
begin
s := 'akucintakamu';
writeln(s);
writeln(crypttool(s));
a := crypttool(s);
writeln(crypttool(a));
end.
