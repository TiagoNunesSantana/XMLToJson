unit uEnderecos;

interface

uses
  System.SysUtils;

type
  TEnderecos = class
  private
    FLogradouro : String;
    FNumero     : String;
    FBairro     : String;
    FCep        : String;
    FCidade     : String;
    FEstado     : String;
    procedure SetNumero(const Value: String);
    procedure SetCep(const Value: String);
  public
    property Logradouro: String read FLogradouro write FLogradouro;
    property Numero: String read FNumero write SetNumero;
    property Bairro: String read FBairro write FBairro;
    property Cep: String read FCep write SetCep;
    property Cidade: String read FCidade write FCidade;
    property Estado: String read FEstado write FEstado;
end;

implementation

{ TEnderecos }

procedure TEnderecos.SetCep(const Value: String);
begin
  try
    if (Length(Value)>0) and (StrToInt(Value)>0) then
      FCep := Value else
      raise Exception.Create('Digite apenas numeros.');
  except
    raise Exception.Create('Digite apenas numeros.');
  end;
end;

procedure TEnderecos.SetNumero(const Value: String);
begin
  try
    if (Length(Value)>0) and (StrToInt(Value)>0) then
      FNumero := Value else
      raise Exception.Create('Digite apenas numeros.');
  except
    raise Exception.Create('Digite apenas numeros.');
  end;
end;

end.
