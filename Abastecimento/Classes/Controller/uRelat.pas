unit uRelat;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMRelat = class(TDataModule)
    QrRelat: TFDQuery;
    QrFKTanque: TFDQuery;
    QrFKBombas: TFDQuery;
    DSMaster: TDataSource;
  private
  public
    procedure GetFkBombas;
    procedure GetFkTanque;
    procedure LoadRelat(ID_BOMBA,ID_TANQUE,DT_INI,DT_FIM : String; periodo,bomba,tanque: Boolean);
  end;

var
  DMRelat: TDMRelat;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMRelat }

procedure TDMRelat.GetFkBombas;
begin
  QrFKBombas.Open;
end;

procedure TDMRelat.GetFkTanque;
begin
  QrFKTanque.Open;
end;

procedure TDMRelat.LoadRelat(ID_BOMBA, ID_TANQUE, DT_INI, DT_FIM: String;
  periodo, bomba, tanque: Boolean);
begin
  with QrRelat do
    begin
       try
          Close;
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add(' ab.* ');
          SQL.Add(' ,bb.nome as bomba ');
          SQL.Add(' ,tq.nome as tanque ');
          SQL.Add(' ,bb.vlr_lts ');
          SQL.Add(' ,(bb.vlr_lts * ab.qtd_litros) as totb ');
          SQL.Add(' from abastecimentos ab ');
          SQL.Add(' join bombas bb on (bb.id = ab.id_bomba) ');
          SQL.Add(' join tanques tq on (tq.id = bb.id_tanque) ');
          SQL.Add('where ');
          SQL.Add(' (bb.nome <>  '''')');

          //periodo
          if periodo then
            begin
              SQL.Add(' and ( ab.data Between cast(:pdtini as date) And cast(:pdtfin as date) ) ');
              ParamByName('pdtini').AsString := DT_INI;
              ParamByName('pdtfin').AsString := DT_FIM;
            end;

          //Bomba
          if bomba then
            begin
              SQL.Add(' and (bb.id =:pbomba) ');
              ParamByName('pbomba').AsString := ID_BOMBA;
            end;

          //Tanque
          if tanque then
            begin
              SQL.Add(' and (tq.id =:pTanque)');
              ParamByName('pTanque').AsString := ID_TANQUE;
            end;

          Open;
       except
        on E: Exception do
          begin
            raise Exception.Create('Erro ao executar o processo');
          end;
       end;
    end;
end;

end.
