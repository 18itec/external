unit uDMTanques;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uTanqueModel, uConexao;

type
  TDMTanque = class(TDataModule)
    QrSearch: TFDQuery;
    QrInsert: TFDQuery;
    QrDelete: TFDQuery;
    QrEdit: TFDQuery;
    QrFK: TFDQuery;
  private
    { Private declarations }
  public
    function GetMaxID : Integer;
    procedure LoadCad(otanque: TTanque; NOME: String);
    procedure LoadCadID(otanque: TTanque; ID: Integer);
    function Insert(otanque: TTanque; out Erro: String):Boolean;
    function Edit(otanque: TTanque; out Erro: String):Boolean;
    function Delete(ID: Integer; out Erro: String):Boolean;
    procedure Loadall;
  end;

var
  DMTanque: TDMTanque;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMTanque }

function TDMTanque.Delete(ID: Integer; out Erro: String): Boolean;
begin
  with QrDelete do
    begin
     Params[0].AsInteger  := ID;

       try
         ExecSQL;
         Result := True;
       except
        on E: Exception do
          begin
            Erro  := 'Erro ao excluir a bomba' + sLineBreak + E.Message;
            Result := False;
          end;
       end;
    end;
end;

function TDMTanque.Edit(otanque: TTanque; out Erro: String): Boolean;
begin
  with QrEdit, otanque do
    begin
     Params[0].AsString   := NOME;
     Params[1].AsFloat    := LITROS_RECEBIDOS;
     Params[2].AsString   := COMBUSTIVEL;
     Params[3].AsString   := DATA_RECEB;
     Params[4].AsInteger  := STATUS;
     Params[5].AsInteger  := ID;
       try
         ExecSQL;
         Result := True;
       except
        on E: Exception do
          begin
            Erro  := 'Erro ao alterar a bomba' + sLineBreak + E.Message;
            Result := False;
          end;
       end;
    end;
end;


function TDMTanque.GetMaxID: Integer;
var
  QueryMax : TFDQuery;
begin
  QueryMax := TFDQuery.Create(nil);

  try
    with QueryMax do
      begin
        Connection := Controle.FConexao;
        SQL.Text := 'select coalesce(max(id),0) + 1 as idmax from TANQUES';
        Open;
      end;
    Result := QueryMax.FieldByName('idmax').AsInteger;
  finally
    FreeAndNil(QueryMax);
  end;

end;

function TDMTanque.Insert(otanque: TTanque; out Erro: String): Boolean;
begin
  with QrInsert, otanque do
    begin
     Params[0].AsInteger  := GetMaxID;
     Params[1].AsString   := NOME;
     Params[2].AsFloat    := LITROS_RECEBIDOS;
     Params[3].AsString   := COMBUSTIVEL;
     Params[4].AsString   := DATA_RECEB;
     Params[5].AsInteger  := STATUS;

       try
         ExecSQL;
         Result := True;
       except
        on E: Exception do
          begin
            Erro  := 'Erro ao cadastrar a bomba' + sLineBreak + E.Message;
            Result := False;
          end;
       end;
    end;
end;

procedure TDMTanque.Loadall;
begin
  QrSearch.Open;
end;

procedure TDMTanque.LoadCad(otanque: TTanque; NOME: String);
var
  QueryLoad : TFDQuery;
begin
  QueryLoad := TFDQuery.Create(nil);

  try
    with QueryLoad do
      begin
        Connection := Controle.FConexao;
        SQL.Text := 'select * from TANQUES where NOME LIKE ''%'+ NOME +'%''';
        Open;
      end;

    if not(QueryLoad.IsEmpty) then
      begin
        with otanque do
          begin
            ID                :=  QueryLoad.FieldByName('ID').AsInteger;
            COMBUSTIVEL       :=  QueryLoad.FieldByName('COMBUSTIVEL').AsString;
            NOME              :=  QueryLoad.FieldByName('NOME').AsString;
            STATUS            :=  QueryLoad.FieldByName('STATUS').AsInteger;
            DATA_RECEB        :=  QueryLoad.FieldByName('DATA_RECEB').AsString;
            LITROS_RECEBIDOS  :=  QueryLoad.FieldByName('LITROS_RECEBIDOS').AsFloat;
          end;
      end;

  finally
    FreeAndNil(QueryLoad);
  end;

end;

procedure TDMTanque.LoadCadID(otanque: TTanque; ID: Integer);
var
  QueryLoad : TFDQuery;
begin
  QueryLoad := TFDQuery.Create(nil);

  try
    with QueryLoad do
      begin
        Connection := Controle.FConexao;
        SQL.Text := 'select * from TANQUES where ID ='+ IntToStr(ID);
        Open;
      end;

    if not(QueryLoad.IsEmpty) then
      begin
        with otanque do
          begin
            ID                :=  QueryLoad.FieldByName('ID').AsInteger;
            NOME              :=  QueryLoad.FieldByName('NOME').AsString;
            STATUS            :=  QueryLoad.FieldByName('STATUS').AsInteger;
            LITROS_RECEBIDOS  :=  QueryLoad.FieldByName('LITROS_RECEBIDOS').AsFloat;
            COMBUSTIVEL       :=  QueryLoad.FieldByName('COMBUSTIVEL').AsString;
            DATA_RECEB        :=  QueryLoad.FieldByName('DATA_RECEB').AsString;
          end;
      end;

  finally
    FreeAndNil(QueryLoad);
  end;
end;

end.
