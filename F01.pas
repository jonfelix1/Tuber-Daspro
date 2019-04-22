{- Tugas Daspro F01-}
{- Kelompok 6 Kelas 01-}

procedure Registrasi (var x : arrUser)  ;
begin
	x.Neff := x.Neff + 1;
	write('Masukkan nama pengunjung');
	readln (x.Tab[x.Neff].nama);
	write('Masukkan alamat pengunjung');
	readln(x.Tab[x.Neff].alamat);
	write('Masukkan username pengunjung');
	readln(x.Tab[x.Neff].username);
	write('Masukkan password pengunjung');
	readln (x.Tab[x.Neff].password);
	
	writeln('Pengunjung ', x.Tab[x.Neff].nama, 'berhasil terdaftar sebagai user.');
end;

