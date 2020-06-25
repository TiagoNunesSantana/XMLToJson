unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls, xmldoc, Xml.XMLIntf, system.json,
  system.VarUtils, Rest.Json, uObjJson;
type
  TfrmPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    cdsDados: TClientDataSet;
    dsDados: TDataSource;
    cdsDadosLogradouro: TStringField;
    cdsDadosNumero: TIntegerField;
    cdsDadosBairro: TStringField;
    cdsDadosCEP: TIntegerField;
    cdsDadosCidade: TStringField;
    cdsDadosEstado: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    btnSalvar: TButton;
    btnDeletar: TButton;
    btnInserir: TButton;
    btnJSON: TButton;
    procedure btnCarregaGridClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnJSONClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uEnderecos;

procedure TfrmPrincipal.btnCarregaGridClick(Sender: TObject);
var _End: TEnderecos;
begin
  _End := TEnderecos.Create;
  _End.Logradouro := 'Logradouro 1';
  _End.Numero := 'Numero 1';
  _End.Bairro := 'Bairro 1';
  _End.Cep := 'Cep 1';
  _End.Cidade := 'Cidade 1';
  _End.Estado := 'Estado 1';
  _End.Free;
end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
begin
  cdsDados.ApplyUpdates(0);
end;

procedure TfrmPrincipal.btnDeletarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja excluir ?','Atenção',MB_YESNO+MB_ICONQUESTION)=IDYES then
    cdsDados.Delete;
end;

procedure TfrmPrincipal.btnInserirClick(Sender: TObject);
begin
  cdsDados.Insert;
end;

procedure TfrmPrincipal.btnJSONClick(Sender: TObject);
var
  _OD: TOpenDialog;
  _Json: TStringList;
  _XML: TXMLDocument;
  _ArqXml: TStringList;
  _ObjJson: TObjJson;
begin
  _OD:= TOpenDialog.Create(Application);
  _OD.Filter:= 'enderecos.xml';
                                                              -
  _ArqXml := TStringList.Create;
  _ArqXml.LoadFromFile(_OD.Filter);

  _ObjJson.JSON := _ArqXml.Text;

  _Json := TStringList.Create;
  _Json.Text := TJson.ObjectToJsonString(_ObjJson);
  _Json.SaveToFile('enderecos.json');
end;

procedure TfrmPrincipal.DBGrid1DblClick(Sender: TObject);
begin
  cdsDados.Edit;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  if not(cdsDados.Active) then
  begin
    cdsDados.CreateDataSet;
    cdsDados.EmptyDataSet;
    cdsDados.Active := true;
  end;
end;

end.
