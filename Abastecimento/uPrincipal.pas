unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,System.UITypes, uViewBomba,
  uViewTanques, Vcl.StdCtrls, uViewAbastecimento, uViewRelat,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfPrincipal = class(TForm)
    Menu: TMainMenu;
    Cadastros1: TMenuItem;
    Bombas1: TMenuItem;
    anques1: TMenuItem;
    Abastecimentos1: TMenuItem;
    Sair1: TMenuItem;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Iniciar1: TMenuItem;
    Relatrios1: TMenuItem;
    Gerar1: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    procedure Sair1Click(Sender: TObject);
    procedure Bombas1Click(Sender: TObject);
    procedure anques1Click(Sender: TObject);
    procedure Iniciar1Click(Sender: TObject);
    procedure Gerar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

uses uCadPai;

procedure TfPrincipal.anques1Click(Sender: TObject);
begin
  try
    fCadTanques := TfCadTanques.Create(Application);
    fCadTanques.ShowModal;
  finally
    FreeAndNil(fCadTanques);
  end;
end;

procedure TfPrincipal.Bombas1Click(Sender: TObject);
begin
  try
    fCadBombas := TfCadBombas.Create(Application);
    fCadBombas.ShowModal;
  finally
    FreeAndNil(fCadBombas);
  end;
end;

procedure TfPrincipal.Gerar1Click(Sender: TObject);
begin
    try
    fRelat := TfRelat.Create(Application);
    fRelat.ShowModal;
  finally
    FreeAndNil(fRelat);
  end;

end;

procedure TfPrincipal.Iniciar1Click(Sender: TObject);
begin
  try
    fAbastecimento := TfAbastecimento.Create(Application);
    fAbastecimento.ShowModal;
  finally
    FreeAndNil(fAbastecimento);
  end;

end;

procedure TfPrincipal.Sair1Click(Sender: TObject);
begin
  if MessageDlg('Você tem certeza que deseja fechar o sistema?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    Application.Terminate;
    FreeAndNil(Self);
  end;
end;

end.
