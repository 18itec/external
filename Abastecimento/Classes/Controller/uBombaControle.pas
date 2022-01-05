unit uBombaControle;

interface

uses
  uBombaModel, uDMBomba, System.SysUtils;

type
  TBombaControle = class
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadRegistro(obomba: TBomba; NOME: String);
    procedure LoadRegistroID(obomba: TBomba; ID: Integer);
    function Insert(oBomba: TBomba; var Erro:String): Boolean;
    function Edit(oBomba: TBomba; var Erro:String): Boolean;
    function Delete(ID: integer; var Erro:String): Boolean;
  end;

implementation

{ TBombaControle }

constructor TBombaControle.Create;
begin
  uDMBomba.DMBomba := TDMBomba.Create(nil);
end;

function TBombaControle.Delete(ID: integer; var Erro: String): Boolean;
begin
  Result  := uDMBomba.DMBomba.Delete(ID,Erro);
end;

destructor TBombaControle.Destroy;
begin
  FreeAndNil(uDMBomba.DMBomba);
  inherited;
end;

function TBombaControle.Edit(oBomba: TBomba; var Erro: String): Boolean;
begin
  Result  := uDMBomba.DMBomba.Edit(oBomba,Erro);
end;

function TBombaControle.Insert(oBomba: TBomba; var Erro: String): Boolean;
begin
  Result  := uDMBomba.DMBomba.Insert(oBomba,Erro);
end;

procedure TBombaControle.LoadRegistro(obomba: TBomba; NOME: String);
begin
  uDMBomba.DMBomba.LoadCad(obomba,NOME);
end;

procedure TBombaControle.LoadRegistroID(obomba: TBomba; ID: Integer);
begin
  uDMBomba.DMBomba.LoadCadID(obomba,ID);
end;

end.
