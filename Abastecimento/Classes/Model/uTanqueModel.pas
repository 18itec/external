unit uTanqueModel;

interface

uses
  System.SysUtils;

type
  TTanque = class
  private
    FID: Integer;
    FSTATUS: Integer;
    FDATA_RECEB: String;
    FLITROS_RECEBIDOS: Double;
    FNOME: String;
    FCOMBUSTIVEL: String;
  public
    property  ID:                 Integer   read FID                write FID;
    property  NOME:               String    read FNOME              write FNOME;
    property  COMBUSTIVEL:        String    read FCOMBUSTIVEL       write FCOMBUSTIVEL;
    property  STATUS:             Integer   read FSTATUS            write FSTATUS;
    property  DATA_RECEB:         String    read FDATA_RECEB        write FDATA_RECEB;
    property  LITROS_RECEBIDOS:   Double    read FLITROS_RECEBIDOS  write FLITROS_RECEBIDOS;
  end;

implementation

end.
