unit uViewBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadPai, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uBombaControle,
  uDMBomba, uBombaModel,System.UITypes;

type
  TfCadBombas = class(TfCadPai)
    EdtBomba: TLabeledEdit;
    Label1: TLabel;
    CBTanque: TComboBox;
    CHKStatus: TCheckBox;
    EdtImposto: TLabeledEdit;
    dsPesquisa: TDataSource;
    EdtVlr: TLabeledEdit;
    procedure BtnSalvarClick(Sender: TObject);
    procedure CBTanqueCloseUp(Sender: TObject);
    procedure BntInsertClick(Sender: TObject);
    procedure TsPesqShow(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure BtnPesqClick(Sender: TObject);
  private
    procedure pesquisar;
    procedure edit;
    procedure insert;
    procedure GetFK;
    procedure LoadCad;
    procedure pesquisarID;
  public
    { Public declarations }
  end;

var
  fCadBombas: TfCadBombas;
  ID_TANQUE_P,ID_ALTR : Integer;

implementation

{$R *.dfm}

{ TfCadBombas }

procedure TfCadBombas.BntInsertClick(Sender: TObject);
begin
  inherited;
GetFK;
end;

procedure TfCadBombas.BtnPesqClick(Sender: TObject);
begin
  inherited;
  pesquisar;
end;

procedure TfCadBombas.BtnSalvarClick(Sender: TObject);
begin
  inherited;

  if alter then
    edit
  else
    insert;

  LoadCad;
  GetFK;
end;

procedure TfCadBombas.CBTanqueCloseUp(Sender: TObject);
begin
  inherited;
  if CBTanque.ItemIndex > -1 then
    begin
      ID_TANQUE_P := Integer(CBTanque.Items.Objects[CBTanque.ItemIndex]);
    end;
end;

procedure TfCadBombas.edit;
var
  obomba : TBomba;
  obombaCtrl : TBombaControle;
  Erro : String;
begin
  obombaCtrl  := TBombaControle.Create;
  obomba      := TBomba.Create;
  try
    with obomba do
      begin
        ID        := ID_ALTR;
        NOME      := EdtBomba.Text;
        ID_TANQUE := ID_TANQUE_P;
        IMPOSTO   := StrToFloat(EdtImposto.Text);
        VLR_LTS   := StrToFloat(EdtVlr.Text);
        if CHKStatus.Checked then STATUS := 1 else STATUS := 0;
      end;

    if obombaCtrl.Edit(obomba,Erro) = False then
      raise Exception.Create(Erro)
    else
      MessageDlg('Salvo com sucesso',mtInformation,[mbok],0);
  finally
    FreeAndNil(obomba);
    FreeAndNil(obombaCtrl);
  end;
end;

procedure TfCadBombas.GetFK;
var
  DM : TDMBomba;
begin
  DM  := TDMBomba.Create(self);
  DM.GetFk;
  DM.QrFK.First;
  CBTanque.Items.Clear;
  CBTanque.Clear;
 while not (DM.QrFK.Eof) do
  begin
    CBTanque.Items.AddObject( DM.QrFK.FieldByName( 'NOME' ).AsString, TObject(DM.QrFK.FieldByName( 'ID' ).AsInteger ) );
    DM.QrFK.Next;
  end;

end;

procedure TfCadBombas.GridDblClick(Sender: TObject);
begin
  inherited;
  pesquisarID;
  TsCad.Show;
end;

procedure TfCadBombas.insert;
var
  obomba : TBomba;
  obombaCtrl : TBombaControle;
  Erro : String;
begin
  obombaCtrl  := TBombaControle.Create;
  obomba      := TBomba.Create;
  try
    with obomba do
      begin
        ID        := 0;
        NOME      := EdtBomba.Text;
        ID_TANQUE := ID_TANQUE_P;
        IMPOSTO   := StrToFloat(EdtImposto.Text);
        VLR_LTS   := StrToFloat(EdtVlr.Text);
        if CHKStatus.Checked then STATUS := 1 else STATUS := 0;
      end;

    if obombaCtrl.Insert(obomba,Erro) = False then
      raise Exception.Create(Erro)
    else
      MessageDlg('Salvo com sucesso',mtInformation,[mbok],0);
  finally
    FreeAndNil(obomba);
    FreeAndNil(obombaCtrl);
  end;

end;

procedure TfCadBombas.LoadCad;
var
  DM : TDMBomba;
begin
  DM  := TDMBomba.Create(self);
  DM.Loadall;
end;

procedure TfCadBombas.pesquisar;
var
  obombaCtrl : TBombaControle;
  obomba : TBomba;
  nTemReg : Boolean;
begin
  nTemReg := True;
  obombaCtrl  := TBombaControle.Create;
  obomba      := TBomba.Create;
  try
    obombaCtrl.LoadRegistro(obomba,EdtPesq.Text);
    with obomba do
      begin
        if NOME <> '' then
          nTemReg := False;
        ID_ALTR             := ID;
        ID_TANQUE_P         := ID_TANQUE;
        EdtBomba.Text       := NOME;
        EdtImposto.Text     := FloatToStr(IMPOSTO);
        EdtVlr.Text         := FloatToStr(VLR_LTS);
        CBTanque.ItemIndex  := CBTanque.Items.IndexOf(NOMETANQUE);
        if STATUS = 1 then
          CHKStatus.Checked := True
        else
          CHKStatus.Checked := false;
      end;

    if nTemReg then
      ShowMessage('Nenhuma registro encontrado')
    else
      begin
        TsCad.Show;
      end;

  finally
    FreeAndNil(obomba);
    FreeAndNil(obombaCtrl);
  end;

end;

procedure TfCadBombas.pesquisarID;
var
  obombaCtrl : TBombaControle;
  obomba : TBomba;
begin
  obombaCtrl  := TBombaControle.Create;
  obomba      := TBomba.Create;
  try
    obombaCtrl.LoadRegistroID(obomba,dsPesquisa.DataSet.FieldByName('ID').AsInteger);
    with obomba do
      begin
        ID_ALTR             := dsPesquisa.DataSet.FieldByName('ID').AsInteger;
        EdtBomba.Text       := NOME;
        ID_TANQUE_P         := ID_TANQUE;
        EdtImposto.Text     := FloatToStr(IMPOSTO);
        EdtVlr.Text         := FloatToStr(VLR_LTS);
        CBTanque.ItemIndex:=CBTanque.Items.IndexOf(NOMETANQUE);
        if STATUS = 1 then
          CHKStatus.Checked := True
        else
          CHKStatus.Checked := false;
      end;
  finally
    FreeAndNil(obomba);
    FreeAndNil(obombaCtrl);
  end;

end;

procedure TfCadBombas.TsPesqShow(Sender: TObject);
begin
  inherited;
  LoadCad;
  GetFK;
  EdtPesq.Enabled:=true;
end;

end.
