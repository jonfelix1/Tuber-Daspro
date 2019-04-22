procedure load;
type
  History_Pengembalian = record
    Username : string;
    ID_Buku : integer;
    Tanggal_Pengembalian : tanggal;
  end;

  tanggal = record
    DD, MM, YYYY : integer;
  end;

  var
    history_Pengembalian = array of History_Pengembalian;
  begin

  end;
