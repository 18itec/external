unit uViewAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.UITypes,
  uDMAbastece, uConexao;

type
  TfAbastecimento = class(TForm)
    Label1: TLabel;
    CBBomba: TComboBox;
    EdtLitros: TLabeledEdit;
    Label2: TLabel;
    LblVlrLit: TLabel;
    LblVlrImposto: TLabel;
    Label5: TLabel;
    LblPercent: TLabel;
    Label7: TLabel;
    BtnAbast: TSpeedButton;
    PnlTot: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    PnlImposto: TPanel;
    function GetMaxID : Integer;
    procedure FormShow(Sender: TObject);
    procedure GetBombas;
    procedure CBBombaClick(Sender: TObject);
    procedure GetDet(ID: Integer);
    procedure EdtLitrosKeyPress(Sender: TObject; var Key: Char);
    procedure CalcTot(Lts: Double);
    procedure EdtLitrosChange(Sender: TObject);
    procedure insert;
    procedure Finali;
    procedure BtnAbastClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAbastecimento: TfAbastecimento;
  ID_BOMBA : Integer;
  Vlr_Litro, Percent, Vlr_imposto, Vlr_Total, TotImposto, Qtd_lts : double;

implementation

{$R *.dfm}

procedure TfAbastecimento.BtnAbastClick(Sender: TObject);
begin
  if Vlr_Total > 0 then
    begin
      insert;
    end
  else
    begin
      raise Exception.Create('Informe quantos litros deseja abastecer');
    end;
end;

procedure TfAbastecimento.CalcTot(Lts: Double);
begin
  Vlr_Total :=0;
  if Lts > 0 then
    begin
      Qtd_lts := Lts;
      Vlr_Total := Vlr_Litro * Lts;
      TotImposto :=  (Percent/100) * Vlr_Total;
    end;

  if Vlr_Total > 0 then
    begin
      PnlTot.Caption      := formatfloat('0.##', Vlr_Total);
      PnlImposto.Caption  := formatfloat('0.##', TotImposto);
    end
  else
    begin
      PnlTot.Caption      := '0,00';
      PnlImposto.Caption  := '0,00';
    end;

end;

procedure TfAbastecimento.CBBombaClick(Sender: TObject);
begin
  if CBBomba.ItemIndex > -1 then
    begin
      ID_BOMBA := Integer(CBBomba.Items.Objects[CBBomba.ItemIndex]);
      GetDet(ID_BOMBA);
      Vlr_imposto:=0;
      LblVlrLit.Caption := formatfloat('0.##', Vlr_Litro);
      LblPercent.Caption := formatfloat('0.##', Percent)+'%';

      Vlr_imposto := (Percent/100) * Vlr_Litro;
      LblVlrImposto.Caption := formatfloat('0.##', Vlr_imposto);

      if Vlr_Litro > 0 then
        begin
         EdtLitros.Enabled:=true;
         EdtLitros.SetFocus;
        end;
    end;
end;

procedure TfAbastecimento.EdtLitrosChange(Sender: TObject);
begin
  if (EdtLitros.Text <> '') then
    begin
      CalcTot(StrToFloat(EdtLitros.Text));
    end
   else
    begin
      PnlTot.Caption      := '0,00';
      PnlImposto.Caption  := '0,00';
      Vlr_Total           :=0;
    end;

end;

procedure TfAbastecimento.EdtLitrosKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',','.',#8]) then
    key :=#0
end;

procedure TfAbastecimento.Finali;
begin
  PnlTot.Caption        :='0,00';
  PnlImposto.Caption    :='0,00';
  EdtLitros.Enabled     :=false;
  LblVlrLit.Caption     :='0,00';
  LblVlrImposto.Caption :='0,00';
  LblPercent.Caption    :='0%';
  Vlr_Litro             :=0;
  Percent               :=0;
  Vlr_imposto           :=0;
  Vlr_Total             :=0;
  TotImposto            :=0;
  Qtd_lts               :=0;
  EdtLitros.Clear;
  CBBomba.Clear;
  CBBomba.Items.Clear;
  GetBombas;
  CBBomba.SetFocus;
end;

procedure TfAbastecimento.FormShow(Sender: TObject);
begin
  Finali;
end;

procedure TfAbastecimento.GetBombas;
var
  DM : TDMAbastece;
begin
  DM  := TDMAbastece.Create(self);
  DM.GetFk;
  DM.QrFK.First;
  CBBomba.Items.Clear;
  CBBomba.Clear;
 while not (DM.QrFK.Eof) do
  begin
    CBBomba.Items.AddObject( DM.QrFK.FieldByName( 'NOME' ).AsString, TObject(DM.QrFK.FieldByName( 'ID' ).AsInteger ) );
    DM.QrFK.Next;
  end;
end;

procedure TfAbastecimento.GetDet(ID: Integer);
begin
  with DMAbastece.QRAux do
    begin
       try
          Close;
          Params[0].AsInteger := ID;
          Open;
          Vlr_Litro   :=  DMAbastece.QRAux.FieldByName( 'VLR_LTS' ).AsFloat;
          Percent     :=  DMAbastece.QRAux.FieldByName( 'IMPOSTO' ).AsFloat;
          Close;
       except
        on E: Exception do
          begin
            raise Exception.Create('Erro ao carregar os detalhes');
          end;
       end;
    end;
end;

function TfAbastecimento.GetMaxID: Integer;
var
  QueryMax : TFDQuery;
begin
  QueryMax := TFDQuery.Create(nil);

  try
    with QueryMax do
      begin
        Connection := Controle.FConexao;
        SQL.Text := 'select coalesce(max(id),0) + 1 as idmax from ABASTECIMENTOS';
        Open;
      end;
    Result := QueryMax.FieldByName('idmax').AsInteger;
  finally
    FreeAndNil(QueryMax);
  end;

end;

procedure TfAbastecimento.insert;
begin
  with DMAbastece.QrInsert do
    begin
       try
          Close;
          Params[0].AsInteger     := GetMaxID;
          Params[1].AsString      := DateToStr(Date);
          Params[2].AsString      := TimeToStr(Time);
          Params[3].AsInteger     := ID_BOMBA;
          Params[4].AsFloat       := Qtd_lts;
          ExecSQL;

          MessageDlg('Abastecimento realizado com sucesso',mtInformation,[mbOK],0);
          Finali;
       except
        on E: Exception do
          begin
            raise Exception.Create('Erro ao salvar o abastecimento');
          end;
       end;
    end;
end;

end.
