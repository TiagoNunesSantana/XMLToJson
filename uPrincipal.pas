unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls, xmldoc, Xml.XMLIntf, system.json,
  system.VarUtils, Rest.Json, IniFiles;
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
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnJSONClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  arqJson: TextFile;

implementation

{$R *.dfm}

uses uConvertXMLtoJSON;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
begin
  cdsDados.ApplyUpdates(0);
end;

procedure TfrmPrincipal.btnDeletarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja excluir ?','Aten��o',MB_YESNO+MB_ICONQUESTION)=IDYES then
    cdsDados.Delete;
end;

procedure TfrmPrincipal.btnInserirClick(Sender: TObject);
begin
  cdsDados.Insert;
end;

procedure TfrmPrincipal.btnJSONClick(Sender: TObject);
var
  _XMLDoc: TXMLDocument;
  sJSON: string;
  _XMLNode: IXMLNode;
begin
  _XMLDoc := TXMLDocument.Create(Application);
  _XMLDoc.LoadFromFile('enderecos.xml');
  _XMLDoc.Active:=True;

  _XMLNode := _XMLDoc.DocumentElement.ChildNodes.FindNode('ROWDATA');

  sJSON := xml_to_json(_XMLNode);

  Writeln(arqJson, sJSON);
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

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  AssignFile(arqJson, 'enderecos.json');
  {$I-}
  Reset(arqJson);
  {$I+}
  if (IOResult <> 0) then
    Rewrite(arqJson) { arquivo n�o existe e ser� criado }
  else
  begin
    CloseFile(arqJson);
    Append(arqJson); { o arquivo existe e ser� aberto para sa�das adicionais }
  end;
end;

end.
