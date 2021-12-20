object dmDB: TdmDB
  OldCreateOrder = False
  Height = 503
  Width = 813
  object FDConPG: TFDConnection
    Params.Strings = (
      'Database=FortAgro'
      'User_Name=postgres'
      'Password=ffg@2021'
      'Server=192.168.236.50'
      'DriverID=PG')
    LoginPrompt = False
    Left = 40
    Top = 8
  end
  object PgDriverLink: TFDPhysPgDriverLink
    Left = 104
    Top = 8
  end
  object ScriptSetSequnce: TFDScript
    SQLScripts = <
      item
        SQL.Strings = (
          'SELECT setval_max('#39'public'#39');')
      end>
    ScriptOptions.FileEncoding = ecUTF8
    Params = <>
    Macros = <>
    FetchOptions.AssignedValues = [evItems, evAutoClose, evAutoFetchAll]
    FetchOptions.AutoClose = False
    FetchOptions.Items = [fiBlobs, fiDetails]
    ResourceOptions.AssignedValues = [rvMacroCreate, rvMacroExpand, rvDirectExecute, rvPersistent]
    ResourceOptions.MacroCreate = False
    ResourceOptions.DirectExecute = True
    Left = 26
    Top = 65
  end
  object TUsuario: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' U.*,'
      ' case '
      '  when U.tipo=0 then '#39'PADRAO'#39
      '  when U.tipo=1 then '#39'SUPERVISOR'#39
      '  when U.tipo=2 then '#39'COMPRAS'#39
      '  when U.tipo=3 then '#39'DIRETORIA'#39
      ' end tipoSTR,'
      ' case '
      '  when U.idsegmento=0 then '#39'AGROPECUARIA'#39
      '  when U.idsegmento=1 then '#39'AGRICULTURA'#39
      ' end SegmentoSTR,'
      ' A.nome Superviso'
      'from usuario U'
      'left join usuario a on u.idsupervisor=A.id '
      'where U.Status>=0')
    Left = 56
    Top = 156
    object TUsuarioId: TIntegerField
      FieldName = 'Id'
      Origin = '"Id"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TUsuarioStatus: TIntegerField
      FieldName = 'Status'
      Origin = '"Status"'
    end
    object TUsuarioDataReg: TSQLTimeStampField
      FieldName = 'DataReg'
      Origin = '"DataReg"'
    end
    object TUsuarioIdUsuario: TIntegerField
      FieldName = 'IdUsuario'
      Origin = '"IdUsuario"'
    end
    object TUsuarioDataAlteracao: TSQLTimeStampField
      FieldName = 'DataAlteracao'
      Origin = '"DataAlteracao"'
    end
    object TUsuarioIdUsuarioAlteracao: TIntegerField
      FieldName = 'IdUsuarioAlteracao'
      Origin = '"IdUsuarioAlteracao"'
    end
    object TUsuarionome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TUsuariousuario: TWideStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 25
    end
    object TUsuariosenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 50
    end
    object TUsuarioidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TUsuariotipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TUsuariotipostr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tipostr'
      Origin = 'tipostr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TUsuariosegmentostr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'segmentostr'
      Origin = 'segmentostr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TUsuarioidsupervisor: TIntegerField
      FieldName = 'idsupervisor'
      Origin = 'idsupervisor'
    end
    object TUsuariosuperviso: TWideStringField
      FieldName = 'superviso'
      Origin = 'superviso'
      Size = 100
    end
    object TUsuariosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TUsuarioagronomo: TIntegerField
      FieldName = 'agronomo'
      Origin = 'agronomo'
    end
    object TUsuarioabastecimento: TIntegerField
      FieldName = 'abastecimento'
      Origin = 'abastecimento'
    end
    object TUsuarioimgass: TBlobField
      FieldName = 'imgass'
      Origin = 'imgass'
    end
    object TUsuariosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TUsuariotokenapp: TWideStringField
      FieldName = 'tokenapp'
      Origin = 'tokenapp'
      Size = 100
    end
    object TUsuariotokenappcompras: TWideStringField
      FieldName = 'tokenappcompras'
      Origin = 'tokenappcompras'
      Size = 500
    end
    object TUsuarioarmazem: TIntegerField
      FieldName = 'armazem'
      Origin = 'armazem'
    end
    object TUsuarioaplicacaosolido: TIntegerField
      FieldName = 'aplicacaosolido'
      Origin = 'aplicacaosolido'
    end
    object TUsuariopulverizacao: TIntegerField
      FieldName = 'pulverizacao'
      Origin = 'pulverizacao'
    end
    object TUsuarioplantio: TIntegerField
      FieldName = 'plantio'
      Origin = 'plantio'
    end
    object TUsuariocolheita: TIntegerField
      FieldName = 'colheita'
      Origin = 'colheita'
    end
    object TUsuariomonitoramentopragas: TIntegerField
      FieldName = 'monitoramentopragas'
      Origin = 'monitoramentopragas'
    end
    object TUsuariopluviometria: TIntegerField
      FieldName = 'pluviometria'
      Origin = 'pluviometria'
    end
    object TUsuariomanutencaomaquinas: TIntegerField
      FieldName = 'manutencaomaquinas'
      Origin = 'manutencaomaquinas'
    end
    object TUsuarioabastecimentoexterno: TIntegerField
      FieldName = 'abastecimentoexterno'
      Origin = 'abastecimentoexterno'
    end
  end
  object TAuxPraga: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxpragas')
    Left = 176
    Top = 160
    object TAuxPragaid: TIntegerField
      FieldName = 'id'
    end
    object TAuxPragastatus: TIntegerField
      FieldName = 'status'
    end
    object TAuxPragadatareg: TSQLTimeStampField
      FieldName = 'datareg'
    end
    object TAuxPragaidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object TAuxPragadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
    end
    object TAuxPragaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
    end
    object TAuxPraganome: TWideStringField
      FieldName = 'nome'
      Size = 50
    end
    object TAuxPragasyncaws: TIntegerField
      FieldName = 'syncaws'
    end
    object TAuxPragasyncfaz: TIntegerField
      FieldName = 'syncfaz'
    end
  end
  object TOperadorMaquina: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from OperadorMaquinas'
      '')
    Left = 177
    Top = 215
    object TOperadorMaquinaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TOperadorMaquinastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TOperadorMaquinadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TOperadorMaquinaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TOperadorMaquinadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TOperadorMaquinaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TOperadorMaquinanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TOperadorMaquinarg: TWideStringField
      FieldName = 'rg'
      Origin = 'rg'
      Size = 10
    end
    object TOperadorMaquinacpf: TWideStringField
      FieldName = 'cpf'
      Origin = 'cpf'
    end
    object TOperadorMaquinacnh: TWideStringField
      FieldName = 'cnh'
      Origin = 'cnh'
    end
    object TOperadorMaquinacelular: TWideStringField
      FieldName = 'celular'
      Origin = 'celular'
    end
    object TOperadorMaquinasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TOperadorMaquinasyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TOperadorMaquinapulverizacao: TIntegerField
      FieldName = 'pulverizacao'
      Origin = 'pulverizacao'
    end
  end
  object TAuxCobertura: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxcobertura')
    Left = 177
    Top = 269
    object TAuxCoberturaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxCoberturastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxCoberturadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxCoberturaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxCoberturadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxCoberturaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxCoberturanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object TMaquinas: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select a.*,'
      ' case '
      '  when combustivel =0 then '#39'Disel'#39
      '  when combustivel =1 then '#39'Gasolina'#39
      '  when combustivel =2 then '#39'Alcool'#39
      '  when combustivel =3 then '#39'Flex'#39
      ' end CombustivelStr,'
      ' case '
      '  when idcategoria =0 then '#39'Maquina'#39
      '  when idcategoria =1 then '#39'Implemento'#39
      '  when idcategoria =2 then '#39'Veiculo'#39
      '  when idcategoria =3 then '#39'Avi'#227'o'#39
      ' end Categoria, '
      'b.nome Tipo,c.nome Marca from maquinaveiculo a '
      'join auxtipomaquinaveiculos b on b.id=a.idtipo'
      'join auxmarcas c on c.id=a.idmarca'
      '')
    Left = 176
    Top = 326
    object TMaquinasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMaquinasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TMaquinasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TMaquinasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TMaquinasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TMaquinasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TMaquinasidtipo: TIntegerField
      FieldName = 'idtipo'
      Origin = 'idtipo'
    end
    object TMaquinasidmarca: TIntegerField
      FieldName = 'idmarca'
      Origin = 'idmarca'
    end
    object TMaquinasmodelo: TWideStringField
      FieldName = 'modelo'
      Origin = 'modelo'
      Size = 50
    end
    object TMaquinasplaca: TWideStringField
      FieldName = 'placa'
      Origin = 'placa'
    end
    object TMaquinasano: TIntegerField
      FieldName = 'ano'
      Origin = 'ano'
    end
    object TMaquinaschassi: TWideStringField
      FieldName = 'chassi'
      Origin = 'chassi'
      Size = 30
    end
    object TMaquinascombustivel: TIntegerField
      FieldName = 'combustivel'
      Origin = 'combustivel'
    end
    object TMaquinasvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 15
      Size = 2
    end
    object TMaquinasnumeroserie: TWideStringField
      FieldName = 'numeroserie'
      Origin = 'numeroserie'
      Size = 30
    end
    object TMaquinasimg: TBlobField
      FieldName = 'img'
      Origin = 'img'
    end
    object TMaquinasprefixo: TWideStringField
      FieldName = 'prefixo'
      Origin = 'prefixo'
    end
    object TMaquinasidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'idcategoria'
    end
    object TMaquinasidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TMaquinasanomodelo: TIntegerField
      FieldName = 'anomodelo'
      Origin = 'anomodelo'
    end
    object TMaquinassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TMaquinassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TMaquinasultimarevisao: TDateField
      FieldName = 'ultimarevisao'
      Origin = 'ultimarevisao'
    end
    object TMaquinashorimetroultimarev: TBCDField
      FieldName = 'horimetroultimarev'
      Origin = 'horimetroultimarev'
      Precision = 15
      Size = 3
    end
    object TMaquinasdepreciacao: TBCDField
      FieldName = 'depreciacao'
      Origin = 'depreciacao'
      Precision = 15
      Size = 3
    end
    object TMaquinasvidautil: TBCDField
      FieldName = 'vidautil'
      Origin = 'vidautil'
      Precision = 15
      Size = 3
    end
    object TMaquinashorimetroproximarevisao: TBCDField
      FieldName = 'horimetroproximarevisao'
      Origin = 'horimetroproximarevisao'
      Precision = 15
      Size = 3
    end
    object TMaquinashorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 3
    end
    object TMaquinascombustivelstr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'combustivelstr'
      Origin = 'combustivelstr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TMaquinascategoria: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'categoria'
      Origin = 'categoria'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TMaquinastipo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 50
    end
    object TMaquinasmarca: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'marca'
      Origin = 'marca'
      Size = 50
    end
  end
  object TProduto: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' pr.Id,'
      ' pr.Nome,'
      ' pr.NumeroSerie,'
      ' pr.CodigoBarras,'
      ' pr.Img,'
      ' pr.codigofabricante,'
      ' ax.Nome Categoria,'
      ' aug.Nome Grupo,'
      ' aus.Nome SubGrupo,'
      ' aum.Nome Marca,'
      'cast('
      ' case pr.idSegmento'
      '  when 0 then '#39'AGROPECU'#193'RIA'#39
      '  when 1 then '#39'AGRICULTURA'#39
      '  when 2 then '#39'AMBOS'#39
      ' end as varchar(15)) Segmento,'
      ' PR.sTATUS,'
      ' PR.Observacao,'
      ' PR.UnidadeMedida,'
      ' PR.Tipo,'
      ' defensivos'
      'from produtoS pr '
      'join auxcategoriaitem ax on ax.Id=pr.idCategoria'
      'left join auxgrupoprodutos aug on aug.id=pr.idGrupo '
      'left join auxsubgrupoprodutos aus on aus.id=pr.idSubGrupo '
      'left join auxMarcas aum on aum.id=pr.idMarca'
      'where pr.status=1 ')
    Left = 176
    Top = 380
    object TProdutoId: TIntegerField
      FieldName = 'Id'
      Origin = '"Id"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TProdutoNome: TWideStringField
      FieldName = 'Nome'
      Origin = '"Nome"'
      Size = 50
    end
    object TProdutoNumeroSerie: TIntegerField
      FieldName = 'NumeroSerie'
      Origin = '"NumeroSerie"'
    end
    object TProdutoCodigoBarras: TWideStringField
      FieldName = 'CodigoBarras'
      Origin = '"CodigoBarras"'
    end
    object TProdutoImg: TBlobField
      FieldName = 'Img'
      Origin = '"Img"'
    end
    object TProdutocodigofabricante: TWideStringField
      FieldName = 'codigofabricante'
      Origin = 'codigofabricante'
      Size = 30
    end
    object TProdutocategoria: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'categoria'
      Origin = 'categoria'
      Size = 50
    end
    object TProdutogrupo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grupo'
      Origin = 'grupo'
      Size = 50
    end
    object TProdutosubgrupo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'subgrupo'
      Origin = 'subgrupo'
      Size = 50
    end
    object TProdutomarca: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'marca'
      Origin = 'marca'
      Size = 50
    end
    object TProdutosegmento: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'segmento'
      Origin = 'segmento'
      ReadOnly = True
      Size = 15
    end
    object TProdutostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TProdutoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TProdutounidademedida: TWideStringField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
      Size = 10
    end
    object TProdutotipo: TWideStringField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TProdutodefensivos: TIntegerField
      FieldName = 'defensivos'
      Origin = 'defensivos'
    end
  end
  object TOperacoes: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from operacoes')
    Left = 220
    Top = 157
    object TOperacoesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TOperacoesstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TOperacoesdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TOperacoesidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TOperacoesdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TOperacoesidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TOperacoesnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object TAreas: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select a.*,u.nome responsavel from areas a'
      'left join usuario u on u.id=a.idresponsavel')
    Left = 217
    Top = 205
    object TAreasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAreasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAreasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAreasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAreasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAreasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAreasnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAreasareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TAreasidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object TAreasresponsavel: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
    object TAreaslatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TAreaslongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
    object TAreassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAreassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TSetor: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from setor')
    Left = 225
    Top = 261
    object TSetorid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSetorstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSetordatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSetoridusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSetordataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSetoridusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSetornome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSetorareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TSetoridarea: TIntegerField
      FieldName = 'idarea'
      Origin = 'idarea'
    end
    object TSetorlatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TSetorlongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
    object TSetorsyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSetorsyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TTalhoes: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select t.*, '
      ' case '
      '  when t.Tipo=0 then '#39'Proprio'#39
      '  when t.Tipo=1 then '#39'Arrendamento'#39
      ' end TipoSte'
      'from talhoes t')
    Left = 229
    Top = 309
    object TTalhoesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TTalhoesstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TTalhoesdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TTalhoesidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TTalhoesdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TTalhoesidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TTalhoesnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TTalhoesareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TTalhoesidsetor: TIntegerField
      FieldName = 'idsetor'
      Origin = 'idsetor'
    end
    object TTalhoesqrcode: TWideStringField
      FieldName = 'qrcode'
      Origin = 'qrcode'
    end
    object TTalhoestipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TTalhoesobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TTalhoestiposte: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tiposte'
      Origin = 'tiposte'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TTalhoeslatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TTalhoeslongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
    object TTalhoessyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TTalhoessyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TTalhoesqrcodesaida: TWideStringField
      FieldName = 'qrcodesaida'
      Origin = 'qrcodesaida'
    end
  end
  object TPluviometro: TFDQuery
    Connection = FDConPG
    SQL.Strings = (
      'select * from Pluviometro')
    Left = 224
    Top = 360
    object TPluviometroid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPluviometrostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPluviometrodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPluviometroidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPluviometrodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPluviometroidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPluviometronome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TPluviometrolatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TPluviometrolongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
    object TPluviometroidsetor: TIntegerField
      FieldName = 'idsetor'
      Origin = 'idsetor'
    end
    object TPluviometrosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TPluviometrosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TPluviometroTalhoes: TFDQuery
    Connection = FDConPG
    SQL.Strings = (
      'select  '
      
        #39'INSERT INTO pluviometrotalhoes(idusuario,idpluviometro, idtalha' +
        'o)VALUES('#39'||idusuario||'#39','#39'||'
      'idpluviometro||'#39','#39'||idtalhao||'#39')'#39' as Insert'
      'from pluviometrotalhoes p '
      'where status =1')
    Left = 224
    Top = 408
    object TPluviometroTalhoesinsert: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'insert'
      Origin = '"insert"'
      ReadOnly = True
      BlobType = ftWideMemo
    end
  end
  object TLocalEstoque: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from localestoque'
      'where combustivel=1')
    Left = 304
    Top = 160
    object TLocalEstoqueid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TLocalEstoquestatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TLocalEstoquedatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TLocalEstoqueidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TLocalEstoquedataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TLocalEstoqueidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TLocalEstoquenome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TLocalEstoqueidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TLocalEstoquesyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TLocalEstoquesyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TLocalEstoquecombustivel: TIntegerField
      FieldName = 'combustivel'
      Origin = 'combustivel'
    end
  end
  object TSafra: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from safra')
    Left = 297
    Top = 213
    object TSafraid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSafrastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSafradatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSafraidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSafradataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSafraidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSafranome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSafradatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object TSafradatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object TSafraobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
  end
  object TCulturas: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxculturas')
    Left = 299
    Top = 261
    object TCulturasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TCulturasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TCulturasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TCulturasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TCulturasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TCulturasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TCulturasnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object TCultivares: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxcultivares')
    Left = 304
    Top = 317
    object TCultivaresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TCultivaresstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TCultivaresdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TCultivaresidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TCultivaresdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TCultivaresidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TCultivaresnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TCultivaressyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TCultivaresidtipocultivar: TIntegerField
      FieldName = 'idtipocultivar'
      Origin = 'idtipocultivar'
    end
    object TCultivaresciclo: TIntegerField
      FieldName = 'ciclo'
      Origin = 'ciclo'
    end
  end
  object TTipoOcorrencia: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxtipoocorrencia')
    Left = 305
    Top = 370
    object TTipoOcorrenciaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TTipoOcorrenciastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TTipoOcorrenciadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TTipoOcorrenciaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TTipoOcorrenciadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TTipoOcorrenciaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TTipoOcorrencianome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object TTipoAplicacaoSolido: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxtipooperacaosolido')
    Left = 393
    Top = 157
    object TTipoAplicacaoSolidoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TTipoAplicacaoSolidostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TTipoAplicacaoSolidodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TTipoAplicacaoSolidoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TTipoAplicacaoSolidodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TTipoAplicacaoSolidoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TTipoAplicacaoSolidonome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object TReceituario: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select r.*,u.nome responsavel from receiturario r'
      'join usuario u on r.idResponsavel=u.id and tiporeceituario=0 '
      'where r.status=1 and liberado=1')
    Left = 386
    Top = 214
    object TReceituarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TReceituariostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TReceituariodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TReceituarioidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TReceituariodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TReceituarioidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TReceituarionome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TReceituarioidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object TReceituarioresponsavel: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
    object TReceituariosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TReceituariosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TReceituariodatarecomendacao: TDateField
      FieldName = 'datarecomendacao'
      Origin = 'datarecomendacao'
    end
    object TReceituariodataprevaplicacao: TDateField
      FieldName = 'dataprevaplicacao'
      Origin = 'dataprevaplicacao'
    end
    object TReceituarioobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
  end
  object TSyncUsuario: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' *'
      'from usuario'
      ''
      '')
    Left = 482
    Top = 248
    object TSyncUsuarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncUsuariostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncUsuariodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncUsuarioidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncUsuariodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncUsuarioidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncUsuarionome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TSyncUsuariousuario: TWideStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 25
    end
    object TSyncUsuariosenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 50
    end
    object TSyncUsuariotipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TSyncUsuarioidsupervisor: TIntegerField
      FieldName = 'idsupervisor'
      Origin = 'idsupervisor'
    end
    object TSyncUsuarioidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TSyncUsuariosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSyncUsuarioagronomo: TIntegerField
      FieldName = 'agronomo'
      Origin = 'agronomo'
    end
    object TSyncUsuarioabastecimento: TIntegerField
      FieldName = 'abastecimento'
      Origin = 'abastecimento'
    end
    object TSyncUsuariosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TSyncUsuariotokenapp: TWideStringField
      FieldName = 'tokenapp'
      Origin = 'tokenapp'
      Size = 500
    end
    object TSyncUsuariotokenappcompras: TWideStringField
      FieldName = 'tokenappcompras'
      Origin = 'tokenappcompras'
      Size = 500
    end
    object TSyncUsuarioimgass: TBlobField
      FieldName = 'imgass'
      Origin = 'imgass'
    end
  end
  object TSyncReceituario: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select b.* from receiturario b')
    Left = 480
    Top = 299
    object TSyncReceituarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncReceituariostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncReceituariodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncReceituarioidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncReceituariodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncReceituarioidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncReceituarionome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncReceituarioidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object TSyncReceituariosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSyncReceituariosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TSyncReceituariodatarecomendacao: TDateField
      FieldName = 'datarecomendacao'
      Origin = 'datarecomendacao'
    end
    object TSyncReceituariodataprevaplicacao: TDateField
      FieldName = 'dataprevaplicacao'
      Origin = 'dataprevaplicacao'
    end
  end
  object SyncDetReceituarioTalhao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'SELECT * FROM detreceiturarioTalhao')
    Left = 386
    Top = 11
    object SyncDetReceituarioTalhaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object SyncDetReceituarioTalhaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object SyncDetReceituarioTalhaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object SyncDetReceituarioTalhaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object SyncDetReceituarioTalhaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object SyncDetReceituarioTalhaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object SyncDetReceituarioTalhaoidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
    end
    object SyncDetReceituarioTalhaoareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object SyncDetReceituarioTalhaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object SyncDetReceituarioTalhaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object SyncDetReceituarioTalhaoidreceiturario: TIntegerField
      FieldName = 'idreceiturario'
      Origin = 'idreceiturario'
    end
  end
  object TSyncDetReceituario: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select d.*  from DetReceiturario d ')
    Left = 271
    Top = 11
    object TSyncDetReceituarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncDetReceituariostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncDetReceituariodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncDetReceituarioidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncDetReceituariodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncDetReceituarioidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncDetReceituarioidreceiturario: TIntegerField
      FieldName = 'idreceiturario'
      Origin = 'idreceiturario'
    end
    object TSyncDetReceituarioidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TSyncDetReceituariosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSyncDetReceituariosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TSyncDetReceituariofinalidade: TWideStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 100
    end
    object TSyncDetReceituarioqtdporhe: TBCDField
      FieldName = 'qtdporhe'
      Precision = 15
    end
  end
  object TDetReceituarioTalhao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'SELECT * FROM detreceiturarioTalhao')
    Left = 507
    Top = 12
    object TDetReceituarioTalhaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TDetReceituarioTalhaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TDetReceituarioTalhaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TDetReceituarioTalhaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TDetReceituarioTalhaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TDetReceituarioTalhaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TDetReceituarioTalhaoidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
    end
    object TDetReceituarioTalhaoareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TDetReceituarioTalhaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TDetReceituarioTalhaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TDetReceituarioTalhaoidreceiturario: TIntegerField
      FieldName = 'idreceiturario'
      Origin = 'idreceiturario'
    end
  end
  object TDetReceituario: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select dr.*,p.nome Produto from detreceiturario dr '
      'join produtos p on dr.idproduto=p.id')
    Left = 268
    Top = 62
    object TDetReceituarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TDetReceituariostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TDetReceituariodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TDetReceituarioidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TDetReceituariodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TDetReceituarioidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TDetReceituarioidreceiturario: TIntegerField
      FieldName = 'idreceiturario'
      Origin = 'idreceiturario'
    end
    object TDetReceituarioidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TDetReceituarioproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
    object TDetReceituariosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TDetReceituariofinalidade: TWideStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 100
    end
    object TDetReceituarioqtdporhe: TBCDField
      FieldName = 'qtdporhe'
      Precision = 15
    end
    object TDetReceituariosyncfaz: TIntegerField
      FieldName = 'syncfaz'
    end
  end
  object Toperacaosafratalhao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from operacaosafratalhao'
      'where status=-1000')
    Left = 521
    Top = 84
    object Toperacaosafratalhaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Toperacaosafratalhaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object Toperacaosafratalhaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object Toperacaosafratalhaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object Toperacaosafratalhaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object Toperacaosafratalhaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object Toperacaosafratalhaoidsafra: TIntegerField
      FieldName = 'idsafra'
      Origin = 'idsafra'
    end
    object Toperacaosafratalhaoidoperacao: TIntegerField
      FieldName = 'idoperacao'
      Origin = 'idoperacao'
    end
    object Toperacaosafratalhaodatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object Toperacaosafratalhaodatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object Toperacaosafratalhaoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object Toperacaosafratalhaoidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
    end
    object Toperacaosafratalhaoidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object Toperacaosafratalhaoareaprevista: TBCDField
      FieldName = 'areaprevista'
      Origin = 'areaprevista'
      Precision = 15
      Size = 2
    end
    object Toperacaosafratalhaoarearealizada: TBCDField
      FieldName = 'arearealizada'
      Origin = 'arearealizada'
      Precision = 15
      Size = 2
    end
    object Toperacaosafratalhaotipoterraaereo: TWideStringField
      FieldName = 'tipoterraaereo'
      Origin = 'tipoterraaereo'
      Size = 10
    end
    object Toperacaosafratalhaoidtipoaplicacaosolido: TIntegerField
      FieldName = 'idtipoaplicacaosolido'
      Origin = 'idtipoaplicacaosolido'
    end
    object Toperacaosafratalhaoidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object Toperacaosafratalhaoidvariedade: TIntegerField
      FieldName = 'idvariedade'
      Origin = 'idvariedade'
    end
    object Toperacaosafratalhaofinalidade: TWideStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 30
    end
    object Toperacaosafratalhaoidreceituario: TIntegerField
      FieldName = 'idreceituario'
      Origin = 'idreceituario'
    end
    object Toperacaosafratalhaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object Toperacaosafratalhaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object Toperacaosafratalhaoqualidadecobertura: TWideStringField
      FieldName = 'qualidadecobertura'
      Origin = 'qualidadecobertura'
    end
    object Toperacaosafratalhaoidcobertura: TIntegerField
      FieldName = 'idcobertura'
      Origin = 'idcobertura'
    end
  end
  object vQRY: TFDQuery
    Connection = FDConPG
    Left = 568
    Top = 280
  end
  object Tdetoperacaosafratalhaomaquinasoperadores: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'SELECT * FROM detoperacaosafratalhaomaquinasoperadores')
    Left = 601
    Top = 121
    object Tdetoperacaosafratalhaomaquinasoperadoresid: TIntegerField
      FieldName = 'id'
    end
    object Tdetoperacaosafratalhaomaquinasoperadoresstatus: TIntegerField
      FieldName = 'status'
    end
    object Tdetoperacaosafratalhaomaquinasoperadoresdatareg: TSQLTimeStampField
      FieldName = 'datareg'
    end
    object Tdetoperacaosafratalhaomaquinasoperadoresidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object Tdetoperacaosafratalhaomaquinasoperadoresdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
    end
    object Tdetoperacaosafratalhaomaquinasoperadoresidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
    end
    object Tdetoperacaosafratalhaomaquinasoperadoresidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
    end
    object Tdetoperacaosafratalhaomaquinasoperadoresidmaquina: TIntegerField
      FieldName = 'idmaquina'
    end
    object Tdetoperacaosafratalhaomaquinasoperadoresoperador: TWideStringField
      FieldName = 'operador'
      Size = 100
    end
    object Tdetoperacaosafratalhaomaquinasoperadoresobservacao: TWideStringField
      FieldName = 'observacao'
      Size = 100
    end
    object Tdetoperacaosafratalhaomaquinasoperadoresdata: TDateField
      FieldName = 'data'
    end
    object Tdetoperacaosafratalhaomaquinasoperadoreshorainicio: TBCDField
      FieldName = 'horainicio'
      Precision = 15
      Size = 3
    end
    object Tdetoperacaosafratalhaomaquinasoperadoreshorafim: TBCDField
      FieldName = 'horafim'
      Precision = 15
      Size = 3
    end
    object Tdetoperacaosafratalhaomaquinasoperadoreshoraparada: TBCDField
      FieldName = 'horaparada'
      Precision = 15
      Size = 3
    end
    object Tdetoperacaosafratalhaomaquinasoperadoreshorastrabalhada: TBCDField
      FieldName = 'horastrabalhada'
      Precision = 15
      Size = 3
    end
    object Tdetoperacaosafratalhaomaquinasoperadoressyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object Tdetoperacaosafratalhaomaquinasoperadoresidoperador: TIntegerField
      FieldName = 'idoperador'
      Origin = 'idoperador'
    end
    object Tdetoperacaosafratalhaomaquinasoperadoresromaneio: TWideStringField
      FieldName = 'romaneio'
      Origin = 'romaneio'
    end
  end
  object Tdetoperacaosafratalhaoocorrencia: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from detoperacaosafratalhaoocorrencia')
    Left = 662
    Top = 228
    object Tdetoperacaosafratalhaoocorrenciaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Tdetoperacaosafratalhaoocorrenciastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object Tdetoperacaosafratalhaoocorrenciadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object Tdetoperacaosafratalhaoocorrenciaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object Tdetoperacaosafratalhaoocorrenciadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object Tdetoperacaosafratalhaoocorrenciaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object Tdetoperacaosafratalhaoocorrenciaidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
    end
    object Tdetoperacaosafratalhaoocorrenciadataocorrencia: TDateField
      FieldName = 'dataocorrencia'
      Origin = 'dataocorrencia'
    end
    object Tdetoperacaosafratalhaoocorrenciaidtipoocorrencia: TIntegerField
      FieldName = 'idtipoocorrencia'
      Origin = 'idtipoocorrencia'
    end
    object Tdetoperacaosafratalhaoocorrenciahora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object Tdetoperacaosafratalhaoocorrenciadescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object Tdetoperacaosafratalhaoocorrenciadata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
  end
  object Tdetoperacaosafratalhaoprodutos: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'SELECT * FROM detoperacaosafratalhaoprodutos')
    Left = 649
    Top = 179
    object Tdetoperacaosafratalhaoprodutosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Tdetoperacaosafratalhaoprodutosstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object Tdetoperacaosafratalhaoprodutosdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object Tdetoperacaosafratalhaoprodutosidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object Tdetoperacaosafratalhaoprodutosdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object Tdetoperacaosafratalhaoprodutosidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object Tdetoperacaosafratalhaoprodutosidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
    end
    object Tdetoperacaosafratalhaoprodutosidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object Tdetoperacaosafratalhaoprodutosobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object Tdetoperacaosafratalhaoprodutosdata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object Tdetoperacaosafratalhaoprodutosqtdeutilidado: TBCDField
      FieldName = 'qtdeutilidado'
      Origin = 'qtdeutilidado'
      Precision = 15
      Size = 3
    end
    object Tdetoperacaosafratalhaoprodutossyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TVazaoOperacao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from DetVazaoOperacao'
      'where syncaws=0 '
      'order by id')
    Left = 265
    Top = 107
    object TVazaoOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TVazaoOperacaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TVazaoOperacaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TVazaoOperacaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TVazaoOperacaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TVazaoOperacaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TVazaoOperacaoidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
    end
    object TVazaoOperacaocincoltha: TIntegerField
      FieldName = 'cincoltha'
      Origin = 'cincoltha'
    end
    object TVazaoOperacaodezltha: TIntegerField
      FieldName = 'dezltha'
      Origin = 'dezltha'
    end
    object TVazaoOperacaoquinzeltha: TIntegerField
      FieldName = 'quinzeltha'
      Origin = 'quinzeltha'
    end
    object TVazaoOperacaovinteltha: TIntegerField
      FieldName = 'vinteltha'
      Origin = 'vinteltha'
    end
    object TVazaoOperacaotrintaltha: TIntegerField
      FieldName = 'trintaltha'
      Origin = 'trintaltha'
    end
    object TVazaoOperacaoquarentaltha: TIntegerField
      FieldName = 'quarentaltha'
      Origin = 'quarentaltha'
    end
    object TVazaoOperacaocinquentaltha: TIntegerField
      FieldName = 'cinquentaltha'
      Origin = 'cinquentaltha'
    end
    object TVazaoOperacaosetentaecincoltha: TIntegerField
      FieldName = 'setentaecincoltha'
      Origin = 'setentaecincoltha'
    end
    object TVazaoOperacaocemltha: TIntegerField
      FieldName = 'cemltha'
      Origin = 'cemltha'
    end
    object TVazaoOperacaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TVazaoOperacaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TStandPlantas: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from StandSementes')
    Left = 657
    Top = 287
    object TStandPlantasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TStandPlantasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TStandPlantasdatasementes: TDateField
      FieldName = 'datasementes'
      Origin = 'datasementes'
    end
    object TStandPlantasidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object TStandPlantasidvariedade: TIntegerField
      FieldName = 'idvariedade'
      Origin = 'idvariedade'
    end
    object TStandPlantasqtdesementes: TBCDField
      FieldName = 'qtdesementes'
      Origin = 'qtdesementes'
      Precision = 15
      Size = 2
    end
    object TStandPlantasdataplantas: TDateField
      FieldName = 'dataplantas'
      Origin = 'dataplantas'
    end
    object TStandPlantasqtdeplantas: TBCDField
      FieldName = 'qtdeplantas'
      Origin = 'qtdeplantas'
      Precision = 15
      Size = 2
    end
    object TStandPlantassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TStandPlantasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TStandPlantasidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
    end
    object TStandPlantassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TPluviometria: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from pluviometria')
    Left = 648
    Top = 360
    object TPluviometriaid: TIntegerField
      FieldName = 'id'
    end
    object TPluviometriastatus: TIntegerField
      FieldName = 'status'
    end
    object TPluviometriadatareg: TSQLTimeStampField
      FieldName = 'datareg'
    end
    object TPluviometriaidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object TPluviometriadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
    end
    object TPluviometriaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
    end
    object TPluviometriaidpluviometro: TIntegerField
      FieldName = 'idpluviometro'
    end
    object TPluviometriaidtalhao: TIntegerField
      FieldName = 'idtalhao'
    end
    object TPluviometriavolumemm: TBCDField
      FieldName = 'volumemm'
      Precision = 15
      Size = 3
    end
    object TPluviometriadatacoleta: TDateField
      FieldName = 'datacoleta'
    end
    object TPluviometriahora: TTimeField
      FieldName = 'hora'
    end
    object TPluviometriasyncaws: TIntegerField
      FieldName = 'syncaws'
    end
    object TPluviometriasyncfaz: TIntegerField
      FieldName = 'syncfaz'
    end
  end
  object TAbastecimento: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' *'
      'from abastecimento a'
      'where syncFaz=0')
    Left = 608
    Top = 54
    object TAbastecimentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAbastecimentostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAbastecimentodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAbastecimentoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAbastecimentodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAbastecimentoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAbastecimentoidlocalestoque: TIntegerField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
    end
    object TAbastecimentoidmaquina: TIntegerField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
    end
    object TAbastecimentoidoperador: TIntegerField
      FieldName = 'idoperador'
      Origin = 'idoperador'
    end
    object TAbastecimentovolumelt: TBCDField
      FieldName = 'volumelt'
      Origin = 'volumelt'
      Precision = 15
      Size = 3
    end
    object TAbastecimentocombustivel: TIntegerField
      FieldName = 'combustivel'
      Origin = 'combustivel'
    end
    object TAbastecimentodataabastecimento: TDateField
      FieldName = 'dataabastecimento'
      Origin = 'dataabastecimento'
    end
    object TAbastecimentohora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TAbastecimentosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAbastecimentosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TAbastecimentohorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoidatividade: TIntegerField
      FieldName = 'idatividade'
      Origin = 'idatividade'
    end
    object TAbastecimentoobs: TWideStringField
      FieldName = 'obs'
      Origin = 'obs'
      Size = 100
    end
    object TAbastecimentoimg: TWideMemoField
      FieldName = 'img'
      Origin = 'img'
      BlobType = ftWideMemo
    end
    object TAbastecimentoimg2: TWideMemoField
      FieldName = 'img2'
      Origin = 'img2'
      BlobType = ftWideMemo
    end
    object TAbastecimentoimg3: TWideMemoField
      FieldName = 'img3'
      Origin = 'img3'
      BlobType = ftWideMemo
    end
    object TAbastecimentoimg4: TWideMemoField
      FieldName = 'img4'
      Origin = 'img4'
      BlobType = ftWideMemo
    end
    object TAbastecimentoimg5: TWideMemoField
      FieldName = 'img5'
      Origin = 'img5'
      BlobType = ftWideMemo
    end
    object TAbastecimentoexterno: TIntegerField
      FieldName = 'externo'
      Origin = 'externo'
    end
  end
  object TAbastecimentoOutros: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select a.* from abastecimentoOutros a'
      'where syncfaz=0')
    Left = 704
    Top = 54
    object TAbastecimentoOutrosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAbastecimentoOutrosstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAbastecimentoOutrosdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAbastecimentoOutrosidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAbastecimentoOutrosdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAbastecimentoOutrosidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAbastecimentoOutrosidabastecimento: TIntegerField
      FieldName = 'idabastecimento'
      Origin = 'idabastecimento'
    end
    object TAbastecimentoOutrosidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TAbastecimentoOutrosquantidade: TBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoOutrossyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAbastecimentoOutrossyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TmonitoramentopragasPontos: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'SELECT * FROM monitoramentopragasPontos')
    Left = 408
    Top = 318
    object TmonitoramentopragasPontosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TmonitoramentopragasPontosstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TmonitoramentopragasPontosdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TmonitoramentopragasPontosidmonitoramento: TIntegerField
      FieldName = 'idmonitoramento'
      Origin = 'idmonitoramento'
    end
    object TmonitoramentopragasPontosponto: TWideStringField
      FieldName = 'ponto'
      Origin = 'ponto'
    end
    object TmonitoramentopragasPontosdataponto: TDateField
      FieldName = 'dataponto'
      Origin = 'dataponto'
    end
    object TmonitoramentopragasPontoshora: TSQLTimeStampField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TmonitoramentopragasPontoslatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
      Size = 50
    end
    object TmonitoramentopragasPontoslongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
      Size = 50
    end
    object TmonitoramentopragasPontossyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TmonitoramentopragasPontossyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TmonitoramentopragasPontosValores: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from monitoramentopragaspontosvalores')
    Left = 408
    Top = 366
    object TmonitoramentopragasPontosValoresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TmonitoramentopragasPontosValoresstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TmonitoramentopragasPontosValoresdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TmonitoramentopragasPontosValoresidponto: TIntegerField
      FieldName = 'idponto'
      Origin = 'idponto'
    end
    object TmonitoramentopragasPontosValoresidpraga: TIntegerField
      FieldName = 'idpraga'
      Origin = 'idpraga'
    end
    object TmonitoramentopragasPontosValorescontagem: TIntegerField
      FieldName = 'contagem'
      Origin = 'contagem'
    end
    object TmonitoramentopragasPontosValoreshora: TSQLTimeStampField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TmonitoramentopragasPontosValoressyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TmonitoramentopragasPontosValoressyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TmonitoramentopragasPontosValorescaracteristica: TIntegerField
      FieldName = 'caracteristica'
      Origin = 'caracteristica'
    end
  end
  object TMonitoramentoPraga: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from monitoramentopragas')
    Left = 384
    Top = 264
    object TMonitoramentoPragaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMonitoramentoPragastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TMonitoramentoPragadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TMonitoramentoPragaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TMonitoramentoPragadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TMonitoramentoPragaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TMonitoramentoPragadatamonitoramento: TDateField
      FieldName = 'datamonitoramento'
      Origin = 'datamonitoramento'
    end
    object TMonitoramentoPragaidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
    end
    object TMonitoramentoPragahorainicio: TSQLTimeStampField
      FieldName = 'horainicio'
      Origin = 'horainicio'
    end
    object TMonitoramentoPragatipoabertura: TIntegerField
      FieldName = 'tipoabertura'
      Origin = 'tipoabertura'
    end
    object TMonitoramentoPragahorafim: TSQLTimeStampField
      FieldName = 'horafim'
      Origin = 'horafim'
    end
    object TMonitoramentoPragasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TMonitoramentoPragasyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TMonitoramentoPragatagabertura: TWideStringField
      FieldName = 'tagabertura'
      Origin = 'tagabertura'
      Size = 50
    end
    object TMonitoramentoPragatagfechamento: TWideStringField
      FieldName = 'tagfechamento'
      Origin = 'tagfechamento'
      Size = 50
    end
  end
  object TMovLocalEstoque: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      '  select '
      '  * from tranferenciaLocalestoque A'
      '  ')
    Left = 720
    Top = 104
    object TMovLocalEstoqueid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMovLocalEstoquestatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TMovLocalEstoquedatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TMovLocalEstoqueidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TMovLocalEstoquedataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TMovLocalEstoqueidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TMovLocalEstoqueidlocalestoqueorigem: TIntegerField
      FieldName = 'idlocalestoqueorigem'
      Origin = 'idlocalestoqueorigem'
    end
    object TMovLocalEstoqueidlocalestoquedetino: TIntegerField
      FieldName = 'idlocalestoquedetino'
      Origin = 'idlocalestoquedetino'
    end
    object TMovLocalEstoqueidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TMovLocalEstoqueqtde: TBCDField
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 15
      Size = 3
    end
    object TMovLocalEstoquedatamov: TDateField
      FieldName = 'datamov'
      Origin = 'datamov'
    end
    object TMovLocalEstoquehora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TMovLocalEstoquesyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TMovLocalEstoquesyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object Tauxatividadeabastecimento: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'SELECT * FROM auxatividadeabastecimento')
    Left = 568
    Top = 384
    object Tauxatividadeabastecimentoid: TIntegerField
      FieldName = 'id'
    end
    object Tauxatividadeabastecimentostatus: TIntegerField
      FieldName = 'status'
    end
    object Tauxatividadeabastecimentodatareg: TSQLTimeStampField
      FieldName = 'datareg'
    end
    object Tauxatividadeabastecimentoidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object Tauxatividadeabastecimentodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
    end
    object Tauxatividadeabastecimentoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
    end
    object Tauxatividadeabastecimentonome: TWideStringField
      FieldName = 'nome'
      Size = 50
    end
    object Tauxatividadeabastecimentosyncaws: TIntegerField
      FieldName = 'syncaws'
    end
    object Tauxatividadeabastecimentosyncfaz: TIntegerField
      FieldName = 'syncfaz'
    end
  end
  object Comprador: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from comprador')
    Left = 749
    Top = 280
    object Compradorid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Compradorstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object Compradordatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object Compradoridusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object Compradordataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object Compradoridusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object Compradornome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object Compradorcidade: TWideStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 100
    end
    object Compradoruf: TWideStringField
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
    object Compradorcpf_cnpj: TWideStringField
      FieldName = 'cpf_cnpj'
      Origin = 'cpf_cnpj'
      Size = 30
    end
    object Compradortelefone_fixo: TWideStringField
      FieldName = 'telefone_fixo'
      Origin = 'telefone_fixo'
    end
    object Compradorcelular: TWideStringField
      FieldName = 'celular'
      Origin = 'celular'
    end
    object Compradoremail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object Compradorcontatopessoa: TWideStringField
      FieldName = 'contatopessoa'
      Origin = 'contatopessoa'
      Size = 100
    end
    object Compradorsenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
    end
    object Compradorsyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object Compradorrazaosocial: TWideStringField
      FieldName = 'razaosocial'
      Origin = 'razaosocial'
      Size = 100
    end
    object Compradorinscricaoestadual: TWideStringField
      FieldName = 'inscricaoestadual'
      Origin = 'inscricaoestadual'
    end
    object Compradorsyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object Contratos: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from contratos')
    Left = 749
    Top = 328
    object Contratosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Contratosstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object Contratosdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object Contratosidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object Contratosdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object Contratosidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object Contratosidcomprador: TIntegerField
      FieldName = 'idcomprador'
      Origin = 'idcomprador'
    end
    object Contratosidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object Contratosidsafra: TIntegerField
      FieldName = 'idsafra'
      Origin = 'idsafra'
    end
    object Contratosnumerocontrato: TWideStringField
      FieldName = 'numerocontrato'
      Origin = 'numerocontrato'
    end
    object Contratostotalcompravolume: TBCDField
      FieldName = 'totalcompravolume'
      Origin = 'totalcompravolume'
      Precision = 15
      Size = 3
    end
    object Contratostotalcomprasacos: TBCDField
      FieldName = 'totalcomprasacos'
      Origin = 'totalcomprasacos'
      Precision = 15
      Size = 3
    end
    object Contratostotalembarquevolume: TBCDField
      FieldName = 'totalembarquevolume'
      Origin = 'totalembarquevolume'
      Precision = 15
      Size = 3
    end
    object Contratostotalembarquesacos: TBCDField
      FieldName = 'totalembarquesacos'
      Origin = 'totalembarquesacos'
      Precision = 15
      Size = 3
    end
    object Contratossyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object Contratossyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object Embarque: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from embarque')
    Left = 749
    Top = 376
    object Embarqueid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Embarquestatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object Embarquedatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object Embarqueidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object Embarquedataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object Embarqueidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object Embarqueidcontrato: TIntegerField
      FieldName = 'idcontrato'
      Origin = 'idcontrato'
    end
    object Embarquenumeronf: TIntegerField
      FieldName = 'numeronf'
      Origin = 'numeronf'
    end
    object Embarqueplaca: TWideStringField
      FieldName = 'placa'
      Origin = 'placa'
      Size = 15
    end
    object Embarquedataembarque: TDateField
      FieldName = 'dataembarque'
      Origin = 'dataembarque'
    end
    object Embarquehorabarque: TTimeField
      FieldName = 'horabarque'
      Origin = 'horabarque'
    end
    object Embarquetara: TBCDField
      FieldName = 'tara'
      Origin = 'tara'
      Precision = 15
      Size = 3
    end
    object Embarquebruto: TBCDField
      FieldName = 'bruto'
      Origin = 'bruto'
      Precision = 15
      Size = 3
    end
    object Embarqueliquido: TBCDField
      FieldName = 'liquido'
      Origin = 'liquido'
      Precision = 15
      Size = 3
    end
    object Embarqueimp: TBCDField
      FieldName = 'imp'
      Origin = 'imp'
      Precision = 15
      Size = 3
    end
    object Embarquequeb: TBCDField
      FieldName = 'queb'
      Origin = 'queb'
      Precision = 15
      Size = 3
    end
    object Embarqueverd: TBCDField
      FieldName = 'verd'
      Origin = 'verd'
      Precision = 15
      Size = 3
    end
    object Embarqueavar: TBCDField
      FieldName = 'avar'
      Origin = 'avar'
      Precision = 15
      Size = 3
    end
    object Embarqueumid: TBCDField
      FieldName = 'umid'
      Origin = 'umid'
      Precision = 15
      Size = 3
    end
    object Embarquesyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object Embarquesyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TManutencao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select '
      
        ' '#39'INSERT INTO revisaomaquinahist(id,idplanorevisao,idmaquina,dat' +
        'ainicio, datafim,horimetro,horimetroproxima,planonome,horimetrom' +
        'aquina)VALUES('#39' '
      
        '||row_number() OVER (PARTITION by 0)||'#39','#39'||plano.id||'#39','#39'||maquin' +
        'a.id||'#39','#39'||'#39#39#39#39'|| max(revisao.datainicio)||'#39#39#39#39'||'#39','#39'|| '
      #39#39#39#39'||max(revisao.datafim)||'#39#39#39#39'||'#39','#39'||'
      'max(revisao.horimetro)||'#39','#39'||'
      
        ' max(revisao.horimetroproxima)||'#39','#39'||'#39#39#39#39'||plano.nome||'#39#39#39#39'||'#39','#39 +
        '||'
      ' max(maquina.horimetro)||'#39');'#39' as INSERT'
      ' from revisaomaquina revisao '
      'join maquinaveiculo maquina on maquina.id=revisao.idmaquina '
      
        'join planorevisao plano on revisao.idplanorevisao=plano.id and p' +
        'lano.status =1'
      'where revisao.status =1'
      'group by maquina.id ,plano.id ,plano.nome,plano.intervalohoras '
      'order by maquina.id ,plano.intervalohoras  ')
    Left = 48
    Top = 208
    object TManutencaoinsert: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'insert'
      Origin = '"insert"'
      ReadOnly = True
      BlobType = ftWideMemo
    end
  end
  object TPlanoManutencao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from planorevisao '
      'where status=1')
    Left = 48
    Top = 256
    object TPlanoManutencaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPlanoManutencaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPlanoManutencaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPlanoManutencaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPlanoManutencaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPlanoManutencaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPlanoManutencaonome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TPlanoManutencaointervalohoras: TBCDField
      FieldName = 'intervalohoras'
      Origin = 'intervalohoras'
      Precision = 15
      Size = 3
    end
    object TPlanoManutencaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TPlanoManutencaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TPlanoRevisaoItens: TFDQuery
    Connection = FDConPG
    SQL.Strings = (
      'select * from planorevisaoitens '
      'where status =1')
    Left = 48
    Top = 312
    object TPlanoRevisaoItensid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPlanoRevisaoItensstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPlanoRevisaoItensdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPlanoRevisaoItensidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPlanoRevisaoItensdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPlanoRevisaoItensidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPlanoRevisaoItensidrevisao: TIntegerField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
    end
    object TPlanoRevisaoItenssyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TPlanoRevisaoItenssyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TPlanoRevisaoItensidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TPlanoRevisaoItensqtde: TBCDField
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 10
      Size = 3
    end
    object TPlanoRevisaoItenstipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TPlanoRevisaoItensobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TPlanoRevisaoItensitem: TWideStringField
      FieldName = 'item'
      Origin = 'item'
      Size = 100
    end
    object TPlanoRevisaoItensiditem: TIntegerField
      FieldName = 'iditem'
      Origin = 'iditem'
    end
  end
  object TPlanoRevisaoMaquinas: TFDQuery
    Connection = FDConPG
    SQL.Strings = (
      'select * from planorevisaomaquinas '
      'where status =1')
    Left = 48
    Top = 360
    object TPlanoRevisaoMaquinasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPlanoRevisaoMaquinasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPlanoRevisaoMaquinasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPlanoRevisaoMaquinasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPlanoRevisaoMaquinasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPlanoRevisaoMaquinasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPlanoRevisaoMaquinasidrevisao: TIntegerField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
    end
    object TPlanoRevisaoMaquinasidmaquina: TIntegerField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
    end
    object TPlanoRevisaoMaquinassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TPlanoRevisaoMaquinassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAuxRevisaoItem: TFDQuery
    Connection = FDConPG
    SQL.Strings = (
      
        'select '#39'INSERT INTO auxrevisaoitens(id,status,idusuario,nome, gr' +
        'upo,syncfaz,syncaws) VALUES('#39'||id||'#39','#39'||'
      
        'status||'#39','#39'||idusuario||'#39','#39'||'#39#39#39#39'||nome||'#39#39#39#39'||'#39','#39'||'#39#39#39#39'||grupo|' +
        '|'#39#39#39#39'||'#39',1,1'#39'||'#39');'#39' as insert'
      'from auxrevisaoitens '
      'where status=1')
    Left = 40
    Top = 416
    object TAuxRevisaoIteminsert: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'insert'
      Origin = '"insert"'
      ReadOnly = True
      BlobType = ftWideMemo
    end
  end
  object TProdutosInsert: TFDQuery
    Connection = FDConPG
    SQL.Strings = (
      'select '
      
        #39'insert into produtos(id,status,nome,tipo,unidademedida,defenciv' +
        'o,codigofabricante)values('#39'||'
      'id||'#39','#39'||status||'#39','#39'||'#39#39#39#39'||replace(nome,'#39#39#39#39','#39' '#39')||'#39#39#39#39'||'#39','#39'||'
      'case'
      ' when defensivos=0 then 0'
      ' else'
      '  3'
      
        'end||'#39','#39'||'#39#39#39#39'||unidademedida||'#39#39#39#39'||'#39','#39'||defensivos||'#39','#39'||'#39#39#39#39'|' +
        '|coalesce(codigofabricante,'#39'0'#39')||'#39#39#39#39'||'#39')'#39' as insert'
      'from produtos p  '
      'where status =1')
    Left = 488
    Top = 184
  end
  object TPlanoRevisaoItensInsert: TFDQuery
    Connection = FDConPG
    SQL.Strings = (
      'select '
      
        #39'insert into planorevisaoitens(id,idusuario,idrevisao,idproduto,' +
        'qtde,tipo,item,iditem)values('#39'||id||'#39','#39'||idusuario||'#39','#39'||idrevis' +
        'ao||'#39','#39'||'
      'coalesce(idproduto,0)||'#39','#39'||coalesce(qtde,0)||'#39','#39'||'
      
        'tipo||'#39','#39'||'#39#39#39#39'||item||'#39#39#39#39'||'#39','#39'||coalesce(iditem,0)||'#39');'#39'as ins' +
        'ert'
      'from planorevisaoitens p '
      'where status =1')
    Left = 144
    Top = 64
    object TPlanoRevisaoItensInsertinsert: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'insert'
      Origin = '"insert"'
      ReadOnly = True
      BlobType = ftWideMemo
    end
  end
  object TPlanoRevisaoMaquinasInsert: TFDQuery
    Connection = FDConPG
    SQL.Strings = (
      'select '
      
        #39'insert into planorevisaomaquinas(id,idusuario,idrevisao,idmaqui' +
        'na)values('#39'||id||'#39','#39'||idusuario||'#39','#39'||idrevisao||'#39','#39'||idmaquina|' +
        '|'#39');'#39' as insert'
      'from planorevisaomaquinas '
      'where status =1')
    Left = 144
    Top = 120
    object TPlanoRevisaoMaquinasInsertinsert: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'insert'
      Origin = '"insert"'
      ReadOnly = True
      BlobType = ftWideMemo
    end
  end
  object TPostRevisaoServico: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'SELECT * FROM servicomanutencao')
    Left = 672
    Top = 447
    object TPostRevisaoServicoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPostRevisaoServicostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPostRevisaoServicodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPostRevisaoServicoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPostRevisaoServicodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPostRevisaoServicoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPostRevisaoServicotiposervico: TIntegerField
      FieldName = 'tiposervico'
      Origin = 'tiposervico'
    end
    object TPostRevisaoServicoidrevisao: TIntegerField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
    end
    object TPostRevisaoServicodescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object TPostRevisaoServicoresponsavel: TWideStringField
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
    object TPostRevisaoServicovalortotal: TBCDField
      FieldName = 'valortotal'
      Origin = 'valortotal'
      Precision = 15
      Size = 3
    end
    object TPostRevisaoServicosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TPostRevisaoServicosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TPostRevisaoServicodatarealizado: TDateField
      FieldName = 'datarealizado'
      Origin = 'datarealizado'
    end
  end
  object TPostRevisaoItem: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from revisaomaquinaitens ')
    Left = 568
    Top = 447
    object TPostRevisaoItemid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPostRevisaoItemstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPostRevisaoItemdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPostRevisaoItemidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPostRevisaoItemdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPostRevisaoItemidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPostRevisaoItemidrevisao: TIntegerField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
    end
    object TPostRevisaoItemsyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TPostRevisaoItemsyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TPostRevisaoItemidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TPostRevisaoItemqtde: TBCDField
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 10
      Size = 3
    end
    object TPostRevisaoItemitem: TWideStringField
      FieldName = 'item'
      Origin = 'item'
      Size = 100
    end
    object TPostRevisaoItemtipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TPostRevisaoItemobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TPostRevisaoItemiditem: TIntegerField
      FieldName = 'iditem'
      Origin = 'iditem'
    end
  end
  object TPostRevisao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from revisaomaquina r ')
    Left = 488
    Top = 447
    object TPostRevisaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPostRevisaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPostRevisaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPostRevisaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPostRevisaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPostRevisaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPostRevisaoidplanorevisao: TIntegerField
      FieldName = 'idplanorevisao'
      Origin = 'idplanorevisao'
    end
    object TPostRevisaoidmaquina: TIntegerField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
    end
    object TPostRevisaoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TPostRevisaodatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object TPostRevisaodatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object TPostRevisaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TPostRevisaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TPostRevisaoidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object TPostRevisaohorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 2
    end
    object TPostRevisaotipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TPostRevisaohorimetroproxima: TBCDField
      FieldName = 'horimetroproxima'
      Origin = 'horimetroproxima'
      Precision = 15
      Size = 3
    end
  end
  object TPostAuxItemRevisao: TFDQuery
    CachedUpdates = True
    OnReconcileError = TPostAuxItemRevisaoReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxrevisaoitens')
    Left = 392
    Top = 447
    object TPostAuxItemRevisaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPostAuxItemRevisaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPostAuxItemRevisaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPostAuxItemRevisaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPostAuxItemRevisaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPostAuxItemRevisaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPostAuxItemRevisaonome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TPostAuxItemRevisaogrupo: TWideStringField
      FieldName = 'grupo'
      Origin = 'grupo'
      Size = 100
    end
    object TPostAuxItemRevisaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TPostAuxItemRevisaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object Desembarques: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from desembarque')
    Left = 392
    Top = 88
    object Desembarquesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Desembarquesstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object Desembarquesdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object Desembarquesidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object Desembarquesdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object Desembarquesidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object Desembarquesidsafra: TIntegerField
      FieldName = 'idsafra'
      Origin = 'idsafra'
    end
    object Desembarquesidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
    end
    object Desembarquesidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object Desembarquesplaca: TWideStringField
      FieldName = 'placa'
      Origin = 'placa'
      Size = 15
    end
    object Desembarquesdatadesembarque: TDateField
      FieldName = 'datadesembarque'
      Origin = 'datadesembarque'
    end
    object Desembarqueshoradesembarque: TTimeField
      FieldName = 'horadesembarque'
      Origin = 'horadesembarque'
    end
    object Desembarquestara: TBCDField
      FieldName = 'tara'
      Origin = 'tara'
      Precision = 15
      Size = 3
    end
    object Desembarquesbruto: TBCDField
      FieldName = 'bruto'
      Origin = 'bruto'
      Precision = 15
      Size = 3
    end
    object Desembarquesliquido: TBCDField
      FieldName = 'liquido'
      Origin = 'liquido'
      Precision = 15
      Size = 3
    end
    object Desembarquesimp: TBCDField
      FieldName = 'imp'
      Origin = 'imp'
      Precision = 15
      Size = 3
    end
    object Desembarquesqueb: TBCDField
      FieldName = 'queb'
      Origin = 'queb'
      Precision = 15
      Size = 3
    end
    object Desembarquesverd: TBCDField
      FieldName = 'verd'
      Origin = 'verd'
      Precision = 15
      Size = 3
    end
    object Desembarquesavar: TBCDField
      FieldName = 'avar'
      Origin = 'avar'
      Precision = 15
      Size = 3
    end
    object Desembarquesumid: TBCDField
      FieldName = 'umid'
      Origin = 'umid'
      Precision = 15
      Size = 3
    end
    object Desembarquessyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object Desembarquessyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object Desembarquesvalornf: TBCDField
      FieldName = 'valornf'
      Origin = 'valornf'
      Precision = 15
      Size = 3
    end
  end
end
