procedure load;
type
  Buku = record
    ID_Buku, Jumlah_Buku, Tahun_Penerbit : integer;
    Judul_Buku, Author : string;
    Kategori : string[sastra, sains, manga, sejarah,programming];
  end;

  var
    buku = array of Buku;
  begin

  end;
