--@Autores: Jorge Cárdenas Cárdenas
--          Samuel Arturo Garrido Sánchez
--@Fecha creación: 03/02/2021
--@Descripción: Función para convertir datos blob

create or replace function dbst_load_a_file(
  p_file_name in varchar2
) return blob
as
    v_clob    blob;
    v_bfile   bfile;
    v_dst_offset  number := 1;
    v_src_offset  number := 1;
begin
    v_bfile := bfilename('BLOB_DIR', p_file_name);
    dbms_lob.open(v_bfile, dbms_lob.lob_readonly);
    dbms_lob.createtemporary(v_clob, true);
    dbms_lob.loadblobfromfile(
      dest_lob    => v_clob,
      src_bfile   => v_bfile,
      amount      => dbms_lob.getlength(v_bfile),
      dest_offset => v_dst_offset,
      src_offset  => v_src_offset
    );
    dbms_lob.fileclose( v_bfile );
    return v_clob;
end;
/
show errors;


