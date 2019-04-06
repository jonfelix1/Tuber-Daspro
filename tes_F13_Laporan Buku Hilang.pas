procedure load;
type
  Laporan_Buku_Hilang = record
    Username : string;
    ID_Buku : integer;
    Tanggal_Laporan : tanggal;
  end;

  tanggal = record
    DD, MM, YYYY : integer;
  end;

  var
  laporan_Buku_Hilang = array of Laporan_Buku_Hilang;
  begin

  end;
