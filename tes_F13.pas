procedure load;
type
  Buku = record
    ID_Buku, Jumlah_Buku, Tahun_Penerbit : integer;
    Judul_Buku, Author : string;
    Kategori : string[sastra, sains, manga, sejarah,programming];
  end;

  User = record
    Nama, Alamat, Username, Password : string;
    Role : string[Pengunjung, Admin];
  end;

  History_Peminjaman = record
    Username
    ID_Buku
    Tanggal_Peminjaman
    Tanggal_Batas_Pengembalian
    Status_Pengembalian
  History_Peminjaman
    Username
    ID_Buku
    Tanggal_Pengembalian
  Tanggal = record

var
  buku = array of Buku;
begin

end;
