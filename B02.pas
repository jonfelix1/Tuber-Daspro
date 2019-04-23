unit B02;
interface

procedure denda(var tanggal1, tanggal2: tanggal);

implementation

procedure denda(var tanggal_pinjam, tanggal_kembali: tanggal);
//Kamus Lokal
  var
    temp_dd, temp_mm, temp_yyyy, selisih_day, denda : integer;

  //Algoritma
  begin
    selisih_day := 0;
    repeat
      begin
        temp_dd := temp_dd + 1;

        if  ((temp_mm = 1) or
            (temp_mm = 3) or
            (temp_mm = 5) or
            (temp_mm = 7) or
            (temp_mm = 8) or
            (temp_mm = 10) or
            (temp_mm = 12)) and
            (temp_dd > 31) then
                begin
                temp_mm += 1;
                temp_dd -= 31;
                if temp_mm = 13 then
                    begin
                    temp_mm := 1;
                    temp_yyyy += 1;
                    end;
                end


        else if temp_mm = 2 then
            begin
            if (temp_yyyy mod 400 = 0) and (temp_dd > 29) then
                begin
                temp_dd -= 29;
                temp_mm += 1;
                end
            else if (temp_yyyy mod 100 > 0) and (temp_yyyy mod 4 = 0) and (temp_dd > 29) then
                begin
                temp_dd -= 29;
                temp_mm += 1;
                end
            else if temp_dd > 28 then
                begin
                temp_dd -= 28;
                temp_mm += 1;
                end;
            end

        else if (temp_dd > 30) then
            begin
            temp_dd -= 30;
            temp_mm += 1;
            end;
      end;
    until (temp_dd = tanggal_kembali.DD and temp_mm = tanggal_kembali.MM and temp_yyyy = tanggal_kembali.YYYY);
    denda := selisih_day*2000;
  end;
