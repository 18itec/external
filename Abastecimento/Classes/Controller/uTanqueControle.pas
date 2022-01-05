unit uTanqueControle;

interface

uses
  System.SysUtils, uTanqueModel, uDMTanques;

type
  TTanqueControle = class
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadRegistro(otanque: TTanque; NOME: String);
    procedure LoadRegistroID(otanque: TTanque; ID: Integer);
    function Insert(otanque: TTanque; var Erro:String): Boolean;
    function Edit(otanque: TTanque; var Erro:String): Boolean;
    function Delete(ID: integer; var Erro:String): Boolean;
  end;

implementation

{ TBombaControle }

constructor TTanqueControle.Create;
begin
  uDMTanques.DMTanque := TDMTanque.Create(nil);
end;

function TTanqueControle.Delete(ID: integer; var Erro: String): Boolean;
begin
  Result  := uDMTanques.DMTanque.Delete(ID,Erro);
end;

destructor TTanqueControle.Destroy;
begin
  FreeAndNil(uDMTanques.DMTanque);
  inherited;
end;

function TTanqueControle.Edit(otanque: TTanque; var Erro: String): Boolean;
begin
  Result  := uDMTanques.DMTanque.Edit(otanque,Erro);
end;

function TTanqueControle.Insert(otanque: TTanque; var Erro: String): Boolean;
begin
  Result  := uDMTanques.DMTanque.Insert(otanque,Erro);
end;

procedure TTanqueControle.LoadRegistro(otanque: TTanque; NOME: String);
begin
  uDMTanques.DMTanque.LoadCad(otanque,NOME);
end;

procedure TTanqueControle.LoadRegistroID(otanque: TTanque; ID: Integer);
begin
  uDMTanques.DMTanque.LoadCadID(otanque,ID);
end;

end.
