unit uObjJson;

interface

uses
  System.SysUtils;

type
  TObjJson = class
  private
    FJSON : String;
  public
    property JSON: String read FJSON write FJSON;
end;

implementation

{ TObjJson }

end.
