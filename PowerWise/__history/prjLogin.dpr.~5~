program prjLogin;

uses
  Vcl.Forms,
  frmPrincipal_U in 'frmPrincipal_U.pas' {Form1},
  DMConexao in 'DMConexao.pas' {DataModule1: TDataModule},
  TelaInicial_U in 'TelaInicial_U.pas' {Form2},
  Cadastro_U in 'Cadastro_U.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Form1.Position := poScreenCenter;
  Form1.lblAviso.Visible := False;
  Application.Run;
end.
