unit uCadPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, uDMBomba;


type
	   TEditDocumento = class helper for TEdit
	   public
	    procedure ValidCamp;
	end;

type
  TfCadPai = class(TForm)
    Panel1: TPanel;
    BtnClose: TSpeedButton;
    PGC: TPageControl;
    TsCad: TTabSheet;
    TsPesq: TTabSheet;
    BntInsert: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnCancel: TSpeedButton;
    PnlPesq: TPanel;
    EdtPesq: TLabeledEdit;
    BtnPesq: TButton;
    Grid: TDBGrid;
    BtnAlt: TSpeedButton;
    Label2: TLabel;
    procedure BtnCloseClick(Sender: TObject);
    procedure BntInsertClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ModInsert;
    procedure ModFinal;
    procedure ModAlter;
    procedure ClearComps;
    procedure DisableComps;
    procedure EnableComps;
    function ValidAlter : Boolean;
    procedure BtnAltClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadPai: TfCadPai;
  alter : Boolean;

implementation

{$R *.dfm}

procedure TfCadPai.BntInsertClick(Sender: TObject);
begin
  ModInsert;
end;

procedure TfCadPai.BtnAltClick(Sender: TObject);
begin
  ModAlter;
end;

procedure TfCadPai.BtnCancelClick(Sender: TObject);
begin
  ModFinal;
end;

procedure TfCadPai.BtnCloseClick(Sender: TObject);
begin
  Close;
  FreeAndNil(sender);
end;

procedure TfCadPai.BtnSalvarClick(Sender: TObject);
begin
  ModFinal;
end;

procedure TfCadPai.ClearComps;
var
   i: Integer;
begin
    for i := 0 to ComponentCount -1 do
    begin
      if (Components[i] is TEdit) then
        begin
          (Components[i] as TEdit).Clear;
          (Components[i] as TEdit).Enabled      :=false;
        end;

      if (Components[i] is TLabeledEdit) then
        begin
          (Components[i] as TLabeledEdit).Enabled:=False;
          (Components[i] as TLabeledEdit).Clear;
        end;

      if (Components[i] is TMemo) then
        begin
         (Components[i] as TMemo).Clear;
         (Components[i] as TMemo).Enabled       :=false;
        end;

      if (Components[i] is TComboBox) then
        begin
         (Components[i] as TComboBox).ItemIndex := -1;
         (Components[i] as TComboBox).Enabled   :=false;
        end;

      if (Components[i] is TCheckBox) then
        begin
         (Components[i] as TCheckBox).Checked   :=false;
         (Components[i] as TCheckBox).Enabled   :=false;
        end;

    end;
end;

procedure TfCadPai.DisableComps;
var
   i: Integer;
begin
    for i := 0 to ComponentCount -1 do
    begin
      if (Components[i] is TEdit) then
        begin
          (Components[i] as TEdit).Enabled      :=False;
        end;

      if (Components[i] is TMemo) then
        begin
         (Components[i] as TMemo).Enabled       :=False;
        end;

      if (Components[i] is TComboBox) then
        begin
         (Components[i] as TComboBox).Enabled   :=False;
        end;

      if (Components[i] is TCheckBox) then
        begin
         (Components[i] as TCheckBox).Enabled   :=False;
        end;

      if (Components[i] is TLabeledEdit) then
        begin
          (Components[i] as TLabeledEdit).Enabled:=False;
        end;

    end;
end;

procedure TfCadPai.EnableComps;
var
   i: Integer;
begin
    for i := 0 to ComponentCount -1 do
    begin
      if (Components[i] is TEdit) then
        begin
          (Components[i] as TEdit).Enabled      :=True;
        end;

      if (Components[i] is TMemo) then
        begin
         (Components[i] as TMemo).Enabled       :=True;
        end;

      if (Components[i] is TComboBox) then
        begin
         (Components[i] as TComboBox).Enabled   :=True;
        end;

      if (Components[i] is TCheckBox) then
        begin
         (Components[i] as TCheckBox).Enabled   :=True;
        end;

      if (Components[i] is TLabeledEdit) then
        begin
          (Components[i] as TLabeledEdit).Enabled:=True;
        end;

    end;

end;

procedure TfCadPai.FormShow(Sender: TObject);
begin
  ModFinal;
end;

procedure TfCadPai.ModAlter;
begin

  BtnClose.Enabled  :=false;
  BtnAlt.Enabled    :=false;
  BtnSalvar.Enabled :=true;
  BtnCancel.Enabled :=true;
  BntInsert.Enabled :=false;
  BtnPesq.Enabled   :=false;
  EdtPesq.Enabled   :=false;
  TsCad.Focused;
  TsCad.Show;
  alter             := True;
  EnableComps;
end;

procedure TfCadPai.ModFinal;
begin
  BtnClose.Enabled  :=True;
  BtnAlt.Enabled    :=True;
  BtnSalvar.Enabled :=False;
  BtnCancel.Enabled :=False;
  BntInsert.Enabled :=True;
  BtnPesq.Enabled   :=true;
  EdtPesq.Enabled   :=True;
  DisableComps;
end;

procedure TfCadPai.ModInsert;
begin
  BtnClose.Enabled  :=false;
  BtnAlt.Enabled    :=false;
  BtnSalvar.Enabled :=true;
  BtnCancel.Enabled :=true;
  BntInsert.Enabled :=false;
  BtnPesq.Enabled   :=false;
  EdtPesq.Enabled   :=false;
  TsCad.Focused;
  TsCad.Show;
  ClearComps;
  alter             := FAlse;
  EnableComps;
end;

function TfCadPai.ValidAlter: Boolean;
var
   i: Integer;
   Componente: TLabeledEdit;
begin
  Result := False;
    for i := 0 to ComponentCount -1 do
    begin
      if (Components[i] is TLabeledEdit) then
        begin
          Componente := Components[i] as TLabeledEdit;
          if Componente.Text = '' then
            begin
              Result := True;
              break;
            end;
        end;

    end;

end;

{ TEditDocumento }

procedure TEditDocumento.ValidCamp;
begin
 if NumbersOnly then
    Text:= StringOfChar('0',MaxLength);
end;

end.
