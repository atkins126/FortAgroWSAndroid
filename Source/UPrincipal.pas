unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Horse,
  Horse.Jhonson,
  System.JSON, Horse.HandleException, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    mLog: TMemo;
    log: TLabel;
    Panel1: TPanel;
    chkLogJson: TCheckBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    vTipoBase:integer;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UDmDb;

{ TForm1 }

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  dmDB.ConectaPG_Local;
  THorse.Use(Jhonson);
  THorse.Use(HandleException);
  THorse.Get('/ping',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
    Res.Send('pong');
  end);
 //ConectaDB
  THorse.Get('/conectaLocal',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Conecta DB LOCAL');
     try
      Res.Send<TJSONObject>(dmDB.ConectaPG_Local);
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Conectado Com Sucesso!');
      except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao conectar db local '+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro','Error ao conectar db local!')).Status(201);
       end
     end;
  end);
  THorse.Get('/ConectaPG_AWS',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Conecta DB AWS');
     try
      Res.Send<TJSONObject>(dmDB.ConectaPG_AWS);
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Conectado Com Sucesso!');
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao conectar AWS '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro','Erro ao conectar Banco AWS')).Status(201);
      end;
     end;
  end);

  THorse.Use(HandleException);
  THorse.Get('/GetTestaServidor',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Testando Servidor');
     try
      Res.Send<TJSONObject>(dmDB.GetTestaServidor);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro','')).Status(201);
      end;
     end;
  end);

  THorse.Get('/GetUsuariosAGRI',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Usuarios');
     try
      Res.Send<TJSONObject>(dmDB.GetUsuariosAGRI);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetPragas',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetPragas');
     try
      Res.Send<TJSONObject>(dmDB.GetPragas);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetOperadorMaquinas',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetOperadorMaquinas');
     try
      Res.Send<TJSONObject>(dmDB.GetOperadorMaquinas);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetCobertura',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetCobertura');
     try
      Res.Send<TJSONObject>(dmDB.GetCobertura);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/GetMaquinas',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetMaquinas');
     try
      Res.Send<TJSONObject>(dmDB.GetMaquinas);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetProdutos',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetProdutos');
     try
      Res.Send<TJSONObject>(dmDB.GetProdutos);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetOperacoes',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetOperaçoes');
     try
      Res.Send<TJSONObject>(dmDB.GetOperacoes);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetAreas',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetAreas');
     try
      Res.Send<TJSONObject>(dmDB.GetAreas);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetSetores',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetSetores');
     try
      Res.Send<TJSONObject>(dmDB.GetSetores);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetTalhoes',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetTalhoes');
     try
      Res.Send<TJSONObject>(dmDB.GetTalhoes);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetPluviometro',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetPluviometro');
     try
      Res.Send<TJSONObject>(dmDB.GetPluviometro);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetPluviometroTalhoes',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetPluviometroTalhoes');
     try
      Res.Send<TJSONObject>(dmDB.GetPluviometroTalhoes);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetAtividadeAbastecimento',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetAtividadeAbastecimento');
     try
      Res.Send<TJSONObject>(dmDB.GetAtividadeAbastecimento);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetLocalEstoque',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetLocalEstoque');
     try
      Res.Send<TJSONObject>(dmDB.GetLocalEstoque);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetSafra',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetSafra');
     try
      Res.Send<TJSONObject>(dmDB.GetSafra);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetCulturas',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetCulturas');
     try
      Res.Send<TJSONObject>(dmDB.GetCulturas);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetCultivares',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetCultivares');
     try
      Res.Send<TJSONObject>(dmDB.GetCultivares);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetTipoOcorrencia',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetTipoOcorrencia');
     try
      Res.Send<TJSONObject>(dmDB.GetTipoOcorrencia);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetAuxTipoAplicacaoSolido',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetAuxTipoAplicacaoSolido');
     try
      Res.Send<TJSONObject>(dmDB.GetAuxTipoAplicacaoSolido);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetTipoDB',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Get Tipo DB');
     try
      Res.Send<TJSONObject>(dmDB.GetTipoDB);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/GetReceituario',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetReceituario');
     try
      Res.Send<TJSONObject>(dmDB.GetReceituario);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Post('/GetMudaStatusReceituario',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Muda Status Receituario');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptGetMudaStatusReceituario(LBody);
       Res.Send(LBodyRed).Status(200)
        except on ex:exception do
        begin
         mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
         Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
        end;
      end;
    end);

    THorse.Post('/TonkenApp',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' TonkenApp');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptTonkenApp(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/OperacaoSafraReceituario',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Receituario');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptOperacaoSafraReceituario(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/OperacaoDetReceituario',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Det Receituario Produtos');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptOperacaoDetReceituario(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/OperacaoDetReceituarioTalhao',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Det Receituario Talhoes');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptOperacaoDetReceituarioTalhao(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/GetDetReceituarioTalhao',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando DetReceituario');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptGetDetReceituarioTalhao(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

   THorse.Post('/GetDetReceituario',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Det Receituario Produtos');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptGetDetReceituario(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/OperacaoSafraTalhao',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Operacao Safra');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptOperacaoSafraTalhao(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);


    THorse.Post('/OperacaoSafraTalhaoMaquinas',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Operacao Safra Maquinas');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptOperacaoSafraTalhaoMaquinas(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/OperacaoSafraTalhaoProduto',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Operacao Safra Talhao Produto');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptOperacaoSafraTalhaoProduto(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/OperacaoSafraTalhaoOcorrencia',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Operacao Safra Talhao Produto');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptOperacaoSafraTalhaoOcorrencia(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/OperacaoSafraVasao',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Operacao Safra Vazao');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptOperacaoSafraVasao(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/OperacaoStandPlantas',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Stand de Plantas');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptOperacaoStandPlantas(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/Pluviometria',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Pluviometria');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptPluviometria(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/Abastecimento',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Abastecimento');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptAbastecimento(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/AbastecimentoOutros',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Abastecimento Outros');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptAbastecimentoOutros(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

     THorse.Post('/MovLocalEstoque',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Movimentacao Estoque');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptMovLocalEstoque(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/Monitoramento',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Monitoramentos');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptMonitoramento(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
         mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
         Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);


    THorse.Post('/MonitoramentoPontos',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Monitoramento Pontos');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptMonitoramentoPontos(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/MonitoramentoPontosValores',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Monitoramento Pontos Valores');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptMonitoramentoPontosValores(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Get('/GetContratos',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetContratos');
       try
        Res.Send<TJSONObject>(dmDB.GetContratos);
       except on ex:exception do
        begin
         mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
         Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
        end;
       end;
    end);

    THorse.Get('/GetComprador',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetComprador');
       try
        Res.Send<TJSONObject>(dmDB.GetComprador);
       except on ex:exception do
        begin
         mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
         Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
        end;
       end;
    end);

    THorse.Post('/Embarques',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Embarques');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptEmbarques(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/Desembarques',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Desembarques');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptDesembarques(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Get('/GetAuxItemRevisao',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetAuxRevisaoItems');
       try
        Res.Send<TJSONObject>(dmDB.GetAuxRevisaoItems);
       except on ex:exception do
        begin
         mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
         Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
        end;
       end;
    end);


    THorse.Get('/GetPlanoRevisao',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetPlanoRevisao');
       try
        Res.Send<TJSONObject>(dmDB.GetPlanoRevisao);
       except on ex:exception do
        begin
         mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
         Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
        end;
       end;
    end);

    THorse.Get('/GetPlanoRevisaoItens',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetPlanoRevisaoItens');
       try
        Res.Send<TJSONObject>(dmDB.GetPlanoRevisaoItens);
       except on ex:exception do
        begin
         mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
         Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
        end;
       end;
    end);

    THorse.Get('/GetPlanoRevisaoMaquinas',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetPlanoRevisaoMaquinas');
       try
        Res.Send<TJSONObject>(dmDB.GetPlanoRevisaoMaquinas);
       except on ex:exception do
        begin
         mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
         Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
        end;
       end;
    end);

    THorse.Get('/GetRevisao',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : GetRevisao');
       try
        Res.Send<TJSONObject>(dmDB.GetRevisao);
       except on ex:exception do
        begin
         mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
         Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
        end;
       end;
    end);

    THorse.Post('/AuxItemRevisao',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Aux Revisao Itens');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptAuxRevisaoItens(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
         mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
         Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/Revisao',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Revisao');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptRevisao(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
         mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
         Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/RevisaoItens',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Revisao Itens');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptRevisaoItens(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
         mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
         Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);

    THorse.Post('/RevisaoServicos',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody,LBodyRed: TJSONObject;
    begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Enviando Revisao Servicos');
      LBody := Req.Body<TJSONObject>;
      try
       LBodyRed:=dmDb.AcceptRevisaoServico(LBody);
       Res.Send(LBodyRed).Status(200)
       except on ex:exception do
       begin
         mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
         Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
       end;
      end;
    end);


    THorse.Listen(8099, procedure(Horse: THorse)
    begin
      log.Caption := ('Servidor Fort Agro Rodando na porta: ' + Horse.Port.ToString+' v2021-12-01');
      Application.ProcessMessages;
    end);
end;


end.
