unit B01_unit;

interface

function crypttool(var input: string): string;

implementation

function crypttool(var input: string): string;
    const
        key = 'Nakano_Miku_is_the_best_girl____hcnslwhqefwruyzcwjcsnypcspumdrxspjwyyxowanfzeinmhqykkrjfmeftwsnqvoqmlkxjtjzavrkzyxrdhvdiumdhszhegoehdjbrsnauvlpezbzrawxisgfeyrzpjqtxdnlvzjabexeskzjkxjldxfrxyimzcvyaozhbzyuifcjfnzischttbumxwhlzunamfwwigaznsjxeayosxdwsbeqjyce';
    var
        i, len: integer;
        result : string;
    begin
        len := length(input);
        if length(input) > length(key) then
            len := length(key);
        setlength(result, len);
        for i := 1 to len do
            result[i] := chr(ord(input[i]) xor ord(key[i]));
            crypttool := result;
    end;

end.