unit frmPrincipal_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, DMConexao;

type
  TForm1 = class(TForm)
    pnlLogin: TPanel;
    lblTitle: TLabel;
    lblSubTitle: TLabel;
    Label3: TLabel;
    edtUser: TEdit;
    lblUser: TLabel;
    lblPass: TLabel;
    edtPass: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    btnCadastrar: TButton;
    btnEntrar: TButton;
    Image1: TImage;
    lblAviso: TLabel;
    procedure cxButton2Click(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);

  private
    { Private declarations }

  public
    procedure validaLogin(user, pass : string; enable : Boolean);
  end;

var
  Form1: TForm1;
  ADMConexao : DMConexao.TDataModule1;

implementation

{$R *.dfm}

procedure TForm1.btnEntrarClick(Sender: TObject);
begin
  validaLogin(edtUser.Text, edtPass.Text, False);
end;

procedure TForm1.cxButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.validaLogin(user, pass: string; enable: Boolean);
begin
  try
    ADMConexao.FDConnection1.Connected := True;

    ADMConexao.fdQuery.SQL.Text :=
    'SELECT * FROM usuario'+
    'WHERE username = :user AND senha = :senha';

    ADMConexao.fdQuery.Params.ParamByName('user').Value := user;
    ADMConexao.fdQuery.Params.ParamByName('senha').Value := pass;

    ADMConexao.fdQuery.Open;

    enable := ADMConexao.fdQuery.FieldByName('status').AsBoolean;

    if ADMConexao.fdQuery.Fields[0].AsInteger > 0 then
    begin
      if enable = True then
        ShowMessage('Login bem sucedido!');
    end
    else
      lblAviso.Visible := True;
      lblAviso.Caption := 'Usuário ou senha inválidos!';
  finally
    ADMConexao.FDConnection1.Connected := False;
  end;
end;

end.
