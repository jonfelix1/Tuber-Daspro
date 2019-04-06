program loadFileBuku;
uses Classes, SysUtils;

type
  Buku = record
    ID_Buku, Jumlah_Buku, Tahun_Penerbit : integer;
    Judul_Buku, Author : string;
    Kategori : string;
  end;

var s: string;
    ts: tStringList;
    inFile: Text;
    Number: string;
    data:array[1..10000] of Buku;
    index_data,id_data,len_data:integer;

begin

  Assign(inFile,'Buku.csv');
  Reset(inFile);
  index_data:=1;

  ts:=tStringList.Create;
  ts.StrictDelimiter:=True;

  // Handle the header
  ReadLn(inFile,s);                     // Read a line from input file
  ts.CommaText:=s;                      // Split it to lines
 
  // Handle the data
  while not eof(inFile) do
  begin
    ReadLn(inFile,s);
    ts.CommaText:=s;

    id_data:=1;
    for Number in ts do begin
      case id_data of
      1:data[index_data].ID_Buku:=StrToInt(Number);
      2:data[index_data].Judul_Buku:=Number;
      3:data[index_data].Author:=Number;
      4:data[index_data].Jumlah_Buku:=StrToInt(Number);
      5:data[index_data].Tahun_Penerbit:=StrToInt(Number);
      6:data[index_data].kategori:=Number;
      end;
      inc(id_data);
    end;
    len_data:=index_data;
    inc(index_data);
  end;

  Close(inFile);
  ts.Free;
end.
