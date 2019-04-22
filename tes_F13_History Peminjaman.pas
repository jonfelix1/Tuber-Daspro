procedure load;
type
  History_Peminjaman = record
    Username : string;
    ID_Buku : integer;
    Tanggal_Peminjaman, Tanggal_Batas_Pengembalian : tanggal;
    Status_Pengembalian : bool;
  end;

  tanggal = record
    DD, MM, YYYY : integer;
  end;

  var
    history_Peminjaman = array of History_Peminjaman;
  begin

  end;
