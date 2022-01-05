unit uBombaModel;

interface

uses
  System.SysUtils;

type
  TBomba = class
  private
    FID: Integer;
    FSTATUS: Integer;
    FID_TANQUE: Integer;
    FNOME: String;
    FNOMETANQUE: String;
    FIMPOSTO: Double;
    FVLR_LTS: Double;
  public
    property  ID:         Integer   read FID        write FID;
    property  NOME:       String    read FNOME      write FNOME;
    property  ID_TANQUE:  Integer   read FID_TANQUE write FID_TANQUE;
    property  STATUS:     Integer   read FSTATUS    write FSTATUS;
    property  NOMETANQUE: String    read FNOMETANQUE      write FNOMETANQUE;
    property  IMPOSTO:    Double    read FIMPOSTO      write FIMPOSTO;
    property  VLR_LTS:    Double    read FVLR_LTS      write FVLR_LTS;

  end;


implementation

{ TBomba }

end.
