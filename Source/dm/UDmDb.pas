unit UDmDb;

interface

uses System.SysUtils, System.Classes, System.Json,
  vcl.Forms, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin,
  System.Json.writers,System.JSON.Types, FireDAC.Phys.PGDef, FireDAC.Phys.PG,
  FireDAC.Phys.ODBCBase,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef,System.IniFiles, FireDAC.FMXUI.Wait,FMX.Dialogs,
  FireDAC.Phys.IBBase,IdSSLOpenSSL,IdSMTP,IdMessage,IdText,IdExplicitTLSClientServerBase,
  IdAttachmentFile, FireDAC.Comp.BatchMove,System.Variants, FireDAC.Comp.BatchMove.JSON,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  System.Net.HttpClient,FMX.Types,System.Net.URLClient,
  System.Net.HttpClientComponent, FireDAC.ConsoleUI.Wait,FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script;


type
  TdmDB = class(TDataModule)
    FDConPG: TFDConnection;
    PgDriverLink: TFDPhysPgDriverLink;
    ScriptSetSequnce: TFDScript;
    TUsuario: TFDQuery;
    TUsuarioId: TIntegerField;
    TUsuarioStatus: TIntegerField;
    TUsuarioDataReg: TSQLTimeStampField;
    TUsuarioIdUsuario: TIntegerField;
    TUsuarioDataAlteracao: TSQLTimeStampField;
    TUsuarioIdUsuarioAlteracao: TIntegerField;
    TUsuarionome: TWideStringField;
    TUsuariousuario: TWideStringField;
    TUsuariosenha: TWideStringField;
    TUsuarioidsegmento: TIntegerField;
    TUsuariotipo: TIntegerField;
    TUsuariotipostr: TWideMemoField;
    TUsuariosegmentostr: TWideMemoField;
    TUsuarioidsupervisor: TIntegerField;
    TUsuariosuperviso: TWideStringField;
    TUsuariosyncaws: TIntegerField;
    TUsuarioagronomo: TIntegerField;
    TUsuarioabastecimento: TIntegerField;
    TUsuarioimgass: TBlobField;
    TAuxPraga: TFDQuery;
    TAuxPragaid: TIntegerField;
    TAuxPragastatus: TIntegerField;
    TAuxPragadatareg: TSQLTimeStampField;
    TAuxPragaidusuario: TIntegerField;
    TAuxPragadataalteracao: TSQLTimeStampField;
    TAuxPragaidusuarioalteracao: TIntegerField;
    TAuxPraganome: TWideStringField;
    TAuxPragasyncaws: TIntegerField;
    TAuxPragasyncfaz: TIntegerField;
    TOperadorMaquina: TFDQuery;
    TOperadorMaquinaid: TIntegerField;
    TOperadorMaquinastatus: TIntegerField;
    TOperadorMaquinadatareg: TSQLTimeStampField;
    TOperadorMaquinaidusuario: TIntegerField;
    TOperadorMaquinadataalteracao: TSQLTimeStampField;
    TOperadorMaquinaidusuarioalteracao: TIntegerField;
    TOperadorMaquinanome: TWideStringField;
    TOperadorMaquinarg: TWideStringField;
    TOperadorMaquinacpf: TWideStringField;
    TOperadorMaquinacnh: TWideStringField;
    TOperadorMaquinacelular: TWideStringField;
    TOperadorMaquinasyncaws: TIntegerField;
    TAuxCobertura: TFDQuery;
    TAuxCoberturaid: TIntegerField;
    TAuxCoberturastatus: TIntegerField;
    TAuxCoberturadatareg: TSQLTimeStampField;
    TAuxCoberturaidusuario: TIntegerField;
    TAuxCoberturadataalteracao: TSQLTimeStampField;
    TAuxCoberturaidusuarioalteracao: TIntegerField;
    TAuxCoberturanome: TWideStringField;
    TMaquinas: TFDQuery;
    TProduto: TFDQuery;
    TProdutoId: TIntegerField;
    TProdutoNome: TWideStringField;
    TProdutoNumeroSerie: TIntegerField;
    TProdutoCodigoBarras: TWideStringField;
    TProdutoImg: TBlobField;
    TProdutocodigofabricante: TWideStringField;
    TProdutocategoria: TWideStringField;
    TProdutogrupo: TWideStringField;
    TProdutosubgrupo: TWideStringField;
    TProdutomarca: TWideStringField;
    TProdutosegmento: TWideStringField;
    TProdutostatus: TIntegerField;
    TProdutoobservacao: TWideStringField;
    TProdutounidademedida: TWideStringField;
    TProdutotipo: TWideStringField;
    TProdutodefensivos: TIntegerField;
    TOperacoes: TFDQuery;
    TOperacoesid: TIntegerField;
    TOperacoesstatus: TIntegerField;
    TOperacoesdatareg: TSQLTimeStampField;
    TOperacoesidusuario: TIntegerField;
    TOperacoesdataalteracao: TSQLTimeStampField;
    TOperacoesidusuarioalteracao: TIntegerField;
    TOperacoesnome: TWideStringField;
    TAreas: TFDQuery;
    TAreasid: TIntegerField;
    TAreasstatus: TIntegerField;
    TAreasdatareg: TSQLTimeStampField;
    TAreasidusuario: TIntegerField;
    TAreasdataalteracao: TSQLTimeStampField;
    TAreasidusuarioalteracao: TIntegerField;
    TAreasnome: TWideStringField;
    TAreasareahe: TBCDField;
    TAreasidresponsavel: TIntegerField;
    TAreasresponsavel: TWideStringField;
    TAreaslatitude: TWideStringField;
    TAreaslongitude: TWideStringField;
    TAreassyncaws: TIntegerField;
    TAreassyncfaz: TIntegerField;
    TSetor: TFDQuery;
    TSetorid: TIntegerField;
    TSetorstatus: TIntegerField;
    TSetordatareg: TSQLTimeStampField;
    TSetoridusuario: TIntegerField;
    TSetordataalteracao: TSQLTimeStampField;
    TSetoridusuarioalteracao: TIntegerField;
    TSetornome: TWideStringField;
    TSetorareahe: TBCDField;
    TSetoridarea: TIntegerField;
    TSetorlatitude: TWideStringField;
    TSetorlongitude: TWideStringField;
    TSetorsyncaws: TIntegerField;
    TSetorsyncfaz: TIntegerField;
    TTalhoes: TFDQuery;
    TTalhoesid: TIntegerField;
    TTalhoesstatus: TIntegerField;
    TTalhoesdatareg: TSQLTimeStampField;
    TTalhoesidusuario: TIntegerField;
    TTalhoesdataalteracao: TSQLTimeStampField;
    TTalhoesidusuarioalteracao: TIntegerField;
    TTalhoesnome: TWideStringField;
    TTalhoesareahe: TBCDField;
    TTalhoesidsetor: TIntegerField;
    TTalhoesqrcode: TWideStringField;
    TTalhoestipo: TIntegerField;
    TTalhoesobservacao: TWideStringField;
    TTalhoestiposte: TWideMemoField;
    TTalhoeslatitude: TWideStringField;
    TTalhoeslongitude: TWideStringField;
    TTalhoessyncaws: TIntegerField;
    TTalhoessyncfaz: TIntegerField;
    TTalhoesqrcodesaida: TWideStringField;
    TPluviometro: TFDQuery;
    TPluviometroid: TIntegerField;
    TPluviometrostatus: TIntegerField;
    TPluviometrodatareg: TSQLTimeStampField;
    TPluviometroidusuario: TIntegerField;
    TPluviometrodataalteracao: TSQLTimeStampField;
    TPluviometroidusuarioalteracao: TIntegerField;
    TPluviometronome: TWideStringField;
    TPluviometrolatitude: TWideStringField;
    TPluviometrolongitude: TWideStringField;
    TPluviometroidsetor: TIntegerField;
    TPluviometrosyncaws: TIntegerField;
    TPluviometrosyncfaz: TIntegerField;
    TPluviometroTalhoes: TFDQuery;
    TLocalEstoque: TFDQuery;
    TLocalEstoqueid: TIntegerField;
    TLocalEstoquestatus: TIntegerField;
    TLocalEstoquedatareg: TSQLTimeStampField;
    TLocalEstoqueidusuario: TIntegerField;
    TLocalEstoquedataalteracao: TSQLTimeStampField;
    TLocalEstoqueidusuarioalteracao: TIntegerField;
    TLocalEstoquenome: TWideStringField;
    TLocalEstoqueidsegmento: TIntegerField;
    TLocalEstoquesyncaws: TIntegerField;
    TLocalEstoquesyncfaz: TIntegerField;
    TLocalEstoquecombustivel: TIntegerField;
    TSafra: TFDQuery;
    TSafraid: TIntegerField;
    TSafrastatus: TIntegerField;
    TSafradatareg: TSQLTimeStampField;
    TSafraidusuario: TIntegerField;
    TSafradataalteracao: TSQLTimeStampField;
    TSafraidusuarioalteracao: TIntegerField;
    TSafranome: TWideStringField;
    TSafradatainicio: TDateField;
    TSafradatafim: TDateField;
    TSafraobservacao: TWideStringField;
    TCulturas: TFDQuery;
    TCulturasid: TIntegerField;
    TCulturasstatus: TIntegerField;
    TCulturasdatareg: TSQLTimeStampField;
    TCulturasidusuario: TIntegerField;
    TCulturasdataalteracao: TSQLTimeStampField;
    TCulturasidusuarioalteracao: TIntegerField;
    TCulturasnome: TWideStringField;
    TCultivares: TFDQuery;
    TCultivaresid: TIntegerField;
    TCultivaresstatus: TIntegerField;
    TCultivaresdatareg: TSQLTimeStampField;
    TCultivaresidusuario: TIntegerField;
    TCultivaresdataalteracao: TSQLTimeStampField;
    TCultivaresidusuarioalteracao: TIntegerField;
    TCultivaresnome: TWideStringField;
    TCultivaressyncaws: TIntegerField;
    TCultivaresidtipocultivar: TIntegerField;
    TCultivaresciclo: TIntegerField;
    TTipoOcorrencia: TFDQuery;
    TTipoOcorrenciaid: TIntegerField;
    TTipoOcorrenciastatus: TIntegerField;
    TTipoOcorrenciadatareg: TSQLTimeStampField;
    TTipoOcorrenciaidusuario: TIntegerField;
    TTipoOcorrenciadataalteracao: TSQLTimeStampField;
    TTipoOcorrenciaidusuarioalteracao: TIntegerField;
    TTipoOcorrencianome: TWideStringField;
    TTipoAplicacaoSolido: TFDQuery;
    TTipoAplicacaoSolidoid: TIntegerField;
    TTipoAplicacaoSolidostatus: TIntegerField;
    TTipoAplicacaoSolidodatareg: TSQLTimeStampField;
    TTipoAplicacaoSolidoidusuario: TIntegerField;
    TTipoAplicacaoSolidodataalteracao: TSQLTimeStampField;
    TTipoAplicacaoSolidoidusuarioalteracao: TIntegerField;
    TTipoAplicacaoSolidonome: TWideStringField;
    TReceituario: TFDQuery;
    TReceituarioid: TIntegerField;
    TReceituariostatus: TIntegerField;
    TReceituariodatareg: TSQLTimeStampField;
    TReceituarioidusuario: TIntegerField;
    TReceituariodataalteracao: TSQLTimeStampField;
    TReceituarioidusuarioalteracao: TIntegerField;
    TReceituarionome: TWideStringField;
    TReceituarioidresponsavel: TIntegerField;
    TReceituarioresponsavel: TWideStringField;
    TSyncUsuario: TFDQuery;
    TSyncUsuarioid: TIntegerField;
    TSyncUsuariostatus: TIntegerField;
    TSyncUsuariodatareg: TSQLTimeStampField;
    TSyncUsuarioidusuario: TIntegerField;
    TSyncUsuariodataalteracao: TSQLTimeStampField;
    TSyncUsuarioidusuarioalteracao: TIntegerField;
    TSyncUsuarionome: TWideStringField;
    TSyncUsuariousuario: TWideStringField;
    TSyncUsuariosenha: TWideStringField;
    TSyncUsuariotipo: TIntegerField;
    TSyncUsuarioidsupervisor: TIntegerField;
    TSyncUsuarioidsegmento: TIntegerField;
    TSyncUsuariosyncaws: TIntegerField;
    TSyncUsuarioagronomo: TIntegerField;
    TSyncUsuarioabastecimento: TIntegerField;
    TSyncUsuariosyncfaz: TIntegerField;
    TSyncUsuariotokenapp: TWideStringField;
    TSyncUsuariotokenappcompras: TWideStringField;
    TSyncUsuarioimgass: TBlobField;
    TSyncReceituario: TFDQuery;
    TSyncReceituarioid: TIntegerField;
    TSyncReceituariostatus: TIntegerField;
    TSyncReceituariodatareg: TSQLTimeStampField;
    TSyncReceituarioidusuario: TIntegerField;
    TSyncReceituariodataalteracao: TSQLTimeStampField;
    TSyncReceituarioidusuarioalteracao: TIntegerField;
    TSyncReceituarionome: TWideStringField;
    TSyncReceituarioidresponsavel: TIntegerField;
    TSyncReceituariosyncaws: TIntegerField;
    TSyncReceituariosyncfaz: TIntegerField;
    SyncDetReceituarioTalhao: TFDQuery;
    SyncDetReceituarioTalhaoid: TIntegerField;
    SyncDetReceituarioTalhaostatus: TIntegerField;
    SyncDetReceituarioTalhaodatareg: TSQLTimeStampField;
    SyncDetReceituarioTalhaoidusuario: TIntegerField;
    SyncDetReceituarioTalhaodataalteracao: TSQLTimeStampField;
    SyncDetReceituarioTalhaoidusuarioalteracao: TIntegerField;
    SyncDetReceituarioTalhaoidtalhao: TIntegerField;
    SyncDetReceituarioTalhaoareahe: TBCDField;
    SyncDetReceituarioTalhaosyncaws: TIntegerField;
    SyncDetReceituarioTalhaosyncfaz: TIntegerField;
    SyncDetReceituarioTalhaoidreceiturario: TIntegerField;
    TSyncDetReceituario: TFDQuery;
    TSyncDetReceituarioid: TIntegerField;
    TSyncDetReceituariostatus: TIntegerField;
    TSyncDetReceituariodatareg: TSQLTimeStampField;
    TSyncDetReceituarioidusuario: TIntegerField;
    TSyncDetReceituariodataalteracao: TSQLTimeStampField;
    TSyncDetReceituarioidusuarioalteracao: TIntegerField;
    TSyncDetReceituarioidreceiturario: TIntegerField;
    TSyncDetReceituarioidproduto: TIntegerField;
    TSyncDetReceituariosyncaws: TIntegerField;
    TSyncDetReceituariosyncfaz: TIntegerField;
    TSyncDetReceituariofinalidade: TWideStringField;
    TDetReceituarioTalhao: TFDQuery;
    TDetReceituarioTalhaoid: TIntegerField;
    TDetReceituarioTalhaostatus: TIntegerField;
    TDetReceituarioTalhaodatareg: TSQLTimeStampField;
    TDetReceituarioTalhaoidusuario: TIntegerField;
    TDetReceituarioTalhaodataalteracao: TSQLTimeStampField;
    TDetReceituarioTalhaoidusuarioalteracao: TIntegerField;
    TDetReceituarioTalhaoidtalhao: TIntegerField;
    TDetReceituarioTalhaoareahe: TBCDField;
    TDetReceituarioTalhaosyncaws: TIntegerField;
    TDetReceituarioTalhaosyncfaz: TIntegerField;
    TDetReceituarioTalhaoidreceiturario: TIntegerField;
    TDetReceituario: TFDQuery;
    TDetReceituarioid: TIntegerField;
    TDetReceituariostatus: TIntegerField;
    TDetReceituariodatareg: TSQLTimeStampField;
    TDetReceituarioidusuario: TIntegerField;
    TDetReceituariodataalteracao: TSQLTimeStampField;
    TDetReceituarioidusuarioalteracao: TIntegerField;
    TDetReceituarioidreceiturario: TIntegerField;
    TDetReceituarioidproduto: TIntegerField;
    TDetReceituarioproduto: TWideStringField;
    TDetReceituariosyncaws: TIntegerField;
    TDetReceituariofinalidade: TWideStringField;
    Toperacaosafratalhao: TFDQuery;
    Toperacaosafratalhaoid: TIntegerField;
    Toperacaosafratalhaostatus: TIntegerField;
    Toperacaosafratalhaodatareg: TSQLTimeStampField;
    Toperacaosafratalhaoidusuario: TIntegerField;
    Toperacaosafratalhaodataalteracao: TSQLTimeStampField;
    Toperacaosafratalhaoidusuarioalteracao: TIntegerField;
    Toperacaosafratalhaoidsafra: TIntegerField;
    Toperacaosafratalhaoidoperacao: TIntegerField;
    Toperacaosafratalhaodatainicio: TDateField;
    Toperacaosafratalhaodatafim: TDateField;
    Toperacaosafratalhaoobservacao: TWideStringField;
    Toperacaosafratalhaoidtalhao: TIntegerField;
    Toperacaosafratalhaoidresponsavel: TIntegerField;
    Toperacaosafratalhaoareaprevista: TBCDField;
    Toperacaosafratalhaoarearealizada: TBCDField;
    Toperacaosafratalhaotipoterraaereo: TWideStringField;
    Toperacaosafratalhaoidtipoaplicacaosolido: TIntegerField;
    Toperacaosafratalhaoidcultura: TIntegerField;
    Toperacaosafratalhaoidvariedade: TIntegerField;
    Toperacaosafratalhaofinalidade: TWideStringField;
    Toperacaosafratalhaoidreceituario: TIntegerField;
    Toperacaosafratalhaosyncaws: TIntegerField;
    Toperacaosafratalhaosyncfaz: TIntegerField;
    Toperacaosafratalhaoqualidadecobertura: TWideStringField;
    Toperacaosafratalhaoidcobertura: TIntegerField;
    vQRY: TFDQuery;
    Tdetoperacaosafratalhaomaquinasoperadores: TFDQuery;
    Tdetoperacaosafratalhaomaquinasoperadoresid: TIntegerField;
    Tdetoperacaosafratalhaomaquinasoperadoresstatus: TIntegerField;
    Tdetoperacaosafratalhaomaquinasoperadoresdatareg: TSQLTimeStampField;
    Tdetoperacaosafratalhaomaquinasoperadoresidusuario: TIntegerField;
    Tdetoperacaosafratalhaomaquinasoperadoresdataalteracao: TSQLTimeStampField;
    Tdetoperacaosafratalhaomaquinasoperadoresidusuarioalteracao: TIntegerField;
    Tdetoperacaosafratalhaomaquinasoperadoresidoperacaotalhao: TIntegerField;
    Tdetoperacaosafratalhaomaquinasoperadoresidmaquina: TIntegerField;
    Tdetoperacaosafratalhaomaquinasoperadoresoperador: TWideStringField;
    Tdetoperacaosafratalhaomaquinasoperadoresobservacao: TWideStringField;
    Tdetoperacaosafratalhaomaquinasoperadoresdata: TDateField;
    Tdetoperacaosafratalhaomaquinasoperadoreshorainicio: TBCDField;
    Tdetoperacaosafratalhaomaquinasoperadoreshorafim: TBCDField;
    Tdetoperacaosafratalhaomaquinasoperadoreshoraparada: TBCDField;
    Tdetoperacaosafratalhaomaquinasoperadoreshorastrabalhada: TBCDField;
    Tdetoperacaosafratalhaomaquinasoperadoressyncaws: TIntegerField;
    Tdetoperacaosafratalhaomaquinasoperadoresidoperador: TIntegerField;
    Tdetoperacaosafratalhaoocorrencia: TFDQuery;
    Tdetoperacaosafratalhaoocorrenciaid: TIntegerField;
    Tdetoperacaosafratalhaoocorrenciastatus: TIntegerField;
    Tdetoperacaosafratalhaoocorrenciadatareg: TSQLTimeStampField;
    Tdetoperacaosafratalhaoocorrenciaidusuario: TIntegerField;
    Tdetoperacaosafratalhaoocorrenciadataalteracao: TSQLTimeStampField;
    Tdetoperacaosafratalhaoocorrenciaidusuarioalteracao: TIntegerField;
    Tdetoperacaosafratalhaoocorrenciaidoperacaotalhao: TIntegerField;
    Tdetoperacaosafratalhaoocorrenciadataocorrencia: TDateField;
    Tdetoperacaosafratalhaoocorrenciaidtipoocorrencia: TIntegerField;
    Tdetoperacaosafratalhaoocorrenciahora: TTimeField;
    Tdetoperacaosafratalhaoocorrenciadescricao: TWideStringField;
    Tdetoperacaosafratalhaoocorrenciadata: TDateField;
    Tdetoperacaosafratalhaoprodutos: TFDQuery;
    Tdetoperacaosafratalhaoprodutosid: TIntegerField;
    Tdetoperacaosafratalhaoprodutosstatus: TIntegerField;
    Tdetoperacaosafratalhaoprodutosdatareg: TSQLTimeStampField;
    Tdetoperacaosafratalhaoprodutosidusuario: TIntegerField;
    Tdetoperacaosafratalhaoprodutosdataalteracao: TSQLTimeStampField;
    Tdetoperacaosafratalhaoprodutosidusuarioalteracao: TIntegerField;
    Tdetoperacaosafratalhaoprodutosidoperacaotalhao: TIntegerField;
    Tdetoperacaosafratalhaoprodutosidproduto: TIntegerField;
    Tdetoperacaosafratalhaoprodutosobservacao: TWideStringField;
    Tdetoperacaosafratalhaoprodutosdata: TDateField;
    Tdetoperacaosafratalhaoprodutosqtdeutilidado: TBCDField;
    Tdetoperacaosafratalhaoprodutossyncaws: TIntegerField;
    TVazaoOperacao: TFDQuery;
    TVazaoOperacaoid: TIntegerField;
    TVazaoOperacaostatus: TIntegerField;
    TVazaoOperacaodatareg: TSQLTimeStampField;
    TVazaoOperacaoidusuario: TIntegerField;
    TVazaoOperacaodataalteracao: TSQLTimeStampField;
    TVazaoOperacaoidusuarioalteracao: TIntegerField;
    TVazaoOperacaoidoperacaotalhao: TIntegerField;
    TVazaoOperacaocincoltha: TIntegerField;
    TVazaoOperacaodezltha: TIntegerField;
    TVazaoOperacaoquinzeltha: TIntegerField;
    TVazaoOperacaovinteltha: TIntegerField;
    TVazaoOperacaotrintaltha: TIntegerField;
    TVazaoOperacaoquarentaltha: TIntegerField;
    TVazaoOperacaocinquentaltha: TIntegerField;
    TVazaoOperacaosetentaecincoltha: TIntegerField;
    TVazaoOperacaocemltha: TIntegerField;
    TVazaoOperacaosyncaws: TIntegerField;
    TVazaoOperacaosyncfaz: TIntegerField;
    TStandPlantas: TFDQuery;
    TStandPlantasid: TIntegerField;
    TStandPlantasidusuario: TIntegerField;
    TStandPlantasdatasementes: TDateField;
    TStandPlantasidcultura: TIntegerField;
    TStandPlantasidvariedade: TIntegerField;
    TStandPlantasqtdesementes: TBCDField;
    TStandPlantasdataplantas: TDateField;
    TStandPlantasqtdeplantas: TBCDField;
    TStandPlantassyncaws: TIntegerField;
    TStandPlantasstatus: TIntegerField;
    TStandPlantasidtalhao: TIntegerField;
    TStandPlantassyncfaz: TIntegerField;
    TPluviometria: TFDQuery;
    TPluviometriaid: TIntegerField;
    TPluviometriastatus: TIntegerField;
    TPluviometriadatareg: TSQLTimeStampField;
    TPluviometriaidusuario: TIntegerField;
    TPluviometriadataalteracao: TSQLTimeStampField;
    TPluviometriaidusuarioalteracao: TIntegerField;
    TPluviometriaidpluviometro: TIntegerField;
    TPluviometriaidtalhao: TIntegerField;
    TPluviometriavolumemm: TBCDField;
    TPluviometriadatacoleta: TDateField;
    TPluviometriahora: TTimeField;
    TPluviometriasyncaws: TIntegerField;
    TPluviometriasyncfaz: TIntegerField;
    TAbastecimento: TFDQuery;
    TAbastecimentoid: TIntegerField;
    TAbastecimentostatus: TIntegerField;
    TAbastecimentodatareg: TSQLTimeStampField;
    TAbastecimentoidusuario: TIntegerField;
    TAbastecimentodataalteracao: TSQLTimeStampField;
    TAbastecimentoidusuarioalteracao: TIntegerField;
    TAbastecimentoidlocalestoque: TIntegerField;
    TAbastecimentoidmaquina: TIntegerField;
    TAbastecimentoidoperador: TIntegerField;
    TAbastecimentovolumelt: TBCDField;
    TAbastecimentocombustivel: TIntegerField;
    TAbastecimentodataabastecimento: TDateField;
    TAbastecimentohora: TTimeField;
    TAbastecimentosyncaws: TIntegerField;
    TAbastecimentosyncfaz: TIntegerField;
    TAbastecimentohorimetro: TBCDField;
    TAbastecimentoOutros: TFDQuery;
    TAbastecimentoOutrosid: TIntegerField;
    TAbastecimentoOutrosstatus: TIntegerField;
    TAbastecimentoOutrosdatareg: TSQLTimeStampField;
    TAbastecimentoOutrosidusuario: TIntegerField;
    TAbastecimentoOutrosdataalteracao: TSQLTimeStampField;
    TAbastecimentoOutrosidusuarioalteracao: TIntegerField;
    TAbastecimentoOutrosidabastecimento: TIntegerField;
    TAbastecimentoOutrosidproduto: TIntegerField;
    TAbastecimentoOutrosquantidade: TBCDField;
    TAbastecimentoOutrossyncaws: TIntegerField;
    TAbastecimentoOutrossyncfaz: TIntegerField;
    TmonitoramentopragasPontos: TFDQuery;
    TmonitoramentopragasPontosid: TIntegerField;
    TmonitoramentopragasPontosstatus: TIntegerField;
    TmonitoramentopragasPontosdatareg: TSQLTimeStampField;
    TmonitoramentopragasPontosidmonitoramento: TIntegerField;
    TmonitoramentopragasPontosponto: TWideStringField;
    TmonitoramentopragasPontosdataponto: TDateField;
    TmonitoramentopragasPontoshora: TSQLTimeStampField;
    TmonitoramentopragasPontoslatitude: TWideStringField;
    TmonitoramentopragasPontoslongitude: TWideStringField;
    TmonitoramentopragasPontossyncaws: TIntegerField;
    TmonitoramentopragasPontossyncfaz: TIntegerField;
    TmonitoramentopragasPontosValores: TFDQuery;
    TmonitoramentopragasPontosValoresid: TIntegerField;
    TmonitoramentopragasPontosValoresstatus: TIntegerField;
    TmonitoramentopragasPontosValoresdatareg: TSQLTimeStampField;
    TmonitoramentopragasPontosValoresidponto: TIntegerField;
    TmonitoramentopragasPontosValoresidpraga: TIntegerField;
    TmonitoramentopragasPontosValorescontagem: TIntegerField;
    TmonitoramentopragasPontosValoreshora: TSQLTimeStampField;
    TmonitoramentopragasPontosValoressyncaws: TIntegerField;
    TmonitoramentopragasPontosValoressyncfaz: TIntegerField;
    TmonitoramentopragasPontosValorescaracteristica: TIntegerField;
    TMonitoramentoPraga: TFDQuery;
    TMonitoramentoPragaid: TIntegerField;
    TMonitoramentoPragastatus: TIntegerField;
    TMonitoramentoPragadatareg: TSQLTimeStampField;
    TMonitoramentoPragaidusuario: TIntegerField;
    TMonitoramentoPragadataalteracao: TSQLTimeStampField;
    TMonitoramentoPragaidusuarioalteracao: TIntegerField;
    TMonitoramentoPragadatamonitoramento: TDateField;
    TMonitoramentoPragaidtalhao: TIntegerField;
    TMonitoramentoPragahorainicio: TSQLTimeStampField;
    TMonitoramentoPragatipoabertura: TIntegerField;
    TMonitoramentoPragahorafim: TSQLTimeStampField;
    TMonitoramentoPragasyncaws: TIntegerField;
    TMonitoramentoPragasyncfaz: TIntegerField;
    TMonitoramentoPragatagabertura: TWideStringField;
    TMonitoramentoPragatagfechamento: TWideStringField;
    TSyncReceituariodatarecomendacao: TDateField;
    TSyncReceituariodataprevaplicacao: TDateField;
    TReceituariosyncaws: TIntegerField;
    TReceituariosyncfaz: TIntegerField;
    TReceituariodatarecomendacao: TDateField;
    TReceituariodataprevaplicacao: TDateField;
    TMovLocalEstoque: TFDQuery;
    TMovLocalEstoqueid: TIntegerField;
    TMovLocalEstoquestatus: TIntegerField;
    TMovLocalEstoquedatareg: TSQLTimeStampField;
    TMovLocalEstoqueidusuario: TIntegerField;
    TMovLocalEstoquedataalteracao: TSQLTimeStampField;
    TMovLocalEstoqueidusuarioalteracao: TIntegerField;
    TMovLocalEstoqueidlocalestoqueorigem: TIntegerField;
    TMovLocalEstoqueidlocalestoquedetino: TIntegerField;
    TMovLocalEstoqueidproduto: TIntegerField;
    TMovLocalEstoqueqtde: TBCDField;
    TMovLocalEstoquedatamov: TDateField;
    TMovLocalEstoquehora: TTimeField;
    TMovLocalEstoquesyncaws: TIntegerField;
    TMovLocalEstoquesyncfaz: TIntegerField;
    Tdetoperacaosafratalhaomaquinasoperadoresromaneio: TWideStringField;
    TReceituarioobservacao: TWideStringField;
    Tauxatividadeabastecimento: TFDQuery;
    Tauxatividadeabastecimentoid: TIntegerField;
    Tauxatividadeabastecimentostatus: TIntegerField;
    Tauxatividadeabastecimentodatareg: TSQLTimeStampField;
    Tauxatividadeabastecimentoidusuario: TIntegerField;
    Tauxatividadeabastecimentodataalteracao: TSQLTimeStampField;
    Tauxatividadeabastecimentoidusuarioalteracao: TIntegerField;
    Tauxatividadeabastecimentonome: TWideStringField;
    Tauxatividadeabastecimentosyncaws: TIntegerField;
    Tauxatividadeabastecimentosyncfaz: TIntegerField;
    TAbastecimentoidatividade: TIntegerField;
    TAbastecimentoobs: TWideStringField;
    Comprador: TFDQuery;
    Contratos: TFDQuery;
    Embarque: TFDQuery;
    Compradorid: TIntegerField;
    Compradorstatus: TIntegerField;
    Compradordatareg: TSQLTimeStampField;
    Compradoridusuario: TIntegerField;
    Compradordataalteracao: TSQLTimeStampField;
    Compradoridusuarioalteracao: TIntegerField;
    Compradornome: TWideStringField;
    Compradorcidade: TWideStringField;
    Compradoruf: TWideStringField;
    Compradorcpf_cnpj: TWideStringField;
    Compradortelefone_fixo: TWideStringField;
    Compradorcelular: TWideStringField;
    Compradoremail: TWideStringField;
    Compradorcontatopessoa: TWideStringField;
    Compradorsenha: TWideStringField;
    Compradorsyncaws: TIntegerField;
    Compradorrazaosocial: TWideStringField;
    Compradorinscricaoestadual: TWideStringField;
    Compradorsyncfaz: TIntegerField;
    Contratosid: TIntegerField;
    Contratosstatus: TIntegerField;
    Contratosdatareg: TSQLTimeStampField;
    Contratosidusuario: TIntegerField;
    Contratosdataalteracao: TSQLTimeStampField;
    Contratosidusuarioalteracao: TIntegerField;
    Contratosidcomprador: TIntegerField;
    Contratosidcultura: TIntegerField;
    Contratosidsafra: TIntegerField;
    Contratosnumerocontrato: TWideStringField;
    Contratostotalcompravolume: TBCDField;
    Contratostotalcomprasacos: TBCDField;
    Contratostotalembarquevolume: TBCDField;
    Contratostotalembarquesacos: TBCDField;
    Contratossyncaws: TIntegerField;
    Contratossyncfaz: TIntegerField;
    Embarqueid: TIntegerField;
    Embarquestatus: TIntegerField;
    Embarquedatareg: TSQLTimeStampField;
    Embarqueidusuario: TIntegerField;
    Embarquedataalteracao: TSQLTimeStampField;
    Embarqueidusuarioalteracao: TIntegerField;
    Embarqueidcontrato: TIntegerField;
    Embarquenumeronf: TIntegerField;
    Embarqueplaca: TWideStringField;
    Embarquedataembarque: TDateField;
    Embarquehorabarque: TTimeField;
    Embarquetara: TBCDField;
    Embarquebruto: TBCDField;
    Embarqueliquido: TBCDField;
    Embarqueimp: TBCDField;
    Embarquequeb: TBCDField;
    Embarqueverd: TBCDField;
    Embarqueavar: TBCDField;
    Embarqueumid: TBCDField;
    Embarquesyncaws: TIntegerField;
    Embarquesyncfaz: TIntegerField;
    TMaquinasid: TIntegerField;
    TMaquinasstatus: TIntegerField;
    TMaquinasdatareg: TSQLTimeStampField;
    TMaquinasidusuario: TIntegerField;
    TMaquinasdataalteracao: TSQLTimeStampField;
    TMaquinasidusuarioalteracao: TIntegerField;
    TMaquinasidtipo: TIntegerField;
    TMaquinasidmarca: TIntegerField;
    TMaquinasmodelo: TWideStringField;
    TMaquinasplaca: TWideStringField;
    TMaquinasano: TIntegerField;
    TMaquinaschassi: TWideStringField;
    TMaquinascombustivel: TIntegerField;
    TMaquinasvalor: TBCDField;
    TMaquinasnumeroserie: TWideStringField;
    TMaquinasimg: TBlobField;
    TMaquinasprefixo: TWideStringField;
    TMaquinasidcategoria: TIntegerField;
    TMaquinasidsegmento: TIntegerField;
    TMaquinasanomodelo: TIntegerField;
    TMaquinassyncaws: TIntegerField;
    TMaquinassyncfaz: TIntegerField;
    TMaquinasultimarevisao: TDateField;
    TMaquinashorimetroultimarev: TBCDField;
    TMaquinasdepreciacao: TBCDField;
    TMaquinasvidautil: TBCDField;
    TMaquinashorimetroproximarevisao: TBCDField;
    TMaquinashorimetro: TBCDField;
    TMaquinascombustivelstr: TWideMemoField;
    TMaquinascategoria: TWideMemoField;
    TMaquinastipo: TWideStringField;
    TMaquinasmarca: TWideStringField;
    TManutencao: TFDQuery;
    TPlanoManutencao: TFDQuery;
    TUsuariosyncfaz: TIntegerField;
    TUsuariotokenapp: TWideStringField;
    TUsuariotokenappcompras: TWideStringField;
    TUsuarioarmazem: TIntegerField;
    TUsuarioaplicacaosolido: TIntegerField;
    TUsuariopulverizacao: TIntegerField;
    TUsuarioplantio: TIntegerField;
    TUsuariocolheita: TIntegerField;
    TUsuariomonitoramentopragas: TIntegerField;
    TUsuariopluviometria: TIntegerField;
    TUsuariomanutencaomaquinas: TIntegerField;
    TUsuarioabastecimentoexterno: TIntegerField;
    TPlanoManutencaoid: TIntegerField;
    TPlanoManutencaostatus: TIntegerField;
    TPlanoManutencaodatareg: TSQLTimeStampField;
    TPlanoManutencaoidusuario: TIntegerField;
    TPlanoManutencaodataalteracao: TSQLTimeStampField;
    TPlanoManutencaoidusuarioalteracao: TIntegerField;
    TPlanoManutencaonome: TWideStringField;
    TPlanoManutencaointervalohoras: TBCDField;
    TPlanoManutencaosyncaws: TIntegerField;
    TPlanoManutencaosyncfaz: TIntegerField;
    TPlanoRevisaoItens: TFDQuery;
    TPlanoRevisaoItensid: TIntegerField;
    TPlanoRevisaoItensstatus: TIntegerField;
    TPlanoRevisaoItensdatareg: TSQLTimeStampField;
    TPlanoRevisaoItensidusuario: TIntegerField;
    TPlanoRevisaoItensdataalteracao: TSQLTimeStampField;
    TPlanoRevisaoItensidusuarioalteracao: TIntegerField;
    TPlanoRevisaoItensidrevisao: TIntegerField;
    TPlanoRevisaoItenssyncaws: TIntegerField;
    TPlanoRevisaoItenssyncfaz: TIntegerField;
    TPlanoRevisaoItensidproduto: TIntegerField;
    TPlanoRevisaoItensqtde: TBCDField;
    TPlanoRevisaoItenstipo: TIntegerField;
    TPlanoRevisaoItensobservacao: TWideStringField;
    TPlanoRevisaoItensitem: TWideStringField;
    TPlanoRevisaoItensiditem: TIntegerField;
    TPlanoRevisaoMaquinas: TFDQuery;
    TPlanoRevisaoMaquinasid: TIntegerField;
    TPlanoRevisaoMaquinasstatus: TIntegerField;
    TPlanoRevisaoMaquinasdatareg: TSQLTimeStampField;
    TPlanoRevisaoMaquinasidusuario: TIntegerField;
    TPlanoRevisaoMaquinasdataalteracao: TSQLTimeStampField;
    TPlanoRevisaoMaquinasidusuarioalteracao: TIntegerField;
    TPlanoRevisaoMaquinasidrevisao: TIntegerField;
    TPlanoRevisaoMaquinasidmaquina: TIntegerField;
    TPlanoRevisaoMaquinassyncaws: TIntegerField;
    TPlanoRevisaoMaquinassyncfaz: TIntegerField;
    TAuxRevisaoItem: TFDQuery;
    TProdutosInsert: TFDQuery;
    TSyncDetReceituarioqtdporhe: TBCDField;
    TDetReceituarioqtdporhe: TBCDField;
    TDetReceituariosyncfaz: TIntegerField;
    TPlanoRevisaoItensInsert: TFDQuery;
    TPlanoRevisaoItensInsertinsert: TWideMemoField;
    TPlanoRevisaoMaquinasInsert: TFDQuery;
    TPlanoRevisaoMaquinasInsertinsert: TWideMemoField;
    TAuxRevisaoIteminsert: TWideMemoField;
    TPluviometroTalhoesinsert: TWideMemoField;
    TManutencaoinsert: TWideMemoField;
    TPostRevisaoServico: TFDQuery;
    TPostRevisaoItem: TFDQuery;
    TPostRevisaoItemid: TIntegerField;
    TPostRevisaoItemstatus: TIntegerField;
    TPostRevisaoItemdatareg: TSQLTimeStampField;
    TPostRevisaoItemidusuario: TIntegerField;
    TPostRevisaoItemdataalteracao: TSQLTimeStampField;
    TPostRevisaoItemidusuarioalteracao: TIntegerField;
    TPostRevisaoItemidrevisao: TIntegerField;
    TPostRevisaoItemsyncaws: TIntegerField;
    TPostRevisaoItemsyncfaz: TIntegerField;
    TPostRevisaoItemidproduto: TIntegerField;
    TPostRevisaoItemqtde: TBCDField;
    TPostRevisaoItemitem: TWideStringField;
    TPostRevisaoItemtipo: TIntegerField;
    TPostRevisaoItemobservacao: TWideStringField;
    TPostRevisaoItemiditem: TIntegerField;
    TPostRevisao: TFDQuery;
    TPostAuxItemRevisao: TFDQuery;
    TPostAuxItemRevisaoid: TIntegerField;
    TPostAuxItemRevisaostatus: TIntegerField;
    TPostAuxItemRevisaodatareg: TSQLTimeStampField;
    TPostAuxItemRevisaoidusuario: TIntegerField;
    TPostAuxItemRevisaodataalteracao: TSQLTimeStampField;
    TPostAuxItemRevisaoidusuarioalteracao: TIntegerField;
    TPostAuxItemRevisaonome: TWideStringField;
    TPostAuxItemRevisaogrupo: TWideStringField;
    TPostAuxItemRevisaosyncaws: TIntegerField;
    TPostAuxItemRevisaosyncfaz: TIntegerField;
    TPostRevisaoServicoid: TIntegerField;
    TPostRevisaoServicostatus: TIntegerField;
    TPostRevisaoServicodatareg: TSQLTimeStampField;
    TPostRevisaoServicoidusuario: TIntegerField;
    TPostRevisaoServicodataalteracao: TSQLTimeStampField;
    TPostRevisaoServicoidusuarioalteracao: TIntegerField;
    TPostRevisaoServicotiposervico: TIntegerField;
    TPostRevisaoServicoidrevisao: TIntegerField;
    TPostRevisaoServicodescricao: TWideStringField;
    TPostRevisaoServicoresponsavel: TWideStringField;
    TPostRevisaoServicovalortotal: TBCDField;
    TPostRevisaoServicosyncaws: TIntegerField;
    TPostRevisaoServicosyncfaz: TIntegerField;
    TPostRevisaoServicodatarealizado: TDateField;
    TPostRevisaoid: TIntegerField;
    TPostRevisaostatus: TIntegerField;
    TPostRevisaodatareg: TSQLTimeStampField;
    TPostRevisaoidusuario: TIntegerField;
    TPostRevisaodataalteracao: TSQLTimeStampField;
    TPostRevisaoidusuarioalteracao: TIntegerField;
    TPostRevisaoidplanorevisao: TIntegerField;
    TPostRevisaoidmaquina: TIntegerField;
    TPostRevisaoobservacao: TWideStringField;
    TPostRevisaodatainicio: TDateField;
    TPostRevisaodatafim: TDateField;
    TPostRevisaosyncaws: TIntegerField;
    TPostRevisaosyncfaz: TIntegerField;
    TPostRevisaoidresponsavel: TIntegerField;
    TPostRevisaohorimetro: TBCDField;
    TPostRevisaotipo: TIntegerField;
    TPostRevisaohorimetroproxima: TBCDField;
    TAbastecimentoimg: TWideMemoField;
    TAbastecimentoimg2: TWideMemoField;
    TAbastecimentoimg3: TWideMemoField;
    TAbastecimentoimg4: TWideMemoField;
    TAbastecimentoimg5: TWideMemoField;
    TAbastecimentoexterno: TIntegerField;
    Desembarques: TFDQuery;
    Desembarquesid: TIntegerField;
    Desembarquesstatus: TIntegerField;
    Desembarquesdatareg: TSQLTimeStampField;
    Desembarquesidusuario: TIntegerField;
    Desembarquesdataalteracao: TSQLTimeStampField;
    Desembarquesidusuarioalteracao: TIntegerField;
    Desembarquesidsafra: TIntegerField;
    Desembarquesidtalhao: TIntegerField;
    Desembarquesidcultura: TIntegerField;
    Desembarquesplaca: TWideStringField;
    Desembarquesdatadesembarque: TDateField;
    Desembarqueshoradesembarque: TTimeField;
    Desembarquestara: TBCDField;
    Desembarquesbruto: TBCDField;
    Desembarquesliquido: TBCDField;
    Desembarquesimp: TBCDField;
    Desembarquesqueb: TBCDField;
    Desembarquesverd: TBCDField;
    Desembarquesavar: TBCDField;
    Desembarquesumid: TBCDField;
    Desembarquessyncaws: TIntegerField;
    Desembarquessyncfaz: TIntegerField;
    Desembarquesvalornf: TBCDField;
    procedure TPostAuxItemRevisaoReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
  private
    function  LerIni(Diretorio,Chave1, Chave2, ValorPadrao: String): String;
    function  VerificaStatusReceituario(idReceituario: string): string;
    function  VerificaOperacaoMaquinaExiste(idMaquina,idOperacao: string): string;
    function  VerificaOperacaoProdutoExiste(idProduto,idOperacao: string): string;
    function  VerificaOperacaoReceituarioExiste(idTalhao,idReceituario: string): string;
    function  VerificaIdExisteLocal(Tabela,Id:string):Boolean;
    procedure AbreDetRectalhao(ID: STRING);
    function  RetornaMaxIdOperacao: string;
    procedure AlteraStatusReceituario(vid: string);
    function  VerificaPliviometria(idTalhao,vData,vHora:string): Boolean;
    function  VerificaAbastecimentoOutro(idAbastecimento,vIdProduto: string):Boolean;
    function  VerificaAbastecimento(idMaquia, vData, vLitros,horimetro: string): Boolean;
    function  RetornaMaxIdGenerico(Atabela: string): string;
    function  RetornaIdUsuario(ANome: string): string;
    procedure InsereSaidaAbastecimento(dataSaida, idcentrocusto,
     idlocalestoque, idproduto, qtditens, idresponsavel,idabastecimento: string);
    procedure AtualizaHorimetroMaquina(horimetro,Idmaquina:string);
  public
    function  GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
    function  ConectaPG_AWS:TJSONObject;
    function  ConectaPG_Local:TJSONObject;
    procedure AtualizaSequencias;
    function  GetUsuariosAGRI             : TJSONObject;
    function  GetPragas                   : TJSONObject;
    function  GetOperadorMaquinas         : TJSONObject;
    function  GetCobertura                : TJSONObject;
    function  GetMaquinas                 : TJSONObject;
    function  GetProdutos                 : TJSONObject;
    function  GetOperacoes                : TJSONObject;
    function  GetAreas                    : TJSONObject;
    function  GetSetores                  : TJSONObject;
    function  GetTalhoes                  : TJSONObject;
    function  GetPluviometro              : TJSONObject;
    function  GetPluviometroTalhoes       : TJSONObject;
    function  GetLocalEstoque             : TJSONObject;
    function  GetSafra                    : TJSONObject;
    function  GetCulturas                 : TJSONObject;
    function  GetCultivares               : TJSONObject;
    function  GetTipoOcorrencia           : TJSONObject;
    function  GetAuxTipoAplicacaoSolido   : TJSONObject;
    function  GetReceituario              : TJSONObject;
    function  GetTestaServidor            : TJSONObject;
    function  GetAtividadeAbastecimento   : TJSONObject;
    function  GetContratos                : TJSONObject;
    function  GetComprador                : TJSONObject;
    function  GetPlanoRevisao             : TJSONObject;
    function  GetPlanoRevisaoItens        : TJSONObject;
    function  GetPlanoRevisaoMaquinas     : TJSONObject;
    function  GetAuxRevisaoItems          : TJSONObject;
    function  GetRevisao                  : TJSONObject;
    function  GetTipoDB                   : TJSONObject;

    function  AcceptGetDetReceituario(obj: TJSONObject)             : TJSONObject;
    function  AcceptGetDetReceituarioTalhao(obj: TJSONObject)       : TJSONObject;


    function  AcceptGetMudaStatusReceituario(obj: TJSONObject)      : TJSONObject;
    function  AcceptTonkenApp(T: TJSONObject): TJSONObject;

    function  AcceptOperacaoSafraReceituario(obj: TJSONObject)      : TJSONObject;
    function  AcceptOperacaoDetReceituario(obj: TJSONObject)        : TJSONObject;
    function  AcceptOperacaoDetReceituarioTalhao(obj: TJSONObject)  : TJSONObject;

    function  AcceptOperacaoSafraTalhao(obj: TJSONObject)           : TJSONObject;
    function  AcceptOperacaoSafraTalhaoMaquinas(obj: TJSONObject)   : TJSONObject;
    function  AcceptOperacaoSafraTalhaoProduto(obj: TJSONObject)    : TJSONObject;
    function  AcceptOperacaoSafraTalhaoOcorrencia(obj: TJSONObject) : TJSONObject;
    function  AcceptOperacaoSafraVasao(obj: TJSONObject)            : TJSONObject;
    function  AcceptOperacaoStandPlantas(obj: TJSONObject)          : TJSONObject;
    function  AcceptPluviometria(obj: TJSONObject)                  : TJSONObject;
    function  AcceptAbastecimento(obj: TJSONObject)                 : TJSONObject;
    function  AcceptAbastecimentoOutros(obj: TJSONObject)           : TJSONObject;
    function  AcceptMovLocalEstoque(obj: TJSONObject)               : TJSONObject;

    function  AcceptMonitoramento(obj: TJSONObject)                 : TJSONObject;
    function  AcceptMonitoramentoPontos(obj: TJSONObject)           : TJSONObject;
    function  AcceptMonitoramentoPontosValores(obj: TJSONObject)    : TJSONObject;
    function  AcceptEmbarques(obj: TJSONObject): TJSONObject;
    function  AcceptDesembarques(obj: TJSONObject): TJSONObject;

    function  AcceptAuxRevisaoItens(obj: TJSONObject): TJSONObject;
    function  AcceptRevisao(obj: TJSONObject): TJSONObject;
    function  AcceptRevisaoItens(obj: TJSONObject): TJSONObject;
    function  AcceptRevisaoServico(obj: TJSONObject): TJSONObject;

    procedure AtualizaSaldoContrato(idContrato:string);
    procedure AtaulizaSaldoAtualCustoMedio(idProduto: string);

   end;

var
  dmDB: TdmDB;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses UPrincipal;

{$R *.dfm}

{ TdmDB }

function TdmDB.AcceptOperacaoDetReceituario(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  nome:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  if FDConPG.Connected=false then ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TSyncDetReceituario.Connection := FDConPG;
  TSyncDetReceituario.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TSyncDetReceituario.Filtered := false;
    TSyncDetReceituario.Close;
    TSyncDetReceituario.Open;
    if VerificaIdExisteLocal('DetReceiturario',vQry.FieldByName('id').AsString)then
      TSyncDetReceituario.Insert
     else
     begin
      TSyncDetReceituario.Filtered := false;
      TSyncDetReceituario.Filter   := 'id='+vQry.FieldByName('id').AsString;
      TSyncDetReceituario.Filtered := True;
      TSyncDetReceituario.edit;
     end;
     TSyncDetReceituariostatus.AsString               :=vQry.FieldByName('status').AsString;
     TSyncDetReceituarioidusuario.AsString            :=vQry.FieldByName('idusuario').AsString;
     TSyncDetReceituarioidreceiturario.AsString       :=vQry.FieldByName('idreceiturario').AsString;
     TSyncDetReceituarioidusuarioalteracao.AsString   :=vQry.FieldByName('idusuarioalteracao').AsString;
     TSyncDetReceituariofinalidade.AsString           :=vQry.FieldByName('finalidade').AsString;
     TSyncDetReceituarioqtdporhe.AsString             :=vQry.FieldByName('qtdporhe').AsString;
     TSyncDetReceituarioidproduto.AsString            :=vQry.FieldByName('idproduto').AsString;
     try
      TSyncDetReceituario.ApplyUpdates(-1);
      if vIdResult.Length>0 then
       vIdResult                              :=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult                              :=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Pedido:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptOperacaoDetReceituarioTalhao(
  obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  if FDConPG.Connected=false then ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TSyncDetReceituario.Connection := FDConPG;
  TSyncDetReceituario.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TDetReceituarioTalhao.Filtered := false;
    TDetReceituarioTalhao.Close;
    TDetReceituarioTalhao.Open;
    if VerificaIdExisteLocal('detreceiturarioTalhao',vQry.FieldByName('id').AsString)then
      TDetReceituarioTalhao.Insert
     else
     begin
      TDetReceituarioTalhao.Filtered := false;
      TDetReceituarioTalhao.Filter   := 'id='+vQry.FieldByName('id').AsString;
      TDetReceituarioTalhao.Filtered := True;
      TDetReceituarioTalhao.edit;
     end;

     for x := 0 to TDetReceituarioTalhao.Fields.Count -1 do
     begin
      vField  := StringReplace(TDetReceituarioTalhao.Fields[x].Name,
       'TDetReceituarioTalhao','',[rfReplaceAll]);
      if vField<>'datareg' then
       TDetReceituarioTalhao.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
     end;
     try
      TDetReceituarioTalhao.ApplyUpdates(-1);
      if vIdResult.Length>0 then
       vIdResult                              :=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult                              :=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Det Rec Talhao:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptOperacaoSafraReceituario(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  nome:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  : string;
  IStatus    : integer;
begin
  if FDConPG.Connected=false then
   ConectaPG_Local;
  TSyncReceituario.Connection := FDConPG;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TSyncReceituario.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
     if VerificaIdExisteLocal('receiturario ',vQry.FieldByName('id').AsString)then
     begin
      TSyncReceituario.Insert;
      TSyncReceituarioid.AsString:=vQry.FieldByName('id').AsString;
     end
     else
     begin
      TSyncReceituario.Filtered := false;
      TSyncReceituario.Filter   := 'id='+vQry.FieldByName('id').AsString;
      TSyncReceituario.Filtered := True;
      TSyncReceituario.edit;
      if TSyncReceituariostatus.AsInteger=0 then
       TSyncReceituariostatus.AsInteger:=1
      else
       TSyncReceituariostatus.AsString   := vQry.FieldByName('status').AsString;
     end;
     TSyncReceituariodatarecomendacao.AsString     :=vQry.FieldByName('datarecomendacao').AsString;
     TSyncReceituariodataprevaplicacao.AsString    :=vQry.FieldByName('dataprevaplicacao').AsString;
     TSyncReceituarioidusuario.AsString            :=RetornaIdUsuario(vQry.FieldByName('Nome').AsString);
     TSyncReceituarioNome.AsString                 :=vQry.FieldByName('Nome').AsString;
     TSyncReceituarioidresponsavel.AsString        :=RetornaIdUsuario(vQry.FieldByName('Nome').AsString);
     try
      TSyncReceituario.ApplyUpdates(-1);
      if vIdResult.Length>0 then
       vIdResult                              :=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult                              :=vQry.FieldByName('id').AsString;
       FDConPG.Commit;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Pedido:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptOperacaoSafraTalhao(obj: TJSONObject): TJSONObject;
var
 vJsonString :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
 vIdPedido,vIdentificador,vIdOperacaoExiste:string;
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 I          : Integer;
begin
 if FDConPG.Connected=false then
  ConectaPG_Local;
 vJsonString := obj.ToString;
 vJoInsert := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
 vJoItem := vJoInsert.GetValue('OperacaoSafra') as TJSONArray;
 frmPrincipal.mlog.Lines.Add('Sincronizando Operacao');
 frmPrincipal.mlog.Lines.Add(vJsonString);
 try
  for i := 0 to vJoItem.Count-1 do
  begin
    vJoItemO := vJoItem.Items[I] as TJSONObject;
    frmPrincipal.mlog.Lines.Add('Lendo e Inserindo Json');
    if (vJoItemO.GetValue('idTalhao').value.Length>0) and
    (vJoItemO.GetValue('idreceituario').value.Length>0) then
    begin
     vIdOperacaoExiste := VerificaOperacaoReceituarioExiste(vJoItemO.GetValue('idTalhao').value,
      vJoItemO.GetValue('idreceituario').value);
    end;
    Toperacaosafratalhao.Close;
    Toperacaosafratalhao.Open;
    Toperacaosafratalhao.Insert;
    Toperacaosafratalhaoidusuario.AsString           := vJoItemO.GetValue('idUsuario').value;
    Toperacaosafratalhaoidsafra.AsString             := vJoItemO.GetValue('idSafra').value;
    Toperacaosafratalhaoidoperacao.AsString          := vJoItemO.GetValue('idOperacao').value;
    Toperacaosafratalhaodatainicio.AsString          := vJoItemO.GetValue('dataInicio').value;
    Toperacaosafratalhaodatafim.AsString             := vJoItemO.GetValue('dataFim').value;
    Toperacaosafratalhaoobservacao.AsString          := vJoItemO.GetValue('observacao').value;
    if vJoItemO.GetValue('idTalhao').value='' then
     Toperacaosafratalhaoidtalhao.AsString            :='90001'
    else
     Toperacaosafratalhaoidtalhao.AsString            := vJoItemO.GetValue('idTalhao').value;
    Toperacaosafratalhaoidresponsavel.AsString       := vJoItemO.GetValue('idUsuario').value;
    Toperacaosafratalhaoareaprevista.AsString        := vJoItemO.GetValue('areaPrev').value;
    Toperacaosafratalhaoarearealizada.AsString       := vJoItemO.GetValue('areaReal').value;
    if vJoItemO.GetValue('qualidadeCobertura').value='Exelente' then
     Toperacaosafratalhaoqualidadecobertura.AsString := 'Excelente'
    else
     Toperacaosafratalhaoqualidadecobertura.AsString := vJoItemO.GetValue('qualidadeCobertura').value;
    Toperacaosafratalhaoidcobertura.AsString         := vJoItemO.GetValue('idcobertura').value;
    Toperacaosafratalhaoidvariedade.AsString         := vJoItemO.GetValue('idvariedade').value;
    Toperacaosafratalhaostatus.AsInteger             := 2;
    if vJoItemO.GetValue('finalidade').Value.Length>0 then
     Toperacaosafratalhaofinalidade.AsString  := vJoItemO.GetValue('finalidade').value;
    if (vJoItemO.GetValue('IdTipoaplicacaosolido').Value.Length>0)and
     (vJoItemO.GetValue('idOperacao ').Value<>'5') then
     Toperacaosafratalhaoidtipoaplicacaosolido.AsString  := vJoItemO.GetValue('IdTipoaplicacaosolido').value;
    if vJoItemO.GetValue('idcultura').Value.Length>0 then
     Toperacaosafratalhaoidcultura.AsString  := vJoItemO.GetValue('idcultura').value;
    if (vJoItemO.GetValue('idreceituario').Value.Length>0)and
     (vJoItemO.GetValue('idOperacao ').Value<>'5') then
     Toperacaosafratalhaoidreceituario.AsString  := vJoItemO.GetValue('idreceituario').value;
    if (vJoItemO.GetValue('tipoterraaereo').Value.Length>0)and
     (vJoItemO.GetValue('idOperacao ').Value<>'5') then
     Toperacaosafratalhaotipoterraaereo.AsString  := vJoItemO.GetValue('tipoterraaereo').value;
    try
     frmPrincipal.mlog.Lines.Add('Confirmando Inserção');
     Toperacaosafratalhao.ApplyUpdates(-1);
     if (vJoItemO.GetValue('idreceituario').value.Length>0)and
     (vJoItemO.GetValue('idOperacao ').Value<>'5') then
     begin
      frmPrincipal.mlog.Lines.Add('Alterando Status Receituraio');
      AlteraStatusReceituario(vJoItemO.GetValue('idreceituario').value);
     end;
     frmPrincipal.mlog.Lines.Add('Pegando Identificador');
     if vIdOperacaoExiste.Length>0 then
      vIdentificador := vIdOperacaoExiste
     else
      vIdentificador := RetornaMaxIdOperacao;

     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     txtJson.WriteStartObject;
     frmPrincipal.mlog.Lines.Add('Enviado com Sucesso!');
     txtJson.WritePropertyName('Ok');
     txtJson.WriteValue(vIdentificador);
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
    except
     on E: Exception do
     begin
      StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       txtJson.WritePropertyName('Erro');
       frmPrincipal.mlog.Lines.Add('Erro Ao Sincronizar Operacao:'+E.Message);
       txtJson.WriteValue('Erro Ao Sincronizar Operacao:'+E.Message);
       txtJson.WriteEndObject;
       Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
     end;
    end;
  end;
 except
 on E: Exception do
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
    frmPrincipal.mlog.Lines.Add('Erro Ao Sincronizar Operacao:'+E.Message);
    txtJson.WritePropertyName('Erro');
    txtJson.WriteValue('Erro Ao Sincronizar Pedido:'+E.Message);
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
 end;
end;

function TdmDB.AcceptOperacaoSafraTalhaoMaquinas(obj: TJSONObject): TJSONObject;
var
 vJsonString :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
 vIdPedido,vIdentificador,vIdMaquinaExiste:string;
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 I          : Integer;
begin
 if FDConPG.Connected=false then ConectaPG_Local;
  Tdetoperacaosafratalhaomaquinasoperadores.Close;
 Tdetoperacaosafratalhaomaquinasoperadores.Open;
 vJsonString := obj.ToString;
 vJoInsert := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
 vJoItem := vJoInsert.GetValue('OperacaoSafraMaquina') as TJSONArray;
 try
  for i := 0 to vJoItem.Count-1 do
  begin
    vJoItemO := vJoItem.Items[I] as TJSONObject;
    vIdMaquinaExiste:=dmDB.VerificaOperacaoMaquinaExiste(vJoItemO.GetValue('idMaquina').value,
     vJoItemO.GetValue('idOperacao').value);

    if vIdMaquinaExiste.Length>0 then
     Tdetoperacaosafratalhaomaquinasoperadores.edit
    else
     Tdetoperacaosafratalhaomaquinasoperadores.Insert;

    frmPrincipal.mlog.Lines.Add('Recebendo Maquinas Operacao:'+vJoItemO.GetValue('idOperacao').value);
    Tdetoperacaosafratalhaomaquinasoperadoresidusuario.AsString             := vJoItemO.GetValue('idUsuario').value;
    Tdetoperacaosafratalhaomaquinasoperadoresidoperacaotalhao.AsString      := vJoItemO.GetValue('idOperacao').value;
    Tdetoperacaosafratalhaomaquinasoperadoresidmaquina.AsString             := vJoItemO.GetValue('idMaquina').value;
    Tdetoperacaosafratalhaomaquinasoperadoresoperador.AsString              := vJoItemO.GetValue('operador').value;
    Tdetoperacaosafratalhaomaquinasoperadoreshorainicio.AsString            := vJoItemO.GetValue('horaInicio').value;
    Tdetoperacaosafratalhaomaquinasoperadoreshorafim.AsString               := vJoItemO.GetValue('horaFim').value;
    Tdetoperacaosafratalhaomaquinasoperadoreshoraparada.AsString            := vJoItemO.GetValue('horaParado').value;
    Tdetoperacaosafratalhaomaquinasoperadoreshorastrabalhada.AsString       := vJoItemO.GetValue('horaTrabalhada').value;
    Tdetoperacaosafratalhaomaquinasoperadoresobservacao.AsString            := vJoItemO.GetValue('observacao').value;
    Tdetoperacaosafratalhaomaquinasoperadoresdata.AsString                  := vJoItemO.GetValue('data').value;
    Tdetoperacaosafratalhaomaquinasoperadoresidoperador.AsString            := vJoItemO.GetValue('idOperador').value;
    Tdetoperacaosafratalhaomaquinasoperadoresromaneio.AsString              := vJoItemO.GetValue('romaneio').value;
    try
     frmPrincipal.mlog.Lines.Add('Tdetoperacaosafratalhaomaquinasoperadores.ApplyUpdates(-1)');
     Tdetoperacaosafratalhaomaquinasoperadores.ApplyUpdates(-1);
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('Ok');
     frmPrincipal.mlog.Lines.Add('Maquina Sincronizada com sucesso');
     txtJson.WriteValue('Maquina Sincronizada com sucesso');
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
    except
     on E: Exception do
     begin
      StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       txtJson.WritePropertyName('Erro');
       frmPrincipal.mlog.Lines.Add('Erro Ao Sincronizar Maquina:'+E.Message);
       txtJson.WriteValue('Erro Ao Sincronizar Maquina:'+E.Message);
       txtJson.WriteEndObject;
       Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
     end;
    end;
  end;
 except
 on E: Exception do
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('Erro');
    txtJson.WriteValue('Erro Ao Sincronizar Maquina:'+E.Message);
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
 end;
end;

function TdmDB.AcceptOperacaoSafraTalhaoOcorrencia(
  obj: TJSONObject): TJSONObject;
var
 vJsonString :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
 vIdPedido,vIdentificador:string;
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 I          : Integer;
begin
 if FDConPG.Connected=false then ConectaPG_Local;
 Tdetoperacaosafratalhaoocorrencia.Close;
 Tdetoperacaosafratalhaoocorrencia.Open;
 vJsonString := obj.ToString;
 vJoInsert := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
 vJoItem := vJoInsert.GetValue('OperacaoSafraOcorrencia') as TJSONArray;
 try
  for i := 0 to vJoItem.Count-1 do
  begin
    vJoItemO := vJoItem.Items[I] as TJSONObject;
    Tdetoperacaosafratalhaoocorrencia.Insert;
    Tdetoperacaosafratalhaoocorrenciaidusuario.AsString           := vJoItemO.GetValue('idUsuario').value;
    Tdetoperacaosafratalhaoocorrenciaidoperacaotalhao.AsString    := vJoItemO.GetValue('idOperacao').value;
    Tdetoperacaosafratalhaoocorrenciadataocorrencia.AsString      := vJoItemO.GetValue('data').value;
    Tdetoperacaosafratalhaoocorrenciaidtipoocorrencia.AsString    := vJoItemO.GetValue('idTipoOcorrencia').value;
    Tdetoperacaosafratalhaoocorrenciahora.AsString                := vJoItemO.GetValue('hora').value;
    Tdetoperacaosafratalhaoocorrenciadescricao.AsString           := vJoItemO.GetValue('descricao').value;
    Tdetoperacaosafratalhaoocorrenciadata.AsString                := vJoItemO.GetValue('data').value;
    try
     Tdetoperacaosafratalhaoocorrencia.ApplyUpdates(-1);
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('Ok');
     txtJson.WriteValue('Ocorrencia Sincronizada com sucesso');
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
    except
     on E: Exception do
     begin
      StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       txtJson.WritePropertyName('Erro');
       txtJson.WriteValue('Erro Ao Sincronizar Ocorrencia:'+E.Message);
       txtJson.WriteEndObject;
       Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
     end;
    end;
  end;
 except
 on E: Exception do
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('Erro');
    txtJson.WriteValue('Erro Ao Sincronizar Ocorrencia:'+E.Message);
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
 end;
end;

function TdmDB.AcceptOperacaoSafraTalhaoProduto(obj: TJSONObject): TJSONObject;
var
 vJsonString :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
 vIdPedido,vIdentificador,vIdProdutoExiste:string;
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 I          : Integer;
begin
 if FDConPG.Connected=false then ConectaPG_Local;
 Tdetoperacaosafratalhaoprodutos.Close;
 Tdetoperacaosafratalhaoprodutos.Open;
 vJsonString := obj.ToString;
 vJoInsert := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
 vJoItem := vJoInsert.GetValue('OperacaoSafraProduto') as TJSONArray;
 try
  for i := 0 to vJoItem.Count-1 do
  begin
    vJoItemO := vJoItem.Items[I] as TJSONObject;
    vIdProdutoExiste   :=  dmDB.VerificaOperacaoProdutoExiste(vJoItemO.GetValue('idProduto').value,
     vJoItemO.GetValue('idOperacao').value);
    if vIdProdutoExiste.Length>0 then
    begin
     Tdetoperacaosafratalhaoprodutos.edit;
    end
    else
     Tdetoperacaosafratalhaoprodutos.Insert;
    frmPrincipal.mlog.Lines.Add('Recebendo Produtos Operacao:'+vJsonString);
    frmPrincipal.mlog.Lines.Add(vJoItemO.GetValue('idUsuario').value);
    Tdetoperacaosafratalhaoprodutosidusuario.AsString           := vJoItemO.GetValue('idUsuario').value;
    frmPrincipal.mlog.Lines.Add(vJoItemO.GetValue('idOperacao').value);
    Tdetoperacaosafratalhaoprodutosidoperacaotalhao.AsString    := vJoItemO.GetValue('idOperacao').value;
    frmPrincipal.mlog.Lines.Add(vJoItemO.GetValue('idProduto').value);
    Tdetoperacaosafratalhaoprodutosidproduto.AsString           := vJoItemO.GetValue('idProduto').value;
    frmPrincipal.mlog.Lines.Add(vJoItemO.GetValue('qtde').value);
    Tdetoperacaosafratalhaoprodutosqtdeutilidado.AsString       := StringReplace(vJoItemO.GetValue('qtde').value,'.',',',[rfReplaceAll]);
    frmPrincipal.mlog.Lines.Add(vJoItemO.GetValue('observacao').value);
    Tdetoperacaosafratalhaoprodutosobservacao.AsString          := vJoItemO.GetValue('observacao').value;
    frmPrincipal.mlog.Lines.Add(vJoItemO.GetValue('data').value);
    Tdetoperacaosafratalhaoprodutosdata.AsString                := vJoItemO.GetValue('data').value;
    try
     frmPrincipal.mlog.Lines.Add('Tdetoperacaosafratalhaoprodutos.ApplyUpdates(-1)');
     Tdetoperacaosafratalhaoprodutos.ApplyUpdates(-1);
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('Ok');
     frmPrincipal.mlog.Lines.Add('Produto Sincronizada com sucesso');
     txtJson.WriteValue('Produto Sincronizada com sucesso');
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
    except
     on E: Exception do
     begin
      StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       txtJson.WritePropertyName('Erro');
       frmPrincipal.mlog.Lines.Add('Erro Ao Sincronizar Produto:'+E.Message);
       txtJson.WriteValue('Erro Ao Sincronizar Produto:'+E.Message);
       txtJson.WriteEndObject;
       Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
     end;
    end;
  end;
 except
 on E: Exception do
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('Erro');
    frmPrincipal.mlog.Lines.Add('Erro Ao Sincronizar Produto:'+E.Message);
    txtJson.WriteValue('Erro Ao Sincronizar Produto:'+E.Message);
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
 end;
end;

function TdmDB.AcceptOperacaoSafraVasao(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  if FDConPG.Connected=false then ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TVazaoOperacao.Connection := FDConPG;
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TVazaoOperacao.Filtered := false;
    TVazaoOperacao.Close;
    TVazaoOperacao.Open;
    if VerificaIdExisteLocal('DetVazaoOperacao',vQry.FieldByName('id').AsString)then
      TVazaoOperacao.Insert
     else
     begin
      TVazaoOperacao.Filtered := false;
      TVazaoOperacao.Filter   := 'id='+vQry.FieldByName('id').AsString;
      TVazaoOperacao.Filtered := True;
      TVazaoOperacao.edit;
     end;

     for x := 0 to TVazaoOperacao.Fields.Count -1 do
     begin
      vField  := StringReplace(TVazaoOperacao.Fields[x].Name,
       'TVazaoOperacao','',[rfReplaceAll]);
      if(vField<>'datareg') and (vField<>'id') then
       TVazaoOperacao.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
     end;
     try
      TVazaoOperacao.ApplyUpdates(-1);
      if vIdResult.Length>0 then
       vIdResult                              :=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult                              :=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Vazao Rec Talhao:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;

end;

function TdmDB.AcceptOperacaoStandPlantas(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  if FDConPG.Connected=false then
   ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TStandPlantas.Connection := FDConPG;
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TStandPlantas.Filtered := false;
    TStandPlantas.Close;
    TStandPlantas.Open;
    if VerificaIdExisteLocal('StandSementes',vQry.FieldByName('id').AsString)then
      TStandPlantas.Insert
     else
     begin
      TStandPlantas.Filtered := false;
      TStandPlantas.Filter   := 'id='+vQry.FieldByName('id').AsString;
      TStandPlantas.Filtered := True;
      TStandPlantas.edit;
     end;

     for x := 0 to TStandPlantas.Fields.Count -1 do
     begin
      vField  := StringReplace(TStandPlantas.Fields[x].Name,
       'TStandPlantas','',[rfReplaceAll]);
      if vField<>'datareg' then
       TStandPlantas.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
     end;
     try
      TStandPlantas.ApplyUpdates(-1);
      if vIdResult.Length>0 then
       vIdResult                              :=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult                              :=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Stand Platas:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.VerificaPliviometria(idTalhao,vData,vHora:string): Boolean;
var
 vQry:TFDQuery;
begin
 vQry            := TFDQuery.Create(nil);
 vQry.Connection := FDConPG;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from pluviometria');
   Add('where status=1 and datacoleta='+vData);
   Add('and hora='+vHora);
   Add('and idtalhao='+idTalhao);
   try
     Open;
     Result := vQry.IsEmpty;
   except
    on E: Exception do
     frmPrincipal.mlog.Lines.Add('Erro Verifica Pluviometria:'+vQry.FieldByName('id').AsString+' '+e.Message);
   end;
 end;
 vQry.Free;
end;

function TdmDB.AcceptPluviometria(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  if FDConPG.Connected=false then
   ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TPluviometria.Connection := FDConPG;
  TPluviometria.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TPluviometria.Filtered := false;
    TPluviometria.Close;
    TPluviometria.Open;
    if VerificaPliviometria(
     vQry.FieldByName('idTalhao').AsString,
      FormatDateTime('yyyy-mm-dd',vQry.FieldByName('datacoleta').AsDateTime).QuotedString,
       vQry.FieldByName('Hora').AsString.QuotedString) then
      TPluviometria.Insert
     else
     begin
      TPluviometria.Filtered := false;
      TPluviometria.Filter   := 'id='+vQry.FieldByName('id').AsString;
      TPluviometria.Filtered := True;
      TPluviometria.edit;
     end;
     for x := 0 to TPluviometria.Fields.Count -1 do
     begin
      vField  := StringReplace(TPluviometria.Fields[x].Name,
       'TPluviometria','',[rfReplaceAll]);
      if (vField<>'datareg') and (vField<>'id') then
       TPluviometria.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
     end;
     try
      TPluviometria.ApplyUpdates(-1);
      if vIdResult.Length>0 then
       vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult:=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Pluviometria:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptRevisao(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  if FDConPG.Connected=false
   then ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TPostRevisao.Connection := FDConPG;
  TPostRevisao.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';

    TPostRevisao.Close;
    TPostRevisao.Open;
    TPostRevisao.Filtered := false;
    TPostRevisao.Filter   := 'id='+vQry.FieldByName('id').AsString;
    TPostRevisao.Filtered := true;
    if TPostRevisao.IsEmpty then
     TPostRevisao.Insert
    else
     TPostRevisao.edit;

    for x := 0 to TPostRevisao.Fields.Count -1 do
    begin
     vField  := StringReplace(TPostRevisao.Fields[x].Name,
      'TPostRevisao','',[rfReplaceAll]);
     if (vField<>'datareg') and (vField<>'id') then
      TPostRevisao.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
     TPostRevisao.ApplyUpdates(-1);
     vIdResult:=RetornaMaxIdGenerico('revisaomaquina');
    except
      on E: Exception do
      begin
        StrAux  := TStringWriter.Create;
        txtJson := TJsonTextWriter.Create(StrAux);
        txtJson.Formatting := TJsonFormatting.Indented;
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Erro');
        txtJson.WriteValue('Erro Ao Sincronizar Revisao:'+E.Message);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
      end;
    end;
   StrAux  := TStringWriter.Create;
   txtJson := TJsonTextWriter.Create(StrAux);
   txtJson.Formatting := TJsonFormatting.Indented;
   txtJson.WriteStartObject;
   txtJson.WritePropertyName('OK');
   txtJson.WriteValue(vIdResult);
   txtJson.WriteEndObject;
   Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptRevisaoItens(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  if FDConPG.Connected=false
   then ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TPostRevisaoItem.Connection := FDConPG;
  TPostRevisaoItem.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TPostRevisaoItem.Close;
    TPostRevisaoItem.Open;
    TPostRevisaoItem.Insert;
    for x := 0 to TPostRevisaoItem.Fields.Count -1 do
    begin
     vField  := StringReplace(TPostRevisaoItem.Fields[x].Name,
      'TPostRevisaoItem','',[rfReplaceAll]);
     if (vField<>'datareg') and (vField<>'id') then
      TPostRevisaoItem.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
     TPostRevisaoItem.ApplyUpdates(-1);
     if vIdResult.Length>0 then
      vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
     else
      vIdResult:=vQry.FieldByName('id').AsString;
     vQry.Next;
    except
      on E: Exception do
      begin
        StrAux  := TStringWriter.Create;
        txtJson := TJsonTextWriter.Create(StrAux);
        txtJson.Formatting := TJsonFormatting.Indented;
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Erro');
        txtJson.WriteValue('Erro Ao Sincronizar Revisao Item:'+E.Message);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
      end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptRevisaoServico(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  if FDConPG.Connected=false
   then ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TPostRevisaoServico.Connection := FDConPG;
  TPostRevisaoServico.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  TPostRevisaoServico.Close;
  TPostRevisaoServico.Open;
  TPostRevisaoServico.Insert;
  for x := 0 to TPostRevisaoServico.Fields.Count -1 do
  begin
   vField  := StringReplace(TPostRevisaoServico.Fields[x].Name,
    'TPostRevisaoServico','',[rfReplaceAll]);
   if (vField<>'datareg') and (vField<>'id') then
    TPostRevisaoServico.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
  end;
  try
   TPostRevisaoServico.ApplyUpdates(-1);
   if vIdResult.Length>0 then
    vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
   else
    vIdResult:=vQry.FieldByName('id').AsString;
   vQry.Next;
  except
    on E: Exception do
    begin
      StrAux  := TStringWriter.Create;
      txtJson := TJsonTextWriter.Create(StrAux);
      txtJson.Formatting := TJsonFormatting.Indented;
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('Erro');
      txtJson.WriteValue('Erro Ao Sincronizar Revisao Servico:'+E.Message);
      txtJson.WriteEndObject;
      Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

procedure TdmDB.AlteraStatusReceituario(vid: string);
var
 qryAux : TFDQuery;
begin
 if FDConPG.Connected=false then
  ConectaPG_Local;
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConPG;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('UPDATE receiturario SET status=2');
  Add('where Id='+vid);
  ExecSQL;
 end;
 qryAux.Free;
end;

function TdmDB.RetornaMaxIdOperacao: string;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select max(id) idMax from operacaosafratalhao');
   Open;
   if IsEmpty then
    Result :='1'
   else
    Result := FieldByName('idMax').AsString;
 end;
end;

procedure TdmDB.TPostAuxItemRevisaoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

function TdmDB.AcceptTonkenApp(T: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  nome:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vToken  :string;
  vJsonString,vIdUsuario :string;
  vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
  vJoItem,vJoItem1   : TJSONArray;
begin
  frmPrincipal.mlog.Lines.Add('Sincronizando Token');
//  if FDConAWS.Connected=false then
//   ConectaPG_Local;
  vQry            := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  try
   TSyncUsuario.Connection := FDConPG;
   TSyncUsuario.Open();
  except
  on E: Exception do
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('Erro');
     txtJson.WriteValue('Erro Ao Sincronizar Tonken:'+E.Message);
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
  end;
  vJsonString    := T.ToString;
  vJoInsert      := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
  vJoItem        := vJoInsert.GetValue('TokenApp') as TJSONArray;
  vJoItemO       := vJoItem.Items[0] as TJSONObject;
  vIdUsuario     := vJoItemO.GetValue('idUsuario').value;
  vToken         := vJoItemO.GetValue('Token').value;

  JsonToSend := TStringStream.Create(T.ToJSON);
  TSyncUsuario.Filter   := 'id='+vIdUsuario;
  TSyncUsuario.Filtered := True;
  TSyncUsuario.edit;
  frmPrincipal.mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Usuario : '+TSyncUsuarionome.AsString);
  try
   TSyncUsuariotokenapp.AsString   := vToken.QuotedString;
   TSyncUsuario.ApplyUpdates(-1);
   if vIdResult.Length>0 then
    vIdResult                              :=vIdUsuario
   else
    vIdResult                              :=vIdUsuario;
   except
   on E: Exception do
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('Erro');
     txtJson.WriteValue('Erro Ao Sincronizar Tonken:'+E.Message);
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;


function TdmDB.GetTestaServidor: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
begin
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue('OK');
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;


function TdmDB.GetReceituario: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then
    ConectaPG_Local;
   TReceituario.Close;
   TReceituario.Open;
   if not TReceituario.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('Receituario');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TReceituario.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('ID');
      txtJson.WriteValue(TReceituarioID.AsString);
      txtJson.WritePropertyName('Status');
      txtJson.WriteValue(TReceituariostatus.AsString);
      txtJson.WritePropertyName('Nome');
      txtJson.WriteValue(TReceituarioNome.AsString);
      txtJson.WritePropertyName('Responsavel');
      txtJson.WriteValue(TReceituarioresponsavel.AsString);
      txtJson.WritePropertyName('DataReg');
      txtJson.WriteValue(TReceituariodatareg.AsString);
      txtJson.WritePropertyName('datarecomendacao');
      txtJson.WriteValue(TReceituariodatarecomendacao.AsString);
      txtJson.WritePropertyName('dataprevaplicacao');
      txtJson.WriteValue(TReceituariodataprevaplicacao.AsString);
      txtJson.WritePropertyName('observacao');
      txtJson.WriteValue(TReceituarioobservacao.AsString);
      txtJson.WriteEndObject;
      TReceituario.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Receituario encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;



function TdmDB.GetAuxTipoAplicacaoSolido: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TTipoAplicacaoSolido.Close;
   TTipoAplicacaoSolido.Open;
   if not TTipoAplicacaoSolido.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('TipoAplicacaoSolido');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TTipoAplicacaoSolido.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('ID');
      txtJson.WriteValue(TTipoAplicacaoSolidoID.AsString);
      txtJson.WritePropertyName('Status');
      txtJson.WriteValue(TTipoAplicacaoSolidostatus.AsString);
      txtJson.WritePropertyName('Nome');
      txtJson.WriteValue(TTipoAplicacaoSolidoNome.AsString);
      txtJson.WriteEndObject;
      TTipoAplicacaoSolido.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhuma Tipo Aplicacao Solidos encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;

end;


function TdmDB.GetTipoDB: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 vTipoDB : string;

begin
   with vQry,vQry.SQL do
   begin
     Clear;
     Add('select * from systemconfig');
     Open;
     if FieldByName('agricultura').AsInteger=1 then
       vTipoDB:='AGRICULTURA'
     ELSE
       vTipoDB:='PECUARIA'
   end;
   StrAux  := TStringWriter.Create;
   txtJson := TJsonTextWriter.Create(StrAux);
   txtJson.Formatting := TJsonFormatting.Indented;
   TxtJSON.WriteStartObject;
    TxtJSON.WritePropertyName('TipoDB');
     TxtJSON.WriteStartArray;
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('TIPO');
      txtJson.WriteValue(vTipoDB);
     txtJson.WriteEndObject;
   TxtJSON.WriteEndArray;
   TxtJSON.WriteEndObject;
   Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.GetTipoOcorrencia: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TTipoOcorrencia.Close;
   TTipoOcorrencia.Open;
   if not TTipoOcorrencia.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('TipoOcorrencia');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TTipoOcorrencia.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('ID');
      txtJson.WriteValue(TTipoOcorrenciaID.AsString);
      txtJson.WritePropertyName('Status');
      txtJson.WriteValue(TTipoOcorrenciastatus.AsString);
      txtJson.WritePropertyName('Nome');
      txtJson.WriteValue(TTipoOcorrenciaNome.AsString);
      txtJson.WriteEndObject;
      TTipoOcorrencia.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Tipo de Ocorrencia encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;

end;

function TdmDB.GetCultivares: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TCultivares.Close;
   TCultivares.Open;
   if not TCultivares.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('Cultivares');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TCultivares.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('ID');
      txtJson.WriteValue(TCultivaresID.AsString);
      txtJson.WritePropertyName('Status');
      txtJson.WriteValue(TCultivaresstatus.AsString);
      txtJson.WritePropertyName('Nome');
      txtJson.WriteValue(TCultivaresNome.AsString);
      txtJson.WriteEndObject;
      TCultivares.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhuma Variedade encontrada!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;

end;


function TdmDB.GetUsuariosAGRI: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then
    ConectaPG_Local;
   TUsuario.Close;
   TUsuario.Open;
   if not TUsuario.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('Usuarios');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TUsuario.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('ID');
      txtJson.WriteValue(TUsuarioID.AsString);
      txtJson.WritePropertyName('Status');
      txtJson.WriteValue(TUsuarioStatus.AsString);
      txtJson.WritePropertyName('nome');
      txtJson.WriteValue(TUsuarionome.AsString);
      txtJson.WritePropertyName('usuario');
      txtJson.WriteValue(TUsuariousuario.AsString);
      txtJson.WritePropertyName('senha');
      txtJson.WriteValue(TUsuariosenha.AsString);
      txtJson.WritePropertyName('idsegmento');
      txtJson.WriteValue(TUsuarioidsegmento.AsString);
      txtJson.WritePropertyName('tipo');
      txtJson.WriteValue(TUsuariotipo.AsString);
      txtJson.WritePropertyName('supervisor');
      txtJson.WriteValue(TUsuariosuperviso.AsString);
      txtJson.WritePropertyName('agronomo');
      txtJson.WriteValue(TUsuarioagronomo.AsString);
      txtJson.WritePropertyName('abastecimento');
      txtJson.WriteValue(TUsuarioabastecimento.AsString);
      txtJson.WritePropertyName('armazem');
      txtJson.WriteValue(TUsuarioarmazem.AsString);
      txtJson.WritePropertyName('aplicacaosolido');
      txtJson.WriteValue(TUsuarioaplicacaosolido.AsString);
      txtJson.WritePropertyName('pulverizacao');
      txtJson.WriteValue(TUsuariopulverizacao.AsString);
      txtJson.WritePropertyName('plantio');
      txtJson.WriteValue(TUsuarioplantio.AsString);
      txtJson.WritePropertyName('colheita');
      txtJson.WriteValue(TUsuariocolheita.AsString);
      txtJson.WritePropertyName('monitoramentopragas');
      txtJson.WriteValue(TUsuariomonitoramentopragas.AsString);
      txtJson.WritePropertyName('pluviometria');
      txtJson.WriteValue(TUsuariopluviometria.AsString);
      txtJson.WritePropertyName('manutencaomaquinas');
      txtJson.WriteValue(TUsuariomanutencaomaquinas.AsString);
      txtJson.WritePropertyName('abastecimentoexterno');
      txtJson.WriteValue(TUsuarioabastecimentoexterno.AsString);
      txtJson.WriteEndObject;
      TUsuario.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabecalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Usuario encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;

end;

function TdmDB.VerificaIdExisteLocal(Tabela, Id: string): Boolean;
var
 vQry:TFDQuery;
begin
 vQry            := TFDQuery.Create(nil);
 vQry.Connection := FDConPG;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from '+Tabela);
   Add('where id='+id);
   try
     Open;
     frmPrincipal.mlog.Lines.Add('Produtos Existe:'+Id+' Exite:'+BoolToStr(vQry.IsEmpty));
     Result := vQry.IsEmpty;
   except
    on E: Exception do
     frmPrincipal.mlog.Lines.Add('Erro Verifica Produtos Existe:'+vQry.FieldByName('id').AsString+' '+e.Message);
   end;
 end;
 vQry.Free;
end;

function TdmDB.VerificaOperacaoMaquinaExiste(idMaquina,idOperacao: string): string;
begin
 with Tdetoperacaosafratalhaomaquinasoperadores,Tdetoperacaosafratalhaomaquinasoperadores.SQL do
 begin
   Clear;
   Add('select * from detoperacaosafratalhaomaquinasoperadores');
   Add('where idmaquina='+idMaquina);
   Add('and idoperacaotalhao='+idOperacao);
   Open;
   Result := FieldByName('id').AsString;
 end;
end;

function TdmDB.VerificaOperacaoProdutoExiste(idProduto,
  idOperacao: string): string;
begin
 with Tdetoperacaosafratalhaoprodutos,Tdetoperacaosafratalhaoprodutos.SQL do
 begin
   Clear;
   Add('select * from detoperacaosafratalhaoprodutos');
   Add('where idProduto='+idProduto);
   Add('and idoperacaotalhao='+idOperacao);
   Open;
   Result := FieldByName('id').AsString;
 end;
end;

function TdmDB.VerificaOperacaoReceituarioExiste(idTalhao, idReceituario: string): string;
begin
 with Toperacaosafratalhao,Toperacaosafratalhao.SQL do
 begin
   Clear;
   Add('select * from operacaosafratalhao');
   Add('where status>-1 and idReceituario='+idReceituario);
   Add('and idtalhao='+idTalhao);
   Open;
   Result := FieldByName('id').AsString;
 end;
end;

function TdmDB.VerificaStatusReceituario(idReceituario: string): string;
var
 vQry:TFDQuery;
begin
 vQry            := TFDQuery.Create(nil);
 vQry.Connection := FDConPG;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from receiturario');
   Add('where id='+idReceituario);
   try
    Open;
   except
    on E: Exception do
     frmPrincipal.mLog.Lines.Add('Erro Verifica Status Receituraio:'+e.Message);
   end;
   Result := FieldByName('status').AsString;
 end;
 vQry.Free;
end;

function TdmDB.VerificaAbastecimento(idMaquia, vData,
  vLitros,horimetro: string): Boolean;
var
 vQry:TFDQuery;
begin
 vQry            := TFDQuery.Create(nil);
 vQry.Connection := FDConPG;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from abastecimento');
   Add('where idmaquina='+idMaquia);
   Add('and dataabastecimento='+vData);
   Add('and volumelt='+StringReplace(vLitros,',','.',[rfReplaceAll]));
   Add('and horimetro='+StringReplace(horimetro,',','.',[rfReplaceAll]));
   try
     Open;
     Result := vQry.IsEmpty;
   except
    on E: Exception do
     frmPrincipal.mlog.Lines.Add('Erro Verifica Abastecimento:'+vQry.FieldByName('id').AsString+' '+e.Message);
   end;
 end;
 vQry.Free;
end;

function TdmDB.VerificaAbastecimentoOutro(idAbastecimento,vIdProduto: string):Boolean;
var
 vQry:TFDQuery;
begin
 vQry            := TFDQuery.Create(nil);
 vQry.Connection := FDConPG;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from abastecimentooutros');
   Add('where idabastecimento='+idAbastecimento);
   Add('and idproduto='+vIdProduto);
   try
     Open;
     Result := vQry.IsEmpty;
   except
    on E: Exception do
     frmPrincipal.mlog.Lines.Add('Erro Verifica Abastecimento Outros:'+vQry.FieldByName('id').AsString+' '+e.Message);
   end;
 end;
 vQry.Free;
end;



function TdmDB.AcceptAbastecimento(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto,vIdAbastecimento  :string;
begin
  if FDConPG.Connected=false then
   ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TAbastecimento.Connection := FDConPG;
  TAbastecimento.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TAbastecimento.Filtered := false;
    TAbastecimento.Close;
    TAbastecimento.Open;
    frmPrincipal.mlog.Lines.Add('Verifica Abastecimento Existe Id Maquina:'+
    vQry.FieldByName('idMaquina').AsString);
    if VerificaAbastecimento(
      vQry.FieldByName('idMaquina').AsString,
      FormatDateTime('yyyy-mm-dd',
      vQry.FieldByName('dataabastecimento').AsDateTime).QuotedString,
      vQry.FieldByName('volumelt').AsString.QuotedString,
      vQry.FieldByName('horimetro').AsString.QuotedString) then
      TAbastecimento.Insert
     else
      vQry.Next;
     for x := 0 to TAbastecimento.Fields.Count -1 do
     begin
      vField  := StringReplace(TAbastecimento.Fields[x].Name,
       'TAbastecimento','',[rfReplaceAll]);
      if (vField<>'datareg') and (vField<>'id') and (vField<>'obs') then
       if TAbastecimento.FindField(vField) <> nil then
        TAbastecimento.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
     end;
     frmPrincipal.mlog.Lines.Add('Confirmando o Insert Id Maquina:'+
      vQry.FieldByName('idMaquina').AsString);
     try
      TAbastecimento.ApplyUpdates(-1);
      vIdAbastecimento := RetornaMaxIdGenerico('abastecimento');

      frmPrincipal.mlog.Lines.Add('Insert Confirmado Id Maquina:'+
       vQry.FieldByName('idMaquina').AsString);

      frmPrincipal.mlog.Lines.Add('AtualizaHorimetroMaquina');
      dmDB.AtualizaHorimetroMaquina(
       StringReplace(vQry.FieldByName('horimetro').AsString,',','.',[rfReplaceAll]),
        vQry.FieldByName('idMaquina').AsString);

      frmPrincipal.mlog.Lines.Add('InsereSaidaAbastecimento');
      InsereSaidaAbastecimento(
      FormatDateTime('yyyy-mm-dd',vQry.FieldByName('dataabastecimento').AsDateTime),'1',
       vQry.FieldByName('idlocalestoque').AsString,
       vQry.FieldByName('combustivel').AsString,
       StringReplace(vQry.FieldByName('volumelt').AsString,',','.',[rfReplaceAll]),
       '0',vIdAbastecimento);
      if vIdResult.Length>0 then
       vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult:=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Abastecimento:'+E.Message);
         frmPrincipal.mlog.Lines.Add('Erro Ao Sincronizar Abastecimento:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
         Break;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

procedure TdmDB.InsereSaidaAbastecimento(dataSaida, idcentrocusto,
  idlocalestoque, idproduto, qtditens, idresponsavel,idabastecimento: string);
var
 vValorCustoMedio:string;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from produtos');
   Add('where id='+idproduto);
   Open;
   vValorCustoMedio := FieldByName('customedio').AsString;
   if vValorCustoMedio.Length=0 then
    vValorCustoMedio:='0';

   Clear;
   Add('insert into estoquesaida(datasaidaestoque,idcentrocusto,idlocalestoque,');
   Add('idproduto,qtditens,idresponsavel,valorsaida,idabastecimento)');
   Add('values(');
   Add(dataSaida.QuotedString+',');
   Add(idcentrocusto+',');
   Add(idlocalestoque+',');
   Add(idproduto+',');
   Add(qtditens+',');
   Add(idresponsavel+',');
   Add(StringReplace(vValorCustoMedio,',','.',[rfReplaceAll])+',');
   Add(idabastecimento+')');
   ExecSQL;
   AtaulizaSaldoAtualCustoMedio(idproduto);
 end;
end;



function TdmDB.AcceptEmbarques(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  if FDConPG.Connected=false
   then ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  Embarque.Connection := FDConPG;
  Embarque.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    Embarque.Close;
    Embarque.Open;
    Embarque.Filtered := false;
    Embarque.Filter   := 'idcontrato='+vQry.FieldByName('idcontrato').AsString+
    ' and numeronf='+vQry.FieldByName('numeronf').AsString;
    Embarque.Filtered := true;
    if Embarque.IsEmpty then
     Embarque.Insert
    else
     Embarque.edit;

    for x := 0 to Embarque.Fields.Count -1 do
    begin
     vField  := StringReplace(Embarque.Fields[x].Name,
      'Embarque','',[rfReplaceAll]);
     if (vField<>'datareg') and (vField<>'id') then
      Embarque.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
     Embarque.ApplyUpdates(-1);
     dmDB.AtualizaSaldoContrato(vQry.FieldByName('id').AsString);
     if vIdResult.Length>0 then
      vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
     else
      vIdResult:=vQry.FieldByName('id').AsString;
     vQry.Next;
    except
      on E: Exception do
      begin
        StrAux  := TStringWriter.Create;
        txtJson := TJsonTextWriter.Create(StrAux);
        txtJson.Formatting := TJsonFormatting.Indented;
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Erro');
        txtJson.WriteValue('Erro Ao Sincronizar Movimentação de Combustivel:'+E.Message);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
      end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptMovLocalEstoque(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  if FDConPG.Connected=false
   then ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TMovLocalEstoque.Connection := FDConPG;
  TMovLocalEstoque.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TMovLocalEstoque.Close;
    TMovLocalEstoque.Open;
    TMovLocalEstoque.Insert;
    for x := 0 to TMovLocalEstoque.Fields.Count -1 do
    begin
     vField  := StringReplace(TMovLocalEstoque.Fields[x].Name,
      'TMovLocalEstoque','',[rfReplaceAll]);
     if (vField<>'datareg') and (vField<>'id') then
      TMovLocalEstoque.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
     TMovLocalEstoque.ApplyUpdates(-1);
     if vIdResult.Length>0 then
      vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
     else
      vIdResult:=vQry.FieldByName('id').AsString;
     vQry.Next;
    except
      on E: Exception do
      begin
        StrAux  := TStringWriter.Create;
        txtJson := TJsonTextWriter.Create(StrAux);
        txtJson.Formatting := TJsonFormatting.Indented;
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Erro');
        txtJson.WriteValue('Erro Ao Sincronizar Movimentação de Combustivel:'+E.Message);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
      end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptAbastecimentoOutros(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  if FDConPG.Connected=false then ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TAbastecimentooutros.Connection := FDConPG;
  TAbastecimentooutros.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TAbastecimentooutros.Filtered := false;
    TAbastecimentooutros.Close;
    TAbastecimentooutros.Open;
    if VerificaAbastecimentoOutro(
     vQry.FieldByName('idabastecimento').AsString,
       vQry.FieldByName('idproduto').AsString.QuotedString) then
      TAbastecimentooutros.Insert
     else
     begin
      TAbastecimentooutros.Filtered := false;
      TAbastecimentooutros.Filter   := 'id='+vQry.FieldByName('id').AsString;
      TAbastecimentooutros.Filtered := True;
      TAbastecimentooutros.edit;
     end;
     for x := 0 to TAbastecimentooutros.Fields.Count -1 do
     begin
      vField  := StringReplace(TAbastecimentooutros.Fields[x].Name,
       'TAbastecimentoOutros','',[rfReplaceAll]);
      if (vField<>'datareg') and (vField<>'id') then
       TAbastecimentooutros.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
     end;
     try
      TAbastecimentooutros.ApplyUpdates(-1);
      if vIdResult.Length>0 then
       vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult:=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Abatecimento Outros:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptAuxRevisaoItens(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  if FDConPG.Connected=false
   then ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TPostAuxItemRevisao.Connection := FDConPG;
  TPostAuxItemRevisao.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TPostAuxItemRevisao.Close;
    TPostAuxItemRevisao.Open;
    TPostAuxItemRevisao.Insert;
    for x := 0 to TPostAuxItemRevisao.Fields.Count -1 do
    begin
     vField  := StringReplace(TPostAuxItemRevisao.Fields[x].Name,
      'TPostAuxItemRevisao','',[rfReplaceAll]);
     if (vField<>'datareg') and (vField<>'id') then
      TPostAuxItemRevisao.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
     TPostAuxItemRevisao.ApplyUpdates(-1);
     vIdResult:=RetornaMaxIdGenerico('auxrevisaoitens');
     vQry.Next;
    except
      on E: Exception do
      begin
        StrAux  := TStringWriter.Create;
        txtJson := TJsonTextWriter.Create(StrAux);
        txtJson.Formatting := TJsonFormatting.Indented;
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Erro');
        txtJson.WriteValue('Erro Ao Sincronizar Aux Item Revisao:'+E.Message);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
      end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptDesembarques(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  if FDConPG.Connected=false
   then ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  Desembarques.Connection := FDConPG;
  Desembarques.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    Desembarques.Close;
    Desembarques.Open;
    Desembarques.Insert;
    for x := 0 to Desembarques.Fields.Count -1 do
    begin
     vField  := StringReplace(Desembarques.Fields[x].Name,
      'Desembarques','',[rfReplaceAll]);
     if (vField<>'datareg') and (vField<>'id') then
      Desembarques.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
     Desembarques.ApplyUpdates(-1);
     if vIdResult.Length>0 then
      vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
     else
      vIdResult:=vQry.FieldByName('id').AsString;
     vQry.Next;
    except
      on E: Exception do
      begin
        StrAux  := TStringWriter.Create;
        txtJson := TJsonTextWriter.Create(StrAux);
        txtJson.Formatting := TJsonFormatting.Indented;
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Erro');
        txtJson.WriteValue('Erro Ao Sincronizar Desembarque:'+E.Message);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
      end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptGetDetReceituario(obj: TJSONObject): TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
 vJsonString :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1: TJSONArray;
 vidReceiturio:string;
 IStatus:integer;
begin
   if FDConPG.Connected=false then
    ConectaPG_Local;
   vJsonString    := Obj.ToString;
   vJoInsert      := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
   vJoItem        := vJoInsert.GetValue('idRec') as TJSONArray;
   vJoItemO       := vJoItem.Items[0] as TJSONObject;
   vidReceiturio  :=  vJoItemO.GetValue('id').value;
   TDetReceituario.Close;
   TDetReceituario.Open;
   TDetReceituario.Filtered := false;
   TDetReceituario.Filter   := 'idreceiturario='+vidReceiturio;
   TDetReceituario.Filtered := true;
   if not TDetReceituario.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('DetReceituario');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TDetReceituario.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('ID');
      txtJson.WriteValue(TDetReceituarioID.AsString);
      txtJson.WritePropertyName('IDReceituario');
      txtJson.WriteValue(TDetReceituarioidreceiturario.AsString);

      txtJson.WritePropertyName('Status');
      txtJson.WriteValue(TDetReceituariostatus.AsString);
      txtJson.WritePropertyName('Finalidade');
      txtJson.WriteValue(TDetReceituariofinalidade.AsString);
      txtJson.WritePropertyName('IdProduto');
      txtJson.WriteValue(TDetReceituarioidproduto.AsString);
      txtJson.WritePropertyName('Produto');
      txtJson.WriteValue(TDetReceituarioproduto.AsString);
      txtJson.WritePropertyName('QtdeIndicada');
      txtJson.WriteValue(TDetReceituarioqtdporhe.AsString);
      txtJson.WriteEndObject;
      TDetReceituario.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Detalhe do Receituario encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;

function TdmDB.AcceptGetDetReceituarioTalhao(obj: TJSONObject): TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
 vJsonString :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
 vidReceiturio:string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   vJsonString    := Obj.ToString;
   vJoInsert      := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
   vJoItem        := vJoInsert.GetValue('idRec') as TJSONArray;
   vJoItemO       := vJoItem.Items[0] as TJSONObject;
   vidReceiturio  :=  vJoItemO.GetValue('id').value;
   if FDConPG.Connected=false then ConectaPG_Local;
   AbreDetRectalhao(vidReceiturio);
   if not TDetReceituarioTalhao.IsEmpty then
   begin
     Result := GetDataSetAsJSON(TDetReceituarioTalhao);
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Detalhe do Receituario Talhao encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;

procedure TdmDB.AbreDetRectalhao(ID: STRING);
begin
   WITH TDetReceituarioTalhao, TDetReceituarioTalhao.SQL dO
   BEGIN
    clear;
    Add('SELECT * FROM detreceiturarioTalhao');
    Add('WHERE idreceiturario='+id);
    Open;
   end;
end;

function TdmDB.AcceptGetMudaStatusReceituario(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  nome:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vStatus  :string;
begin
  if FDConPG.Connected=false then ConectaPG_Local;
   vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';

  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  TxtJSON.WriteStartObject;
  TxtJSON.WritePropertyName('StatusRec');
  TxtJSON.WriteStartArray;
  I:=0;
  while not vQry.eof do
  begin
    vStatus := VerificaStatusReceituario(vQry.FieldByName('id').AsString);
    if vStatus.Length>0 then
    begin
      if vQry.FieldByName('status').AsString<>vStatus then
      begin
       I:=1;
       txtJson.WriteStartObject;
       txtJson.WritePropertyName('ID');
       txtJson.WriteValue(vQry.FieldByName('ID').AsString);
       txtJson.WritePropertyName('Status');
       txtJson.WriteValue(vStatus);
       txtJson.WriteEndObject;
      end;
    end;
    vQry.Next
  end;
  if I>0 then
  begin
    TxtJSON.WriteEndArray;
    TxtJSON.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
  end
  else
  begin
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('Atencao');
    txtJson.WriteValue('Nenhum');
    TxtJSON.WriteEndArray;
    TxtJSON.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
  end;
end;

function TdmDB.AcceptMonitoramento(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
  vJsonResult:TJSONObject;
begin
   frmPrincipal.mlog.Lines.Add(FormatDateTime('hh:mm:ss',now)+': Recebendo Monitoramento');
  if FDConPG.Connected=false then ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TMonitoramentoPraga.Connection := FDConPG;
  TMonitoramentoPraga.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TMonitoramentoPraga.Close;
    TMonitoramentoPraga.Open;
    TMonitoramentoPraga.Insert;
    for x := 0 to TMonitoramentoPraga.Fields.Count -1 do
    begin
     vField  := StringReplace(TMonitoramentoPraga.Fields[x].Name,
      'TMonitoramentoPraga','',[rfReplaceAll]);
     if (vField<>'datareg') and (vField<>'id') then
      TMonitoramentoPraga.FieldByName(vField).AsString := vQry.FieldByName(vField).AsString;
    end;
    try
     TMonitoramentoPraga.ApplyUpdates(-1);
     frmPrincipal.mlog.Lines.Add(FormatDateTime('hh:mm:ss',now)+': Monitoramento Recebido');
     vQry.Next;
    except
      on E: Exception do
      begin
        StrAux  := TStringWriter.Create;
        txtJson := TJsonTextWriter.Create(StrAux);
        txtJson.Formatting := TJsonFormatting.Indented;
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Erro');
        txtJson.WriteValue('Erro Ao Sincronizar Monitoramento:'+E.Message);
        txtJson.WriteEndObject;
        txtJson.WriteValue(StrAux.ToString);
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
      end;
    end;
  end;
  vIdResult := RetornaMaxIdGenerico('monitoramentopragas');

  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.RetornaIdUsuario(ANome: string): string;
begin
 if FDConPG.Connected=false then ConectaPG_Local;
 vqry.Connection := FDConPG;
 with vqry,vqry.SQL do
 begin
   Clear;
   Add('select * from usuario');
   Add('where STATUS=1 AND nome='+ANome.QuotedString);
   Open;
   Result :=FieldByName('id').AsString;
 end;
end;

function TdmDB.RetornaMaxIdGenerico(Atabela: string): string;
begin
 if FDConPG.Connected=false then ConectaPG_Local;
 vqry.Connection := FDConPG;
 with vqry,vqry.SQL do
 begin
   Clear;
   Add('select max(id) maxid from '+Atabela);
   Open;
   if FieldByName('maxid').AsString.Length=0 then
    Result :='1'
   else
    Result :=FieldByName('maxid').AsString;
 end;
end;

function TdmDB.AcceptMonitoramentoPontos(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  frmPrincipal.mlog.Lines.Add(FormatDateTime('hh:mm:ss',now)+': Recebendo Monitoramento Pontos');
  if FDConPG.Connected=false then ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TmonitoramentopragasPontos.Connection := FDConPG;
  TmonitoramentopragasPontos.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TmonitoramentopragasPontos.Close;
    TmonitoramentopragasPontos.Open;
    TmonitoramentopragasPontos.Insert;
    for x := 0 to TmonitoramentopragasPontos.Fields.Count -1 do
    begin
     vField  := StringReplace(TmonitoramentopragasPontos.Fields[x].Name,
      'TmonitoramentopragasPontos','',[rfReplaceAll]);
     if (vField<>'datareg') and (vField<>'id') then
      TmonitoramentopragasPontos.FieldByName(vField).AsString := vQry.FieldByName(vField).AsString;
    end;
    try
     TmonitoramentopragasPontos.ApplyUpdates(-1);
     frmPrincipal.mlog.Lines.Add(FormatDateTime('hh:mm:ss',now)+': Monitoramento Ponto Recebido');
     vQry.Next;
    except
      on E: Exception do
      begin
        txtJson.WriteValue(StrAux.ToString);
        StrAux  := TStringWriter.Create;
        txtJson := TJsonTextWriter.Create(StrAux);
        txtJson.Formatting := TJsonFormatting.Indented;
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Erro');
        txtJson.WriteValue('Erro Ao Sincronizar Monitoramento Pontos:'+E.Message);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
      end;
    end;
  end;
  vIdResult := RetornaMaxIdGenerico('monitoramentopragaspontos');
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptMonitoramentoPontosValores(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  frmPrincipal.mlog.Lines.Add(FormatDateTime('hh:mm:ss',now)+': Recebendo Monitoramento Pragas');
  if FDConPG.Connected=false then ConectaPG_Local;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FDConPG;
  TmonitoramentopragasPontosValores.Connection := FDConPG;
  TmonitoramentopragasPontosValores.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TmonitoramentopragasPontosValores.Close;
    TmonitoramentopragasPontosValores.Open;
    TmonitoramentopragasPontosValores.Insert;
    for x := 0 to TmonitoramentopragasPontosValores.Fields.Count -1 do
    begin
     vField  := StringReplace(TmonitoramentopragasPontosValores.Fields[x].Name,
      'TmonitoramentopragasPontosValores','',[rfReplaceAll]);
     if (vField<>'datareg') and (vField<>'id') then
      TmonitoramentopragasPontosValores.FieldByName(vField).AsString := vQry.FieldByName(vField).AsString;
    end;
    try
     TmonitoramentopragasPontosValores.ApplyUpdates(-1);
     frmPrincipal.mlog.Lines.Add(FormatDateTime('hh:mm:ss',now)+': Monitoramento Pragas Recebidos');
     if vIdResult.Length>0 then
      vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
     else
      vIdResult:=vQry.FieldByName('id').AsString;
     vQry.Next;
    except
      on E: Exception do
      begin
        StrAux  := TStringWriter.Create;
        txtJson := TJsonTextWriter.Create(StrAux);
        txtJson.Formatting := TJsonFormatting.Indented;
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Erro');
        txtJson.WriteValue('Erro Ao Sincronizar Monitoramento Pontos Valores:'+E.Message);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
      end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

procedure TdmDB.AtaulizaSaldoAtualCustoMedio(idProduto: string);
var
 vQryAux:TFDQuery;
 TotalItensEntradaGeral,
 TotalValorEntradaGeral,
 TotalItensSaidaGeral,
 TotalValorSaidaGeral,
 ValorSaldoAtual,
 SaldoAtual,
 CustoMedio:Double;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := FDConPG;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('select totalEntrada-totalSaid saldo from');
   Add('(select');
   Add('(select coalesce(sum(qtditens),0) from notafiscalitems');
   Add('where status=1 and idproduto='+idProduto+')totalEntrada,');
   Add('(select  coalesce(sum(qtditens),0) from estoquesaida');
   Add('where status=1 and idproduto='+idProduto+') totalSaid');
   Add('from estoqueentrada limit 1)y');
   Open;
   SaldoAtual := FieldByName('saldo').AsFloat;

   Clear;
   Add('select (sum(y.vl1)/sum(qtditens)) valormedio from');
   Add('(select');
   Add(' (e.qtditens * (e.valortotalnf/e.qtditens))vl1,');
   Add(' e.qtditens');
   Add('from notafiscalitems e');
   Add('where status=1 and e.idproduto='+idProduto+')y');// and a.datasaidaestoque<='+dataEntrada.QuotedString);
   Open;
   CustoMedio := FieldByName('valormedio').AsFloat;

   Clear;
   Add('update produtos set saldoatual='+StringReplace(FloatToStr(SaldoAtual),',','.',[rfReplaceAll]));
   Add(',customedio='+StringReplace(FloatToStr(CustoMedio),',','.',[rfReplaceAll]));
   Add('where id='+idProduto);
   ExecSQL;
 end;
end;

procedure TdmDB.AtualizaHorimetroMaquina(horimetro, Idmaquina: string);
var
 vQryAux:TFDQuery;
 vVolumeTotal,vVolumeSC:double;
 vVolumeTotalS,vVolumeSCS:string;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := FDConPG;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update maquinaveiculo set horimetro='+horimetro);
   Add('where id='+Idmaquina);
   ExecSQL;
 end;
 vQryAux.Free;
end;

procedure TdmDB.AtualizaSaldoContrato(idContrato: string);
var
 vQryAux:TFDQuery;
 vVolumeTotal,vVolumeSC:double;
 vVolumeTotalS,vVolumeSCS:string;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := FDConPG;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select coalesce(sum(liquido),0)Totalliquido from embarque');
   Add('where status=1 and idContrato='+idContrato);
   Open;
   vVolumeTotal := FieldByName('Totalliquido').AsFloat;

   if vVolumeTotal>0 then
     vVolumeSC := vVolumeTotal/60
   else
    vVolumeSC := 0;

   vVolumeTotalS := FloatToStr(vVolumeTotal);
   vVolumeSCS    := FloatToJson(vVolumeSC);

//   vVolumeTotalS := StringReplace(vVolumeTotalS,'.','',[rfReplaceAll]);
//   vVolumeSCS    := StringReplace(vVolumeSCS,'.','',[rfReplaceAll]);

   vVolumeTotalS := StringReplace(vVolumeTotalS,',','.',[rfReplaceAll]);
   vVolumeSCS    := StringReplace(vVolumeSCS,',','.',[rfReplaceAll]);

   Clear;
   Add('update contratos set totalembarquevolume='+vVolumeTotalS);
   Add(',totalembarquesacos='+vVolumeSCS);
   Add('where id='+idContrato);
   ExecSQL;
 end;
 vQryAux.Free;
end;

procedure TdmDB.AtualizaSequencias;
begin
 with ScriptSetSequnce do
 begin
  try
   ValidateAll;
   ExecuteAll;
  except
   on e : Exception do
   begin
    ShowMessage(e.Message);
   end;
  end;
 end;
end;
function TdmDB.ConectaPG_AWS: TJSONObject;
var
 Arquivo,
 vVendorLib,
 dbUser,
 dbPassw,
 dbName,
 dbServer,
 dbPort: String;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
begin
 StrAux  := TStringWriter.Create;
 txtJson := TJsonTextWriter.Create(StrAux);
 Arquivo := ExtractFilePath(ParamStr(0))+'Fort.ini';
 if not FileExists(Arquivo) then
 begin
   txtJson.WriteStartObject;
   txtJson.WritePropertyName('Erro');
   txtJson.WriteValue('Arquivo Fort.ini não localizado no seguinte diretorio:'+
   Arquivo);
   txtJson.WriteEndObject;
   Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
 end
 else
 begin
   vVendorLib := ExtractFilePath(ParamStr(0))+'DrivesDB\libpq_32.dll';
   dbUser     := LerIni(Arquivo,'AWS','UserName','');
   dbPassw    := LerIni(Arquivo,'AWS','Password','');
   dbName     := LerIni(Arquivo,'AWS','Database','');
   dbServer   := LerIni(Arquivo,'AWS','Server','');
   dbPort     := LerIni(Arquivo,'AWS','Port','');
//   with FDConAWS do
//   begin
//    Params.Clear;
//    Params.Values['DriverID']        := 'PG';
//    Params.Values['User_name']       := dbUser;
//    Params.Values['Database']        := dbName;
//    Params.Values['Password']        := dbPassw;
//    Params.Values['DriverName']      := 'PG';
//    Params.Values['Server']          := dbServer;
//    Params.Values['Port']            := dbPort;
//    PgDriverLink.VendorLib           := vVendorLib;
//
//    Connected := true;
//    txtJson.WriteStartObject;
//    txtJson.WritePropertyName('Mensagem');
//    txtJson.WriteValue('Conexao OK');
//    txtJson.WriteEndObject;
//    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
//
//   end;
 end;
end;

function TdmDB.ConectaPG_Local: TJSONObject;
var
 Arquivo,
 vVendorLib,
 dbUser,
 dbPassw,
 dbName,
 dbServer,
 dbPort: String;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
begin
 StrAux  := TStringWriter.Create;
 txtJson := TJsonTextWriter.Create(StrAux);
 Arquivo := ExtractFilePath(ParamStr(0))+'Fort.ini';
 if not FileExists(Arquivo) then
 begin
   txtJson.WriteStartObject;
   txtJson.WritePropertyName('Erro');
   txtJson.WriteValue('Arquivo Fort.ini não localizado no seguinte diretorio:'+
   Arquivo);
   txtJson.WriteEndObject;
   Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
 end
 else
 begin
   vVendorLib := ExtractFilePath(ParamStr(0))+'DrivesDB\libpq_32.dll';
   dbUser     := LerIni(Arquivo,'LOCAL','UserName','');
   dbPassw    := LerIni(Arquivo,'LOCAL','Password','');
   dbName     := LerIni(Arquivo,'LOCAL','Database','');
   dbServer   := LerIni(Arquivo,'LOCAL','Server','');
   dbPort     := '5432';
   with FDConPG do
   begin
    Params.Clear;
    Params.Values['DriverID']        := 'PG';
    Params.Values['User_name']       := dbUser;
    Params.Values['Database']        := dbName;
    Params.Values['Password']        := dbPassw;
    Params.Values['DriverName']      := 'PG';
    Params.Values['Server']          := dbServer;
    Params.Values['Port']            := dbPort;
    PgDriverLink.VendorLib           := vVendorLib;
    try
     Connected := true;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Conexao OK');
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
     except
     on E : Exception do
       begin
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Erro');
        txtJson.WriteValue('Não foi possivel conectar ao banco:'+e.Message);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
   end;
 end;
end;

function TdmDB.GetSetores: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TSetor.Close;
   TSetor.Open;
   if not TSetor.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('Setores');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TSetor.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('ID');
      txtJson.WriteValue(TSetorID.AsString);
      txtJson.WritePropertyName('Status');
      txtJson.WriteValue(TSetorstatus.AsString);
      txtJson.WritePropertyName('Nome');
      txtJson.WriteValue(TSetorNome.AsString);
      txtJson.WritePropertyName('AreaHe');
      txtJson.WriteValue(TSetorareahe.AsString);
      txtJson.WritePropertyName('Latitude');
      txtJson.WriteValue(TSetorlatitude.AsString);
      txtJson.WritePropertyName('Longitude');
      txtJson.WriteValue(TSetorlongitude.AsString);
      txtJson.WritePropertyName('IdArea');
      txtJson.WriteValue(TSetoridarea.AsString);
      txtJson.WriteEndObject;
      TSetor.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Setor encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;

function TdmDB.GetPlanoRevisao: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FDConPG.Connected=false then ConectaPG_Local;
  TPlanoManutencao.Connection := FDConPG;
 TPlanoManutencao.Close;
 TPlanoManutencao.Open;
 Result := GetDataSetAsJSON(TPlanoManutencao);
end;

function TdmDB.GetPlanoRevisaoItens: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TPlanoRevisaoItensInsert.Close;
   TPlanoRevisaoItensInsert.Open;
   if not TPlanoRevisaoItensInsert.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('TPlanoRevisaoItens');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TPlanoRevisaoItensInsert.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('INSERT');
      txtJson.WriteValue(TPlanoRevisaoItensInsert.FieldByName('INSERT').AsString);
      txtJson.WriteEndObject;
      TPlanoRevisaoItensInsert.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabecalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Plano de Revisao Item encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;

function TdmDB.GetPlanoRevisaoMaquinas: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TPlanoRevisaoMaquinasInsert.Close;
   TPlanoRevisaoMaquinasInsert.Open;
   if not TPlanoRevisaoMaquinasInsert.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('TPlanoRevisaoMaquinas');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TPlanoRevisaoMaquinasInsert.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('INSERT');
      txtJson.WriteValue(TPlanoRevisaoMaquinasInsert.FieldByName('INSERT').AsString);
      txtJson.WriteEndObject;
      TPlanoRevisaoMaquinasInsert.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabecalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Plano de Revisao Item encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;

function TdmDB.GetAuxRevisaoItems: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TAuxRevisaoItem.Close;
   TAuxRevisaoItem.Open;
   if not TAuxRevisaoItem.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('TAuxRevisaoItem');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TAuxRevisaoItem.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('INSERT');
      txtJson.WriteValue(TAuxRevisaoItem.FieldByName('INSERT').AsString);
      txtJson.WriteEndObject;
      TAuxRevisaoItem.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabecalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Aux Item Revisao encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;

function TdmDB.GetRevisao: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TManutencao.Close;
   TManutencao.Open;
   if not TManutencao.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('TAuxRevisaoHist');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TManutencao.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('INSERT');
      txtJson.WriteValue(TManutencao.FieldByName('INSERT').AsString);
      txtJson.WriteEndObject;
      TManutencao.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabecalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Revisao Historico encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;

function TdmDB.GetPluviometro: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FDConPG.Connected=false then ConectaPG_Local;
  TPluviometro.Connection := FDConPG;
 TPluviometro.Close;
 TPluviometro.Open;
 Result := GetDataSetAsJSON(TPluviometro);
end;

function TdmDB.GetPluviometroTalhoes: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TPluviometroTalhoes.Close;
   TPluviometroTalhoes.Open;
   if not TPluviometroTalhoes.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('TPluviometroTalhoes');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TPluviometroTalhoes.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('INSERT');
      txtJson.WriteValue(TPluviometroTalhoes.FieldByName('INSERT').AsString);
      txtJson.WriteEndObject;
      TPluviometroTalhoes.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabecalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Pluviometro Talhoes encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;

function TdmDB.GetLocalEstoque: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FDConPG.Connected=false then ConectaPG_Local;
 TLocalEstoque.Connection := FDConPG;
 TLocalEstoque.Close;
 TLocalEstoque.Open;
 Result := GetDataSetAsJSON(TLocalEstoque);
end;

function TdmDB.GetCulturas: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TCulturas.Close;
   TCulturas.Open;
   if not TCulturas.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('Cultura');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TCulturas.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('ID');
      txtJson.WriteValue(TCulturasID.AsString);
      txtJson.WritePropertyName('Status');
      txtJson.WriteValue(TCulturasstatus.AsString);
      txtJson.WritePropertyName('Nome');
      txtJson.WriteValue(TCulturasNome.AsString);
      txtJson.WriteEndObject;
      TCulturas.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhuma Cultura encontrada!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;

end;


function TdmDB.GetSafra: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TSafra.Close;
   TSafra.Open;
   if not TSafra.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('Safra');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TSafra.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('ID');
      txtJson.WriteValue(TSafraID.AsString);
      txtJson.WritePropertyName('Status');
      txtJson.WriteValue(TSafrastatus.AsString);
      txtJson.WritePropertyName('Nome');
      txtJson.WriteValue(TSafraNome.AsString);
      txtJson.WriteEndObject;
      TSafra.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhuma Safra encontrada!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;


function TdmDB.GetTalhoes: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TTalhoes.Close;
   TTalhoes.Open;
   if not TTalhoes.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('Talhoes');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TTalhoes.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('ID');
      txtJson.WriteValue(TTalhoesID.AsString);
      txtJson.WritePropertyName('Status');
      txtJson.WriteValue(TTalhoesstatus.AsString);
      txtJson.WritePropertyName('Nome');
      txtJson.WriteValue(TTalhoesNome.AsString);
      txtJson.WritePropertyName('AreaHe');
      txtJson.WriteValue(TTalhoesareahe.AsString);
      txtJson.WritePropertyName('Latitude');
      txtJson.WriteValue(TTalhoeslatitude.AsString);
      txtJson.WritePropertyName('Longitude');
      txtJson.WriteValue(TTalhoeslongitude.AsString);
      txtJson.WritePropertyName('IdSetor');
      txtJson.WriteValue(TTalhoesidsetor.AsString);
      txtJson.WritePropertyName('QrCode');
      txtJson.WriteValue(TTalhoesqrcode.AsString);
      txtJson.WritePropertyName('Tipo');
      txtJson.WriteValue(TTalhoestiposte.AsString);
      txtJson.WritePropertyName('Observacao');
      txtJson.WriteValue(TTalhoesobservacao.AsString);
      txtJson.WritePropertyName('QrCodeSaida');
      txtJson.WriteValue(TTalhoesqrcodeSaida.AsString);
      txtJson.WriteEndObject;
      TTalhoes.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Talhão encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;


function TdmDB.GetAreas: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TAreas.Close;
   TAreas.Open;
   if not TAreas.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('Areas');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TAreas.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('ID');
      txtJson.WriteValue(TAreasID.AsString);
      txtJson.WritePropertyName('Status');
      txtJson.WriteValue(TAreasstatus.AsString);
      txtJson.WritePropertyName('Nome');
      txtJson.WriteValue(TAreasNome.AsString);
      txtJson.WritePropertyName('AreaHe');
      txtJson.WriteValue(TAreasareahe.AsString);
      txtJson.WritePropertyName('Latitude');
      txtJson.WriteValue(TAreaslatitude.AsString);
      txtJson.WritePropertyName('Longitude');
      txtJson.WriteValue(TAreaslongitude.AsString);
      txtJson.WritePropertyName('Responsavel');
      txtJson.WriteValue(TAreasresponsavel.AsString);
      txtJson.WriteEndObject;
      TAreas.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhuma Area encontrada!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;


function TdmDB.GetAtividadeAbastecimento: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FDConPG.Connected=false then ConectaPG_Local;
  Tauxatividadeabastecimento.Connection := FDConPG;
 Tauxatividadeabastecimento.Close;
 Tauxatividadeabastecimento.Open;
 Result := GetDataSetAsJSON(Tauxatividadeabastecimento);
end;

function TdmDB.GetOperacoes: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TOperacoes.Close;
   TOperacoes.Open;
   if not TOperacoes.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('Operacoes');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TOperacoes.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('ID');
      txtJson.WriteValue(TOperacoesID.AsString);
      txtJson.WritePropertyName('Nome');
      txtJson.WriteValue(TOperacoesNome.AsString);
      txtJson.WritePropertyName('Status');
      txtJson.WriteValue(TOperacoesstatus.AsString);
      txtJson.WriteEndObject;
      TOperacoes.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhuma Operacao encontrada!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;


function TdmDB.GetProdutos: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TProdutosInsert.Close;
   TProdutosInsert.Open;
   if not TProdutosInsert.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('Produtos');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TProdutosInsert.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('INSERT');
      txtJson.WriteValue(TProdutosInsert.FieldByName('INSERT').AsString);
//      txtJson.WritePropertyName('Nome');
//      txtJson.WriteValue(TProdutoNome.AsString);
//      txtJson.WritePropertyName('NumeroSerie');
//      txtJson.WriteValue(TProdutoNumeroSerie.AsString);
//      txtJson.WritePropertyName('CodigoBarras');
//      txtJson.WriteValue(TProdutoCodigoBarras.AsString);
//      txtJson.WritePropertyName('Img');
//      txtJson.WriteValue(TProdutoImg.AsString);
//      txtJson.WritePropertyName('codigofabricante');
//      txtJson.WriteValue(TProdutocodigofabricante.AsString);
//      txtJson.WritePropertyName('categoria');
//      txtJson.WriteValue(TProdutocategoria.AsString);
//      txtJson.WritePropertyName('grupo');
//      txtJson.WriteValue(TProdutogrupo.AsString);
//      txtJson.WritePropertyName('subgrupo');
//      txtJson.WriteValue(TProdutosubgrupo.AsString);
//      txtJson.WritePropertyName('marca');
//      txtJson.WriteValue(TProdutomarca.AsString);
//      txtJson.WritePropertyName('segmento');
//      txtJson.WriteValue(TProdutosegmento.AsString);
//      txtJson.WritePropertyName('Status');
//      txtJson.WriteValue(TProdutostatus.AsString);
//      txtJson.WritePropertyName('Tipo');
//      txtJson.WriteValue(TProdutoTipo.AsString);
//      txtJson.WritePropertyName('UnidadeMedida');
//      txtJson.WriteValue(TProdutoUnidadeMedida.AsString);
//      txtJson.WritePropertyName('Observacao');
//      txtJson.WriteValue(TProdutoObservacao.AsString);
//      txtJson.WritePropertyName('CodigoBarras');
//      txtJson.WriteValue(TProdutoCodigoBarras.AsString);
//      txtJson.WritePropertyName('Defencivo');
//      txtJson.WriteValue(TProdutodefensivos.AsString);
      txtJson.WriteEndObject;
      TProdutosInsert.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabecalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Produto encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;

function TdmDB.GetMaquinas: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TMaquinas.Close;
   TMaquinas.Open;
   if not TMaquinas.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('Maquinas');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TMaquinas.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('Id');
      txtJson.WriteValue(TMaquinasID.AsString);
      txtJson.WritePropertyName('Status');
      txtJson.WriteValue(TMaquinasstatus.AsString);
      txtJson.WritePropertyName('Tipo');
      txtJson.WriteValue(TMaquinasTipo.AsString);
      txtJson.WritePropertyName('Categoria');
      txtJson.WriteValue(TMaquinascategoria.AsString);
      txtJson.WritePropertyName('Marca');
      txtJson.WriteValue(TMaquinasmarca.AsString);
      txtJson.WritePropertyName('Modelo');
      txtJson.WriteValue(TMaquinasmodelo.AsString);
      txtJson.WritePropertyName('Placa');
      txtJson.WriteValue(TMaquinasplaca.AsString);
      txtJson.WritePropertyName('Ano');
      txtJson.WriteValue(TMaquinasAno.AsString);
      txtJson.WritePropertyName('Chassi');
      txtJson.WriteValue(TMaquinaschassi.AsString);
      txtJson.WritePropertyName('Combustivel');
      txtJson.WriteValue(TMaquinasCombustivel.AsString);
      txtJson.WritePropertyName('NumeroSerie');
      txtJson.WriteValue(TMaquinasnumeroserie.AsString);
      txtJson.WritePropertyName('IMG');
      txtJson.WriteValue(TMaquinasimg.AsString);
      txtJson.WritePropertyName('Segmento');
      txtJson.WriteValue(TMaquinasidsegmento.AsString);
      txtJson.WritePropertyName('Prefixo');
      txtJson.WriteValue(TMaquinasprefixo.AsString);

      txtJson.WritePropertyName('ultimarevisao');
      txtJson.WriteValue(TMaquinasultimarevisao.AsString);

      txtJson.WritePropertyName('horimetroultimarev');
      txtJson.WriteValue(TMaquinashorimetroultimarev.AsString);

      txtJson.WritePropertyName('horimetroproximarevisao');
      txtJson.WriteValue(TMaquinashorimetroproximarevisao.AsString);

      txtJson.WritePropertyName('horimetro');
      txtJson.WriteValue(TMaquinashorimetro.AsString);

      txtJson.WriteEndObject;
      TMaquinas.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabecalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhuma Maquina encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;


function TdmDB.GetCobertura: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   Tauxcobertura.Close;
   Tauxcobertura.Open;
   if not Tauxcobertura.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('Cobertura');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not Tauxcobertura.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('ID');
      txtJson.WriteValue(TauxcoberturaID.AsString);
      txtJson.WritePropertyName('Status');
      txtJson.WriteValue(Tauxcoberturastatus.AsString);
      txtJson.WritePropertyName('Nome');
      txtJson.WriteValue(TauxcoberturaNome.AsString);
      txtJson.WriteEndObject;
      Tauxcobertura.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhuma Variedade encontrada!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;

function TdmDB.GetContratos: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FDConPG.Connected=false then ConectaPG_Local;
  Contratos.Connection := FDConPG;
 Contratos.Close;
 Contratos.Open;
 Result := GetDataSetAsJSON(Contratos);
end;

function TdmDB.GetComprador: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FDConPG.Connected=false then ConectaPG_Local;
  Comprador.Connection := FDConPG;
 Comprador.Close;
 Comprador.Open;
 Result := GetDataSetAsJSON(Comprador);
end;

function TdmDB.GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
var
  f: TField;
  o: TJSOnObject;
  a: TJSONArray;
begin
  a := TJSONArray.Create;
  DataSet.Active := True;
  DataSet.First;
  while not DataSet.EOF do begin
    o := TJSOnObject.Create;
    for f in DataSet.Fields do
      o.AddPair(f.FieldName, VarToStr(f.Value));
    a.AddElement(o);
    DataSet.Next;
  end;
  DataSet.Active := False;
  Result := TJSONObject.Create;
  Result.AddPair(DataSet.Name, a);
end;

function TdmDB.GetOperadorMaquinas: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
begin
   if FDConPG.Connected=false then ConectaPG_Local;
   TOperadorMaquina.Close;
   TOperadorMaquina.Open;
   if not TOperadorMaquina.IsEmpty then
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('OperadorMaquina');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not TOperadorMaquina.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('ID');
      txtJson.WriteValue(TOperadorMaquinaID.AsString);
      txtJson.WritePropertyName('NOME');
      txtJson.WriteValue(TOperadorMaquinaNOME.AsString);
      txtJson.WritePropertyName('RG');
      txtJson.WriteValue(TOperadorMaquinaRG.AsString);
      txtJson.WritePropertyName('CPF');
      txtJson.WriteValue(TOperadorMaquinaCPF.AsString);
      txtJson.WritePropertyName('STATUS');
      txtJson.WriteValue(TOperadorMaquinaSTATUS.AsString);
      txtJson.WriteEndObject;
      TOperadorMaquina.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Operador de Maquinas encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;

end;


function TdmDB.GetPragas: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FDConPG.Connected=false then
  ConectaPG_Local;
 TAuxPraga.Connection := FDConPG;
 TAuxPraga.Close;
 TAuxPraga.Open;
 Result := GetDataSetAsJSON(TAuxPraga);
end;

function TdmDB.LerIni(Diretorio,Chave1, Chave2, ValorPadrao: String): String;
var
 FileIni: TIniFile;
begin
  result := ValorPadrao;
  try
    FileIni := TIniFile.Create(Diretorio);
    if FileExists(Diretorio) then
      result := FileIni.ReadString(Chave1, Chave2, ValorPadrao);
  finally
    FreeAndNil(FileIni)
  end;
end;

end.
