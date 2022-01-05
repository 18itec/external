unit uConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, Data.DB,
  FireDAC.Comp.Client, inifiles, Forms;

type
  TControle = class(TDataModule)
    FConexao: TFDConnection;
    FBDriverLink: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Controle: TControle;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TControle.DataModuleCreate(Sender: TObject);
var
ArquivoINI, Servidor, Caminho, UserName, PassWord, LinkFD, Driver : string;
Configuracoes : TIniFile;
begin
   ArquivoINI := ExtractFilePath(Application.ExeName) + 'conf.ini';

   if not FileExists(ArquivoINI) then
    begin
     raise Exception.Create('Não existe um arquivo de conexão');
     Exit;
    end;

  Configuracoes := TIniFile.Create(ArquivoINI);

   Try
      Servidor   := Configuracoes.ReadString('Configuracao', 'Servidor',   Servidor);
      Caminho    := Configuracoes.ReadString('Configuracao', 'DataBase',   Caminho);
      UserName   := Configuracoes.ReadString('Configuracao', 'UserName',   UserName);
      PassWord   := Configuracoes.ReadString('Configuracao', 'PassWord',   PassWord);
      LinkFD     := Configuracoes.ReadString('Configuracao', 'LinkFD',   LinkFD);
      Driver     := Configuracoes.ReadString('Configuracao', 'Driver',   Driver);
    Finally
      Configuracoes.Free;
    end;

   try
    with FConexao do
      begin
        Connected                   := False;
        DriverName                  := Driver;
        FBDriverLink.VendorLib      := LinkFD;
        LoginPrompt                 := False;
        Params.Values['DataBase']   := Servidor + ':' + Caminho;
        Params.Values['User_Name']  := UserName;
        Params.Values['Password']   := PassWord;
        FConexao.Connected          := True;
      end;
   except
    on E: Exception do
      begin
        raise Exception.Create('Ocorreu O erro:' + #13 +  E.message);
      end;
   end;

end;

end.
