unit loadandsave;

interface
const maxData = 1000;

type 

  arrayData = record
    neff:integer;
    end;

  astring = array[1..1000] of string; //menyimpan data sementara yang dipakai pada fungsi pecahString 

  tanggal = record
    DD, MM, YYYY : integer;
    end;

  Buku = record
    ID_Buku, Jumlah_Buku, Tahun_Penerbit : integer;
    Judul_Buku, Author : string;
    Kategori : string;
    end;
  arrBuku = record
    tab:array[1..maxData] of Buku;
    neff:integer;
    end;
  

  User = record
    Nama, Alamat, Username, Password : string;
    Role : string;
    end;
  arrUser = record
    tab:array[1..maxData] of User;
    neff:integer;
    end;


  History_Peminjaman = record
    Username : string;
    ID_Buku : integer;
    Tanggal_Peminjaman, Tanggal_Batas_Pengembalian : tanggal;
    Status_Pengembalian : boolean;
    end;
  arrPinjam = record
    tab:array[1..maxData] of History_Peminjaman;
    neff:integer;
    end;

  
  History_Pengembalian = record
    Username : string;
    ID_Buku : integer;
    Tanggal_Pengembalian : tanggal;
    end;
  arrKembali = record
    tab:array[1..maxData] of History_Pengembalian;
    neff:integer;
    end;


  Laporan_Buku_Hilang = record
    Username : string;
    ID_Buku_Hilang : integer;
    Tanggal_Laporan : tanggal;
    end;
  arrHilang = record
    tab:array[1..maxData] of Laporan_Buku_Hilang;
    neff:integer;
    end;


  procedure pecahString(line:string;splitBy:char;var destination:astring);//memisah suatu string berdasarkan splitBy (mirip fungsi split();)
  function IntToStr(bilangan:integer):String;//menghasilkan bentuk string dari suatu integer
  function saveValidation(kalimat:string):String;//menghasilkan data yang sudah sesuai dengan format .csv
  function load(namafile:string):arrayData;//memuat data dari suatu file dengan format .csv
  procedure save(namafile:string;data:arrayData);//menyimpan dari ke suatu file dengan format .csv
  procedure bacaTanggal(sTanggal:string;var tTanggal:tanggal);//mengubah tanggal dalam bentuk string menjadi bentuk tanggal(type bentukan)
  function gabungTanggal(t:tanggal):String;//mengembalikan tanggal yang dalam bentuk tanggal(type bentukan) menjadi bentuk string
  
  //handleXXXXX mengubah data mentah yang dibaca fungsi load(); menjadi data yang lebih mudah diolah
  procedure handleBuku(databuku:arrayData;var data:arrBuku);
  procedure handleUser(datauser:arrayData;var data:arrUser);
  procedure handlePinjam(datapinjam:arrayData;var data:arrPinjam);
  procedure handleKembali(dataKembali:arrayData;var data:arrKembali);
  procedure handleHilang(datahilang:arrayData;var data:arrHilang);

  //convertXXXXX mengubah data yang sudah diolah menjadi data yang mudah untuk disimpan
  function convertBuku(data:arrBuku):arrayData;
  function convertUser(data:arrUser):arrayData;
  function convertPinjam(data:arrPinjam):arrayData;
  function convertKembali(data:arrKembali):arrayData;
  function convertHilang(data:arrHilang):arrayData;

implementation

procedure pecahString(line:string;splitBy:char;var destination:astring);
var i,j:integer;buka:boolean;
begin
  j:=1;
  destination[j]:='';
  i:=0;
  buka:=false;
  repeat
      inc(i);
      if buka then //memisah data yang diapit tanda ("...")
        begin
          if line[i]='"' then 
            begin
                if line[i+1]='"' then 
                    begin
                    destination[j]:=destination[j]+line[i];
                    Inc(i);
                    end
                else
                    buka:=False; 
            end
          else
            destination[j]:=destination[j]+line[i];
        end
      else //memisah data yang tidak diapit tanda("...")
        begin
          if line[i]='"' then buka:=True 
          else if line[i]<>splitBy then 
            destination[j]:=destination[j]+line[i] else
            begin
              inc(j);
              destination[j]:='';
            end;
        end;
   until i=Length(line); 
end;

function IntToStr(bilangan:integer):String;
begin
    Str(bilangan,IntToStr);
end;

function saveValidation(kalimat:string):String;
var i:integer;ada:boolean;
begin
  ada:=false;
  saveValidation:=''; //mengapit data dengan tanda ("...") jika didalam data terdapat (,) atau (")
  for i:=1 to Length(kalimat) do
    begin
      if kalimat[i]='"' then saveValidation:=saveValidation+'"'; //menggandakan tanda (") 
      if (kalimat[i]='"') or (kalimat[i]=',') then ada:=true;
      saveValidation:=saveValidation+kalimat[i];
    end;
  if ada then saveValidation:='"'+saveValidation+'"';
end;

procedure bacaTanggal(sTanggal:string;var tTanggal:tanggal);
var temp:astring;
begin
    pecahString(sTanggal,'/',temp);
    val(temp[1],tTanggal.DD);
    val(temp[2],tTanggal.MM);
    val(temp[3],tTanggal.YYYY);
end;

function gabungTanggal(t:tanggal):String;
begin
  gabungTanggal:=IntToStr(t.DD)+'/'+IntToStr(t.MM)+'/'+IntToStr(t.YYYY);
end;

function load(namafile:string):arrayData;
const MaxElements = 100000;
var ch : string;
    inFile: TextFile;
    dat:arrayData;
    i:integer;
 begin
   Assign(inFile,namafile);
   Reset(inFile);  
   i := 1; 
   readln(inFile,ch); //menghilangkan row 1
   repeat
    readln(inFile, ch); //membaca setiap baris yang ada pada file
    dat.tab[i]:=ch;
    inc(i); 
   until eof(inFile);
   dat.neff:=i-1;
   load:=dat;
   Close(inFile);
end;

procedure save(namafile:string;data:arrayData);
var row1 : string;
    inFile: TextFile;
    i:integer;
begin
  Assign(infile,namafile);
  Reset(inFile);
  readln(inFile,row1); //membaca header file
  rewrite(infile);
  writeln(infile,row1); //menulis ulang header file
  for i:=1 to data.neff do writeln(infile,data.tab[i]); //menulis semua data
  close(inFile);
end;



procedure handleBuku(databuku:arrayData;var data:arrBuku);
    var i:integer;
        temp:astring;
    begin
    data.neff:=databuku.neff;
    for i:=1 to data.neff do
        begin
        pecahString(databuku.tab[i],',',temp);
        //masukkan data ke dalam variabel yang mudah diolah
        Val(temp[1],data.tab[i].ID_Buku);
        data.tab[i].Judul_Buku:=temp[2];
        data.tab[i].Author:=temp[3];
        Val(temp[4],data.tab[i].Jumlah_Buku);
        Val(temp[5],data.tab[i].Tahun_Penerbit);
        data.tab[i].kategori:=temp[6];
    end;
end;

procedure handleUser(datauser:arrayData;var data:arrUser);
    var i:integer;
        temp:astring;
    begin
    data.neff:=datauser.neff;
    for i:=1 to data.neff do
        begin
        pecahString(datauser.tab[i],',',temp);
        //masukkan data ke dalam variabel yang mudah diolah
        data.tab[i].Nama:=temp[1];
        data.tab[i].Alamat:=temp[2];
        data.tab[i].Username:=temp[3];
        data.tab[i].Password:=temp[4];
        data.tab[i].Role:=temp[5];
    end;
end;

procedure handlePinjam(datapinjam:arrayData;var data:arrPinjam);
    var i:integer;
        temp:astring;
    begin
    data.neff:=dataPinjam.neff;
    for i:=1 to data.neff do
        begin
        pecahString(datapinjam.tab[i],',',temp);
        //masukkan data ke dalam variabel yang mudah diolah
        data.tab[i].Username:=temp[1];
        Val(temp[2],data.tab[i].ID_Buku);
        bacaTanggal(temp[3],data.tab[i].Tanggal_Peminjaman);
        bacaTanggal(temp[4],data.tab[i].Tanggal_Batas_Pengembalian);
        data.tab[i].Status_Pengembalian:=(upcase(temp[5])='TRUE');
    end;
end;

procedure handleKembali(dataKembali:arrayData;var data:arrKembali);
    var i:integer;
        temp:astring;
    begin
    data.neff:=dataKembali.neff;
    for i:=1 to data.neff do
        begin
        pecahString(dataKembali.tab[i],',',temp);
        //masukkan data ke dalam variabel yang mudah diolah
        data.tab[i].Username:=temp[1];
        val(temp[2],data.tab[i].ID_Buku);
        bacaTanggal(temp[3],data.tab[i].Tanggal_Pengembalian);
    end;
end;

procedure handleHilang(datahilang:arrayData;var data:arrHilang);
    var i:integer;
        temp:astring;
    begin
    data.neff:=datahilang.neff;
    for i:=1 to data.neff do
        begin
        pecahString(datahilang.tab[i],',',temp);
        //masukkan data ke dalam variabel yang mudah diolah
        data.tab[i].Username:=temp[1];
        val(temp[2],data.tab[i].ID_Buku_Hilang);
        bacaTanggal(temp[3],data.tab[i].Tanggal_Laporan);
    end;
end;



function convertBuku(data:arrBuku):arrayData;
var i:integer;
begin
convertBuku.neff:=data.neff;
for i:=1 to data.neff do 
  //kembalikan data ke bentuk yang mudah disimpan ke dalam file
  convertBuku.tab[i]:=
        saveValidation(IntToStr(data.tab[i].ID_Buku))+','+
        saveValidation(data.tab[i].Judul_Buku)+','+
        saveValidation(data.tab[i].Author)+','+
        saveValidation(IntToStr(data.tab[i].Jumlah_Buku))+','+
        saveValidation(IntToStr(data.tab[i].Tahun_Penerbit))+','+
        saveValidation(data.tab[i].Kategori);
end;

function convertUser(data:arrUser):arrayData;
var i:integer;
begin
convertUser.neff:=data.neff;
for i:=1 to data.neff do 
  //kembalikan data ke bentuk yang mudah disimpan ke dalam file
  convertUser.tab[i]:=
        saveValidation(data.tab[i].Nama)+','+
        saveValidation(data.tab[i].Alamat)+','+
        saveValidation(data.tab[i].Username)+','+
        saveValidation(data.tab[i].Password)+','+
        saveValidation(data.tab[i].Role);
end;

function convertPinjam(data:arrPinjam):arrayData;
var i:integer;c:string;
begin
convertPinjam.neff:=data.neff;
for i:=1 to data.neff do 
if data.tab[i].Status_Pengembalian  then
  c:='True' //mengubah tipe data boolean menjadi string
else 
  c:='false';
  //kembalikan data ke bentuk yang mudah disimpan ke dalam file
  convertPinjam.tab[i]:=
        saveValidation(data.tab[i].Username)+','+
        saveValidation(IntToStr(data.tab[i].ID_Buku))+','+
        saveValidation(gabungTanggal(data.tab[i].Tanggal_Peminjaman))+','+
        saveValidation(gabungTanggal(data.tab[i].Tanggal_Batas_Pengembalian))+','+c;
end;

function convertKembali(data:arrKembali):arrayData;
var i:integer;
begin
convertKembali.neff:=data.neff;
for i:=1 to data.neff do 
  //kembalikan data ke bentuk yang mudah disimpan ke dalam file
  convertKembali.tab[i]:=
        saveValidation(data.tab[i].Username)+','+
        saveValidation(IntToStr(data.tab[i].ID_Buku))+','+
        saveValidation(gabungTanggal(data.tab[i].Tanggal_Pengembalian));
end;

function convertHilang(data:arrHilang):arrayData;
var i:integer;
begin
convertHilang.neff:=data.neff;
for i:=1 to data.neff do 
  //kembalikan data ke bentuk yang mudah disimpan ke dalam file
  convertHilang.tab[i]:=
        saveValidation(data.tab[i].Username)+','+
        saveValidation(IntToStr(data.tab[i].ID_Buku_Hilang))+','+
        saveValidation(gabungTanggal(data.tab[i].Tanggal_Laporan));
end;

end.