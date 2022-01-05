program Abastecimento;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  uCadPai in 'uCadPai.pas' {fCadPai},
  uBombaModel in 'Classes\Model\uBombaModel.pas',
  uBombaControle in 'Classes\Controller\uBombaControle.pas',
  uConexao in 'Classes\Controller\uConexao.pas' {Controle: TDataModule},
  uDMBomba in 'Classes\Controller\uDMBomba.pas' {DMBomba: TDataModule},
  uViewBomba in 'Classes\View\uViewBomba.pas' {fCadBombas},
  uViewTanques in 'Classes\View\uViewTanques.pas' {fCadTanques},
  uTanqueModel in 'Classes\Model\uTanqueModel.pas',
  uTanqueControle in 'Classes\Controller\uTanqueControle.pas',
  uDMTanques in 'Classes\Controller\uDMTanques.pas' {DMTanque: TDataModule},
  uViewAbastecimento in 'Classes\View\uViewAbastecimento.pas' {fAbastecimento},
  uDMAbastece in 'Classes\Controller\uDMAbastece.pas' {DMAbastece: TDataModule},
  uViewRelat in 'Classes\View\uViewRelat.pas' {fRelat},
  uRelat in 'Classes\Controller\uRelat.pas' {DMRelat: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TControle, Controle);
  Application.CreateForm(TfCadBombas, fCadBombas);
  Application.CreateForm(TfCadTanques, fCadTanques);
  Application.CreateForm(TDMTanque, DMTanque);
  Application.CreateForm(TfAbastecimento, fAbastecimento);
  Application.CreateForm(TDMAbastece, DMAbastece);
  Application.CreateForm(TfRelat, fRelat);
  Application.CreateForm(TDMRelat, DMRelat);
  Application.Run;
end.
