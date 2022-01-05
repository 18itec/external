unit uDMAbastece;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uConexao;

type
  TDMAbastece = class(TDataModule)
    QrFK: TFDQuery;
    QrInsert: TFDQuery;
    QRAux: TFDQuery;
    procedure GetFk;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAbastece: TDMAbastece;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMAbastece }

procedure TDMAbastece.GetFk;
begin
  QrFK.Open;
end;

end.
