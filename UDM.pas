// 09/07/2007 15:41 78685 Rodrigo.Postai  Lock de Tabelas
// 06/07/2007 17:36 76581 Mochi  Tratamento seriado x Cancelamento Beneficiario
// 05/07/2007 17:59 83110 RICARDO.VIEIRA  Problemas na geração de diárias na validação de autorização de internação
// 03/07/2007 08:40 70874 Mochi  Limitação Ortodontia - Contagem Incorreta
// 20/06/2007 14:51 83356 Julio  Botão revalidar x Negação "Prestador não pode receber o evento".
// 19/06/2007 16:39 83262 Julio  TISS - AG 3.3.10 - Pop-up de tratamento seriado gerado indevidamente
// 18/06/2007 12:03 70874 Julio  Limitação Ortodontia - Contagem Incorreta
// 12/06/2007 18:36 82881 PAULO.MELO  Mensagem de tratamento seriado na autorização odontológica
// 08/06/2007 18:53 79108 Marcelo.Barbosa  Glosas: Evento já pago e Autorização Vencida
// 06/06/2007 16:22 81762 RODRIGO.ANDRADE  Ao realizar o movimento de acerto  o sistema gera negações indevidas
// 01/06/2007 10:07 82589 Marcelo.Barbosa  Erro ao validar Autorização.
// 29/05/2007 18:45 76581 Marcelo.Barbosa  Tratamento seriado x Cancelamento Beneficiario
// 29/05/2007 17:17 81583 ARTUR.MARTINS  Erro no grau apresentado na autorização, quando há prorrogação
// 30/04/2007 08:23 79017 DEBORA.REBELLO  TISS 2.1 - Ajuste na numeração de guias e solicitações
// 27/04/2007 08:56 78567 Marcelo.Barbosa  AG 3.3.09 - Produção - Problemas na negação "prestador não pode realizar o evento"
// 25/04/2007 15:35 80729 Marcelo.Barbosa  Limitação Ortodontia - Contagem Incorreta
// 25/04/2007 15:09 77448 Ferreira  TISS 2.1 - Tipo acomodação X acomodação
// 09/04/2007 09:39 79716 Walberti  Erro ao prorrogar evento quando o beneficiário está cancelado.
{
Alterações:

date:10-04-2000
by  : Paulo Garcia Jr.
desc: O campo recebedor do Acadastro samauto__PRESTADOR não estava sendo checado corretamente
      substituição das atribuições data() e now() por sys.serverDate() e sys.serverNow();
date:03/05/2000
by  : Wilson Jr.
desc: Voltar nas negações a quantidade de eventos autorizados.
      - Essa alteração terá efeito nos casos de negações cuja verificação
        é feita pela quantidade de eventos
date:05/05/2000                -
by  : Wilson Jr.
desc: Ao cruzar os eventos complementares com os eventos de um pacote negociado
      não se estava levando em consideração o grau dos eventos
      Querys alteradas: SQLPCTPRESTADOR, SQLPCTMUNICIPIO, SQLPCTESTADO,
                        SQLPCTGERAL
date:18/07/2000
by  : Wilson Jr.
desc: Na atualização do evento principal, buscar nos Parâmetros Gerais o XTHM e o
      CODIGOPAGTO caso estes estejam nulos

date:07/11/2000
by  : Fábio J. C.
desc: Ao Gravar o evento gerado, não utilizar a Sys.CurrentyQuery para permitir
      a chamada a partir de outra DLL

date:07/12/2000
by  : Mauricio Ibelli
desc: 1) sms 1153 -> Colocar data de vigencia para carencia no contrato
      2) acerto   -> Colocar nas roinas comparacao com data parametro
      ChecarFamiliaBloqueada e
      ChecarFamiliaInativa e
      ChecarContratoBloqueado,

date:13/12/2000
by  : Wilson Jr.
desc: Tratamento do campo Finalidade de Atendimento

date:14/12/2000
by  : Wilson Jr.
desc: Alçada por limite

date:15/12/2000
by  : Wilson Jr.
desc: Indicador Comporta código de pagamento

date:30/01/2001
by  : Wilson Jr.
desc: Negações de evento e grau não comportam percentual de pagamento
      - Foram alterados os procedimentos Validador e AlterarSAM_AUTORIZ_EVENTOGERADO
        -> Foi incluído o parâmetro pCodigoPagto

date:14/02/2001
by  : Juliano
desc: Substituído o TABGERACAO por TABGERACAOREC em 3 pontos do código

date: 17/05/2001
by  : Fábio
desc: Internação, CodPagto equipe via, Tipo regime de atendimento, Série terapêutica
      Negações: SAM_ERRO_BENEFICIARIOINTERNACAO 1300
                SAM_ERRO_EVENTOINTERNACAO 7000
                SAM_ERRO_EVENTOINTERVALOINTERNACAO 4190

date: 29/05/2001
by  : Junior
desc: Mudança no cálculo do limite. Criado o parâmetro pDataCalculoLimitacao que será
      usado no cálculo do limite.

date: 23/07/2001
by  : Junior
desc: Solicitação de auxílio.

date: 03/12/2001
by  : Mauricio Ibelli sms: 5212 (FEF)
desc: Checar pendencias para documentos de prestador.

date: 07/12/2001
by  : Mauricio Ibelli sms: 5009 (FEF-AUT-01)
desc: Nao levar dados de valores informados no evento solicitado para o evento gerado
      se definido no evento complementar que NAOACEITAPFINFAUT = "S" > Somente para EVENTO COMPLEMENTAR GERAL

date: 11/12/2001
by  : Mauricio Ibelli sms: xxxx
desc: Inclusão do processo de geracao de Pericia e Validacao da auditoria (ja existente)

date: 08/01/2002
by  : Mauricio Ibelli sms: 5731
desc: Alterar a Query "CONTA_LIMITES" para acerto de contagem.

date: 07/03/2002
by  : Fábio sms: 10365
desc: Para melhor manutenção é necessário dividir a SamAuto.
      Dividir essa dll em várias é inviável devido ao tempo gasto para criar as dlls, sendo que as funções são utilizadas sempre em conjunto.
      Sendo assim optous-se por dividir a SamAuto units para facilitar a manutenção.
       - uDM: DataModule principal;
       - uFrmAlertas: Formulário com funções dos alertas;
       - uDMLimite: DataModule com funções do limite;
       - uDMReverter: DataModule com as funções reverter;
       - uDMCancelar: DataModule com as funções cancelar;
       - uDMFechamento: DataModule com as funções fechamento;

date: 15/08/2002
by  : Fábio
desc: Autorização por Stored procedure em qualquer banco está suspensa.
      Somente está sendo atualizada a dll,
      Após o pacote 15, provavelmente 16 serão ajustadas as SP.


date: 22/08/2002
by  : Fábio
desc: A interface uiAcomodacao foi substituída por uiRotinas.
      Sendo assim, qualquer rotina que não utilize muito as rotinas da
      interface uiAutorizador deve ser implementado na uiRotinas,
      ficando mais leve devido ao número de componentes.
}

unit UDM;

interface

uses

  Windows, Variants,
  Messages,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  rotinas,

  Db,
  ComObj,
  SysUtils, BennerQuery, Status, BennerStoredProc, uBQuery, UISamAutoImpl,
  uManagedInterop, Benner_Tecnologia_ManagedInterop_TLB, uBDebug;

type
  tPrazoIntervalar = record
    Data: TDateTime;
    Quantidade: Double;
  end;

  tqtd = record
    QTDMaxima: Integer;
    Percentual: Double;
    QTDPaga: Double;
  end;

  EventoPrincipal =
    record
    HandleEvento: integer;
    Valor: double;
  end;

  PNegList = ^ListaNegacao;
  ListaNegacao =
    record
    HandleOrigem: integer;
    Negacao: integer;
    Complemento: WideString;
    SamMotivoNegacao: integer;
    //Junior - 03/05/2000
    QtdAutorizada: Currency;
    QtdLiberadaAuxilio: Currency;
    LiberaPorAuxilio: string;
    //larini 21/08/2003
    ValorAutorizado: Currency;

  end;

  PNegBenefPrestador = ^ListaNegacaoBenefPrestador;
  ListaNegacaoBenefPrestador =
    record
    Negacao: integer;
    Complemento: WideString;
    SamMotivoNegacao: integer;
  end;

   PNegBenefPrestador = ^ListaNegacaoBenefPrestador;
  ListaNegacaoBenefPrestador = mineros
    record
    Negacao: integer;
    Complemento: WideString;
    SamMotivoNegacao: integer;
  end;

  PNegacoesValidas = ^ListaNegacoesValidas;
  ListaNegacoesValidas =
    record
    Codigo: integer;
    HandleNegacao: integer;
    LiberaPorAuxilio: string;
    //Junior - 31/10/2001
    //Considerar o novo parâmetro 'CONSIDERANOPAGAMENTO'
    //Se o parâmetro em SAM_MOTIVONEGACAO_SIS estiver marcado com 'N'
    //a negação não será considerada quando a origem do processo for 'P' - pagamento
    //Alterada query MOTIVO_NEGACAO
    ConsideraNoPagamento: string;
    RegimePagamento: string;
  end;

  TDM = class(TDataModule)
    SQLPCTPRESTADOR: TBennerQuery;
    SQLPCTMUNICIPIO: TBennerQuery;
    SQLPCTESTADO: TBennerQuery;
    SQLPCTGERAL: TBennerQuery;
    SQLTGECOMPLEMENTAR: TBennerQuery;
    SQLGen: TBennerQuery;
    samauto_AUTORIZ_EVENTOSOLICIT: TBennerQuery;
    EXECUTOR: TBennerQuery;
    sam_PARAMETROSGERAIS: TBennerQuery;
    samauto_ACOMODACAO_EVENTO: TBennerQuery;
    samauto_BENEFICIARIO: TBennerQuery;
    samauto_BENEFICIARIO_CARTAOIDENTIF: TBennerQuery;
    samauto_CONTRATO_TPDEP: TBennerQuery;
    samauto_CONTRATO_TPDEP_DOC: TBennerQuery;
    samauto_PRESTADOR_ESPECIALIDADE: TBennerQuery;
    samauto_PRESTADOR_AFASTAMENTO: TBennerQuery;
    samauto_TGE: TBennerQuery;
    samauto_TGE_GRAU: TBennerQuery;
    samauto_PRONTUARIO: TBennerQuery;
    samauto_TGE_DEPENDENTE: TBennerQuery;
    MODULO_COBERTURA: TBennerQuery;
    CARAC_ATENDIMENTO: TBennerQuery;
    REDE_RESTRITA: TBennerQuery;
    samauto_REDERESTRITA_PRESTADOR: TBennerQuery;
    samauto_REDEDIFERENCIADA_PRESTADOR: TBennerQuery;
    REGRA_EXECUCAO: TBennerQuery;
    PODEEXECUTAR: TBennerQuery;
    samauto_PRESTADOR_PRESTADORDAENTID: TBennerQuery;
    PRESTADOR_HABILITACAO: TBennerQuery;
    CONT_BENEFICIARIO: TBennerQuery;
    CONT_FAMILIA: TBennerQuery;
    CONT_CONTRATO: TBennerQuery;
    SOLICITANTE: TBennerQuery;
    EXECUTOR_AUX: TBennerQuery;
    samauto_AUTORIZ_EVENTONEGACAO: TBennerQuery;
    MOTIVO_NEGACAO: TBennerQuery;
    CARENCIA: TBennerQuery;
    Q: TBennerQuery;
    samauto_BENEFICIARIO_DOCENTREGUE: TBennerQuery;
    samauto_GRAU: TBennerQuery;
    UPD: TBennerQuery;
    RECEBEDOR: TBennerQuery;
    INSEVENTOGERADO: TBennerQuery;
    PODERECEBER: TBennerQuery;
    REGRA_RECEBIMENTO: TBennerQuery;
    QA: TBennerQuery;
    QS: TBennerQuery;
    QG: TBennerQuery;
    SAM_PARAMETROSPRESTADOR: TBennerQuery;
    QPFEventoB: TBennerQuery;
    QPFEventoF: TBennerQuery;
    QPFEventoC: TBennerQuery;
    QPFFaixaC: TBennerQuery;
    QPFFaixaF: TBennerQuery;
    QPFFaixaB: TBennerQuery;
    qQtdAntPF: TBennerQuery;
    PRAZO_INTERVALAR_AUX: TBennerQuery;
    samauto_AUTORIZ_ACOMODACAO: TBennerQuery;
    samauto_BENEFICIARIO_LICENCA: TBennerQuery;
    FINALIDADEATENDIMENTO: TBennerQuery;
    GRUPOUSUARIO: TBennerQuery;
    samauto_GUIAEVENTOS: TBennerQuery;
    SAM_PARAMETROSBENEFICIARIO: TBennerQuery;
    SUSPENSAO_TITULAR: TBennerQuery;
    qEquipeVia: TBennerQuery;
    qVerificaAuxilio: TBennerQuery;
    qDeleteEventoBeneficio: TBennerQuery;
    qUpdAuxBeneficio: TBennerQuery;
    qAuxIlio: TBennerQuery;
    qInsEventoBeneficio: TBennerQuery;
    REDE_RESTRITA_CONTRATO: TBennerQuery;
    SQLPCTREDE: TBennerQuery;
    qInternacao: TBennerQuery;
    qEventosValidos: TBennerQuery;
    samauto_PRESTADOR_ISENTADOC: TBennerQuery;
    samauto_TIPOPRESTADOR_DOC: TBennerQuery;
    samauto_PRESTADOR_DOCENTREGUE: TBennerQuery;
    PRORROGACAO: TBennerQuery;
    qPrestadorDados: TBennerQuery;
    QBeneficiarioContrato: TBennerQuery;
    QPF: TBennerQuery;
    X: TBennerQuery;
    LOCALEXECUCAO: TBennerQuery;
    SUSPENSAO: TBennerQuery;
    ALINHAR_AUXILIARES: TBennerQuery;
    ALINHAR_AUXILIARES_DATA: TBennerQuery;
    REGIMEATENDIMENTO_TIPOPRESTADOR: TBennerQuery;
    PRAZOPRESTADOR: TBennerQuery;
    CARENCIA_CPT: TBennerQuery;
    CARENCIA_REDUCAO: TBennerQuery;
    PODEEXECUTAR_MEMBROENTIDADE: TBennerQuery;
    EVENTO_PREDECESSOR: TBennerQuery;
    PODERECEBER_MEMBROENTIDADE: TBennerQuery;
    qWriteAudit: TBennerQuery;
    DSaUDIT: TDataSource;
    qHandleGerado: TBennerQuery;
    dsHandleGerado: TDataSource;
    qIncomp: TBennerQuery;
    qIncompDel: TBennerQuery;
    PRAZOINTERVALAR_EVENTO_GRAU: TBennerQuery;
    qGeral: TBennerQuery;
    qEventoGerado: TBennerQuery;
    qAux2: TBennerQuery;
    PRAZO_INTERVALAR_AUTORIZ: TBennerQuery;
    PRAZO_INTERVALAR_GUIA: TBennerQuery;
    qAux: TBennerQuery;
    sp_ValidadorNew: TBennerStoredProc;
    qBuscaDados: TBennerQuery;
    sp_AcharModuloCobertura: TBennerStoredProc;
    sp_IncLimite: TBennerStoredProc;
    sp_Incompatibilidade: TBennerStoredProc;
    sp_BSValorPF: TBennerStoredProc;
    sp_VerificaPrestadorIsento: TBennerStoredProc;
    qSempreVisualizar: TBennerQuery;
    qParamGeralAtendimento: TBennerQuery;
    qParamGeralProc: TBennerQuery;
    sp_Acomodacao: TBennerStoredProc;
    qOrigemEvento: TBennerQuery;
    sp_ValorBasePF: TBennerStoredProc;
    sp_PercentualPF: TBennerStoredProc;
    qEventoGeradoContagem: TBennerQuery;
    qDecrementaContagemEG: TBennerQuery;
    qBuscaEventoGerado: TBennerQuery;
    spGerarEventos: TBennerStoredProc;
    qAlertas: TBennerQuery;
    sp_SuplementacaoNaAutorizacao: TBennerStoredProc;
    Q2: TBennerQuery;
    spBSAut_ValidarPendentes: TBennerStoredProc;
    qEventosGerados: TBennerQuery;
    qSAM_AUTORIZ: TBennerQuery;
    qSAM_AUTORIZ_EVENTOSOLICIT: TBennerQuery;
    qCalculaValor: TBennerQuery;
    q1: TBennerQuery;
    qAjustaLimite: TBennerQuery;
    SP_LIMITE: TBennerStoredProc;
    qAuxLimite: TBennerQuery;
    spBSTISS_GerarSenhaAutorizacao: TBennerStoredProc;
    spBSAut_DataAteTratamentoSeriado: TBennerStoredProc;
    qPacote: TBennerQuery;
    qObservacaoIncomp: TBennerQuery;
    sp_GerarTratamentoSeriado: TBennerStoredProc;
    q3: TBennerQuery;
    sp_BSAut_IniciarEquipeVia: TBennerStoredProc;
    qHAutoriz: TBennerQuery;
    qVerificaProtocoloTransacao: TBennerQuery;
    spVerificaNegPericia: TBennerStoredProc;
    qPericia: TBennerQuery;

    procedure DMDestroy(Sender: TObject);
    function ValordaPF2(CodigoPF, Prestador, Beneficiario: OleVariant): Double;


  private
    vgExecutorMembroDe, vgRecebedorMembroDe: integer;

    procedure AlinharAuxiliares(pHAutorizacao: integer);
    procedure GerarTratamentoSeriado(pHEvento, pHAutorizacao: integer); //pRealizarAteDataMenor: TDateTime);
    function SolicitandoDiaria(pEvento, pGrau: integer;
      var vAcomodacao: integer): boolean;
    function SugerirAuditorPerito(pPrestador, pFilial: integer; pAuditorPerito: char): integer;
    function ChecarCarenciaCPT(pBeneficiario, pEvento: integer; vComplemento: ansistring): ansistring;
    function CarenciaPorPagamentoComBaixada(pBeneficiario: integer): boolean;
    procedure MontaNegacaoInterno(pHandleOrigem, pNegacao: integer;
      pComplemento: WideString; pQtdAutorizada,
      pValorAutorizado: Currency);
    { Private declarations }

  public
    //Variáveis;
    g_HandleTipoAutorizacao: Integer;
    vgInadConta: integer;
    vgInadCartao: integer;
    vgInadTitulo: integer;
    Sys: OleVariant;
    gNegacoes: AnsiString;
    vgSAM_AUTORIZ_EVENTOSOLICITHandle: integer;
    vgCurrentUser: integer;
    vgDocumentosEmFalta: WideString;
    vgDependencia: integer;
    vgEventoDependente: WideString;
    vgModuloQueDeuCobertura: integer;
    vgPlanoQueDeuCobertura: integer; //Valeska - sms 21638
    vgContratoModQueDeuCobertura: integer;
    vgBeneficiarioModulo: integer;
    vgDataAdesaoModuloBeneficiario: TDateTime;
    vgRedeRestrita: integer;
    vgOrigemdoProcesso: string;
    vgOrigemClinica: boolean;
    vgValidarPartindoDaGeracaoDeOutro: boolean;
    vgRevalidar: boolean;
    vgFINALIDADEATENDIMENTO,
      vgCONDICAOATENDIMENTO,
      vgLOCALATENDIMENTO,
      vgOBJETIVOTRATAMENTO,
      vgREGIMEATENDIMENTO,
      vgTIPOTRATAMENTO,
      vRegimePgto: integer;
    //Junior - 30/01/2001
    vgCodigoPagto,
      vgXTHM: Integer;

    vgACIDENTEPESSOAL: string;
    vgOLESamIncomp: Variant;
    vgOLERestricaoFinan: Variant;
    vgOLEPeg: Variant;
    vgOLEProcura: Variant;
    FranquiaDLL: Variant; //larini
    EspecificoDll: Variant; //sms 93618
    vgExecutorNaoCredenciadoEmRegimeLivreEscolha: boolean;
    vgSolicitanteNaoEhCredenciado: boolean;
    vgCodigoSolicitanteInvalido: boolean;
    vgCodigoExecutorInvalido: boolean;
    vgCodigoBeneficiarioInvalido: boolean;
    vgCodigoRecebedorInvalido: boolean;
    vgCodigoLocalExecucaoInvalido: boolean;
    vgCodigoEventoInvalido: boolean;
    vgBeneficiario: Integer;
    vgRecordHandle: Integer;
    vgDV: string;
    vgGrau: Integer;
    vgResultado: string;
    vgHandleOrigem: Integer;
    vDataSolicitacao: TdateTime;
    vgServico: string;
    vgRecebedor: Integer;
    vLstNegacao: TList;
    RecNegacao: PNegList;

    vLstNegacaoBenefPrestador: TList;
    RecNegacaoBenefPrestador: PNegBenefPrestador;

    vLstNegacoesValidas: TList;
    RecNegacoesValidas: PNegacoesValidas;

    vEventoPrincipal: EventoPrincipal;

    vgTipoExecutorRegime: byte;
    vgTipoLocalExecucaoRegime: byte;
    vgPermiteAuxilio: Boolean;
    vgQuantidadeMaxima: integer;
    vgAuxiliar: integer;
    vgMotivoDias: integer;
    gLiberaPorAuxilio: string;
    vgNegacoesDesconsiderar: string;
    vgSemEventosClinica: boolean;
    vgControle: Integer;
    vgStrTipoEvento: string; // Coelho SMS: 96089

    //Procedimentos:                              -+
    function PegaPreco(pEvento, pGrau, pBeneficiario, pRecebedor,
      pLocalExecucao: OleVariant; pQuantidade: double;
      pData: TDateTime; pCodPagto, pXthm, pAcomodacao, LA, RA, CA, OT, TT,
      FA: OleVariant; pCBOS:Integer; pHoraAtendimento: TDateTime; pHorarioEspecial : boolean;
      var pValorPrimeira, pValorSegunda, pValorDemais: Double): Double;

    procedure MostrarAlertasObserva(pHandleAutorizacao: Integer);
    procedure ValidarTodos(pUsuario,
      pAutorizacao: Integer;
      pEventosValidar: string);

    procedure Validador
      (
      pHandleOrigem,
      pEvento,
      pGrau,
      pCid,
      pAcomodacao,
      pCurrentUser,
      pBeneficiario: integer;
      pDv: string;
      pExecutor,
      pSolicitante,
      pRecebedor,
      pLocalExecucao: integer; // Fábio - 08/10/2001
      pData,
      pHora: TDateTime; // novo param
      pTipoAutorizacao,
      pFinalidadeAtendimento,
      pCondicaoAtendimento,
      pLocalAtendimento,
      pObjetivoTratamento,
      pRegimeAtendimento,
      pTipoTratamento: integer;
      pAcidentePessoal,
      pServico: string;
      pQuantidade: currency;
      pValor: currency;
      pCodigoPagto,
      pXTHM: Integer;
      pDataCalculoLimitacao: TDateTime;
      pPermiteAuxilio: string;
      pNegacoesDesconsiderar: string;
      pOrigemAcerto: WideString;
      pHandleAcerto: Integer);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure CriarObjetos;
    procedure PrepararQueries;
    procedure LimparObjetos;
    procedure GerarEventos(pExecutor,
      pSolicitante,
      pRecebedor,
      pLocalExecucao,
      pEvento,
      pGrau: integer;
      pCid: integer;
      pDataSolicitacao: TDateTime;
      pHandleEventoSolicit,
      pBeneficiario: Integer;
      pTipoAutorizacao,
      pAcomodacao: integer;
      pQuantidade: real);
    procedure BuscarPacote(pExecutor, //SMS 83110 - Vieira
      pSolicitante,
      pRecebedor,
      pLocalExecucao,
      pEvento,
      pGrau: integer;
      pCid: integer;
      pDataSolicitacao: TDateTime;
      pHandleEventoSolicit,
      pBeneficiario: Integer;
      pTipoAutorizacao,
      pAcomodacao: integer;
      pQuantidade: real);

    procedure GerarComplementaresManual(pBeneficiario: integer; pEvento: integer; pCid: integer; pPacoteOrigem: char;
      pSolicitante, pExecutor, pRecebedor, pLocalExecucao: integer;
      pDataSolicitacao: TDateTime; pTipoAutorizacao: integer; pQuantidade: real;
      pQuery: TBennerQuery);

    function CalcularAcomodacao(pAutorizacao: Variant; pDataPrevistoAtendimento: TDatetime; var EventoAcomodacao: Integer): Integer;
    procedure AtualizarAcomodacao(pHandleOrigem: integer; pDataAtendimento: TDateTime);
    procedure AtualizarPeriodoInternacaoAcomodacao(pHandleOrigem: integer);
    procedure LerBeneficiario(pHandle: integer);
    procedure LerExecutor(pHandle: integer);
    procedure LerSolicitante(pHandle: integer);
    procedure LerRecebedor(pHandle: integer);
    procedure LerLocalExecucao(pHandle: integer);
    procedure ChecarBeneficiario(pHandle: integer;
      pDV: string;
      pData: TDatetime);
    procedure ChecarBeneficiarioDoc(pBeneficiario,
      pContrato: Integer;
      pData,
      pDataNascimento,
      pBeneficiarioDataAdesao: TDateTime);
    procedure ChecarPrestadorDoc(pPrestador,
      pModo: Integer;
      pDataCredenciamento,
      pDataInclusao: TDateTime);
    procedure ChecarIncompatibilidade(pHandleOrigem,
      pBeneficiario,
      pExecutor: integer;
      pData: TDateTime);
    procedure ChecarIncompatibilidadeEvento(pHandleOrigem,
      pExecutor,
      pEvento,
      pGrau: Integer;
      pData: TDateTime;
      pBeneficiario: Integer);
    function GravarEventoGerado(pEventoGerado,
      pGrauGerado,
      pCid,
      pBeneficiario,
      pSolicitante,
      pExecutor,
      pRecebedor,
      pLocalExecucao: integer;
      pDataSolicitacao: TDateTime;
      pCodPagto: Integer;
      pTipoAutorizacao: integer;
      pNaoAceitaPfInfAut,
      pTipoEvento: string;
      pQuantidade: real;
      pLocalAtendimento,
      pCodigoTabela: Integer): integer; //SMS 73963 - Marcelo Barbosa - 25/11/2006
    procedure ChecarEventoSolicitante(pHandleOrigem,
      pEvento,
      pPrestador: integer;
      pData: TDateTime);
    procedure ChecarSituacaoPrestador(P: TBennerQuery; pData:
      TDateTime;
      pEvento: integer;
      pTipoPrestador: char;
      //  Executor e recebedor podem ser membros apenas do local de execução,
      //  sendo assim não precisa mais do recebedor como parâmetro.
      //  pRecebedor: integer;
      pLocalExecucao: integer);
    procedure ChecarRegimeAtendimentoTipoPrestador(
      pPrestador, pEvento: integer; pTipo: char);
    procedure ChecarEvento(pHandleOrigem,
      pBeneficiario,
      pGrauGerado,
      pMatricula,
      pEvento,
      pGrau: integer;
      pQuantidade: currency;
      pBeneficiarioSexo: string;
      pBeneficiarioDataNascimento,
      pBeneficiarioDataAdesao,
      pData: TDateTime;
      pTipoAutorizacao,
      pExecutor,
      pRecebedor,
      pLocalExecucao: integer);
    procedure ChecarCobertura(pHandleOrigem,
      pEvento,
      pBeneficiario,
      pExecutor,
      pRecebedor,
      pContrato,
      pFinalidadeAtendimento,
      pCondicaoAtendimento,
      pLocalAtendimento,
      pObjetivoTratamento,
      pRegimeAtendimento,
      pTipoTratamento: Integer;
      pData,
      pBeneficiarioDataAdesao: TDateTime);
    function AcharModuloCobertura(
      pEvento,
      pBeneficiario: integer;
      pData,
      pBeneficiarioDataAdesao: TDateTime;
      pFinalidadeAtendimento,
      pCondicaoAtendimento,
      pLocalAtendimento,
      pObjetivoTratamento,
      pRegimeAtendimento,
      pTipoTratamento: integer
      ): integer;
    procedure ChecarEventoExecutor(pHandleOrigem,
      pEvento,
      pGrau,
      pExecutor,
      pLocalExecucao,
      pRegimeAtendimento: Integer;
      pData: TDateTime);
    procedure ChecarEventoLocalExecucao(pHandleOrigem,
      pEvento,
      pGrau,
      pLocalExecucao,
      pRegimeAtendimento: Integer;
      pData: TDateTime);
    procedure ChecarEventoRecebedor(pHandleOrigem,
      pEvento,
      pRecebedor,
      pRegimeAtendimento: Integer;
      pData: TDateTime);
    procedure ChecarGrauExecutor(pHandleOrigem,
      pGrau,
      pExecutor: integer;
      pData: TDateTime);
    procedure ChecarGrauLocalExecucao(pHandleOrigem,
      pGrau,
      pLocalExecucao: integer);
    procedure MontaNegacao(pHandleOrigem,
      pNegacao: integer;
      pComplemento: WideString;
      pQtdAutorizada: Currency); overload;
    procedure MontaNegacao(pHandleOrigem,
      pNegacao: integer;
      pComplemento: WideString;
      pQtdAutorizada, pValorAutorizado: Currency); overload;
    procedure MontaNegacaoDeAlertas(pHandleOrigem,
      pNegacao: integer;
      pComplemento: WideString);
    procedure MontaNegacaoBenefPrestador(pNegacao: integer;
      pComplemento: WideString);

    procedure ChecarCarencia(pHandleOrigem,
      pEvento,
      pGrau,
      pFinalidadeAtendimento,
      pCondicaoAtendimento,
      pLocalAtendimento,
      pObjetivoTratamento,
      pRegimeAtendimento,
      pTipoTratamento,
      pBeneficiario,
      pFamilia,
      pContrato,
      pBeneficiarioDiasCompraCarencia: Integer;
      pData,
      pBeneficiarioDataAdesaoModulo: TDateTime;
      pAcidentePessoal: string;
      pDataAdesaoDoBeneficiario: TdateTime;
      pOrigemCarencia: integer);

    procedure GravarNegacoesDaAutorizacao;
    procedure GravarNegacoesDoPagamento;
    procedure AlterarSAM_AUTORIZ_EVENTOGERADO(pHandleOrigem,
      pEvento,
      pGrau,
      pCid,
      pUsuario,
      pBeneficiario: integer;
      pDv: string;
      pExecutor,
      pSolicitante,
      pRecebedor,
      pLocalExecucao: integer;
      pData: TDateTime;
      pHora: TDateTime;
      pTipoAutorizacao,
      pFinalidadeAtendimento,
      pCondicaoAtendimento,
      pLocalAtendimento,
      pObjetivoTratamento,
      pRegimeAtendimento,
      pTipoTratamento: integer;
      pAcidentePessoal: string;
      pServico: Char;
      pQuantidade: currency;
      pValorCalculado: currency;
      pCodigoPagto,
      pXTHM, pCBOS: Integer;
      pDataCalculoLimitacao: TDateTime;
      pPermiteAuxilio: string;
      pNegacoesDesconsiderar: string);

    procedure ContQtdPagaEG(pHandleEventoGerado: integer;
      pQuantidade, pValorCalculado: double);
    procedure CarregarNegacoes;
    procedure ChecarFamiliaSemResponsavel(pData: TDateTime);
    procedure ChecarLimitePF(pHandleOrigem, pBeneficiario, pFamilia,
      pContrato, pEvento, pGrau: Integer; pDataAutorizacao: TDateTime;
      pQtdAuto: Double);
    procedure ChecarSeRecebedorPodeReceber(pRecebedor,
      pExecutor: integer;
      pData: TDateTime);
    procedure GravarEventoPrincipal(pHandleOrigem: integer; pData: TDateTime);
    procedure DMPrepare(pCurrentSystem: OleVariant);

    function FindTGEPos(pHandle: longint): string;
    function BeneficiarioDvOk(pHandle: Integer; pDV: string; pData: TDateTime): boolean;
    function SetSituacaoDoEvento(pHandleOrigem,
      pBeneficiario,
      pSolicitante: integer;
      pExecutor: integer;
      pRecebedor: integer;
      pLocalExecucao: integer;
      pEvento: integer;
      pGrau: integer;
      pCid: integer;
      pData: TDateTime;
      pQuantidade: currency;
      pValorCalculado: currency;
      pDataCalculoLimitacao: TDateTime;
      pTipoAutorizacao: integer;
      pOrigemAcerto: WideString;
      pHandleAcerto: Integer): string;
    function ChecarEventoDependente(pEventoOriginal,
      pEvento,
      pMatricula: integer): integer;
    function ChecarRedeRestrita(pHandleOrigem,
      pPrestador,
      pContrato,
      pModulo,
      pPlano,
      pEvento: Integer): boolean;
    function ChecarRedeRestritaContrato(pHandleOrigem,
      pPrestador,
      pContrato: integer
      ): boolean;
    function ChecarEventoRegime(pTabela: string;
      pRegimeAtendimento,
      pRegra: integer): Integer;
    function LerMotivoNegacao(pMotivoNegacao, pRegimePgto: integer; var pLiberaPorAuxilio: string): integer;
    function TemEventosGeradosPagos(pHandleOrigem: integer;
      pLocal: char): boolean;
    function ChkPrestadorEventoExec(
      pExecutor,
      pEvento,
      pRegimeAtendimento: integer;
      pData: TDateTime): boolean;
    function ChkPrestadorDaEntidadeEventoExec(
      pMembro,
      pEntidade,
      pEvento: integer;
      pData: TDateTime): boolean;
    function ChkRecebedorDaEntidadeEventoExec(
      pMembro,
      pEntidade,
      pEvento: integer;
      pData: TDateTime): boolean;

    function ChkRecebedorEventoExec(
      pRecebedor,
      pEvento,
      pRegimeAtendimento: integer;
      pData: TDateTime): boolean;
    function ChecarContratoInativo(pData: TDateTime): boolean;
    function ChecarFamiliaInativa(pData: TDateTime): boolean;
    function VerificaGrauValido(pGrauGerado: integer): boolean;
    function ValidarCodigoPagto(pEvento, pGrau, pCodigoPagto: Integer): Boolean;
    function GetFilial(phandle: integer; tipo: char): integer;
    function ChecarBeneficiarioInternado(pBenef: Integer; pDataAtendimento: TDateTime; pHandleOrigem: Integer; pServico: string): boolean;
    function ChecarTipoAtendimentoEvento(pHandle: Integer): Boolean;
    function LocalizaAuxilio(pHandleOrigem, pBeneficiario, pEvento, pGrau: Integer;
      pData: TDateTime; pQuantidade: Currency): Boolean;
    procedure GerarPericia(pHandleEventoGerado, pHandleAutorizacao,
      pHandleBeneficiario, pPrestador: integer);

    procedure GerarAuditoria(pHandleEventoGerado, pHandleAutorizacao, pHandleProtocoloTransacao,
      pHandleBeneficiario, pPrestador: integer);
    function gerarPericiaPorValor(
      pHandleAutorizacao,
      pHandleContrato: integer;
      pHandleEVENTOGERADO: integer;
      pData: TDateTime;
      pValorEventoAutorizando: currency
      ): boolean;
    function EhGrauPrincipal(pHandleOrigem: integer): boolean;
    procedure AlterarEquipeVia(pHandleOrigem: integer; pData: TDateTime);
    procedure VerificaFranquia(pEventoGerado: Integer; pSituacao: string);
    function ChecarMaximoDiasInternacao(pAutorizacao: integer; pQuantidade: integer): Integer;
    function VerificaPrestadorIsentoAutorizacao(piHandleOrigem, piRecebedor, piEvento, piRegimeAtendimento: integer): boolean;

    procedure RecalcularPFaoRevalidar(
      pHandleOrigem,
      pEvento,
      pGrau,
      pBeneficiario,
      pRecebedor: integer;
      pData: TDateTime;
      pQuantidade: currency;
      pCodigoPagto,
      pXTHM: Integer;
      pValorPrimeira, pValorSegunda, pValorDemais: Double);

    procedure BSAut_4250(pEvento, pCid: integer);
    procedure FormPrepare;
    procedure atualizaSequenciaMatMed(piHandleEventoGerado: Integer);
    procedure EfetuaContagemEventoRevertido(pHandleEventoGerado: Integer);
    procedure DesfazContagemEventoRevertido(pHandleEventoGerado: Integer);
    procedure VerificaLimiteCentavos(pLimite, pHandleBFM: Integer; pData: TDatetime; pTipo, pIncDec: string); //SMS 68813 - Marcelo Barbosa - 20/09/2006
    procedure BuscaLimitacao(pHandleEvGerado: Integer);
    function PegarAcomodacoes(pAutorizacao: Integer; pTipoEvento: string): string;
    procedure GerarDiarias(pAutorizacao, pAcomodacao, pCodigoTabela: integer; pTipoEvento: string);
  end;

const
{$INCLUDE constantes.txt}

  CredenciadoEmRegimeLivreEscolha = 0;
  CredenciadoEmRegimeCredenciamento = 1;
  NaoCredenciadoEmRegimeLivreEscolha = 2;
  NaoCredenciadoEmRegimeCredenciamento = 3;
  Nulo = -1; //Simula valores nulos

  EVENTOGERADO_SQLSERVER = 'SUBSTRING(CONTAGEMPF, 1, CHARINDEX(''|'', CONTAGEMPF) - 1)';
  EVENTOGERADO_DB2 = 'SUBSTR(CONTAGEMPF, 1, POSSTR(CONTAGEMPF, ''|'') - 1)';
  EVENTOGERADO_ORACLE = 'SUBSTR(CONTAGEMPF, 1, INSTR(CONTAGEMPF, ''|'') - 1)';
  EVENTOGERADO_CACHE = 'SUBSTR(CONTAGEMPF, 1, INSTR(CONTAGEMPF, ''|'') - 1)';

  VERIFICACAOCAMPONULO_SQLSERVER = 'IsNull(datalength(CONTAGEMPF), 0) > 0';
  VERIFICACAOCAMPONULO_DB2 = 'coalesce(length(CONTAGEMPF),0) > 0';
  VERIFICACAOCAMPONULO_ORACLE = 'nvl(length(CONTAGEMPF), 0) > 0';
  VERIFICACAOCAMPONULO_CACHE = 'nvl(length(CONTAGEMPF), 0) > 0';

var
  DM: TDM;

implementation

uses uFrmAlertas, uDMLimite, UFrmCancelar, uFormEscolhePacote, UISamAuto,
  uFRMComplementares;

// Os testes feitos com grau e executor = -1 simulam o teste quando o valor é null

{$R *.DFM}

procedure TDM.EfetuaContagemEventoRevertido(pHandleEventoGerado: Integer);
var
  viHandleEventoGerado,
    viEvento,
    viBeneficiario: Integer;
  vsDadosContagem: string;
  vdQtdAutorizada,
    vdValorBasePF: Double;
  vdtDataAtendimento: TDateTime;
begin
  vgOlePeg.Inicializar(Sys.CurrentSystem);
  qEventoGeradoContagem.Close;
  qEventoGeradoContagem.ParamByName('pHANDLE').AsInteger := pHandleEventoGerado;
  qEventoGeradoContagem.Open;

  viHandleEventoGerado := qEventoGeradoContagem.FieldByName('EVENTOGERADO').AsInteger;
  vsDadosContagem := qEventoGeradoContagem.FieldByName('CONTAGEMPF').AsString;
  vdQtdAutorizada := qEventoGeradoContagem.FieldByName('QTDAUTORIZADA').AsFloat;
  vdValorBasePF := qEventoGeradoContagem.FieldByName('BASECALCULOPF').AsFloat;
  viEvento := qEventoGeradoContagem.FieldByName('EVENTOGERADOTGE').AsInteger;
  viBeneficiario := qEventoGeradoContagem.FieldByName('BENEFICIARIO').AsInteger;
  vdtDataAtendimento := qEventoGeradoContagem.FieldByName('DATAATENDIMENTO').AsDateTime;

  // Efetua a contagem da PF
  vgOlePeg.ContaPF(
    Sys.CurrentSystem,
    -1,
    viHandleEventoGerado,
    vsDadosContagem,
    vdQtdAutorizada,
    vdValorBasePF,
    viEvento,
    viBeneficiario,
    vdtDataAtendimento
    );

  vgOlePeg.Finalizar;
end;

procedure TDM.DesfazContagemEventoRevertido(pHandleEventoGerado: Integer);
var
  vsNivel: string;
begin

  qBuscaEventoGerado.Close;
  qBuscaEventoGerado.ParamByName('pEVENTOGERADO').AsInteger := pHandleEventoGerado;
  qBuscaEventoGerado.Open;

  qDecrementaContagemEG.Close;
  qDecrementaContagemEG.SQL.Clear;

  if (not qBuscaEventoGerado.Eof) then
  begin
    vsNivel := qBuscaEventoGerado.FieldByName('NIVEL').AsString;
    qDecrementaContagemEG.SQL.Add('UPDATE                                   ');
    qDecrementaContagemEG.SQL.Add('    SAM_' + vsNivel + '_CONTPF           ');
    qDecrementaContagemEG.SQL.Add('  SET                                    ');
    qDecrementaContagemEG.SQL.Add('    QTDAUTORIZADA = QTDAUTORIZADA - (    ');
    qDecrementaContagemEG.SQL.Add('      SELECT                             ');
    qDecrementaContagemEG.SQL.Add('          QTDAUTORIZADA                  ');
    qDecrementaContagemEG.SQL.Add('        FROM                             ');
    qDecrementaContagemEG.SQL.Add('          SAM_' + vsNivel + '_CONTPF_AUT ');
    qDecrementaContagemEG.SQL.Add('        WHERE                            ');
    qDecrementaContagemEG.SQL.Add('          HANDLE = :pAUT                 ');
    qDecrementaContagemEG.SQL.Add('    ),                                   ');
    qDecrementaContagemEG.SQL.Add('    VALORAUTORIZADO = VALORAUTORIZADO - (');
    qDecrementaContagemEG.SQL.Add('      SELECT                             ');
    qDecrementaContagemEG.SQL.Add('          VALORAUTORIZADO                ');
    qDecrementaContagemEG.SQL.Add('        FROM                             ');
    qDecrementaContagemEG.SQL.Add('          SAM_' + vsNivel + '_CONTPF_AUT ');
    qDecrementaContagemEG.SQL.Add('        WHERE                            ');
    qDecrementaContagemEG.SQL.Add('          HANDLE = :pAUT                 ');
    qDecrementaContagemEG.SQL.Add('    )                                    ');
    qDecrementaContagemEG.SQL.Add('  WHERE                                  ');
    qDecrementaContagemEG.SQL.Add('    HANDLE = :pCONTPF                    ');
    qDecrementaContagemEG.ParamByName('pAUT').AsInteger := qBuscaEventoGerado.FieldByName('HANDLEAUT').AsInteger;
    qDecrementaContagemEG.ParamByName('pCONTPF').AsInteger := qBuscaEventoGerado.FieldByName('HANDLECONTPF').AsInteger;
    qDecrementaContagemEG.ExecSql;

    qDecrementaContagemEG.Close;
    qDecrementaContagemEG.SQL.Clear;
    qDecrementaContagemEG.SQL.Add('DELETE FROM SAM_' + vsNivel + '_CONTPF_AUT WHERE HANDLE = :pAUT');
    qDecrementaContagemEG.ParamByName('pAUT').AsInteger := qBuscaEventoGerado.FieldByName('HANDLEAUT').AsInteger;
    qDecrementaContagemEG.ExecSql;

  end;

end;

procedure TDM.ValidarTodos(pUsuario,
  pAutorizacao: Integer;
  pEventosValidar: string);
var
  viHandleEventoSolicitado: Integer;
  viTamanho: Integer;
  viPosicao: Integer;
  viAcomodacao: Integer;
  vsUtilizaAuxilio: string;
  vsSenha: string;
begin
  try
    WriteBDebug(Concat('SamAuto.DM.ValidarTodos - pUsuario [', IntToStr(pUsuario), '] pAutorizacao [', IntToStr(pAutorizacao), '] pEventosValidar [', pEventosValidar));
    StartTransactionEx(Sys.CurrentSystem, 'SamAuto_UDM_ValidarTodos', vsSenha);
    if Sys.VisibleMode then
      LimparObjetos;

    // Verifica se a seleção de complementares será manual ou automática pelo tipo da autorização
    qSAM_AUTORIZ.Close;
    qSAM_AUTORIZ.ParamByName('HANDLE').AsInteger := pAutorizacao;
    qSAM_AUTORIZ.Open;
    if qSAM_AUTORIZ.FieldByName('UTILIZACOMPLEMENTARESMANUAL').AsString = 'S' then
    begin
      WriteBDebug('SamAuto.DM.ValidarTodos - Utiliza complementares manual');
      // Seleção de complementares manual
      viPosicao := 1;
      viTamanho := Length(pEventosValidar);
      while viPosicao < viTamanho do
      begin
        viHandleEventoSolicitado := StrToInt(PegaCampo(pEventosValidar, viPosicao, '|'));
        qSAM_AUTORIZ_EVENTOSOLICIT.Close;
        qSAM_AUTORIZ_EVENTOSOLICIT.ParamByName('HANDLE').AsInteger := viHandleEventoSolicitado;
        qSAM_AUTORIZ_EVENTOSOLICIT.Open;

        if qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('ACOMODACAOEVENTO').AsInteger > 0 then
          viAcomodacao := qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('ACOMODACAOEVENTO').AsInteger
        else if qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('ACOMODACAOGRAU').AsInteger > 0 then
          viAcomodacao := qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('ACOMODACAOGRAU').AsInteger
        else
          viAcomodacao := -1;

        q.Close;
        q.SQL.Clear;
        q.SQL.Add('SELECT UTILIZAAUXILIO');
        q.SQL.Add('  FROM SAM_PARAMETROSPROCCONTAS');
        q.Open;
        vsUtilizaAuxilio := q.FieldByName('UTILIZAAUXILIO').asString;

        Validador(qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('HANDLE').asInteger,
          iif(qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('EVENTO').asInteger > 0, qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('EVENTO').asInteger, -1),
          iif(qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('GRAU').asInteger > 0, qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('GRAU').asInteger, -1),
          qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('CID').asInteger,
          viAcomodacao,
          Sys.CurrentUser,
          qSAM_AUTORIZ.FieldByName('BENEFICIARIO').asInteger,
          qSAM_AUTORIZ.FieldByName('DV').asString,
          iif(qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('EXECUTOR').asInteger > 0, qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('EXECUTOR').asInteger, -1),
          iif(qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('SOLICITANTE').asInteger > 0, qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('SOLICITANTE').asInteger, -1),
          iif(qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('RECEBEDOR').asInteger > 0, qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('RECEBEDOR').asInteger, -1),
          iif(qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('LOCALEXECUCAO').asInteger > 0, qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('LOCALEXECUCAO').asInteger, -1),
          qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAATENDIMENTO').asDateTime,
          qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('HORAATENDIMENTO').asDateTime,
          qSAM_AUTORIZ.FieldByName('TIPOAUTORIZACAO').asInteger,
          qSAM_AUTORIZ.FieldByName('FINALIDADEATENDIMENTO').asInteger,
          qSAM_AUTORIZ.FieldByName('CONDICAOATENDIMENTO').asInteger,
          qSAM_AUTORIZ.FieldByName('LOCALATENDIMENTO').asInteger,
          qSAM_AUTORIZ.FieldByName('OBJETIVOTRATAMENTO').asInteger,
          qSAM_AUTORIZ.FieldByName('REGIMEATENDIMENTO').asInteger,
          qSAM_AUTORIZ.FieldByName('TIPOTRATAMENTO').asInteger,
          qSAM_AUTORIZ.FieldByName('ACIDENTEPESSOAL').asString,
          'G',
          qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('QTDSOLICITADA').AsFloat,
          0,
          qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('CODIGOPAGTO').asInteger,
          qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('XTHM').asInteger,
          qSAM_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAATENDIMENTO').asDateTime,
          vsUtilizaAuxilio,
          '',
          '',
          0);
      end;

      //gerar a senha da autorização se existir algum evento autorizado ou liberado
      spBSTISS_GerarSenhaAutorizacao.ParamByName('P_Autorizacao').AsInteger := pAutorizacao;
      spBSTISS_GerarSenhaAutorizacao.ExecProc;
    end
    else
    begin
      WriteBDebug('SamAuto.DM.ValidarTodos - Não utiliza complementares manual');
      // Se geração de complementares for automática utiliza a geração de eventos e validação
      // da nova procedure BSAut_ValidarPendentes
      Sys.NewCounter('AUTORIZADORSP', 0, 1, vgRecordHandle);
      vgCurrentUser := pUsuario;

      spBSAut_ValidarPendentes.ParamByName('P_USUARIO').AsInteger := vgCurrentUser;
      spBSAut_ValidarPendentes.ParamByName('P_CHAVE').AsInteger := vgRecordHandle;
      spBSAut_ValidarPendentes.ParamByName('P_AUTORIZACAO').AsInteger := pAutorizacao;
      //Ao validar mais de 30 eventos solicitados, no SQL a string era passada com problemas.
      if pos('SQL', string(Sys.SQLServer)) > 0 then
      begin
        spBSAut_ValidarPendentes.ParamByName('P_EVENTOSVALIDAR').DataType := ftMemo;
        spBSAut_ValidarPendentes.ParamByName('P_EVENTOSVALIDAR').Value := pEventosValidar;
      end
      else
        spBSAut_ValidarPendentes.ParamByName('P_EVENTOSVALIDAR').AsString := pEventosValidar;

      spBSAut_ValidarPendentes.ExecProc;

      GerarTratamentoSeriado(0, pAutorizacao);

      //Ao realizar a validação e encontrar mais de um caso de pacote para o mesmo evento
      //esse trecho de código deve indicar ao usuário e solicitar a escolha de somente
      //um pacote para que o sistema possa gerar os eventos.
      qPacote.Close;
      qPacote.SQL.Clear;
      qPacote.SQL.Add('SELECT DISTINCT VALOREVENTOS');
      qPacote.SQL.Add('  FROM TMP_MENSAGEM         ');
      qPacote.SQL.Add(' WHERE CHAVE = :CHAVE       ');
      qPacote.SQL.Add('   AND USUARIO = :USUARIO   ');
      qPacote.SQL.Add('   AND USUARIO IS NOT NULL  ');
      qPacote.ParamByName('CHAVE').AsInteger := vgRecordHandle;
      qPacote.ParamByName('USUARIO').AsInteger := vgCurrentUser;
      qPacote.Open;

      if not qPacote.IsEmpty then
      begin
        vgFINALIDADEATENDIMENTO := qSAM_AUTORIZ.FieldByName('FINALIDADEATENDIMENTO').asInteger;
        vgCONDICAOATENDIMENTO := qSAM_AUTORIZ.FieldByName('CONDICAOATENDIMENTO').asInteger;
        vgLOCALATENDIMENTO := qSAM_AUTORIZ.FieldByName('LOCALATENDIMENTO').asInteger;
        vgOBJETIVOTRATAMENTO := qSAM_AUTORIZ.FieldByName('OBJETIVOTRATAMENTO').asInteger;
        vgREGIMEATENDIMENTO := qSAM_AUTORIZ.FieldByName('REGIMEATENDIMENTO').asInteger;
        vgTIPOTRATAMENTO := qSAM_AUTORIZ.FieldByName('TIPOTRATAMENTO').asInteger;
        vgACIDENTEPESSOAL := qSAM_AUTORIZ.FieldByName('ACIDENTEPESSOAL').asString;
      end;

      while not qPacote.Eof do
      begin
        q.Close;
        q.SQL.Clear;
        q.SQL.Add('SELECT A.EVENTO, A.CID, A.SOLICITANTE, A.EXECUTOR, A.RECEBEDOR,');
        q.SQL.Add('       A.LOCALEXECUCAO, A.DATASOLICITACAO, A.QTDSOLICITADA,    ');
        q.SQL.Add('       A.HANDLE, A.ACOMODACAO                                  ');
        q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOSOLICIT A                             ');
        q.SQL.Add(' WHERE AUTORIZACAO = :AUTORIZ                                  ');
        q.SQL.Add('   AND EVENTO = :EVENTO                                        ');
        q.SQL.Add('   AND NOT EXISTS (SELECT 1 FROM SAM_AUTORIZ_EVENTOGERADO B    ');
        q.SQL.Add('                    WHERE B.EVENTOSOLICITADO = A.HANDLE)       ');
        q.Parambyname('AUTORIZ').asinteger := pAutorizacao;
        q.Parambyname('EVENTO').asinteger := qPacote.fieldbyname('VALOREVENTOS').asinteger;
        q.Open;

        samauto_AUTORIZ_EVENTOSOLICIT.Close;
        samauto_AUTORIZ_EVENTOSOLICIT.ParamByName('HANDLE').Value := q.fieldbyname('HANDLE').asinteger;
        samauto_AUTORIZ_EVENTOSOLICIT.Open;

        try
          BuscarPacote(
            q.fieldbyname('EXECUTOR').asinteger,
            q.fieldbyname('SOLICITANTE').asinteger,
            q.fieldbyname('RECEBEDOR').asinteger,
            q.fieldbyname('LOCALEXECUCAO').asinteger,
            q.fieldbyname('EVENTO').asinteger,
            nulo,
            q.fieldbyname('CID').asinteger,
            q.fieldbyname('DATASOLICITACAO').AsdateTime,
            q.fieldbyname('HANDLE').asinteger,
            qSAM_AUTORIZ.fieldbyname('BENEFICIARIO').asinteger,
            qSAM_AUTORIZ.fieldbyname('TIPOAUTORIZACAO').asinteger,
            q.fieldbyname('ACOMODACAO').asinteger,
            q.fieldbyname('QTDSOLICITADA').asinteger);
        except
          on E: Exception do
            ShowMessage('Erro ao gerar Pacote: ' + e.Message);
        end;
        qPacote.Next;
      end;

      MostrarAlertasObserva(pAutorizacao);

      q1.Close;
      q1.SQL.Clear;
      q1.SQL.Add('SELECT HANDLE FROM SAM_AUTORIZ_EVENTOGERADO ');
      q1.SQL.Add(' WHERE AUTORIZACAO = :AUTORIZACAO ');
      q1.SQL.Add('   AND SITUACAO <> ''C''');
      q1.ParamByName('AUTORIZACAO').Value := pAutorizacao;
      q1.Open;
      q1.First;

      AtualizarPeriodoInternacaoAcomodacao(q1.FieldByName('HANDLE').AsInteger);
      while not q1.Eof do
      begin
        BuscaLimitacao(q1.FieldByName('HANDLE').AsInteger);
        q1.Next;
      end;
    end;

    CommitEx(Sys.CurrentSystem, vsSenha);
    WriteBDebug('SamAuto.DM.ValidarTodos - Fim');
  except
    on E: Exception do
    begin
      RollbackEx(Sys.CurrentSystem, vsSenha);
      ShowMessage('Erro ao validar autorização: ' + e.message);
    end;
  end;
end;

procedure TDM.Validador(pHandleOrigem,
  pEvento,
  pGrau,
  pCid,
  pAcomodacao,
  pCurrentUser,
  pBeneficiario: integer;
  pDv: string;
  pExecutor,
  pSolicitante,
  pRecebedor,
  pLocalExecucao: integer;
  pData,
  pHora: TDateTime; // novo param
  pTipoAutorizacao,
  pFinalidadeAtendimento,
  pCondicaoAtendimento,
  pLocalAtendimento,
  pObjetivoTratamento,
  pRegimeAtendimento,
  pTipoTratamento: integer;
  pAcidentePessoal,
  pServico: string;
  pQuantidade: currency;
  pValor: currency;
  pCodigoPagto,
  pXTHM: Integer;
  pDataCalculoLimitacao: TDateTime;
  pPermiteAuxilio: string;
  pNegacoesDesconsiderar: string;
  pOrigemAcerto: WideString;
  pHandleAcerto: Integer);
var
  vSituacao: string;
  vrResponsavelTipo: integer;
  vrResponsavelTipoHandle: integer;
  vrRestricaoTipo: WideString;
  vrRestricaoDias: integer;
  vrStringFaturas: string;
  vrDataAdesaoRestricao: TDateTime;
  vComplemento: AnsiString;
  vLog: string;
  i : integer;
  v_DataAdesaoModuloBeneficiario: TDateTime;
  v_ModuloQueDeuCobertura, v_PlanoQueDeuCobertura: Integer;
  v_HandleEventoSolicitado,
    v_HandleProtocoloTransacaoAutoriz: Integer;
  vdRealizarAteDataMenor: TDateTime;
  vI_QtdLiberadaTratSeriado: Integer;
  vdRealizar: string;
  //Coelho SMS: 84581
  vSMsgDataCancel: string;
  vIChave: Integer;
  vDataCalc: Variant;
  vHObsAut: Integer;
  pdataAux: TDateTime;
  vsSenha: String;
  samAutorizEventoGeradoBLL,
    samAutorizEventoSolicitBLL,
    samProtocoloTransacaoAutorizBLL,
    samAutorizBLL: IBusinessComponentProxy;
begin
  WriteBDebug('SamAuto.DM.Validador - Início');
  //  Quando executar a BSValidador
  vgControle := -1;
  v_HandleProtocoloTransacaoAutoriz:= 0;
  try
    i := 0;
    vgQuantidadeMaxima := 0;
    vgAuxiliar := 0;

    if pServico = 'C' then
    begin
      vgOrigemDoProcesso := 'P';
      vgOrigemClinica := True;
      pServico := 'R';
    end
    else
      vgOrigemClinica := False;

    if (pServico <> 'P') and (pServico <> 'R') then
      StartTransactionEx(Sys.CurrentSystem, 'SamAuto_UDM_Validador', vsSenha );

    //Carregar variáveis globais
    vgCurrentUser := pCurrentUser;
    vgFINALIDADEATENDIMENTO := pFinalidadeAtendimento;
    vgCONDICAOATENDIMENTO := pCondicaoAtendimento;
    vgLOCALATENDIMENTO := pLocalAtendimento;
    vgOBJETIVOTRATAMENTO := pObjetivoTratamento;
    vgREGIMEATENDIMENTO := pRegimeAtendimento;
    vgTIPOTRATAMENTO := pTipoTratamento;
    vgACIDENTEPESSOAL := pAcidentePessoal;
    vgCodigoPagto := pCodigoPagto;
    vgXTHM := pXTHM;

    vgPermiteAuxilio := pPermiteAuxilio = 'S';

    vgDocumentosEmFalta := '';
    vgBeneficiarioModulo := Nulo;
    vgExecutorNaoCredenciadoEmRegimeLivreEscolha := False;
    vgCodigoSolicitanteInvalido := False;
    vgCodigoExecutorInvalido := False;
    vgCodigoBeneficiarioInvalido := False;
    vgCodigoEventoInvalido := False;
    vgSolicitanteNaoEhCredenciado := False;
    vgTipoExecutorRegime := 0;

    if pBeneficiario = 0 then
      pBeneficiario := nulo;

    vgBeneficiario := pBeneficiario;
    vgDV := pDv;

    vgServico := pServico;
    if pLocalExecucao < 0 then
      pLocalExecucao := nulo;

    q.Close;
    q.SQL.Clear;
    q.SQL.Add('SELECT CNPJ FROM EMPRESAS');
    q.Open;

    if q.FieldByName('CNPJ').asString = '62231527000184' then
    begin
      if (pRecebedor < 0) or (pRecebedor = nulo) then //-- -- se nao tem recebedor
      begin
        if (pExecutor < 0) or (pExecutor = null) then //-- se não tem executor
        begin
          if pLocalExecucao > 0 then //-- se tem local de execução
            pRecebedor := pLocalExecucao;
        end
        else
          pRecebedor := pExecutor;
      end;
    end;

    if pSolicitante < 0 then
      pSolicitante := nulo;
    if pExecutor < 0 then
      pExecutor := nulo;

    vgRecebedor := pRecebedor;

    AbrirTabelas;

    if sam_PARAMETROSGERAIS.FieldByName('LOCALATENDIMENTORESSARCIMENTO').AsInteger = vgLOCALATENDIMENTO then
      vRegimePgto := 2
    else
      vRegimePgto := 1;

    Sys.NewCounter('AUTORIZADORSP', 0, 1, vgRecordHandle);
    vgCurrentUser := pCurrentUser;

    if not vgValidarPartindoDaGeracaoDeOutro then
      LimparObjetos;

    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT INTERNACAO');
    Q.SQL.Add('  FROM SAM_REGIMEATENDIMENTO');
    Q.SQL.Add(' WHERE HANDLE = :HREGIMEATENDIMENTO');
    Q.ParamByName('HREGIMEATENDIMENTO').Value := vgREGIMEATENDIMENTO;
    Q.Open;
    if Q.FieldByName('INTERNACAO').AsString = 'S' then
    begin
      if SolicitandoDiaria(pEvento, pGrau, pAcomodacao) then
        pAcomodacao := nulo;
    end
    else
      pAcomodacao := nulo;

    LerBeneficiario(pBeneficiario);
    LerExecutor(pExecutor);
    LerRecebedor(pRecebedor);
    LerSolicitante(pSolicitante);
    LerLocalExecucao(pLocalExecucao);

    samauto_AUTORIZ_EVENTOSOLICIT.Close;
    samauto_AUTORIZ_EVENTOSOLICIT.ParamByName('HANDLE').Value := pHandleOrigem;
    samauto_AUTORIZ_EVENTOSOLICIT.Open;

    if (pServico = 'A') or (pServico = 'I') then
    begin
      // Quando o serviço é ^A^, significa que, o pHandleOrigem, é o handle do evento gerado
      q.SQL.Clear;
      q.SQL.Add('SELECT EVENTOSOLICITADO, TIPOEVENTO, PROTOCOLOTRANSACAO FROM SAM_AUTORIZ_EVENTOGERADO WHERE HANDLE=:HANDLE');
      q.ParamByName('HANDLE').Value := pHandleOrigem;
      q.Open;

      vgHandleOrigem := q.FieldByName('EVENTOSOLICITADO').asInteger;
      vgStrTipoEvento := q.FieldByName('TIPOEVENTO').AsString;
      v_HandleProtocoloTransacaoAutoriz := q.FieldByName('PROTOCOLOTRANSACAO').asInteger;

      samauto_AUTORIZ_EVENTOSOLICIT.Close;
      samauto_AUTORIZ_EVENTOSOLICIT.ParamByName('HANDLE').Value := q.fields[0].AsInteger;
      q.Close;
      samauto_AUTORIZ_EVENTOSOLICIT.Open;

    end
    else
    begin
            // Quando o serviço é ^G^, significa que, o pHandleOrigem, é o handle do evento solicitado
      vgHandleOrigem := pHandleOrigem;

      samauto_AUTORIZ_EVENTOSOLICIT.Close;
      samauto_AUTORIZ_EVENTOSOLICIT.ParamByName('HANDLE').Value := pHandleOrigem;
      samauto_AUTORIZ_EVENTOSOLICIT.Open;

      qVerificaProtocoloTransacao.Close;
      qVerificaProtocoloTransacao.ParamByName('HEVENTOSOLICITADO').AsInteger := pHandleOrigem;
      qVerificaProtocoloTransacao.Open;
      v_HandleProtocoloTransacaoAutoriz := qVerificaProtocoloTransacao.FieldByName('PROTOCOLOTRANSACAO').AsInteger;
    end;

    // se for I=prorrogação de internação,
    // é idêntico a 'A', entretanto foi preciso passar 'I'
    // para não dar a negação de evento fora do período de internação
    if pServico = 'I' then
      pServico := 'A';
    vgNegacoesDesconsiderar := pNegacoesDesconsiderar;
    //Gerar os eventos
    case pServico[1] of
      'G':
        begin //(G)erar eventos e validar
          WriteBDebug('SamAuto.DM.Validador - Gerar eventos e validar');
          vgrevalidar := False;
          GerarEventos(pExecutor,
            pSolicitante,
            pRecebedor,
            pLocalExecucao,
            pEvento,
            pGrau,
            pCid,
            pData,
            pHandleOrigem,
            pBeneficiario,
            pTipoAutorizacao,
            pAcomodacao,
            pQuantidade);
          AlinharAuxiliares(samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger);
          if not vgValidarPartindoDaGeracaoDeOutro then
            GravarNegacoesDaAutorizacao;
          AtualizarPeriodoInternacaoAcomodacao(pHandleOrigem);

          if (sam_PARAMETROSGERAIS.FieldByName('REVERSAOAUTNEGPERICIA').AsString = 'S') then
          begin
            WriteBDebug('SamAuto.DM.Validador - Reverter/revisar automaticamente negações de perícia');
            qPericia.Close;
            qPericia.ParamByName('HAUTORIZACAO').AsInteger:= samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger;
            qPericia.Open;

            if not qPericia.IsEmpty then
            begin
              WriteBDebug('SamAuto.DM.Validador - Revertendo/revisando automaticamente negações de perícia');
              spVerificaNegPericia.Close;
              spVerificaNegPericia.ParamByName('P_AUTORIZACAO').AsInteger := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger;
              spVerificaNegPericia.ParamByName('P_PERICIA').AsInteger     := qPericia.FieldByName('HANDLE').AsInteger;
              spVerificaNegPericia.ParamByName('P_USUARIO').AsInteger     := VarToInt(Sys.CurrentUser);
              spVerificaNegPericia.ExecProc;
            end;
          end;

          try
            // Atualizar situação TISS do gerado
            samAutorizEventoSolicitBLL:= BusinessComponent.CreateInstance('Benner.Saude.Atendimento.Business.SamAutorizEventoSolicitBLL, Benner.Saude.Atendimento.Business');
            samAutorizEventoSolicitBLL.AddParameter(pdtInteger, pHandleOrigem);
            samAutorizEventoSolicitBLL.Execute('AtualizarSituacaoTISS');
            //Atualizar situação TISS do protocolo
            if v_HandleProtocoloTransacaoAutoriz > 0 then
            begin
              samProtocoloTransacaoAutorizBLL:= BusinessComponent.CreateInstance('Benner.Saude.Atendimento.Business.SamProtocoloTransacaoAutorizBLL, Benner.Saude.Atendimento.Business');
              samProtocoloTransacaoAutorizBLL.AddParameter(pdtInteger, v_HandleProtocoloTransacaoAutoriz);
              samProtocoloTransacaoAutorizBLL.Execute('AtualizarSituacaoTISS');
            end;
            // Atualizar situação TISS autorização
            samAutorizBLL:= BusinessComponent.CreateInstance('Benner.Saude.Atendimento.Business.SamAutorizBLL, Benner.Saude.Atendimento.Business');
            samAutorizBLL.AddParameter(pdtInteger, samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger);
            samAutorizBLL.Execute('AtualizarSituacaoTISS');
          finally
            samProtocoloTransacaoAutorizBLL:= nil;
            samAutorizEventoSolicitBLL:= nil;
            samAutorizBLL:= nil;
          end;
        end;
      'A':
        begin //(A)lterar evento gerado e validar
          WriteBDebug('SamAuto.DM.Validador - Alterar evento gerado e validar');
          pdataAux := iif(pData > 0, pData, samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAATENDIMENTO').AsDateTime);

          if ((vgStrTipoEvento = 'P') or (vgStrTipoEvento = 'D')) then // Coelho SMS: 96089
          begin
            // Se for prorrogação aumentar a quantidade solicitada na prorrogacao na data
            pdataAux := pdataAux + pQuantidade;
          end;

          vSituacao := SetSituacaoDoEvento(pHandleOrigem,
            pBeneficiario,
            pSolicitante,
            pExecutor,
            pRecebedor,
            pLocalExecucao,
            pEvento,
            pGrau,
            pCid,
            pdataAux,
            pQuantidade,
            pValor,
            pDataCalculoLimitacao,
            pTipoAutorizacao,
            '',
            0
            );
          vgStrTipoEvento := EmptyStr;
            // verificando se tem negacao manual
          if (vgResultado = 'A') and (pHandleOrigem > 0) then
          begin
            Q.sql.clear;
            q.SQL.add('SELECT COUNT(1) QTD FROM SAM_AUTORIZ_EVENTONEGACAO WHERE SITUACAO = ''P'' AND EVENTOGERADO = :EVENTOGERADO');
            q.ParamByName('EVENTOGERADO').AsInteger := pHandleOrigem;
            q.Open;
            if Q.FieldByName('QTD').AsInteger > 0 then
            begin
              vgResultado := 'N';
            end;
          end;
            // verificando se tem negacao manual
          vSituacao := vgResultado;


          Q.Close;
          Q.SQL.Clear;
          Q.SQL.Add('SELECT COUNT(1) QTD ');
          Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTONEGACAO ');
          Q.SQL.Add(' WHERE EVENTOGERADO = :HANDLE');
          Q.ParamByName('HANDLE').Value := pHandleOrigem;
          Q.Open;

          if (Q.fieldbyname('QTD').asInteger > 0) and
            (vgResultado = 'A') then
          begin
            vSituacao := 'L';
          end;

          UPD.Close;
          UPD.SQL.Clear;
          UPD.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO SET');
          UPD.SQL.Add('  SITUACAO = :SITUACAO,');
          UPD.SQL.Add('  USUARIOGERACAO = :USUARIOGERACAO,');
          UPD.SQL.Add('  DATAHORAGERACAO = :DATAHORAGERACAO,');
          UPD.SQL.Add('  SENHA = :SENHA');

          if vSituacao = 'N' then
          begin
            UPD.SQL.Add('  ,USUARIOLIBERACAO = NULL,');
            UPD.SQL.Add('  DATAHORALIBERACAO = NULL');
          end;
          //

          UPD.SQL.Add('  WHERE');
          UPD.SQL.Add('  HANDLE = :HANDLE');
          UPD.ParamByName('SENHA').DataType := ftInteger;

          UPD.ParamByName('HANDLE').Value := pHandleOrigem;
          UPD.ParamByName('SITUACAO').Value := vSituacao;
          UPD.ParamByName('USUARIOGERACAO').Value := pCurrentUser;
          UPD.ParamByName('DATAHORAGERACAO').Value := Sys.ServerNow;
          if vSituacao = 'N' then
          begin
            UPD.ParamByName('SENHA').Clear;
          end
          else
          begin
            UPD.ParamByName('SENHA').Value := StrToInt(IntToStr(pHandleOrigem) + Mod11(IntToStr(pHandleOrigem)));

              //----------------------- Busca datas de adesão Contrato,Familia e Beneficicario ------
            qBuscaDados.Close;
            qBuscaDados.ParamByName('HANDLE').Value := vgBeneficiario;
            qBuscaDados.Open;
              //------------------- Acha Modulo que deu Cobertura -------------------------------------
            if vgControle < 0 then
            begin
              sp_AcharModuloCobertura.ParamByName('p_Evento').Value := pEvento;
              sp_AcharModuloCobertura.ParamByName('p_Grau').Value := pGrau;
              sp_AcharModuloCobertura.ParamByName('p_Data').Value := pDataCalculoLimitacao;
              sp_AcharModuloCobertura.ParamByName('p_Beneficiario').Value := vgBeneficiario;
              sp_AcharModuloCobertura.ParamByName('p_BeneficiarioDataAdesao').Value := qBuscaDados.FieldByName('BDATAADESAO').AsDateTime;
              sp_AcharModuloCobertura.ParamByName('p_FinalidadeAtendimento').Value := pFinalidadeAtendimento;
              sp_AcharModuloCobertura.ParamByName('p_CondicaoAtendimento').Value := pCondicaoAtendimento;
              sp_AcharModuloCobertura.ParamByName('p_LocalAtendimento').Value := pLocalAtendimento;
              sp_AcharModuloCobertura.ParamByName('p_ObjetivoTratamento').Value := pObjetivoTratamento;
              sp_AcharModuloCobertura.ParamByName('p_RegimeAtendimento').Value := pRegimeAtendimento;
              sp_AcharModuloCobertura.ParamByName('p_TipoTratamento').Value := pTipoTratamento;

              sp_AcharModuloCobertura.ParamByName('p_TipoModulo').Value := '';
              sp_AcharModuloCobertura.ExecProc;

              v_DataAdesaoModuloBeneficiario := sp_AcharModuloCobertura.ParamByName('p_DataAdesaoModuloBeneficiario').AsDateTime;
              v_ModuloQueDeuCobertura := sp_AcharModuloCobertura.ParamByName('p_ModuloQueDeuCobertura').AsInteger;
              v_PlanoQueDeuCobertura := sp_AcharModuloCobertura.ParamByName('p_PlanoQueDeuCobertura').AsInteger;
            end
            else
            begin
              v_DataAdesaoModuloBeneficiario := sp_ValidadorNew.ParamByName('p_Atributo_2').AsDateTime;
              v_ModuloQueDeuCobertura := sp_ValidadorNew.ParamByName('p_Atributo_1').AsInteger;
              v_PlanoQueDeuCobertura := sp_ValidadorNew.ParamByName('p_Atributo_3').AsInteger;
            end;

              //----------------- Incrementa Limites -----------------------------------------
            qCalculaValor.Sql.clear;
            qCalculaValor.SQL.Add('DELETE FROM ' + PrefixoTmp(Sys.CurrentSystem) + 'TMP_LIMITE WHERE CHAVE = :CHAVE');
            qCalculaValor.ParamByName('CHAVE').AsInteger := pHandleOrigem;
            qCalculaValor.ExecSql;

            SP_LIMITE.ParamByName('P_HANDLEORIGEM').asInteger := pHandleOrigem;
            SP_Limite.ParamByName('P_EVENTO').asInteger := pEvento;
            SP_Limite.ParamByName('P_FINALIDADEATENDIMENTO').asInteger := pFinalidadeAtendimento;
            SP_Limite.ParamByName('P_CONDICAOATENDIMENTO').asInteger := pCondicaoAtendimento;
            SP_Limite.ParamByName('P_LOCALATENDIMENTO').asInteger := vgLOCALATENDIMENTO;
            SP_Limite.ParamByName('P_OBJETIVOTRATAMENTO').asInteger := pObjetivoTratamento;
            SP_Limite.ParamByName('P_REGIMEATENDIMENTO').asInteger := pRegimeAtendimento;
            SP_Limite.ParamByName('P_TIPOTRATAMENTO').asInteger := pTipoTratamento;
            SP_Limite.ParamByName('P_BENEFICIARIO').asInteger := pBeneficiario;
            SP_Limite.ParamByName('P_FAMILIA').asInteger := qBuscaDados.FieldByName('FHANDLE').AsInteger;
            SP_Limite.ParamByName('P_CONTRATO').asInteger := qBuscaDados.FieldByName('CHANDLE').AsInteger;
            SP_Limite.ParamByName('P_MODULOQUEDEUCOBERTURA').asInteger := v_ModuloQueDeuCobertura;
            SP_Limite.ParamByName('P_PLANOQUEDEUCOBERTURA').asInteger := v_PlanoQueDeuCobertura;
            SP_Limite.ParamByName('P_DATA').AsDateTime := pDataCalculoLimitacao;
            SP_Limite.ParamByName('P_QUANTIDADE').ASfLOAT := pQuantidade;
            SP_Limite.ParamByName('P_VALORCALCULADO').asFloat := pValor;
            SP_Limite.ParamByName('P_RECEBEDOR').asInteger := pRecebedor;
            SP_Limite.ParamByName('P_GRAU').asInteger := pGrau;
            SP_Limite.ParamByName('P_CID').asInteger := pCid;
            SP_Limite.ParamByName('P_ORIGEMDOPROCESSO').asString := vgOrigemDoProcesso;
            SP_Limite.ParamByName('P_AUTORIZACAO').asInteger := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger;
            SP_Limite.ParamByName('P_ORIGEMCLINICA').asString := vgServico;
            SP_Limite.ParamByName('P_RECORDHANDLE').asInteger := vgRecordHandle;
            SP_Limite.ParamByName('P_CURRENTUSER').asInteger := sys.currentUser;
            SP_Limite.ParamByName('P_DIRETO').asString := 'N';
            SP_Limite.ParamByName('P_REGIMEPGTO').AsString := inttostr(vRegimePgto);
            SP_Limite.ExecProc;
            sp_IncLimite.ParamByName('p_Beneficiario').Value := Iif(vgBeneficiario > 0, vgBeneficiario, pBeneficiario);
            sp_IncLimite.ParamByName('p_Familia').Value := qBuscaDados.FieldByName('FHANDLE').AsInteger;
            sp_IncLimite.ParamByName('p_Contrato').Value := qBuscaDados.FieldByName('CHANDLE').AsInteger;
            sp_IncLimite.ParamByName('p_DataAdesaoBeneficiario').AsDateTime := qBuscaDados.FieldByName('BDATAADESAO').AsDateTime;
            sp_IncLimite.ParamByName('p_DataAdesaoFamilia').AsDateTime := qBuscaDados.FieldByName('FDATAADESAO').AsDateTime;
            sp_IncLimite.ParamByName('p_DataAdesaoContrato').AsDateTime := qBuscaDados.FieldByName('CDATAADESAO').AsDateTime;
            sp_IncLimite.ParamByName('p_Data').Value := pDataCalculoLimitacao;
            sp_IncLimite.ParamByName('p_HandleOrigem').Value := pHandleOrigem;

            sp_IncLimite.ParamByName('p_DataAdesaoModuloBeneficiario').AsDateTime := v_DataAdesaoModuloBeneficiario;
            sp_IncLimite.ParamByName('p_ModuloQueDeuCobertura').Value := v_ModuloQueDeuCobertura;
            sp_IncLimite.ParamByName('p_PlanoQueDeuCobertura').Value := v_PlanoQueDeuCobertura;

            sp_IncLimite.ParamByName('p_Recebedor').Value := vgRecebedor;
            sp_IncLimite.ParamByName('p_Chave').Value := vgRecordHandle;
            sp_IncLimite.ParamByName('p_OrigemDoProcesso').Value := vgOrigemDoProcesso;
            sp_IncLimite.ParamByName('p_Servico').Value := vgServico;
            sp_IncLimite.ExecProc;
            qCalculaValor.Sql.clear;
            qCalculaValor.SQL.Add('DELETE FROM ' + PrefixoTmp(Sys.CurrentSystem) + 'TMP_LIMITE WHERE CHAVE = :CHAVE');
            qCalculaValor.ParamByName('CHAVE').AsInteger := pHandleOrigem;
            qCalculaValor.ExecSql;

            EfetuaContagemEventoRevertido(pHandleOrigem);
          end;
          UPD.ExecSql;

          VerificaFranquia(pHandleOrigem, vSituacao);

          AtualizarPeriodoInternacaoAcomodacao(pHandleOrigem);

          // se o usuário está alterando deve gravar a negação.
          // se a validador está revalidando um evento então não deve gravar.
          if not vgValidarPartindoDaGeracaoDeOutro then
            GravarNegacoesDaAutorizacao;

          //Verifica se o evento é de tratamento seriado ou não
          GerarTratamentoSeriado(pHandleOrigem, samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger);

          if (sam_PARAMETROSGERAIS.FieldByName('REVERSAOAUTNEGPERICIA').AsString = 'S') then
          begin
            WriteBDebug('SamAuto.DM.Validador - Reverter/revisar automaticamente negações de perícia');
            qPericia.Close;
            qPericia.ParamByName('HAUTORIZACAO').AsInteger:= samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger;
            qPericia.Open;

            if not qPericia.IsEmpty then
            begin
              WriteBDebug('SamAuto.DM.Validador - Revertendo/revisando automaticamente negações de perícia');
              spVerificaNegPericia.Close;
              spVerificaNegPericia.ParamByName('P_AUTORIZACAO').AsInteger := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger;
              spVerificaNegPericia.ParamByName('P_PERICIA').AsInteger     := qPericia.FieldByName('HANDLE').AsInteger;
              spVerificaNegPericia.ParamByName('P_USUARIO').AsInteger     := VarToInt(Sys.CurrentUser);
              spVerificaNegPericia.ExecProc;
            end;
          end;

          try
            // Atualizar situação TISS do gerado
            samAutorizEventoGeradoBLL:= BusinessComponent.CreateInstance('Benner.Saude.Atendimento.Business.SamAutorizEventoGeradoBLL, Benner.Saude.Atendimento.Business');
            samAutorizEventoGeradoBLL.AddParameter(pdtInteger, pHandleOrigem);
            samAutorizEventoGeradoBLL.Execute('AtualizarSituacaoTISS');
            //Atualizar situação TISS do protocolo
            if v_HandleProtocoloTransacaoAutoriz > 0 then
            begin
              samProtocoloTransacaoAutorizBLL:= BusinessComponent.CreateInstance('Benner.Saude.Atendimento.Business.SamProtocoloTransacaoAutorizBLL, Benner.Saude.Atendimento.Business');
              samProtocoloTransacaoAutorizBLL.AddParameter(pdtInteger, v_HandleProtocoloTransacaoAutoriz);
              samProtocoloTransacaoAutorizBLL.Execute('AtualizarSituacaoTISS');
            end;
            // Atualizar situação TISS autorização
            samAutorizBLL:= BusinessComponent.CreateInstance('Benner.Saude.Atendimento.Business.SamAutorizBLL, Benner.Saude.Atendimento.Business');
            samAutorizBLL.AddParameter(pdtInteger, samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger);
            samAutorizBLL.Execute('AtualizarSituacaoTISS');
          finally
            samProtocoloTransacaoAutorizBLL:= nil;
            samAutorizEventoGeradoBLL:= nil;
            samAutorizBLL:= nil;
          end;
        end;
      'R':
        begin
          WriteBDebug('SamAuto.DM.Validador - Revalidar evento da guia');
          vSituacao := SetSituacaoDoEvento(pHandleOrigem, //(R)evalidar Evento da guia
            pBeneficiario,
            pSolicitante,
            pExecutor,
            pRecebedor,
            pLocalExecucao,
            pEvento,
            pGrau,
            pCid,
            pData,
            pQuantidade,
            pValor,
            pDataCalculoLimitacao,
            pTipoAutorizacao,
            pOrigemAcerto,
            pHandleAcerto
            );
          AtualizarPeriodoInternacaoAcomodacao(pHandleOrigem);
        end;

    end;
    if samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('HANDLE').AsInteger = 0 then
    begin
      QA.Close;
      qa.SQL.Clear;
      qa.sql.add('SELECT EVENTOSOLICITADO FROM SAM_AUTORIZ_EVENTOGERADO WHERE HANDLE = :HANDLE');
      qa.ParamByName('HANDLE').Value := pHandleOrigem;
      qa.Open;
      v_HandleEventoSolicitado := qa.FieldByName('EVENTOSOLICITADO').AsInteger;
    end
    else
      v_HandleEventoSolicitado := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('HANDLE').AsInteger;

    AddLogDepuracao(sys.currentsystem, 'GravarEventoPrincipal 01');
    GravarEventoPrincipal(v_HandleEventoSolicitado, iif(pData > 0, pData, samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAATENDIMENTO').AsDateTime));


    //Comitar a Transacao
    if (pServico <> 'P') and (pServico <> 'R') and (not vgValidarPartindoDaGeracaoDeOutro) then
      CommitEx(Sys.CurrentSystem, vsSenha);

    // Mostrar os alertas na tela, na validação somente mostra os alertas se variável do sistema ALERTASOMENTERESUMO for igual a S
    if not sys.webmode then
      if (vgOrigemDoProcesso = 'A') and (not (vgValidarPartindoDaGeracaoDeOutro)) then
      begin
        if ((sys.SessionVar['EXIBIRALERTA'] = 'S') or (sys.SessionVar['EXIBIRALERTA'] = '')) then
          MostrarAlertasObserva(samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger);
      end;

    atualizaSequenciaMatMed(pHandleOrigem);
  except
    if (pServico <> 'P') and (pServico <> 'R') then
      RollbackEx(Sys.CurrentSystem, vsSenha);
    raise;
  end;

  qWriteAudit.SQL.Clear;
  qWriteAudit.Close;
  qWriteAudit.SQL.Add('SELECT * FROM SAM_AUTORIZ_EVENTOGERADO WHERE HANDLE= :HANDLE');
  qWriteAudit.ParamByName('HANDLE').Value := pHandleOrigem;
  qWriteAudit.Open;

  vLog := 'Atualização dos campos: ' + #13;
  for i := 0 to qWriteAudit.FieldCount - 1 do
  begin
    vLog := vLog + #13 + qWriteAudit.Fields[i].FieldName + ': ' + qWriteAudit.FieldByName(qWriteAudit.Fields[i].FieldName).AsString;
  end;
  vLog := vLog + #13 + 'na tabela SAM_AUTORIZ_EVENTOGERADO';
  if Sys.VisibleMode then
    Sys.writeaudit('A', Sys.HandleOfTable('SAM_AUTORIZ_EVENTOGERADO'), phandleOrigem, vLog);
  WriteBDebug('SamAuto.DM.Validador - Fim');
end;


procedure TDM.GerarEventos(pExecutor,
  pSolicitante,
  pRecebedor,
  pLocalExecucao,
  pEvento,
  pGrau: integer;
  pCid: integer;
  pDataSolicitacao: TDateTime;
  pHandleEventoSolicit,
  pBeneficiario: Integer;
  pTipoAutorizacao,
  pAcomodacao: integer;
  pQuantidade: real);
const
  SQLPOS =
    'SELECT A.EXAMEPOSOPERATORIO FROM SAM_TGE A WHERE A.HANDLE = :HANDLE';
  SQLPCTNEGREDE =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, A.CONVENIO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU FROM SAM_PCTNEGREDE A, SAM_REDERESTRITA_PRESTADOR P, SAM_REDERESTRITA R, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G ' +
    'WHERE A.PRESTADOR = P.HANDLE AND P.REDERESTRITA = R.HANDLE AND P.REDERESTRITA = :REDE AND P.PRESTADOR = :PRESTADOR AND ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT AND ' +
    'R.RESTRICAOPRESTADORES = ''S'' ' +
    'AND A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND A.CONVENIO = :HCONVENIO';
  SQLPCTNEGPRESTADOR =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, A.CONVENIO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU  FROM SAM_PCTNEGPREST A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G WHERE A.PRESTADOR = :PRESTADOR AND ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT ' +
    'AND A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND A.CONVENIO = :HCONVENIO';
  SQLPCTNEGMUNICIPIO =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, A.CONVENIO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU FROM SAM_PCTNEGMUNIC A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G WHERE A.MUNICIPIO = :MUNICIPIO AND ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT ' +
    'AND A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND A.CONVENIO = :HCONVENIO';
  SQLPCTNEGESTADO =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, A.CONVENIO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU FROM SAM_PCTNEGESTADO A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G WHERE A.ESTADO = :ESTADO AND ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT ' +
    'AND A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND A.CONVENIO = :HCONVENIO';
  SQLPCTNEGFILIAL =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, A.CONVENIO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU FROM SAM_PCTNEGFILIAL A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G WHERE A.FILIAL = :FILIAL AND ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT ' +
    'AND A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND A.CONVENIO = :HCONVENIO';
  SQLPCTNEGGERAL =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, A.CONVENIO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU FROM SAM_PCTNEGGERAL A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G WHERE ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT AND ' +
    'A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND A.CONVENIO = :HCONVENIO';
  SQLTGECOMPLEMENTARPRESTADOR =
    'SELECT * FROM SAM_TGE_COMPLEMENTAR_PRESTADOR COMP WHERE COMP.PRESTADOR = :HCOMPLEMENTAR AND ' +
    'COMP.EVENTO = :EVENTO';
  SQLTGECOMPLEMENTARMUNICIPIO =
    'SELECT * FROM SAM_TGE_COMPLEMENTAR_MUNICIPIO COMP WHERE COMP.MUNICIPIO = :HCOMPLEMENTAR AND ' +
    'COMP.EVENTO = :EVENTO';
  SQLTGECOMPLEMENTARESTADO =
    'SELECT * FROM SAM_TGE_COMPLEMENTAR_ESTADO COMP WHERE COMP.ESTADO = :HCOMPLEMENTAR AND ' +
    'COMP.EVENTO = :EVENTO';
  SQLTGECOMPLEMENTARGERAL =
    'SELECT * FROM SAM_TGE_COMPLEMENTAR COMP WHERE COMP.EVENTO = :EVENTO';
  SQLPCTNEGREDEGRAU =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU FROM SAM_PCTNEGREDE A, SAM_REDERESTRITA_PRESTADOR P, SAM_REDERESTRITA R, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G ' +
    'WHERE A.PRESTADOR = P.HANDLE AND P.REDERESTRITA = R.HANDLE AND P.REDERESTRITA = :REDE AND P.PRESTADOR = :PRESTADOR AND ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT AND ' +
    'R.RESTRICAOPRESTADORES = ''S'' ' +
    'AND A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND ' +
    'G.HANDLE = :HGRAU';
  SQLPCTNEGPRESTADORGRAU =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU  FROM SAM_PCTNEGPREST A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G WHERE A.PRESTADOR = :PRESTADOR AND ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT ' +
    'AND A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND ' +
    'G.HANDLE = :HGRAU';
  SQLPCTNEGMUNICIPIOGRAU =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU FROM SAM_PCTNEGMUNIC A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G WHERE A.MUNICIPIO = :MUNICIPIO AND ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT ' +
    'AND A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND ' +
    'G.HANDLE = :HGRAU';
  SQLPCTNEGESTADOGRAU =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU FROM SAM_PCTNEGESTADO A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G WHERE A.ESTADO = :ESTADO AND ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT ' +
    'AND A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND ' +
    'G.HANDLE = :HGRAU';
  SQLPCTNEGGERALGRAU =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU FROM SAM_PCTNEGGERAL A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G WHERE ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT AND ' +
    'A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND ' +
    'G.HANDLE = :HGRAU';

var
  vModulo: integer;
  vbUtilizaSelecaoManualdeComplementares: boolean;

label
  PacoteRedeModulo,
    PacoteRedeContrato,
    PacotePrestador,
    PacoteMunicipio,
    PacoteEstado,
    PacoteGeral,
    EventoComplementar,
    ComplementarPrestador,
    ComplementarMunicipio,
    ComplementarEstado,
    ComplementarGeral,
    InicioPacote,
    FimDaGeracaoDeEventos;
begin
  SQLGen.Close;
  SQLGEN.SQL.Clear;
  SQLTGEComplementar.Close;
  SQLTGEComplementar.SQL.Clear;
  SQLPCTREDE.Close;
  SQLPCTREDE.SQL.Clear;
  SQLPCTPRESTADOR.Close;
  SQLPCTPRESTADOR.SQL.Clear;
  SQLPCTMUNICIPIO.Close;
  SQLPCTMUNICIPIO.SQL.Clear;
  SQLPCTESTADO.Close;
  SQLPCTESTADO.SQL.Clear;

  // Eduardo - 27/01/2004 - SMS 22973
  // Verifica se a seleção de complementares será manual ou automática pelo tipo da autorização
  q.Close;
  q.SQL.Clear;
  q.SQL.Add('SELECT UTILIZACOMPLEMENTARESMANUAL');
  q.SQL.Add('  FROM SAM_TIPOAUTORIZ            ');
  q.SQL.Add(' WHERE HANDLE = :HANDLE           ');
  q.ParamByName('HANDLE').AsInteger := pTipoAutorizacao;
  q.Open;
  if q.FieldByName('UTILIZACOMPLEMENTARESMANUAL').AsString = 'S' then
    vbUtilizaSelecaoManualdeComplementares := True
  else
    vbUtilizaSelecaoManualdeComplementares := False;
  // fim SMS 22973

  if (not vbUtilizaSelecaoManualdeComplementares) or (pGrau <> nulo) then
  begin
    // mesmo se informar o grau pacote deve gerar o que tem a mais nos complementares.
    try
      spGerarEventos.Close;
      spGerarEventos.ParamByName('P_EXECUTOR').AsInteger := pExecutor;
      spGerarEventos.ParamByName('P_SOLICITANTE').AsInteger := pSolicitante;
      spGerarEventos.ParamByName('P_RECEBEDOR').AsInteger := pRecebedor;
      spGerarEventos.ParamByName('P_LOCALEXECUCAO').AsInteger := pLocalExecucao;
      spGerarEventos.ParamByName('P_EVENTO').AsInteger := pEvento;
      spGerarEventos.ParamByName('P_GRAU').AsInteger := pGrau;
      spGerarEventos.ParamByName('P_DATAATENDIMENTO').AsDateTime := pDataSolicitacao;
      spGerarEventos.ParamByName('P_HANDLEEVENTOSOLICIT').AsInteger := pHandleEventoSolicit;
      spGerarEventos.ParamByName('P_BENEFICIARIO').AsInteger := pBeneficiario;
      spGerarEventos.ParamByName('P_DV').asString := vgDV;
      spGerarEventos.ParamByName('P_TIPOAUTORIZACAO').AsInteger := pTipoAutorizacao;
      spGerarEventos.ParamByName('P_ACOMODACAO').AsInteger := pAcomodacao;
      spGerarEventos.ParamByName('P_QUANTIDADE').AsFloat := pQuantidade;
      spGerarEventos.ParamByName('P_AUTORIZACAO').AsInteger := SAMAUTO_AUTORIZ_EVENTOSOLICIT.FieldByname('AUTORIZACAO').asInteger;
      spGerarEventos.ParamByName('P_USUARIO').AsInteger := sys.CurrentUser;
      spGerarEventos.ParamByName('P_CHAVE').AsInteger := vgRecordHandle;
      spGerarEventos.ParamByName('P_AUTORIZADOR').asString := 'I';
      spGerarEventos.ParamByName('P_SERVICO').asString := 'G';
      spGerarEventos.ParamByName('P_SOMENTEGERAR').AsString := 'N';
      spGerarEventos.ParamByName('P_QTDPACOTE').AsInteger := -1;
      spGerarEventos.ParamByName('P_ATRIBUTO_1').AsInteger := 1;
      spGerarEventos.ParamByName('P_ATRIBUTO_2').AsInteger := -1;
      spGerarEventos.ParamByName('P_ATRIBUTO_3').AsFloat := -1;
      spGerarEventos.ParamByName('P_ATRIBUTO_4').AsDateTime := sys.serverdate;
      spGerarEventos.ParamByName('P_ATRIBUTO_5').asString := '';
      spGerarEventos.ParamByName('P_ATRIBUTO_6').asString := '';
      spGerarEventos.ExecProc;

      MostrarAlertasObserva(SAMAUTO_AUTORIZ_EVENTOSOLICIT.FieldByname('AUTORIZACAO').asInteger);

      GerarTratamentoSeriado(0, SAMAUTO_AUTORIZ_EVENTOSOLICIT.FieldByname('AUTORIZACAO').asInteger);

    except
      on E: Exception do
      begin
        ShowMessage('Erro ao gerar eventos: ' + e.Message);
      end;
    end;
  end
  else // UTILIZA SELEÇÃO MANUAL DE EVENTOS COMPLEMENTARES
  begin

    // 20/08/2003 - sms 18597 - Rodrigo
    if pRecebedor = nulo then
      pRecebedor := pLocalExecucao;

    if (pGrau = nulo) then // o usuário não selecionou grau
    begin
      vModulo := AcharModuloCobertura(
        pEvento,
        pBeneficiario,
        pDataSolicitacao,
        samauto_BENEFICIARIO.FieldByName('BDATAADESAO').AsDateTime,
        vgFinalidadeAtendimento,
        vgCondicaoAtendimento,
        vgLocalAtendimento,
        vgObjetivoTratamento,
        vgRegimeAtendimento,
        vgTipoTratamento);

      // Eduardo - 12/04/2004 - SMS 21638
      // Multi-plano
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT M.REDERESTRITA, B.HANDLE BENEFICIARIO, B.CONTRATO');
      Q.SQL.Add('  FROM SAM_CONTRATO_MOD M, SAM_BENEFICIARIO B, SAM_CONTRATO C');
      Q.SQL.Add(' WHERE M.MODULO   = :MODULO');
      Q.SQL.Add('   AND B.CONTRATO = C.HANDLE');
      Q.SQL.Add('   AND M.CONTRATO = C.HANDLE');
      Q.SQL.Add('   AND B.HANDLE   = :BENEFICIARIO');
      Q.SQL.Add('   AND M.PLANO    = :PLANO');
      Q.ParamByName('MODULO').Value := vModulo;
      Q.ParamByName('PLANO').Value := vgPlanoQueDeuCobertura;
      Q.ParamByName('BENEFICIARIO').Value := pBeneficiario;
      Q.Open;
      // fim SMS 21638

      // Soares - SMS: 68508 - Ítem 1 - 28/09/2006 - Início
      // Não estava sendo verificado quanto ao tipo de convenio... sendo assim, quando o convenio era diferente do
      // beneficiario continuava fazendo a mesma verificação
      q1.Close;
      q1.SQL.Clear;
      q1.SQL.Add('SELECT CONVENIO               ');
      q1.SQL.Add('  FROM SAM_BENEFICIARIO       ');
      q1.SQL.Add(' WHERE HANDLE = :HBENEFICIARIO');
      q1.ParamByName('HBENEFICIARIO').AsInteger := pBeneficiario;
      q1.Open;
      // Soares - SMS: 68508 - Ítem 1 - 28/09/2006 - Fim

      if pgrau = -1 then
      begin
        SQLGen.Close;
        SQLGen.SQL.Clear;
        SQLGen.SQL.Add(SQLPCTNEGREDE);
        SQLGen.ParamByName('REDE').Value := Q.FieldByName('REDERESTRITA').AsInteger;
        SQLGen.ParamByName('PRESTADOR').Value := pRecebedor;
        SQLGen.ParamByName('EVENTO').Value := pEvento;
        SQLGen.ParamByName('DATA').Value := pDataSolicitacao;
        SQLGen.ParamByName('HEVENTOSOLICIT').Value := pHandleEventoSolicit;
        SQLGen.ParamByName('HCONVENIO').Value := q1.FieldByName('CONVENIO').Value; // Soares - SMS: 68508 - Ítem 1 - 28/09/2006
        SQLGen.Open;
      end;
      if not SQLGen.IsEmpty then
      begin
        GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'R', pSolicitante, pExecutor, pRecebedor,
          pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
        exit; // Pode sair do procedimento aqui pois já gerou o pacote e os complementares
      end;

      // ----------------- PACOTE REDE NO CONTRATO -----------------

      // descobrir o contrato para achar a rede restrita do contrato
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT B.CONTRATO, C.REDERESTRITA');
      Q.SQL.Add('  FROM SAM_BENEFICIARIO B, SAM_CONTRATO C');
      Q.SQL.Add(' WHERE B.CONTRATO = C.HANDLE');
      Q.SQL.Add('   AND B.HANDLE = :HANDLE');
      Q.ParamByName('HANDLE').Value := pBeneficiario;
      Q.Open;

      if pgrau = -1 then
      begin
        SQLGen.Close;
        SQLGen.SQL.Clear;
        SQLGen.SQL.Add(SQLPCTNEGREDE);
        SQLGen.ParamByName('REDE').Value := Q.FieldByName('REDERESTRITA').AsInteger;
        SQLGen.ParamByName('PRESTADOR').Value := pRecebedor;
        SQLGen.ParamByName('EVENTO').Value := pEvento;
        SQLGen.ParamByName('DATA').Value := pDataSolicitacao;
        SQLGen.ParamByName('HEVENTOSOLICIT').Value := pHandleEventoSolicit;
        SQLGen.ParamByName('HCONVENIO').Value := q1.FieldByName('CONVENIO').Value; // Soares - SMS: 68508 - Ítem 1 - 28/09/2006
        SQLGen.Open;
      end;
      if not SQLGen.IsEmpty then
      begin
        GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'C', pSolicitante, pExecutor, pRecebedor,
          pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
        exit; //
      end;

      // ------------------------ PACOTE PRESTADOR ------------------------

      //Tentar Gerar Pacote para o prestador
      //Procura Pacote para o Prestador
      if pgrau = -1 then
      begin
        SQLGen.Close;
        SQLGen.SQL.Clear;
        SQLGen.SQL.Add(SQLPCTNEGPRESTADOR);
        SQLGen.ParamByName('PRESTADOR').Value := pRecebedor;
        SQLGen.ParamByName('EVENTO').Value := pEvento;
        SQLGen.ParamByName('DATA').Value := pDataSolicitacao;
        SQLGen.ParamByName('HEVENTOSOLICIT').Value := pHandleEventoSolicit;
        SQLGen.ParamByName('HCONVENIO').Value := q1.FieldByName('CONVENIO').Value; // Soares - SMS: 68508 - Ítem 1 - 28/09/2006
        SQLGen.Open;
      end;
      if not SQLGen.IsEmpty then
      begin
        GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'P', pSolicitante, pExecutor, pRecebedor,
          pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
        exit; //
      end;

      // -------------------- PACOTE MUNICÍPIO -------------------------
      //Procura Pacote para o Municipio

      if pGrau = -1 then
      begin
        SQLGen.Close;
        SQLGen.SQL.Clear;
        SQLGen.SQL.Add(SQLPCTNEGMUNICIPIO);
        SQLGen.ParamByName('MUNICIPIO').Value := RECEBEDOR.FieldByName('MUNICIPIOPAGAMENTO').AsInteger;
        SQLGen.ParamByName('EVENTO').Value := pEvento;
        SQLGen.ParamByName('DATA').Value := pDataSolicitacao;
        SQLGen.ParamByName('HEVENTOSOLICIT').Value := pHandleEventoSolicit;
        SQLGen.ParamByName('HCONVENIO').Value := q1.FieldByName('CONVENIO').Value; // Soares - SMS: 68508 - Ítem 1 - 28/09/2006
        SQLGen.Open;
      end;
      if not SQLGen.IsEmpty then
      begin
        GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'M', pSolicitante, pExecutor, pRecebedor,
          pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
        exit; //
      end;

      // ----------------------- PACOTE ESTADO ---------------------------

      if pGrau = -1 then
      begin
        //Procura Pacote para o Estado
        SQLGen.Close;
        SQLGen.SQL.Clear;
        SQLGen.SQL.Add(SQLPCTNEGESTADO);
        SQLGen.ParamByName('ESTADO').Value := RECEBEDOR.FieldByName('ESTADOPAGAMENTO').AsInteger;
        SQLGen.ParamByName('EVENTO').Value := pEvento;
        SQLGen.ParamByName('DATA').Value := pDataSolicitacao;
        SQLGen.ParamByName('HEVENTOSOLICIT').Value := pHandleEventoSolicit;
        SQLGen.ParamByName('HCONVENIO').Value := q1.FieldByName('CONVENIO').Value; // Soares - SMS: 68508 - Ítem 1 - 28/09/2006
        SQLGen.Open;
      end;
      if not SQLGen.IsEmpty then
      begin
        GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'E', pSolicitante, pExecutor, pRecebedor,
          pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
        exit; //
      end;

      // ----------------------- PACOTE FILIAL ---------------------------

      if pGrau = -1 then
      begin
        //Procura Pacote para a Filial
        SQLGen.Close;
        SQLGen.SQL.Clear;
        SQLGen.SQL.Add(SQLPCTNEGFILIAL);
        SQLGen.ParamByName('FILIAL').Value := RECEBEDOR.FieldByName('FILIALPADRAO').AsInteger;
        SQLGen.ParamByName('EVENTO').Value := pEvento;
        SQLGen.ParamByName('DATA').Value := pDataSolicitacao;
        SQLGen.ParamByName('HEVENTOSOLICIT').Value := pHandleEventoSolicit;
        SQLGen.ParamByName('HCONVENIO').Value := q1.FieldByName('CONVENIO').Value; // Soares - SMS: 68508 - Ítem 1 - 28/09/2006
        SQLGen.Open;
      end;
      if not SQLGen.IsEmpty then
      begin
        GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'F', pSolicitante, pExecutor, pRecebedor,
          pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
        exit; //
      end;

      // ------------------------ PACOTE GERAL ------------------------
      //Procura Pacote Geral
      if pGrau = -1 then
      begin
        SQLGen.Close;
        SQLGen.SQL.Clear;
        SQLGen.SQL.Add(SQLPCTNEGGERAL);
        SQLGen.ParamByName('EVENTO').Value := pEvento;
        SQLGen.ParamByName('DATA').Value := pDataSolicitacao;
        SQLGen.ParamByName('HEVENTOSOLICIT').Value := pHandleEventoSolicit;
        SQLGen.ParamByName('HCONVENIO').Value := q1.FieldByName('CONVENIO').Value; // Soares - SMS: 68508 - Ítem 1 - 28/09/2006
        SQLGen.Open;
      end;
      if not SQLGen.IsEmpty then
      begin
        GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'G', pSolicitante, pExecutor, pRecebedor,
          pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
        exit; //
      end;
    end;

    GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'N', pSolicitante, pExecutor, pRecebedor,
      pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
    exit;

  end;
end;

// SMS 15787 - RODRIGO - 20/11/2003

procedure TDM.GerarComplementaresManual(pBeneficiario: integer; pEvento: integer; pCid: integer; pPacoteOrigem: char;
  pSolicitante, pExecutor, pRecebedor, pLocalExecucao: integer;
  pDataSolicitacao: TDateTime; pTipoAutorizacao: integer; pQuantidade: real;
  pQuery: TBennerQuery);
var
  PacoteSelecionado: integer;
  i: integer;
begin
  PacoteSelecionado := -1;
  if pQuery.RecordCount > 1 then
  begin
    if Sys.VisibleMode then
      ShowMessage('Existe mais de um grau do tipo pacote. É necessário informar o grau desejado.');
    FormPacote := TFormPacote.Create(nil);
    FormPacote.Sys := Sys;
    InitSys(Sys.CurrentSystem, FormPacote);

    FormPacote.Inicializar(pQuery); //(SQLGen);
    FormPacote.ShowModal;
    if FormPacote.PacoteEscolhido < 0 then
    begin
      if Sys.VisibleMode then
        ShowMessage('Não foi selecionado um pacote. Impossível continuar!!!');

      Freeandnil(FormPacote);
      exit;
    end
    else
    begin
      PacoteSelecionado := FormPacote.PacoteEscolhido;
      Freeandnil(FormPacote);
    end;
    // Agora deve ser selecionado os eventos complementares que serão gerados manualmente
    FRMComplementares := TFRMComplementares.Create(self);
    FRMComplementares.Sys := Sys;
    InitSys(Sys, FRMComplementares);
    //             FRMComplementares.EncontrarComplementares(pevento,pRecebedor,-1,-1,85,'P');

    LerRecebedor(pRecebedor);

    FRMComplementares.EncontrarComplementares(pEvento,
      pRecebedor,
      RECEBEDOR.FieldByName('ESTADOPAGAMENTO').AsInteger,
      RECEBEDOR.FieldByName('MUNICIPIOPAGAMENTO').AsInteger,
      PacoteSelecionado,
      pPacoteOrigem);
    // Só exibe a tela, se tiver encontrado graus complementares para serem selecionados.
    if FRMComplementares.LSTCompl.Items.Count > 0 then
      FRMComplementares.ShowModal;

    if FRMComplementares.global.vbOK then
    begin
      // Gravar o Pacote se existir
      GravarEventoGerado(
        pQuery.FieldByName('EVENTO').AsInteger,
        pQuery.FieldByName('GRAUAGERAR').AsInteger,
        pCid,
        pBeneficiario,
        pSolicitante,
        pExecutor,
        pRecebedor,
        pLocalExecucao,
        pDataSolicitacao,
        pQuery.FieldByName('CODIGOPAGTO').AsInteger,
        pTipoAutorizacao,
        'N',
        'N',
        pQuantidade,
        vgLOCALATENDIMENTO, //SMS 73963 - Marcelo Barbosa - 25/11/2006
        0);
      // Gravar os complementares selecionados
      for i := 0 to FRMComplementares.LSTCompl.Items.Count - 1 do
      begin
        if FRMComplementares.LSTCompl.Items.Item[i].Checked then
          GravarEventoGerado(
            FRMComplementares.pegaHandleEventoGerar(i),
            FRMComplementares.pegaHandleGrauGerar(i),
            pCid,
            pBeneficiario,
            pSolicitante,
            pExecutor,
            pRecebedor,
            pLocalExecucao,
            pDataSolicitacao,
            FRMComplementares.pegaCodigoPagamento(i),
            pTipoAutorizacao,
            'N',
            'N',
            pQuantidade,
            vgLOCALATENDIMENTO, //SMS 73963 - Marcelo Barbosa - 25/11/2006
            0);
      end;
    end
    else
    begin
      if FRMComplementares.LSTCompl.Items.Count > 0 then
        Application.MessageBox('Para validar é necessário confirmar o processo. ' + #13#10 + 'Processo de validação cancelado!', 'Sistema Benner Saúde', MB_OK + MB_ICONWARNING);
      //      ShowMessage('Para validar é necessário selecionar pelo menos um evento complementar. Processo de validação cancelado!');
    end;
    FRMComplementares.Free;
    FRMComplementares := nil;
  end //fim se tem mais de um pacote para
  else
  begin
    // Agora deve ser selecionado os eventos complementares que serão gerados manualmente
    FRMComplementares := TFRMComplementares.Create(self);
    FRMComplementares.Sys := Sys;
    InitSys(Sys, FRMComplementares);

    //             FRMComplementares.EncontrarComplementares(pevento,pRecebedor,-1,-1,85,'P');
    LerRecebedor(pRecebedor);
    FRMComplementares.EncontrarComplementares(pEvento,
      pRecebedor,
      RECEBEDOR.FieldByName('ESTADOPAGAMENTO').AsInteger,
      RECEBEDOR.FieldByName('MUNICIPIOPAGAMENTO').AsInteger,
      pQuery.FieldByName('HANDLE').AsInteger, // Pacote Encontrado
      pPacoteOrigem);
    if FRMComplementares.LSTCompl.Items.Count > 0 then
      FRMComplementares.ShowModal;

    if FRMComplementares.global.vbOK then
    begin
      // Gravar o Pacote se existir
      if not pQuery.FieldByName('HANDLE').isNull then
        GravarEventoGerado(
          pQuery.FieldByName('EVENTO').AsInteger,
          pQuery.FieldByName('GRAUAGERAR').AsInteger,
          pCid,
          pBeneficiario,
          pSolicitante,
          pExecutor,
          pRecebedor,
          pLocalExecucao,
          pDataSolicitacao,
          pQuery.FieldByName('CODIGOPAGTO').AsInteger,
          pTipoAutorizacao,
          'N',
          'N',
          pQuantidade,
          vgLOCALATENDIMENTO, //SMS 73963 - Marcelo Barbosa - 25/11/2006
          0);
      // Gravar os complementares selecionados
      for i := 0 to FRMComplementares.LSTCompl.Items.Count - 1 do
      begin
        if FRMComplementares.LSTCompl.Items.Item[i].Checked then
          GravarEventoGerado(
            FRMComplementares.pegaHandleEventoGerar(i),
            FRMComplementares.pegaHandleGrauGerar(i),
            pCid,
            pBeneficiario,
            pSolicitante,
            pExecutor,
            pRecebedor,
            pLocalExecucao,
            pDataSolicitacao,
            FRMComplementares.pegaCodigoPagamento(i),
            pTipoAutorizacao,
            'N',
            'N',
            pQuantidade,
            vgLOCALATENDIMENTO, //SMS 73963 - Marcelo Barbosa - 25/11/2006
            0);
      end;
    end
    else
    begin
      // Soh exige a mensagem caso exista complementares e o usuário nao selecionou nenhuma
      // Caso contrário, passa direto, pois o evento não possui complementar
      if FRMComplementares.LSTCompl.Items.Count > 0 then
        Application.MessageBox('Para validar é necessário confirmar o processo. ' + #13#10 + 'Processo de validação cancelado!', 'Sistema Benner Saúde', MB_OK + MB_ICONWARNING)
    end;
    FRMComplementares.Free;
    FRMComplementares := nil;
  end;
end;

function TDM.SetSituacaoDoEvento(pHandleOrigem,
  pBeneficiario,
  pSolicitante,
  pExecutor,
  pRecebedor,
  pLocalExecucao,
  pEvento,
  pGrau: integer;
  pCid: integer;
  pData: TDateTime;
  pQuantidade: currency;
  pValorCalculado: currency;
  pDataCalculoLimitacao: TDateTime;
  pTipoAutorizacao: integer;
  pOrigemAcerto: WideString;
  pHandleAcerto: Integer): string;
var
  RTFDll: Variant;
  Texto: WideString;
  vsVisualizar: string;
  vsSenha: string;
begin
  WriteBDebug('SamAuto.DM.SetSituacaoDoEvento - Início');
  try
    StartTransactionEx(Sys.CurrentSystem, 'SamAuto_UDM_SetSituacaoDoEvento', vsSenha);

    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT CALCCODPAGTOEVENTOCIRURGICO');
    Q.SQL.Add('  FROM SAM_PARAMETROSATENDIMENTO');
    Q.UnPrepare;
    Q.Open;

    if vgBeneficiario = -1 then // coelho sms 94694
      sp_ValidadorNEW.ParamByName('p_Beneficiario').Value := NULL
    else
    begin
      if vgBeneficiario > 0 then
        sp_ValidadorNEW.ParamByName('p_Beneficiario').Value := vgBeneficiario
      else
        sp_ValidadorNEW.ParamByName('p_Beneficiario').Value := pBeneficiario;
    end;

    sp_ValidadorNEW.ParamByName('p_HandleOrigemEvento').Value := vgHandleOrigem;
    sp_ValidadorNEW.ParamByName('p_HandleOrigem').Value := pHandleOrigem;
    sp_ValidadorNEW.ParamByName('p_Grau').Value := pGrau;
    sp_ValidadorNEW.ParamByName('p_Evento').Value := pEvento;
    sp_ValidadorNEW.ParamByName('p_Executor').Value := pExecutor;
    sp_ValidadorNEW.ParamByName('p_Quantidade').Value := pQuantidade;
    sp_ValidadorNEW.ParamByName('p_Recebedor').Value := pRecebedor;
    sp_ValidadorNEW.ParamByName('p_Solicitante').Value := pSolicitante;
    sp_ValidadorNEW.ParamByName('p_Data').Value := pData;
    sp_ValidadorNEW.ParamByName('p_OrigemDoProcesso').Value := vgOrigemDoProcesso;
    sp_ValidadorNEW.ParamByName('p_Chave').Value := vgRecordHandle;
    sp_ValidadorNEW.ParamByName('p_DV').Value := vgDV;
    sp_ValidadorNEW.ParamByName('p_FINALIDADEATENDIMENTO').Value := vgFINALIDADEATENDIMENTO;
    sp_ValidadorNEW.ParamByName('p_CONDICAOATENDIMENTO').Value := vgCONDICAOATENDIMENTO;
    sp_ValidadorNEW.ParamByName('p_LOCALATENDIMENTO').Value := vgLOCALATENDIMENTO;
    sp_ValidadorNEW.ParamByName('p_OBJETIVOTRATAMENTO').Value := vgOBJETIVOTRATAMENTO;
    sp_ValidadorNEW.ParamByName('p_REGIMEATENDIMENTO').Value := vgREGIMEATENDIMENTO;
    sp_ValidadorNEW.ParamByName('p_TIPOTRATAMENTO').Value := vgTIPOTRATAMENTO;
    sp_ValidadorNEW.ParamByName('p_ACIDENTEPESSOAL').Value := vgACIDENTEPESSOAL;
    sp_ValidadorNEW.ParamByName('p_CurrentUser').Value := vgCurrentUser;
    sp_ValidadorNEW.ParamByName('p_XTHM').Value := vgXTHM;
    sp_ValidadorNEW.ParamByName('p_CodigoPagto').Value := vgCodigoPagto;
    sp_ValidadorNEW.ParamByName('p_DataCalculoLimitacao').Value := pDataCalculoLimitacao;
    sp_ValidadorNEW.ParamByName('p_LocalExecucao').Value := pLocalExecucao;

    if not vgOrigemClinica then
      sp_ValidadorNEW.ParamByName('p_Servico').Value := vgServico
    else
      sp_ValidadorNEW.ParamByName('p_Servico').Value := 'C';

    sp_ValidadorNEW.ParamByName('p_TipoAutorizacao').Value := pTipoAutorizacao;
    sp_ValidadorNEW.ParamByName('p_ValorCalculado').Value := pValorCalculado;

    sp_ValidadorNEW.ParamByName('p_AutorizadorExterno').Value := 'N';
    sp_ValidadorNEW.ParamByName('p_Atributo_1').Value := 1;
    sp_ValidadorNEW.ParamByName('p_Atributo_2').Value := date;
    sp_ValidadorNEW.ParamByName('p_Atributo_3').Value := '';

    sp_ValidadorNEW.ParamByName('p_OrigemAcerto').Value := pOrigemAcerto;
    sp_ValidadorNEW.ParamByName('p_HandleAcerto').Value := pHandleAcerto;

    sp_ValidadorNEW.ParamByName('P_MODULOQUEDEUCOBERTURA').Value := 0;
    sp_ValidadorNEW.ParamByName('P_PLANOQUEDEUCOBERTURA').Value := 0;
    sp_ValidadorNEW.ParamByName('P_DATAADESAOMODULOBENEFICIARIO').Value := pData;
    sp_ValidadorNEW.ParamByName('P_BENEFICIARIOMODULO').Value := 0;
    sp_ValidadorNEW.ParamByName('P_CONTRATOMODQUEDEUCOBERTURA').Value := 0;
    sp_ValidadorNEW.ParamByName('P_ACHOUMODULO').Value := 'N';
    sp_ValidadorNEW.ParamByName('P_CHAMOUMODULOCOBERTURA').Value := 'N'; // passa 'N' pois assim a procedure faz a busca do módulo de cobertura

    sp_ValidadorNEW.ExecProc;

    // Executou a Validador
    vgControle := 1;

    gNegacoes := sp_ValidadorNew.ParamByName('p_PegNegacao').AsString;
    vgPlanoQueDeuCobertura := sp_ValidadorNEW.ParamByName('p_Atributo_3').AsInteger;

    if (vgOrigemDoProcesso = 'A') and (sp_ValidadorNEW.ParamByName('p_AlertaNegacao').AsInteger = 1) then
    begin
      GerarPericia(-1,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger,
        vgBeneficiario,
        pRecebedor);
    end;


    vgResultado := sp_ValidadorNEW.ParamByName('p_Resultado').AsString;
    Result := sp_ValidadorNEW.ParamByName('p_Resultado').AsString;
    vgRedeRestrita := sp_ValidadorNEW.ParamByName('p_RedeRestrita').AsInteger;

    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT * FROM ' + PrefixoTmp(Sys.CurrentSystem) + 'TMP_NEGACAOEVENTO');
    Q.SQL.Add(' WHERE HANDLEORIGEM = :HANDLEORIGEM');
    Q.SQL.Add('   AND CHAVE        = :CHAVE');
    Q.ParamByName('HANDLEORIGEM').Value := pHandleOrigem;
    Q.ParamByName('CHAVE').Value := vgRecordHandle;
    Q.Open;
    Result := 'A';
    while not Q.EOF do
    begin
      if (Q.FieldByName('TIPO').AsString = 'O') then
      begin
        if (vgOrigemClinica) or (vgOrigemdoProcesso = 'A') or ((Q.FieldByName('CONSIDERANOPAGAMENTO').AsString = 'S') and (vgOrigemdoProcesso = 'P')) then // se veio da clínica deve desconsiderar o flag 'CONSIDERANOPAGAMENTO'
        begin
          if not Q.FieldByName('Z_GRUPO').IsNull then //SMS 85665 - Willian - 8/8/2007
          begin
            qObservacaoIncomp.Close;
            qObservacaoIncomp.SQL.Clear;
            qObservacaoIncomp.SQL.Add('SELECT OBSERVACAO FROM SAM_INCOMP_EVENTOS_GERAL WHERE INCOMPATIBILIDADE = :INCOMP');
            qObservacaoIncomp.ParamByName('INCOMP').AsInteger := Q.FieldByName('IMCOMPATIBILIDADE').AsInteger; //Vieira 31/08/2007
            qObservacaoIncomp.Open;
            RTFDll := AbrirDll(Sys.CurrentSystem, 'RTF2TXT.Rotinas');
            Texto := 'Observação...........:';
            Texto := Texto + RTFDLl.rtf2txt(Sys.CurrentSystem, qObservacaoIncomp.FieldByName('OBSERVACAO').AsString);

            New(FrmAlertas.RecObservacao);
            FrmAlertas.RecObservacao^.Observacao := Q.FieldByName('COMPLEMENTO').AsString + #13 + Texto;
            FrmAlertas.vLstObs.Add(FrmAlertas.RecObservacao);
          end
          else
          begin
            New(FrmAlertas.RecObservacao);
            FrmAlertas.RecObservacao^.Observacao := Q.FieldByName('COMPLEMENTO').AsString;
            FrmAlertas.vLstObs.Add(FrmAlertas.RecObservacao);
          end;
        end;
      end;
      Q.Next;
    end; // do WHILE DAS NEGAÇÕES
      //Carregando a Lista de Alertas
    QS.Close;
    QS.SQL.Clear;
    QS.SQL.Add('SELECT * FROM ' + PrefixoTmp(Sys.CurrentSystem) + 'TMP_ALERTAS');
    QS.SQL.Add(' WHERE CHAVE        = :CHAVE');
    QS.ParamByName('CHAVE').Value := vgRecordHandle;
    QS.Open;

    while not QS.EOF do
    begin
      with FrmAlertas do
      begin
        New(RecAlerta);
        RecAlerta^.Local := QS.FieldByName('DESCRICAO').AsString;
        RecAlerta^.TipoAlerta := QS.FieldByName('TIPOALERTA').AsString;

        RecAlerta^.Texto := sys.SQLMemoText(Integer(Pointer(QS.FieldByName('TEXTO'))));
        RecAlerta^.Acao := ' '; // isto já foi tratado na Stored Procedure
        RecAlerta^.Auto_Pgto := 'A';
        RecAlerta^.HandleAlerta := QS.FieldByName('HANDLEALERTA').AsInteger;
        RecAlerta^.HandleOrigem := -1;

        qSempreVisualizar.Close;
        qSempreVisualizar.SQL.Clear;

        if (RecAlerta^.TipoAlerta = 'BENEFICIARIO') then
          qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTABENEF WHERE HANDLE = :HANDLE');
        if (RecAlerta^.TipoAlerta = 'CORPO CLINICO') or
          (RecAlerta^.TipoAlerta = 'ASSOCIACAO') or
          (RecAlerta^.TipoAlerta = 'EXECUTOR') or
          (RecAlerta^.TipoAlerta = 'LOCALEXECUCAO') or
          (RecAlerta^.TipoAlerta = 'RECEBEDOR') or
          (RecAlerta^.TipoAlerta = 'SOLICITANTE') then
          qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTAPRESTADOR WHERE HANDLE = :HANDLE');
        if (RecAlerta^.TipoAlerta = 'MATRICULA') then
          qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTAMATRICULA WHERE HANDLE = :HANDLE');
        if (RecAlerta^.TipoAlerta = 'FAMILIA') then
          qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTAFAMILIA WHERE HANDLE = :HANDLE');
        if (RecAlerta^.TipoAlerta = 'CONTRATO') then
          qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTACONTRATO WHERE HANDLE = :HANDLE');
        if (RecAlerta^.TipoAlerta = 'PLANO') then
          qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTAPLANO WHERE HANDLE = :HANDLE');
        if (RecAlerta^.TipoAlerta = 'SOLICITANTEMUNICIPIO') or
          (RecAlerta^.TipoAlerta = 'EXECUTORMUNICIPIO') or
          (RecAlerta^.TipoAlerta = 'RECEBEDORMUNICIPIO') or
          (RecAlerta^.TipoAlerta = 'LOCALEXECMUNICIPIO') then
          qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTAMUNICIPIO WHERE HANDLE = :HANDLE');
        if (RecAlerta^.TipoAlerta = 'SOLICITANTEESTADO') or
          (RecAlerta^.TipoAlerta = 'EXECUTORESTADO') or
          (RecAlerta^.TipoAlerta = 'RECEBEDORESTADO') or
          (RecAlerta^.TipoAlerta = 'LOCALEXECUCAOESTADO') then
          qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTAESTADO WHERE HANDLE = :HANDLE');
        if (RecAlerta^.TipoAlerta = 'GERAL') then
          qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTAGERAL WHERE HANDLE = :HANDLE');

        qSempreVisualizar.ParamByName('HANDLE').Value := RecAlerta^.HandleAlerta;
        qSempreVisualizar.Open;
        vsVisualizar := qSempreVisualizar.FieldByName('SEMPREVISUALIZAR').AsString;

        if (vsVisualizar = 'S') or (qParamGeralAtendimento.FieldByName('ALERTASOMENTERESUMO').AsString = 'N') then
          vLstAlerta.Add(RecAlerta)
        else
          Dispose(RecAlerta);
      end;
      QS.Next;
    end; // END DO WHILE DO ALERTA
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('DELETE FROM ' + PrefixoTmp(Sys.CurrentSystem) + 'TMP_NEGACAOEVENTO');
    Q.SQL.Add(' WHERE CHAVE =:CHAVE         ');
    Q.ParamByName('CHAVE').Value := vgRecordHandle;
    Q.ExecSql;
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('DELETE FROM ' + PrefixoTmp(Sys.CurrentSystem) + 'TMP_ALERTAS      ');
    Q.SQL.Add(' WHERE CHAVE =:CHAVE         ');
    Q.ParamByName('CHAVE').Value := vgRecordHandle;
    Q.ExecSql;

    CommitEx(Sys.CurrentSystem, vsSenha);
  except
    RollbackEx(Sys.CurrentSystem, vsSenha);
    raise;
  end;
  WriteBDebug('SamAuto.DM.SetSituacaoDoEvento - Início');
end;

function TDM.CalcularAcomodacao(pAutorizacao: Variant; pDataPrevistoAtendimento: TDatetime; var EventoAcomodacao: Integer): Integer;
begin
  sp_Acomodacao.ParamByName('P_AUTORIZACAO').Value := pAutorizacao;
  sp_Acomodacao.ParamByName('P_DATAPREVISTA').Value := pDataPrevistoAtendimento;
  sp_Acomodacao.ExecProc;
  Result := sp_Acomodacao.ParamByName('P_ACOMODACAO').AsInteger;
  EventoAcomodacao := sp_Acomodacao.ParamByName('P_EVENTOACOMODACAO').AsInteger;
end;


procedure TDM.AtualizarAcomodacao(pHandleOrigem: integer; pDataAtendimento: TDateTime);
// Fábio 12/07/2002
// a acomodação é achada pelo módulo q deu cobertura ou pela SAM_ACOMODACAO_GRAU/SAM_ACOMODACAO_EVENTO.
// sendo assim não está sendo mais atualizada a SP da acomodação e esse procedimento para atualizar a acomodação na autorização.
var
  plHAutorizacao, vAcomodacao, vEventoAcomodacao: integer;
begin
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT AUTORIZACAO FROM SAM_AUTORIZ_EVENTOSOLICIT WHERE HANDLE = :EVENTOSOLICITADO');
  Q.ParamByName('EVENTOSOLICITADO').Value := pHandleOrigem;
  Q.Open;

  if Q.EOF then
  begin
    Exit;
  end;

  plHAutorizacao := Q.FieldByName('AUTORIZACAO').AsInteger;

  // Fábio - 18/01/2002
  // acomodação a partir da versão 2.06.02 pode ser um evento ou grau respectivamente
  // para encontrar a acomodação passa a utilizar SP
  vAcomodacao := CalcularAcomodacao(plHAutorizacao, pDataAtendimento, vEventoAcomodacao);

  if vAcomodacao > 0 then
  begin
    Q.SQL.Clear;
    Q.SQL.Add('UPDATE SAM_AUTORIZ SET ACOMODACAO = :ACOMODACAO');
    Q.SQL.Add('WHERE HANDLE = :HANDLE');
    Q.ParamByName('HANDLE').Value := plHAutorizacao;
    Q.ParamByName('ACOMODACAO').Value := vAcomodacao;
    q.ExecSql;
  end;
end;

procedure TDM.AtualizarPeriodoInternacaoAcomodacao(pHandleOrigem: integer);
var
  vDias, vAcomodacao, vTipoAcomodacao: integer;
  vDiariaTipoAcomodacaoTISS: string;
  vdValidadeAutorizacao,
    vdValidadeEventoSolicitado,
    vdValidadeEventoGerado: TDAteTime; // Coelho SMS: 119820
begin
  Q.SQL.Clear;
  Q.SQL.Add(' SELECT DIARIATIPOACOMODACAOTISS FROM SAM_PARAMETROSATENDIMENTO ');
  Q.Open;
  vDiariaTipoAcomodacaoTISS := Q.FieldByName('DIARIATIPOACOMODACAOTISS').AsString;
  Q.Close;

  // atualiza o período de internação se for o primeira diária ou se for internação
  // atualiza também a acomodação se for diária ou prorrogação.

  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT A.DATAINTERNACAO, A.DATAPREVISTAALTA, G.*, ');
  Q.SQL.Add('       A.DATAVALIDADE VALIDADEAUTORIZACAO, ES.DATAVALIDADE VALIDADEEVENTOSOLICITADO '); // Coelho SMS: 119820 incluída a data de validade da autorização e do evento solicitado
  Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO G,    ');
  Q.SQL.Add('       SAM_AUTORIZ A,                 ');
  Q.SQL.Add('       SAM_AUTORIZ_EVENTOSOLICIT ES   ');
  Q.SQL.Add(' WHERE G.HANDLE = :HANDLE             ');
  Q.SQL.Add('   AND A.HANDLE = G.AUTORIZACAO       ');
  Q.SQL.Add('   AND ES.HANDLE = G.EVENTOSOLICITADO ');
  Q.ParamByName('HANDLE').Value := pHandleOrigem;
  Q.Open;

  vdValidadeAutorizacao := Q.FieldByName('VALIDADEAUTORIZACAO').AsDateTime; // Coelho SMS: 119820
  vdValidadeEventoSolicitado := Q.FieldByName('VALIDADEEVENTOSOLICITADO').AsDateTime; // Coelho SMS: 119820
  vdValidadeEventoGerado := Q.FieldByName('DATAVALIDADE').AsDateTime; // Coelho SMS: 119820

  X.Close;
  X.SQL.Clear;
  X.SQL.Add('SELECT G.ACOMODACAO, G.TIPOACOMODACAO, ( ' + Sys.SQLAddDay('G.DATAATENDIMENTO', 'G.QTDAUTORIZADA') + ' ) ULTIMA');
  X.SQL.Add(' FROM SAM_AUTORIZ_EVENTOGERADO G');
  X.SQL.Add('WHERE G.AUTORIZACAO = :HAUTORIZACAO');
  X.SQL.Add('  AND TIPOEVENTO IN (''D'', ''P'')');
  X.SQL.Add('ORDER BY ULTIMA DESC, G.ACOMODACAO DESC');
  X.ParamByName('HAUTORIZACAO').Value := Q.FieldByName('AUTORIZACAO').AsInteger;
  X.Open;
  vAcomodacao := X.FieldByName('ACOMODACAO').AsInteger;
  vTipoAcomodacao := X.FieldByName('TIPOACOMODACAO').AsInteger;
  // se situacao = '' então está revertendo Checado lá

  X.Close;
  X.SQL.Clear;
  X.SQL.Add('SELECT SUM(C.QTDAUTORIZADA) DIARIAS');
  X.SQL.Add('  FROM SAM_AUTORIZ A,');
  X.SQL.Add('       SAM_AUTORIZ_EVENTOGERADO C');
  X.SQL.Add(' WHERE A.HANDLE = C.AUTORIZACAO');
  X.SQL.Add('   AND A.HANDLE = :HAUTORIZACAO');
  X.SQL.Add('   AND C.TIPOEVENTO IN (''D'', ''P'')');
  X.SQL.Add('   AND C.SITUACAO IN (''A'', ''L'')');
  X.ParamByName('HAUTORIZACAO').AsInteger := Q.FieldByName('AUTORIZACAO').AsInteger;
  X.Open;
  vDias := X.FieldByName('DIARIAS').AsInteger;

  X.Close;
  X.SQL.Clear;
  X.SQL.Add('SELECT C.DATAATENDIMENTO');
  X.SQL.Add('  FROM SAM_AUTORIZ A,');
  X.SQL.Add('       SAM_AUTORIZ_EVENTOGERADO C');
  X.SQL.Add(' WHERE A.HANDLE = C.AUTORIZACAO');
  X.SQL.Add('   AND A.HANDLE = :HAUTORIZACAO');
  X.SQL.Add('   AND C.TIPOEVENTO IN (''D'', ''P'')');
  X.SQL.Add('   AND C.SITUACAO IN (''A'', ''L'')');
  X.SQL.Add(' ORDER BY C.DATAATENDIMENTO ASC');
  X.ParamByName('HAUTORIZACAO').Value := Q.FieldByName('AUTORIZACAO').AsInteger;
  X.Open;

  if Q.FieldByName('TIPOEVENTO').AsString = 'D' then
  begin
    UPD.SQL.Clear;
    UPD.SQL.Add('UPDATE SAM_AUTORIZ');
    UPD.SQL.Add('   SET ACOMODACAO = :HACOMODACAO,');

    if ((vDiariaTipoAcomodacaoTISS = 'S') and (vAcomodacao > 0)) then
    begin
      qAux.Close;
      qAux.SQL.Clear;
      qAux.SQL.Add(' SELECT HANDLE FROM TIS_TIPOACOMODACAO WHERE ACOMODACAO = :ACOMODACAO ');
      qAux.ParamByName('ACOMODACAO').AsInteger := vAcomodacao;
      qaux.Open;
      if (not qAux.FieldByName('HANDLE').IsNull) then
      begin
        UPD.SQL.Add('       TIPOACOMODACAO = :TIPOACOMODACAO, ');
        if vTipoAcomodacao > 0 then
          UPD.ParamByName('TIPOACOMODACAO').AsInteger := vTipoAcomodacao
        else
          UPD.ParamByName('TIPOACOMODACAO').AsInteger := qAux.FieldByName('HANDLE').AsInteger; 
      end;
      qAux.Close;
    end;
    UPD.SQL.Add('       DATAINTERNACAO = :DATA1,');
    UPD.SQL.Add('       DATAPREVISTAALTA = :DATA2');
    UPD.SQL.Add(' WHERE HANDLE = :HAUTORIZACAO');
    if vAcomodacao > 0 then
    begin
      UPD.ParamByName('HACOMODACAO').Value := vAcomodacao
    end
    else
    begin
      UPD.ParamByName('HACOMODACAO').DataType := ftInteger;
      UPD.ParamByName('HACOMODACAO').Clear;
    end;

    UPD.ParamByName('HAUTORIZACAO').Value := Q.FieldByName('AUTORIZACAO').AsInteger;

    if X.FieldByName('DATAATENDIMENTO').isNull then
    begin
      UPD.ParamByName('DATA1').DataType := ftDateTime;
      UPD.ParamByName('DATA2').DataType := ftDateTime;
      UPD.ParamByName('DATA1').Clear;
      UPD.ParamByName('DATA2').Clear;
    end
    else
    begin
      UPD.ParamByName('DATA1').AsDateTime := X.FieldByName('DATAATENDIMENTO').AsDateTime;
      UPD.ParamByName('DATA2').AsDateTime := X.FieldByName('DATAATENDIMENTO').AsDateTime + vDias;
    end;
    UPD.ExecSql;
  end;

  if Q.FieldByName('TIPOEVENTO').AsString = 'P' then
  begin
    UPD.SQL.Clear;
    UPD.SQL.Add('UPDATE SAM_AUTORIZ');
    UPD.SQL.Add('   SET ACOMODACAO = :HACOMODACAO,');

    if ((vDiariaTipoAcomodacaoTISS = 'S') and (vAcomodacao > 0)) then
    begin
      qAux.Close;
      qAux.SQL.Clear;
      qAux.SQL.Add(' SELECT HANDLE FROM TIS_TIPOACOMODACAO WHERE ACOMODACAO = :ACOMODACAO ');
      qAux.ParamByName('ACOMODACAO').AsInteger := vAcomodacao;
      qAux.Open;
      if (not qAux.FieldByName('HANDLE').IsNull) then
      begin
        UPD.SQL.Add('       TIPOACOMODACAO = :TIPOACOMODACAO, ');
        if vTipoAcomodacao > 0 then
          UPD.ParamByName('TIPOACOMODACAO').AsInteger := vTipoAcomodacao
        else
          UPD.ParamByName('TIPOACOMODACAO').AsInteger := qAux.FieldByName('HANDLE').AsInteger;
      end;
      qAux.Close;
    end;

    UPD.SQL.Add('       DATAINTERNACAO = :DATA1,');
    UPD.SQL.Add('       DATAPREVISTAALTA = :DATA2');

    if ((vdValidadeAutorizacao < (X.FieldByName('DATAATENDIMENTO').AsDateTime + vDias)) or X.FieldByName('DATAATENDIMENTO').isNull) then // Coelho SMS: 119820, só atualizar se a validade da autorização for menor do que o atendimento do evento + a qtde de diárias
      UPD.SQL.Add('    ,DATAVALIDADE = :DATA3'); //SMS 98248

    UPD.SQL.Add(' WHERE HANDLE = :HAUTORIZACAO');

    if vAcomodacao > 0 then
      UPD.ParamByName('HACOMODACAO').Value := vAcomodacao
    else
    begin
      UPD.ParamByName('HACOMODACAO').DataType := ftInteger;
      UPD.ParamByName('HACOMODACAO').Value := null;
    end;
    UPD.ParamByName('HAUTORIZACAO').Value := Q.FieldByName('AUTORIZACAO').AsInteger;
    // Eduardo - 05/01/2003 - SMS 22314
    // Setando data de internação e data prevista de alta
    // Adicionada verificação se data atendimento for nula setando data de internação
    // e data prevista de alta como nula também

    if X.FieldByName('DATAATENDIMENTO').isNull then
    begin
      UPD.ParamByName('DATA1').DataType := ftDateTime;
      UPD.ParamByName('DATA2').DataType := ftDateTime;
      UPD.ParamByName('DATA3').DataType := ftDateTime;
      UPD.ParamByName('DATA1').Value := null;
      UPD.ParamByName('DATA2').Value := null;
      UPD.ParamByName('DATA3').Value := null;
    end
    else
    begin
      UPD.ParamByName('DATA1').AsDateTime := X.FieldByName('DATAATENDIMENTO').AsDateTime;
      UPD.ParamByName('DATA2').AsDateTime := X.FieldByName('DATAATENDIMENTO').AsDateTime + vDias;
      if vdValidadeAutorizacao < (X.FieldByName('DATAATENDIMENTO').AsDateTime + vDias) then // Coelho SMS: 119820, só atualizar se a validade da autorização for menor do que o atendimento do evento + a qtde de diárias
        UPD.ParamByName('DATA3').AsDateTime := X.FieldByName('DATAATENDIMENTO').AsDateTime + vDias; //SMS 98248
    end;
    // fim SMS 22314

    UPD.ExecSql;

    if (not X.FieldByName('DATAATENDIMENTO').IsNull) and (vDias > 0) then
    begin
      if vdValidadeEventoSolicitado < (X.FieldByName('DATAATENDIMENTO').AsDateTime + vDias) then // Coelho SMS: 119820
      begin
        UPD.Close;
        UPD.SQL.Clear;
        UPD.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOSOLICIT                 ');
        UPD.SQL.Add('   SET DATAVALIDADE = :DATA                     ');
        UPD.SQL.Add(' WHERE HANDLE = (SELECT EVENTOSOLICITADO        ');
        UPD.SQL.Add('                   FROM SAM_AUTORIZ_EVENTOGERADO');
        UPD.SQL.Add('                  WHERE HANDLE = :HANDLE )      ');
        UPD.ParamByName('DATA').AsDateTime := X.FieldByName('DATAATENDIMENTO').AsDateTime + vDias;
        UPD.ParamByName('HANDLE').AsInteger := pHandleOrigem;
        UPD.ExecSql;
      end;

      if vdValidadeEventoGerado < (X.FieldByName('DATAATENDIMENTO').AsDateTime + vDias) then // Coelho SMS: 119820
      begin
        UPD.Close;
        UPD.SQL.Clear;
        UPD.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO                 ');
        UPD.SQL.Add('   SET DATAVALIDADE = :DATA                     ');
        UPD.SQL.Add(' WHERE HANDLE = :HANDLE                         ');
        UPD.ParamByName('DATA').AsDateTime := X.FieldByName('DATAATENDIMENTO').AsDateTime + vDias;
        UPD.ParamByName('HANDLE').AsInteger := pHandleOrigem;
        UPD.ExecSql;
      end;
    end;
  end;
end;

procedure TDM.GravarNegacoesDaAutorizacao;
var
  i: integer;
  RecNegacaoAnteriores: PNegList;
  vMostrado: boolean;
  j: integer;
begin
  WriteBDebug('SamAuto.DM.GravarNegacoesDaAutorizacao - Início');
  // Fábio - 16/08/2001
  // pela store procedure repete alertas ...
  // checar se não irá gravar alertas repetidos.
  //Application.hint := 'Gravando negações da autorização...';
  if vLstNegacao.Count > 0 then
  begin
    WriteBDebug(Concat('SamAuto.DM.GravarNegacoesDaAutorizacao - Negações: ', IntToStr(vLstNegacao.Count)));
    for i := 0 to vLstNegacao.Count - 1 do
    begin
      vMostrado := False;
      RecNegacao := vLstNegacao.Items[i];
      //SAM_AUTORIZ_EVENTONEGACAO.Close;
      if i > 0 then
      begin
        for j := 0 to i - 1 do
        begin
          RecNegacaoAnteriores := vLstNegacao.Items[j];
          if (RecNegacaoAnteriores^.Negacao = RecNegacao^.Negacao) and
            (RecNegacaoAnteriores^.Complemento = RecNegacao^.Complemento) and
            (RecNegacaoAnteriores^.HandleOrigem = RecNegacao^.HandleOrigem) then
          begin
            vMostrado := True;
            break;
          end;
        end;
      end;

      if (RecNegacao.QtdLiberadaAuxilio = -1) and (vMostrado = False) then
      begin
        samauto_AUTORIZ_EVENTONEGACAO.ParamByName('HANDLE').Value := Sys.NewHandle('SAM_AUTORIZ_EVENTONEGACAO');
        samauto_AUTORIZ_EVENTONEGACAO.ParamByName('EVENTOGERADO').Value := RecNegacao^.HandleOrigem;
        samauto_AUTORIZ_EVENTONEGACAO.ParamByName('DESCRMOTIVO').AsMemo := RecNegacao^.Complemento;
        samauto_AUTORIZ_EVENTONEGACAO.ParamByName('MOTIVONEGACAO').Value := RecNegacao^.SamMotivoNegacao;
        samauto_AUTORIZ_EVENTONEGACAO.ExecSql;
      end;
    end;
  end;
  WriteBDebug('SamAuto.DM.GravarNegacoesDaAutorizacao - Fim');
end;

procedure TDM.GravarNegacoesDoPagamento; //Não está sendo usada.
var
  i: integer;
begin
  if vLstNegacao.Count > 0 then
  begin
    for i := 0 to vLstNegacao.Count - 1 do
    begin
      RecNegacao := vLstNegacao.Items[i];
    end;
  end;
end;

procedure TDM.AlterarSAM_AUTORIZ_EVENTOGERADO(pHandleOrigem,
  pEvento,
  pGrau,
  pCid,
  pUsuario,
  pBeneficiario: integer;
  pDv: string;
  pExecutor,
  pSolicitante,
  pRecebedor,
  pLocalExecucao: integer;
  pData,
  pHora: TDatetime;
  pTipoAutorizacao,
  pFinalidadeAtendimento,
  pCondicaoAtendimento,
  pLocalAtendimento,
  pObjetivoTratamento,
  pRegimeAtendimento,
  pTipoTratamento: integer;
  pAcidentePessoal: string;
  pServico: Char;
  pQuantidade: currency;
  pValorCalculado: currency;
  pCodigoPagto,
  pXTHM, pCBOS: Integer;
  pDataCalculoLimitacao: TDateTime;
  pPermiteAuxilio: string;
  pNegacoesDesconsiderar: string);

var
  pValorPrimeira,
    pValorSegunda,
    pValorDemais: Double;
  vAcomodacao: integer;
begin
  WriteBDebug('SamAuto.DM.AlterarSAM_AUTORIZ_EVENTOGERADO - Início');
  vgStrTipoEvento := EmptyStr;
  if not TemEventosGeradosPagos(pHandleOrigem, 'G') then
  begin
    //Mudar Situação do evento Gerado;
    DMLimite.DecLimiteAutorizacao(pHandleOrigem,
      pQuantidade,
      pValorCalculado,
      pEvento
      );

    // Luciano T. Alberti - SMS 60019 - 09/05/2006 - Início
    // --> Verifica se a negação 4000 está ligada
    qAux.Close;
    qAux.sql.clear;
    qAux.sql.add('SELECT S.SAMMOTIVONEGACAO HANDLE');
    qAux.sql.add('  FROM SIS_MOTIVONEGACAO     N');
    qAux.sql.add('  JOIN SAM_MOTIVONEGACAO_SIS S ON (S.SISMOTIVONEGACAO = N.HANDLE)');
    qAux.sql.add(' WHERE N.CODIGO = 4000');
    qAux.Open;
    // Luciano T. Alberti - SMS 60019 - 09/05/2006 - Fim

    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('DELETE FROM SAM_AUTORIZ_EVENTONEGACAO');
    Q.SQL.Add('      WHERE EVENTOGERADO = :EVENTOGERADO');

    // Luciano T. Alberti  - SMS 54482 - 07/12/2005
    // .......... a negacao que tem o Manter situacao e se ja foi revertido nao será apagado -  SMS - 53111 - Wellington
    // .......... Deve se manter somente as que estão ligadas e que tem o flag manter situação - sms 51389

    Q.SQL.Add('        AND ( NOT EXISTS(SELECT 1');
    Q.SQL.Add('                           FROM SAM_MOTIVONEGACAO_SIS B');
    Q.SQL.Add('                           JOIN SAM_AUTORIZ_EVENTONEGACAO A ON (A.MOTIVONEGACAO = B.SAMMOTIVONEGACAO)');
    Q.SQL.Add('                          WHERE A.HANDLE = SAM_AUTORIZ_EVENTONEGACAO.HANDLE');
    Q.SQL.Add('                            AND B.MANTERSITUACAO = ''S'' ');
    Q.SQL.Add('                            AND A.SITUACAO = ''R'' ) ');
    Q.SQL.Add('           OR NOT EXISTS(SELECT 1');
    Q.SQL.Add('                           FROM SAM_MOTIVONEGACAO_SIS S');
    Q.SQL.Add('                          WHERE S.SAMMOTIVONEGACAO = SAM_AUTORIZ_EVENTONEGACAO.MOTIVONEGACAO)');
    Q.SQL.Add('            )   ');

    (* >>>> Luciano T. Alberti  - SMS 54482 - 07/12/2005
       Substituido pelo código acima

    // a negacao que tem o Manter situacao e se ja foi revertido nao será apagado -  SMS - 53414 - Wellington
    Q.SQL.Add('        AND SAM_AUTORIZ_EVENTONEGACAO.HANDLE NOT IN (SELECT A.HANDLE');
    Q.SQL.Add('                                                       FROM SAM_MOTIVONEGACAO_SIS B');
    Q.SQL.Add('                                                       JOIN SAM_AUTORIZ_EVENTONEGACAO A ON (A.HANDLE = SAM_AUTORIZ_EVENTONEGACAO.HANDLE)');
    Q.SQL.Add('                                                      WHERE B.SAMMOTIVONEGACAO = SAM_AUTORIZ_EVENTONEGACAO.MOTIVONEGACAO ');
    Q.SQL.Add('                                                        AND B.MANTERSITUACAO = ''S''');
    Q.SQL.Add('                                                        AND A.SITUACAO = ''R'')');
    // sms 51389 - Deve se manter somente as que estão ligadas e que tem o flag manter situaçào.
    Q.SQL.Add('        OR SAM_AUTORIZ_EVENTONEGACAO.MOTIVONEGACAO NOT IN ');
    Q.SQL.Add('        (SELECT SAMMOTIVONEGACAO FROM SAM_MOTIVONEGACAO_SIS)');
    <<<<<<<<<<<<<<<<<< *)

    // Luciano T. Alberti - SMS 60019 - 09/05/2006 - Início
    // --> Não remover as negações 4000 (manuais)
    if not (qAux.IsEmpty) then
    begin
      Q.SQL.Add('      AND SAM_AUTORIZ_EVENTONEGACAO.MOTIVONEGACAO <> :MOTIVONEGACAO');
      Q.ParamByName('MOTIVONEGACAO').AsInteger := qAux.FieldByName('HANDLE').AsInteger;
    end;
    // Luciano T. Alberti - SMS 60019 - 09/05/2006 - Fim

    Q.ParamByName('EVENTOGERADO').Value := pHandleOrigem;
    Q.ExecSql;
    Q.Close;

    g_HandleTipoAutorizacao := pTipoAutorizacao;

    //início sms 56253 - Edilson.Castro - 27/02/2006
    //o sistema não estava buscando a acomodação do evento, necessária para os cálculos de preço mais adiante
    Q.SQL.Clear;
    Q.SQL.Add('SELECT ACOMODACAO, TIPOEVENTO'); //inclusão do campo ACOMODACAO: sms 56253 - Edilson.Castro - 27/02/2006
    Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO');
    Q.SQL.Add(' WHERE HANDLE = :EVENTOGERADO');
    Q.ParamByName('EVENTOGERADO').AsInteger := pHandleOrigem;
    Q.Open;
    vgStrTipoEvento := q.FieldByName('TIPOEVENTO').AsString;

    if not Q.FieldByName('ACOMODACAO').IsNull then
      vAcomodacao := Q.FieldByName('ACOMODACAO').AsInteger
    else
      vAcomodacao := -1;
    //fim sms 56253

    pValorCalculado := PegaPreco(
      pEvento, pGrau, pBeneficiario, pRecebedor, pLocalExecucao,
      pQuantidade, pData, pCodigoPagto, pXthm,
      vAcomodacao, //antes: 0; sms 56253 - Edilson.Castro - 27/02/2006 (como pode estar passando 0????)
      pLocalAtendimento, pRegimeAtendimento, pCondicaoAtendimento,
      pObjetivoTratamento, pTipoTratamento, pFinalidadeAtendimento, pCBOS, pHora, false,
      pValorPrimeira, pValorSegunda, pValorDemais);

    Validador(pHandleOrigem,
      pEvento,
      pGrau,
      pCid,
      nulo,
      pUsuario,
      pBeneficiario,
      pDv,
      pExecutor,
      pSolicitante,
      pRecebedor,
      pLocalExecucao,
      pData,
      pHora,
      //Junior - 13/12/200
      pTipoAutorizacao,
      pFinalidadeAtendimento,
      pCondicaoAtendimento,
      pLocalAtendimento,
      pObjetivoTratamento,
      pRegimeAtendimento,
      pTipoTratamento,
      pAcidentePessoal,
      pServico,
      pQuantidade,
      pValorCalculado,
      pCodigoPagto,
      pXTHM,
      pDataCalculoLimitacao,
      pPermiteAuxilio,
      '',
      '', //Rodrigo Andrade SMS 81762
      0 //Rodrigo Andrade SMS 81762
      );
    vgStrTipoEvento := EmptyStr;

    RecalcularPFaoRevalidar(pHandleOrigem,
      pEvento,
      pGrau,
      pBeneficiario,
      pRecebedor,
      pData,
      pQuantidade,
      pCodigoPagto,
      pXTHM,
      pValorPrimeira, pValorSegunda, pValorDemais);

    BuscaLimitacao(pHandleOrigem); //SMS 72989 - Marcelo Barbosa - 22/11/2006

  end
  else // sms 47575 redistribuir as quatidades nos tratamentos seriados
  begin

  end;
  WriteBDebug('SamAuto.DM.AlterarSAM_AUTORIZ_EVENTOGERADO - Fim');
end;

function TDM.GravarEventoGerado(pEventoGerado,
  pGrauGerado,
  pCid,
  pBeneficiario,
  pSolicitante,
  pExecutor,
  pRecebedor,
  pLocalExecucao: integer;
  pDataSolicitacao: TDateTime;
  pCodPagto: Integer;
  pTipoAutorizacao: Integer;
  pNaoAceitaPfInfAut,
  pTipoEvento: string;
  pQuantidade: real;
  pLocalAtendimento,
  pCodigoTabela: Integer): integer;
var
  vHandleSAM_AUTORIZ_EVENTOGERADO: integer;
  vSituacao: string;
  vAux: Double;
  vAcomodacao: Integer;
  vValorEventoAutorizando: currency;
  vdDataAtendimento: TDateTime;
  vValorPrimeira,
    vValorSegunda,
    vValorDemais: double;
  v_DataAdesaoModuloBeneficiario: TDateTime;
  v_ModuloQueDeuCobertura, v_PlanoQueDeuCobertura: Integer;
  v_ValorAutorizado: double;
  vDataAux: TDateTime;
  vEspecifico: OleVariant;
  vsSenha: string;
begin
  WriteBDebug('SamAuto.DM.GravarEventoGerado - Início');
  vAux := 0;
  vDataSolicitacao := pdataSolicitacao;
  vEspecifico := AbrirDll(Sys, 'ESPECIFICO.UESPECIFICO');

  //Application.hint := 'Gravando evento gerado...';
  vHandleSAM_AUTORIZ_EVENTOGERADO := Sys.NewHandle('SAM_AUTORIZ_EVENTOGERADO');

  if (pCodPagto = 0) then
    pCodPagto := nulo;

  // podem estar sendo solicitados manualmente eventos/grau que são diária
  // devem ser gerados como diária ou prorrogação caso existam diária já casdastradas para a autorização.
  if SolicitandoDiaria(pEventoGerado, pGraugerado, vAcomodacao) then
  begin
    if pTipoEvento = 'N' then
      pTipoEvento := 'D';
    if pTipoEvento = 'D' then
    begin
    end;
    if not ((pTipoEvento = 'D') or (pTipoEvento = 'P')) then
      vAcomodacao := nulo
    else
    begin
      Q.Close;
      Q.SQL.Clear;
      if SAM_PARAMETROSGERAIS.FieldByName('TIPOACOMODACAO').AsString = 'G' then
      begin
        Q.SQL.Add('SELECT ACOMODACAO FROM SAM_ACOMODACAO_GRAU WHERE GRAU = :GRAU');
        Q.ParamByName('GRAU').Value := pGrauGerado;
      end
      else
      begin
        Q.SQL.Add('SELECT ACOMODACAO FROM SAM_ACOMODACAO_EVENTO WHERE EVENTO = :EVENTO');
        Q.ParamByName('EVENTO').Value := pEventoGerado;
      end;
      Q.Open;
      vAcomodacao := Q.FieldByName('ACOMODACAO').AsInteger; // se for geração depois dá um update pois possui o handle da SAM_ACOMODACAO_GRAU/SAM_ACOMODACAO_EVENTO
    end;
  end;
  vdDataAtendimento := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAATENDIMENTO').AsDateTime;
  INSEVENTOGERADO.Close;
  INSEVENTOGERADO.ParamByName('HANDLE').Value := vHandleSAM_AUTORIZ_EVENTOGERADO;
  INSEVENTOGERADO.ParamByName('AUTORIZACAO').Value := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger;
  INSEVENTOGERADO.ParamByName('EVENTOSOLICITADO').Value := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('HANDLE').AsInteger;
  vgHandleOrigem := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('HANDLE').AsInteger;
  if pEventoGerado > 0 then
    INSEVENTOGERADO.ParamByName('EVENTOGERADO').Value := pEventoGerado
  else
    INSEVENTOGERADO.ParamByName('EVENTOGERADO').Clear;

  if pGrauGerado > 0 then
    INSEVENTOGERADO.ParamByName('GRAUGERADO').Value := pGrauGerado
  else
    INSEVENTOGERADO.ParamByName('GRAUGERADO').Clear;
  //juliana alterado em 25/04/2002 para gravar a senha de intercambio do evento solicitado no evento gerado.(Incluído no update da query.)
  INSEVENTOGERADO.ParamByName('SENHAINTER').Value := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('SENHAINTERCAMBIO').AsInteger;
  INSEVENTOGERADO.ParamByName('DATAAUTORIZACAO').Value := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATASOLICITACAO').AsDateTime; //sys.ServerDate();
  INSEVENTOGERADO.ParamByName('DATAVALIDADE').Value := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAVALIDADE').AsDateTime; //sys.ServerDate();
  INSEVENTOGERADO.ParamByName('DATAHORAGERACAO').Value := Sys.ServerNow;
  INSEVENTOGERADO.ParamByName('USUARIOGERACAO').Value := Sys.currentuser;
  INSEVENTOGERADO.ParamByName('QTDPAGA').Value := 0;
  // juliana alterado em 06/05/2003 - para quantidade cancelada não gravar null
  INSEVENTOGERADO.ParamByName('QTDCANCELADA').Value := 0;
  INSEVENTOGERADO.ParamByName('NECESSITAPOS').Value := FindTGEPos(pEventoGerado);
  INSEVENTOGERADO.ParamByName('USUARIOLIBERACAO').Clear;
  INSEVENTOGERADO.ParamByName('TIPOEVENTO').Value := pTipoEvento;


  if (pTipoEvento = 'P') then //Coelho SMS: 79716 se for prorrogação o evento deve ser incluído com a quantidade de dias da prorrogação
  begin
    if not samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAPREVISTAALTA').IsNull then
      vDataAux := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAPREVISTAALTA').AsDateTime
    else
      vDataAux := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAATENDIMENTO').AsDateTime;
  end
  else
    vDataAux := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAATENDIMENTO').AsDateTime;

  INSEVENTOGERADO.ParamByName('DATAATENDIMENTO').Value := vDataAux;

  if pTipoEvento = 'P' then
    vDataAux := vDataAux + pQuantidade;


  INSEVENTOGERADO.ParamByName('HORAATENDIMENTO').Value := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('HORAATENDIMENTO').Value;
  INSEVENTOGERADO.ParamByName('SITUACAO').Value := 'N';
  if vAcomodacao = nulo then
    INSEVENTOGERADO.ParamByName('ACOMODACAO').Clear
  else
    INSEVENTOGERADO.ParamByName('ACOMODACAO').Value := vAcomodacao;

  if (pSolicitante = nulo) or (vgCodigoSolicitanteInvalido) or (pSolicitante <= 0) then
    INSEVENTOGERADO.ParamByName('SOLICITANTE').Clear
  else
    INSEVENTOGERADO.ParamByName('SOLICITANTE').Value := pSolicitante;

  pExecutor := vEspecifico.ATE_ExecutorDaDiaria(Sys, pTipoEvento, pExecutor, pLocalExecucao); // Paulo Melo - SMS 119805

  if (pExecutor = nulo) or (vgCodigoExecutorInvalido) or (pExecutor <= 0) then
    INSEVENTOGERADO.ParamByName('EXECUTOR').Clear
  else
    INSEVENTOGERADO.ParamByName('EXECUTOR').Value := pExecutor;

  if pQuantidade = nulo then
    INSEVENTOGERADO.ParamByName('QTDAUTORIZADA').Value := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('QTDSOLICITADA').AsFloat
  else
    INSEVENTOGERADO.ParamByName('QTDAUTORIZADA').Value := pQuantidade;

  if samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('XTHM').IsNull then
    INSEVENTOGERADO.ParamByName('XTHMINFORMADO').Clear
  else
    INSEVENTOGERADO.ParamByName('XTHMINFORMADO').Value := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('XTHM').AsInteger;

  if samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('CODIGOPAGTO').IsNull then
  begin
    INSEVENTOGERADO.ParamByName('TABCODPAGTO').Value := 1;
    if pCodPagto = nulo then
      INSEVENTOGERADO.ParamByName('CODIGOPAGAMENTOINFORMADO').Clear
    else
      INSEVENTOGERADO.ParamByName('CODIGOPAGAMENTOINFORMADO').Value := pCodPagto;
  end
  else
  begin
    INSEVENTOGERADO.ParamByName('TABCODPAGTO').Value := 2;
    INSEVENTOGERADO.ParamByName('CODIGOPAGAMENTOINFORMADO').Value := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('CODIGOPAGTO').AsInteger;
  end;

  if pNaoAceitaPfInfAut = 'N' then
  begin
    if samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('PF').IsNull then
      INSEVENTOGERADO.ParamByName('PFINFORMADO').Clear
    else
      INSEVENTOGERADO.ParamByName('PFINFORMADO').Value := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('PF').AsInteger;

    if samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('PARCELAMENTO').IsNull then
      INSEVENTOGERADO.ParamByName('PARCELAMENTOINFORMADO').Clear
    else
      INSEVENTOGERADO.ParamByName('PARCELAMENTOINFORMADO').Value := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('PARCELAMENTO').AsString;
  end
  else
  begin
    INSEVENTOGERADO.ParamByName('TABCODPAGTO').Value := 1;
    INSEVENTOGERADO.ParamByName('XTHMINFORMADO').Clear;
    INSEVENTOGERADO.ParamByName('CODIGOPAGAMENTOINFORMADO').Clear;
    INSEVENTOGERADO.ParamByName('PFINFORMADO').Clear;
    INSEVENTOGERADO.ParamByName('PARCELAMENTOINFORMADO').Clear;
  end;

  if not INSEVENTOGERADO.ParamByName('XTHMINFORMADO').IsNull then
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT P.CODIGOXTHM, G.XTHM SUPORTAXTHM, X.XTHM');
    Q.SQL.Add('  FROM SAM_PARAMETROSPROCCONTAS P, SAM_GRAU G, SAM_XTHM X');
    Q.SQL.Add(' WHERE X.HANDLE = P.CODIGOXTHM AND G.HANDLE = :HGRAU');
    Q.ParamByName('HGRAU').Value := INSEVENTOGERADO.ParamByName('GRAUGERADO').AsInteger;
    Q.Open;
    if Q.FieldByName('SUPORTAXTHM').AsString = 'N' then
    begin
      if Q.FieldByName('CODIGOXTHM').AsInteger <> INSEVENTOGERADO.ParamByName('XTHMINFORMADO').AsInteger then
        INSEVENTOGERADO.ParamByName('XTHMINFORMADO').Clear;
    end;
  end;


  //Gabriel SMS: 115727 Inicio
  if pCodigoTabela > 0 then
    INSEVENTOGERADO.ParamByName('CODIGOTABELA').AsInteger := pCodigoTabela
  else
  begin
    INSEVENTOGERADO.ParamByName('CODIGOTABELA').DataType := ftInteger;
    INSEVENTOGERADO.ParamByName('CODIGOTABELA').Clear;

    if not samauto_Autoriz_EVENTOSOLICIT.FieldByName('CODIGOTABELA').IsNull then
    begin
      q.Close;
      q.SQL.Clear;
      if Pos('SQL', string(SYS.SQLServer)) > 0 then
        q.SQL.Add('SELECT TOP 1 HANDLE FROM SAM_TGE_TABELATISS WHERE EVENTO = :EVENTO AND TABELATISS = :TABELATISS ')
      else
        q.SQL.Add('SELECT HANDLE FROM SAM_TGE_TABELATISS WHERE EVENTO = :EVENTO AND TABELATISS = :TABELATISS AND ROWNUM <= 1 ');
      Q.ParamByName('EVENTO').AsInteger := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('EVENTO').AsInteger;
      Q.ParamByName('TABELATISS').AsInteger := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('CODIGOTABELA').AsInteger;
      Q.Open;

      if Q.FieldByName('HANDLE').AsInteger > 0 then
        INSEVENTOGERADO.ParamByName('CODIGOTABELA').AsInteger := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('CODIGOTABELA').AsInteger;
    end;
  end;

  INSEVENTOGERADO.ParamByName('VALORAUTORIZADO').Value := 0;
  INSEVENTOGERADO.ParamByName('LOCALATENDIMENTO').AsInteger := pLocalAtendimento;
  INSEVENTOGERADO.ParamByName('SITUACAOINICIAL').asString := 'H';
  if (samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('CBOS').IsNull) then
  begin
    INSEVENTOGERADO.ParamByName('CBOS').DataType := ftInteger;
    INSEVENTOGERADO.ParamByName('CBOS').Clear;
  end
  else
    INSEVENTOGERADO.ParamByName('CBOS').AsInteger := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('CBOS').AsInteger;
  INSEVENTOGERADO.ExecSql;

   //verificar se o grau principal É série terap. e se o evento exige perícia
  X.Close;
  X.SQL.Clear;
  X.SQL.Add('SELECT T.EXAMEPREOPERATORIO, T.GRAUPRINCIPAL');
  X.SQL.Add('  FROM SAM_TGE T');
  X.SQL.Add(' WHERE T.HANDLE = :EVENTOGERADO');
  X.ParamByName('EVENTOGERADO').Value := pEventoGerado;
  X.Open;

  if (X.FieldByName('EXAMEPREOPERATORIO').AsString = 'S') or
    (samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('GERARPERICIAMANUAL').AsString = 'S') then
  begin
    GerarPericia(vHandleSAM_AUTORIZ_EVENTOGERADO,
      samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger,
      pBeneficiario,
      pRecebedor);
  end;

  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT A.BENEFICIARIO,');
  Q.SQL.Add('       A.LOCALATENDIMENTO, A.REGIMEATENDIMENTO,');
  Q.SQL.Add('       A.CONDICAOATENDIMENTO, A.OBJETIVOTRATAMENTO,');
  Q.SQL.Add('       A.TIPOTRATAMENTO, FINALIDADEATENDIMENTO, TIPOAUTORIZACAO');
  Q.SQL.Add('  FROM SAM_AUTORIZ A');
  Q.SQL.Add('WHERE  A.HANDLE = :HANDLE');
  Q.ParamByName('HANDLE').Value := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger;
  Q.Open;
  g_HandleTipoAutorizacao := pTipoAutorizacao;
  v_ValorAutorizado := PegaPreco(
    INSEVENTOGERADO.ParamByName('EVENTOGERADO').AsInteger,
    INSEVENTOGERADO.ParamByName('GRAUGERADO').AsInteger,
    pBeneficiario,
    pRecebedor,
    pLocalExecucao,
    INSEVENTOGERADO.ParamByName('QTDAUTORIZADA').AsInteger,
    INSEVENTOGERADO.ParamByName('DATAATENDIMENTO').AsInteger,
    INSEVENTOGERADO.ParamByName('CODIGOPAGAMENTOINFORMADO').value,
    INSEVENTOGERADO.ParamByName('XTHMINFORMADO').value,
    0,
    q.FieldByName('LOCALATENDIMENTO').AsInteger,
    q.FieldByName('REGIMEATENDIMENTO').AsInteger,
    q.FieldByName('CONDICAOATENDIMENTO').AsInteger,
    q.FieldByName('OBJETIVOTRATAMENTO').AsInteger,
    q.FieldByName('TIPOTRATAMENTO').AsInteger,
    q.FieldByName('FINALIDADEATENDIMENTO').AsInteger,
    iif(samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('CBOS').IsNull, 0,samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('CBOS').AsInteger) ,
    iif(samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('HORAATENDIMENTO').isNull,samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('HORAATENDIMENTO').AsDateTime,now),
    False,
    vValorPrimeira,
    vValorSegunda,
    vValorDemais);

  GerarTratamentoSeriado(vHandleSAM_AUTORIZ_EVENTOGERADO, samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger);

  try
    StartTransactionEx(Sys.CurrentSystem, 'SamAuto_UDM_GravarEventoGerado', vsSenha);

    vSituacao := SetSituacaoDoEvento(vHandleSAM_AUTORIZ_EVENTOGERADO,
      pBeneficiario,
      pSolicitante,
      pExecutor,
      pRecebedor,
      pLocalExecucao,
      pEventoGerado,
      pGrauGerado,
      pCid,
      iif(pTipoEvento = 'P', vDataAux, INSEVENTOGERADO.ParamByName('DATAATENDIMENTO').AsDateTime),
      INSEVENTOGERADO.ParamByName('QTDAUTORIZADA').AsCurrency,
      v_ValorAutorizado,
      samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAATENDIMENTO').AsDateTime,
      pTipoAutorizacao,
      '', 0 //Rodrigo Andrade SMS 81762
      );

    CommitEx(Sys.CurrentSystem, vsSenha);
  except
    if (vSituacao = null) then
      RollbackEx(Sys.CurrentSystem, vsSenha);

    raise;
    Application.HandleException(self);
  end;

  RecalcularPFaoRevalidar(
    vHandleSAM_AUTORIZ_EVENTOGERADO,
    INSEVENTOGERADO.ParamByName('EVENTOGERADO').AsInteger,
    INSEVENTOGERADO.ParamByName('GRAUGERADO').AsInteger,
    pBeneficiario,
    pRecebedor,
    INSEVENTOGERADO.ParamByName('DATAATENDIMENTO').AsInteger,
    pQuantidade,
    INSEVENTOGERADO.ParamByName('CODIGOPAGAMENTOINFORMADO').AsInteger, //codigo pagto
    INSEVENTOGERADO.ParamByName('XTHMINFORMADO').asInteger, //pXTHM,
    vValorPrimeira, vValorSegunda, vValorDemais);

  vSituacao := vgResultado;
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO');
  Q.SQL.Add('SET    SITUACAO = :SITUACAO,');
  Q.SQL.Add('       SENHA    = :SENHA');

  Q.SQL.Add('WHERE  HANDLE   = :HANDLE');
  Q.ParamByName('SENHA').DataType := ftInteger;

  Q.ParamByName('SITUACAO').DataType := ftString;
  Q.ParamByName('HANDLE').DataType := ftInteger;
  Q.ParamByName('HANDLE').Value := vHandleSAM_AUTORIZ_EVENTOGERADO;
  Q.ParamByName('SITUACAO').Value := vSituacao;

  if vSituacao = 'N' then
  begin
    Q.ParamByName('SENHA').Clear;
  end
  else
  begin
    Q.ParamByName('SENHA').Value := StrToInt(IntToStr(vHandleSAM_AUTORIZ_EVENTOGERADO) + Mod11(IntToStr(vHandleSAM_AUTORIZ_EVENTOGERADO)));
  end;
  q.ExecSql;

  VerificaFranquia(vhandleSAM_AUTORIZ_EVENTOGERADO, vSituacao);

  //Se o evento estiver autorizado e for uma Autorizacao - então incrementar limites
  if (vSituacao = 'A') and (vgOrigemDoProcesso = 'A') then
  begin

      //----------------------- Busca datas de adesão Contrato,Familia e Beneficicario ------
    qBuscaDados.Close;
    qBuscaDados.ParamByName('HANDLE').Value := vgBeneficiario;
    qBuscaDados.Open;
      //------------------- Acha Modulo que deu Cobertura -------------------------------------
    if vgControle < 0 then
    begin
      sp_AcharModuloCobertura.ParamByName('p_Evento').Value := pEventoGerado;
      sp_AcharModuloCobertura.ParamByName('p_Grau').Value := pGrauGerado;
      sp_AcharModuloCobertura.ParamByName('p_Data').Value := INSEVENTOGERADO.ParamByName('DATAATENDIMENTO').AsDateTime;
      sp_AcharModuloCobertura.ParamByName('p_Beneficiario').Value := vgBeneficiario;
      sp_AcharModuloCobertura.ParamByName('p_BeneficiarioDataAdesao').Value := qBuscaDados.FieldByName('BDATAADESAO').AsDateTime;
      sp_AcharModuloCobertura.ParamByName('p_FinalidadeAtendimento').Value := vgFinalidadeAtendimento;
      sp_AcharModuloCobertura.ParamByName('p_CondicaoAtendimento').Value := vgCondicaoAtendimento;
      sp_AcharModuloCobertura.ParamByName('p_LocalAtendimento').Value := vgLocalAtendimento;
      sp_AcharModuloCobertura.ParamByName('p_ObjetivoTratamento').Value := vgObjetivoTratamento;
      sp_AcharModuloCobertura.ParamByName('p_RegimeAtendimento').Value := vgRegimeAtendimento;
      sp_AcharModuloCobertura.ParamByName('p_TipoTratamento').Value := vgTipoTratamento;
      sp_AcharModuloCobertura.ParamByName('p_Tipomodulo').Value := '';
      sp_AcharModuloCobertura.ExecProc;
      
      v_DataAdesaoModuloBeneficiario := sp_AcharModuloCobertura.ParamByName('p_DataAdesaoModuloBeneficiario').AsDateTime;
      v_ModuloQueDeuCobertura := sp_AcharModuloCobertura.ParamByName('p_ModuloQueDeuCobertura').AsInteger;
      v_PlanoQueDeuCobertura := sp_AcharModuloCobertura.ParamByName('p_PlanoQueDeuCobertura').AsInteger;
    end
    else
    begin
      v_DataAdesaoModuloBeneficiario := sp_ValidadorNew.ParamByName('p_Atributo_2').AsDateTime;
      v_ModuloQueDeuCobertura := sp_ValidadorNew.ParamByName('p_Atributo_1').AsInteger;
      v_PlanoQueDeuCobertura := sp_ValidadorNew.ParamByName('p_Atributo_3').AsInteger;
    end;

    sp_IncLimite.ParamByName('p_Beneficiario').Value := Iif(vgBeneficiario > 0, vgBeneficiario, pBeneficiario);
    sp_IncLimite.ParamByName('p_Familia').Value := qBuscaDados.FieldByName('FHANDLE').AsInteger;
    sp_IncLimite.ParamByName('p_Contrato').Value := qBuscaDados.FieldByName('CHANDLE').AsInteger;
    sp_IncLimite.ParamByName('p_DataAdesaoBeneficiario').AsDateTime := qBuscaDados.FieldByName('BDATAADESAO').AsDateTime;
    sp_IncLimite.ParamByName('p_DataAdesaoFamilia').AsDateTime := qBuscaDados.FieldByName('FDATAADESAO').AsDateTime;
    sp_IncLimite.ParamByName('p_DataAdesaoContrato').AsDateTime := qBuscaDados.FieldByName('CDATAADESAO').AsDateTime;
    sp_IncLimite.ParamByName('p_Data').Value := INSEVENTOGERADO.ParamByName('DATAATENDIMENTO').AsDateTime;
    sp_IncLimite.ParamByName('p_HandleOrigem').Value := vHandleSAM_AUTORIZ_EVENTOGERADO;
    sp_IncLimite.ParamByName('p_DataAdesaoModuloBeneficiario').Value := v_DataAdesaoModuloBeneficiario;
    sp_IncLimite.ParamByName('p_ModuloQueDeuCobertura').Value := v_ModuloQueDeuCobertura;
    sp_IncLimite.ParamByName('p_PlanoQueDeuCobertura').Value := v_PlanoQueDeuCobertura;
    sp_IncLimite.ParamByName('p_Recebedor').Value := vgRecebedor;
    sp_IncLimite.ParamByName('p_Chave').Value := vgRecordHandle;
    sp_IncLimite.ParamByName('p_OrigemDoProcesso').Value := vgOrigemDoProcesso;
    sp_IncLimite.ParamByName('p_Servico').AsString := vgServico;
    sp_IncLimite.ExecProc;

      // Bruno SMS : 47685 -> Incrementa a contagem de PF
      // Se o evento já foi autorizado ou liberado, já executa a sua contagem
    EfetuaContagemEventoRevertido(vhandleSAM_AUTORIZ_EVENTOGERADO);

    GerarAuditoria(
      vHandleSAM_AUTORIZ_EVENTOGERADO,
      samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger,
      0,
      samauto_BENEFICIARIO.FieldByName('BHANDLE').AsInteger,
      samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('RECEBEDOR').AsInteger);

    vValorEventoAutorizando := INSEVENTOGERADO.ParamByName('VALORUNITARIOCALCULADO').asCurrency;

    if GerarPericiaPorValor(INSEVENTOGERADO.ParamByName('AUTORIZACAO').AsInteger,
      samauto_BENEFICIARIO.FieldByName('CONTRATO').AsInteger,
      vHandleSAM_AUTORIZ_EVENTOGERADO,
      samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAATENDIMENTO').AsDateTime,
      vValorEventoAutorizando) then
    begin
      // se a autorização ultrapassou o valor não permite reverter e gera perícia.
      // se autorizar direto, precisa gerar negação da perícia para depois ter o que não reverter.
      MontaNegacao(vHandleSAM_AUTORIZ_EVENTOGERADO,
        SAM_ERRO_EVENTOPREOPERATORIO,
        'A autorização ultrapassou o valor máximo permitido no contrato - o autorização somente será liberada com realização da perícia"',
        -1);
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO SET SITUACAO = ''N'' WHERE HANDLE = :HANDLE');
      Q.ParamByName('HANDLE').Value := vHandleSAM_AUTORIZ_EVENTOGERADO;
      Q.ExecSql;
    end;
    GravarEventoPrincipal(
      samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('HANDLE').AsInteger,
      samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAATENDIMENTO').AsDateTime);
  end;

  //  AtualizarPOS_AUTORIZACAO('I', vHandleSAM_AUTORIZ_EVENTOGERADO);
  if (vSituacao = 'A') then
    atualizaSequenciaMatMed(vHandleSAM_AUTORIZ_EVENTOGERADO);

  //Código comentado porque o controle sobre o campo Sequencia não estava sendo
  //feito conforme solicitado anteriormente pela Cabesp. A partir de agora, o campo
  //será gerado quando o mat/med é inserido, não sendo alterado na (re)validação.
  //if (vSituacao = 'A') then //SMS 68864 - Débora Rebello - 28/02/2007
  //  atualizaSequenciaMatMed(vHandleSAM_AUTORIZ_EVENTOGERADO); //SMS 68864 - Débora Rebello - 28/02/2007
  Result := vHandleSAM_AUTORIZ_EVENTOGERADO;
  WriteBDebug('SamAuto.DM.GravarEventoGerado - Fim');
end;

procedure TDM.VerificaFranquia(pEventoGerado: Integer; pSituacao: string);
var
  vPFFranquia: Double;
begin
  if (pSituacao = 'L') or (pSituacao = 'A') then
  begin
    //verificar a franquia deste evento //larini
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT C.PERMITEFATURARPFAUTORIZACAO,G.DATAATENDIMENTO,G.VALORCALCPF');
    Q.SQL.Add('  FROM SAM_AUTORIZ A, SAM_BENEFICIARIO B, SAM_CONTRATO C, SAM_AUTORIZ_EVENTOGERADO G WHERE C.HANDLE = B.CONTRATO AND B.HANDLE = A.BENEFICIARIO AND G.HANDLE = :GERADO AND A.HANDLE=G.AUTORIZACAO');
    Q.ParamByName('GERADO').Value := pEventoGerado;
    Q.Open;
    if Q.FieldByName('PERMITEFATURARPFAUTORIZACAO').AsString = 'S' then
    begin
      vPFFranquia := FranquiaDLL.PFFranquiaAutoriz(Sys.CurrentSystem,
        pEventoGerado, //eventogerado
        Q.FieldByName('DATAATENDIMENTO').AsDateTime);
      if vPFFranquia >= 0 then
        if (Q.FieldByName('VALORCALCPF').isnull) or (vPFFranquia <> Arredonda(Q.FieldByName('VALORCALCPF').AsFloat, 2)) then
        begin
          x.SQL.Clear;
          x.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO SET VALORCALCPF=:VALORCALCPF, FRANQUIA=''S'' WHERE HANDLE=:HANDLE');
          x.ParamByName('VALORCALCPF').AsFloat := vPFFranquia;
          x.ParamByName('HANDLE').AsInteger := pEventoGerado;
          x.ExecSql;
        end;
    end;
    q.Close;
  end
  else
  begin
    qEventoGerado.Close;
    qEventoGerado.ParamByName('HANDLE').AsInteger := pEventoGerado;
    qEventoGerado.Open;
    if qEventoGerado.FieldByName('FRANQUIA').AsString = 'S' then
    begin
      FranquiaDLL.RevertePFFranquiaAutoriz(Sys.CurrentSystem, pEventoGerado);
      x.SQL.Clear;
      x.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO SET VALORCALCPF=NULL, FRANQUIA=''N'' WHERE HANDLE=:HANDLE');
      x.ParamByName('HANDLE').AsInteger := pEventoGerado;
      x.ExecSql;
    end;
    qEventoGerado.Close;
  end;
end;

procedure TDM.GerarTratamentoSeriado(pHEvento, pHAutorizacao: integer); //pRealizarAteDataMenor: TDateTime);
var
  vdRealizarAteDataMenor: TDateTime; //SMS - Marcelo Barbosa - 28/05/2007
  vI_QtdLiberadaTratSeriado: Integer;
  vdRealizar: string;
  //Coelho SMS: 84581
  vSMsgDataCancel: string;
  vDataCalc: Variant;
  vHandleEV: Integer;
  vHObsAut: Integer;
  vd_DataValidadeTS: TDateTime; //SMS 89376 - Marcelo Barbosa - 07/11/2007
  vsSenha: string;
begin
  WriteBDebug(Concat('SamAuto.DM.GerarTratamentoSeriado - pHEvento [', IntToStr(pHEvento), '] pHAutorizacao [', IntToStr(pHAutorizacao), ']'));
  //Será feito tudo via procedure e as verificaçoes em um só lugar
  //é chamado em GerarEventos, GravarEventoGerado, Validador e ValidarTodos
  qAux.Close;
  qAux.SQL.Clear;
  qAux.SQL.add('SELECT T.TRATAMENTOSERIADO ');
  qAux.SQL.add('   FROM SAM_TGE T          ');
  qAux.SQL.add(' JOIN SAM_AUTORIZ_EVENTOGERADO G ON (T.HANDLE = G.EVENTOGERADO) ');
  if (pHEvento > 0) then //Caso venha de revalidação - já tem evento gerado
  begin
    qAux.SQL.add(' WHERE G.HANDLE = :HANDLE  ');
    qAux.ParamByName('HANDLE').AsInteger := pHEvento;
  end
  else //Vem da validação, acabou de gerar os eventos gerados
  begin
    //    qAux.SQL.add(' JOIN SAM_AUTORIZ_EVENTOGERADO G ON (T.HANDLE = G.EVENTOGERADO) ');
    qAux.SQL.add(' WHERE G.AUTORIZACAO = :HANDLE     ');
    qAux.SQL.add('   AND T.TRATAMENTOSERIADO = ''S'' ');
    qAux.ParamByName('HANDLE').AsInteger := pHAutorizacao;
  end;
  qAux.Open;

  if qAux.FieldByName('TRATAMENTOSERIADO').asString = 'S' then
  begin
    WriteBDebug('SamAuto.DM.GerarTratamentoSeriado - Tratamento Seriado "Sim"');
    try
      StartTransactionEx(Sys.CurrentSystem, 'SamAuto_UDM_GerarTratamentoSeriado', vsSenha);

      if (pHEvento > 0) then //Caso venha de revalidação - já tem evento gerado
      begin
        //Verificará até que data pode realizar as seções e gerará as mesmas
        q.Close;
        q.SQL.Clear;
        q.SQL.Add('SELECT DATAATENDIMENTO, EVENTOGERADO, GRAUGERADO ');
        q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO ');
        q.sql.Add(' WHERE HANDLE = :HANDLE ');
        q.ParamByName('HANDLE').AsInteger := pHEvento;
        q.Open;

        spBSAut_DataAteTratamentoSeriado.Close;
        spBSAut_DataAteTratamentoSeriado.ParamByName('P_EVENTOGERADO').Value := q.fieldbyName('EVENTOGERADO').AsInteger;
        spBSAut_DataAteTratamentoSeriado.ParamByName('P_GRAUGERADO').Value := q.fieldbyName('GRAUGERADO').AsInteger;
        spBSAut_DataAteTratamentoSeriado.ParamByName('P_AUTORIZACAO').Value := pHAutorizacao;
        spBSAut_DataAteTratamentoSeriado.ParamByName('P_DATA').Value := q.fieldbyName('DATAATENDIMENTO').AsDateTime;
        spBSAut_DataAteTratamentoSeriado.ExecProc;

        vdRealizarAteDataMenor := spBSAut_DataAteTratamentoSeriado.parambyName('P_ATEDATAMENOR').AsDateTime;
        vdRealizar := spBSAut_DataAteTratamentoSeriado.parambyName('P_REALIZAR').AsString;

        X.Close;
        X.SQL.Clear;
        X.SQL.Add('SELECT 1 ');
        X.SQL.Add('  FROM SAM_TGE ');
        X.SQL.Add(' WHERE HANDLE = :HANDLE ');
        X.SQL.Add('   AND GRAUPRINCIPAL = :GRAU');
        X.ParamByName('HANDLE').Value := q.fieldbyName('EVENTOGERADO').AsInteger;
        X.ParamByName('GRAU').Value := q.fieldbyName('GRAUGERADO').AsInteger;
        X.Open;

        if (vdRealizar = 'V') and (not X.IsEmpty) then
        begin
          sp_GerarTratamentoSeriado.close;
          sp_GerarTratamentoSeriado.ParamByName('P_HEVENTOGERADO').AsInteger := pHEvento;
          sp_GerarTratamentoSeriado.ParamByName('P_REALIZARATEDATAMENOR').AsDateTime := vdRealizarAteDataMenor;
          sp_GerarTratamentoSeriado.ExecProc;

          vd_DataValidadeTS := sp_GerarTratamentoSeriado.ParamByName('P_DATAVALIDADE').AsDateTime;

          X.Close;
          X.SQL.Clear;
          X.SQL.Add('SELECT EVENTOSOLICITADO');
          X.SQL.Add('FROM SAM_AUTORIZ_EVENTOGERADO');
          X.SQL.Add('WHERE HANDLE = :HANDLE');
          X.ParamByName('HANDLE').AsInteger := pHEvento;
          X.Open;

          qA.Close;
          qA.SQL.Clear;
          qA.SQL.Add('SELECT PERIODOCONTROLSERIE');
          qA.SQL.Add('FROM SAM_AUTORIZ_EVENTOSOLICIT');
          qA.SQL.Add('WHERE HANDLE = :HANDLE');
          qA.ParamByName('HANDLE').AsInteger := X.FieldByName('EVENTOSOLICITADO').AsInteger;
          qA.Open;

          if qA.FieldByName('PERIODOCONTROLSERIE').AsString = 'S' then
            vd_DataValidadeTS := getSabado(Sys, (vd_DataValidadeTS));

          Q.Close;
          Q.SQL.Clear;
          Q.SQL.Add('SELECT SUM(QTDLIBERADA) QTD');
          Q.SQL.Add(' FROM SAM_AUTORIZ_EVENTOGERADOSERIE');
          Q.SQL.Add('WHERE EVENTOGERADO = :HEVENTOGERADO');
          Q.ParamByName('HEVENTOGERADO').Value := pHEvento;
          Q.Open;
          vI_QtdLiberadaTratSeriado := q.FieldByName('QTD').AsInteger;

          if (vI_QtdLiberadaTratSeriado > 0) then
          begin
            Q.Close;
            Q.SQL.Clear;
            Q.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO');
            Q.SQL.Add('   SET SENHA = SENHA           ');

            if vI_QtdLiberadaTratSeriado > 0 then
            begin
              Q.SQL.Add(' ,QTDAUTORIZADA = :QTDAUTORIZADA');
              Q.ParamByName('QTDAUTORIZADA').AsInteger := vI_QtdLiberadaTratSeriado;
            end;

            if vd_DataValidadeTS <> null then
            begin
              Q.SQL.Add(' ,DATAVALIDADE = :DATAVALIDADE');
              Q.ParamByName('DATAVALIDADE').AsDateTime := vd_DataValidadeTS;
            end;
            Q.SQL.Add('WHERE HANDLE = :HEVENTOGERADO');
            Q.ParamByName('HEVENTOGERADO').AsInteger := pHEvento;
            Q.ExecSql;

            Q.Close;
            Q.SQL.Clear;
            Q.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOSOLICIT  ');
            Q.SQL.Add('   SET DATAVALIDADE=:DATAVALIDADE ');
            Q.SQL.Add(' WHERE HANDLE=:HANDLE             ');
            Q.ParamByName('DATAVALIDADE').AsDateTime := vd_DataValidadeTS;
            Q.ParamByName('HANDLE').AsInteger := X.FieldByName('EVENTOSOLICITADO').AsInteger;
            Q.ExecSql;

          end;
          if Sys.VisibleMode then
          begin
            CommitEx(Sys.CurrentSystem, vsSenha);
            ShowMessage('Sessões do tratamento seriado foram recalculadas.');
            StartTransactionEx(Sys.CurrentSystem, 'SamAuto_UDM_GerarTratamentoSeriado', vsSenha);
          end;
        end
        else
        begin
          Q.Close;
          Q.SQL.Clear;
          Q.SQL.Add('DELETE FROM SAM_AUTORIZ_EVENTOGERADOSERIE');
          Q.SQL.Add(' WHERE EVENTOGERADO = :HEVENTOGERADO');
          Q.ParamByName('HEVENTOGERADO').Value := pHEvento;
          Q.ExecSql;
        end;
      end;

      q.Close;
      q.SQL.Clear;
      q.SQL.add('SELECT M.TEXTO, M.INTEIRO1, M.INTEIRO2, M.DATA, M.CHAVE ');
      q.SQL.add('  FROM ' + PrefixoTmp(Sys.CurrentSystem) + 'TMP_MENSAGEM  M ');

      if (pHEvento > 0) then //Veio da Revalidação
      begin
        q.SQL.add(' WHERE M.CHAVE =:PCHAVE  ');
        q.SQL.add('   AND M.INTEIRO1 = 666  ');
        q.ParamByName('PCHAVE').AsInteger := pHEvento;
      end
      else //Veio da Validação
      begin
        q.SQL.add('  JOIN SAM_AUTORIZ_EVENTOGERADO G ON (M.CHAVE = G.HANDLE) ');
        q.SQL.add('  JOIN SAM_TGE T ON (T.HANDLE = G.EVENTOGERADO) ');
        q.SQL.add(' WHERE G.AUTORIZACAO = :AUTORIZACAO   ');
        q.SQL.add('   AND T.TRATAMENTOSERIADO = ''S''    ');
        q.SQL.add('   AND G.GRAUGERADO = T.GRAUPRINCIPAL ');
        q.ParamByName('AUTORIZACAO').AsInteger := pHAutorizacao;
      end;
      q.Open;

      vSMsgDataCancel := EmptyStr;
      vDataCalc := Null;

      if q.FieldByName('INTEIRO1').AsInteger = 666 then // verificar se veio registro
      begin
        vDataCalc := q.FieldByName('DATA').AsDateTime;
        vSMsgDataCancel := 'Quantidade autorizada menor que a quantidade solicitada.' + #13 +
          'Verifique as quantidades geradas no tratamento seriado.' + #13 +
          'Autorização válida até: ' + DateToStr(vDataCalc);

        if not sys.webmode then
        begin
          CommitEx(Sys.CurrentSystem, vsSenha);
          ShowMessage(vSMsgDataCancel);
          StartTransactionEx(Sys.CurrentSystem, 'SamAuto_UDM_GerarTratamentoSeriado', vsSenha);
        end;

        // fazer o update na Sam_autoriz com a nova data de validade.
        qA.Close;
        qA.SQL.Clear;
        qA.SQL.Add('UPDATE SAM_AUTORIZ               ');
        qA.SQL.Add('   SET DATAVALIDADE =:PVALIDADE  ');
        qA.SQL.Add(' WHERE HANDLE =:PAUTORIZ         ');
        qA.ParamByName('PVALIDADE').AsDateTime := vDataCalc;
        qA.ParamByName('PAUTORIZ').AsInteger := pHAutorizacao;
        qA.ExecSql;

        q.First;

        while not (q.eof) do // atualizar a data de validade de todos os eventos gerados quando for tratamento seriado
        begin
          vHandleEV := q.FieldByName('INTEIRO2').AsInteger; // peguei o handle do evento vinculado ao evento gerado
          vDataCalc := q.FieldByName('DATA').AsDateTime;

          if ((vDataCalc <> null) and (vHandleEV > 0)) then
          begin
            qA.Close;
            qA.SQL.Clear;
            qA.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO  ');
            qA.SQL.Add('   SET DATAVALIDADE =:PVALIDADE  ');
            qA.SQL.Add(' WHERE EVENTOGERADO =:PEVENTO    ');
            qA.SQL.Add('   AND AUTORIZACAO =:PAUT        ');
            qA.ParamByName('PVALIDADE').AsDateTime := vDataCalc;
            qA.ParamByName('PEVENTO').AsInteger := vHandleEV;
            qA.ParamByName('PAUT').AsInteger := pHAutorizacao;
            qA.ExecSql;

            q2.close;
            q2.SQL.Clear;
            q2.SQL.Add(' SELECT EVENTOSOLICITADO         ');
            q2.SQL.Add('   FROM SAM_AUTORIZ_EVENTOGERADO ');
            q2.SQL.Add(' WHERE HANDLE = :HANDLE ');
            q2.ParamByName('HANDLE').AsInteger := q.FieldByName('CHAVE').AsInteger;
            q2.Open;

            // Inserir a obs da autorizacao.
            vHObsAut := Sys.NewHandle('SAM_AUTORIZ_OBSERVACAO');
            q3.Close;
            q3.SQL.Clear;
            q3.SQL.Add('INSERT INTO SAM_AUTORIZ_OBSERVACAO ');
            q3.SQL.Add('(HANDLE, AUTORIZACAO, OBSERVACAO, USUARIO, DATAREGISTRO, EVENTOSOLICIT, OBSERVACAOINCLUIDAPELOUSUARIO)');
            q3.SQL.Add('VALUES (:HANDLE, :AUTORIZACAO, :OBSERVACAO, :USUARIO, :DATAREGISTRO, :EVENTOSOLICIT, OBSERVACAOINCLUIDAPELOUSUARIO)');
            q3.ParamByName('HANDLE').AsInteger := vHObsAut;
            q3.ParamByName('AUTORIZACAO').AsInteger := pHAutorizacao;

            sys.SQLMemoParam(Integer(Pointer(q3.ParamByName('OBSERVACAO'))), vSMsgDataCancel);
            q3.ParamByName('USUARIO').AsInteger := sys.CurrentUser;
            q3.ParamByName('DATAREGISTRO').AsDateTime := sys.ServerNow;
            q3.ParamByName('EVENTOSOLICIT').AsInteger := q2.FieldByName('EVENTOSOLICITADO').AsInteger;
            q3.ParamByName('OBSERVACAOINCLUIDAPELOUSUARIO').AsString := 'N';
            q3.ExecSql;
          end;
          q.next;
        end;

        q.Close;
        q.SQL.Clear;
        q.SQL.Add('DELETE FROM ' + PrefixoTmp(Sys.CurrentSystem) + 'TMP_MENSAGEM ');

        if (pHEvento > 0) then //Veio da Revalidação
        begin
          q.SQL.add(' WHERE CHAVE =:PCHAVE  ');
          q.SQL.add('   AND INTEIRO1 = 666  ');
          q.ParamByName('PCHAVE').AsInteger := pHEvento;
        end
        else //Veio da Validação
        begin
          q.SQL.add(' WHERE CHAVE IN ( SELECT G.HANDLE ');
          q.SQL.add('                      FROM SAM_AUTORIZ_EVENTOGERADO G ');
          q.SQL.add('                      JOIN SAM_TGE T ON (T.HANDLE = G.EVENTOGERADO) ');
          q.SQL.add('                     WHERE G.AUTORIZACAO = :AUTORIZACAO     ');
          q.SQL.add('                      AND T.TRATAMENTOSERIADO = ''S''       ');
          q.SQL.add('                      AND G.GRAUGERADO = T.GRAUPRINCIPAL)   ');
          q.SQL.add('   AND INTEIRO1 = 666  ');
          q.ParamByName('AUTORIZACAO').AsInteger := pHAutorizacao;
        end;
        q.ExecSql;
      end;
      CommitEx(Sys.CurrentSystem, vsSenha);
    except
      RollbackEx(Sys.CurrentSystem, vsSenha);
      raise;
    end;
  end;
  WriteBDebug('SamAuto.DM.GerarTratamentoSeriado - Fim');
end;

                  {   ROTINAS DO 'AUTORIZADOR'  }

procedure TDM.ChecarBeneficiario(pHandle: integer;
  pDV: string;
  pData: TDateTime);
var
  vDataAutorizacaoMenorDataAdesao,
    vDataCancelamentoNaoNula,
    vDataAutorizacaoMaiorDataCancelamento,
    vAtendimentoAteNaoNulo,
    vDataAutorizacaoMenorAtendimentoAte: boolean;
  vDiaInicial, vDiaFinal: TDateTime;
  vComplemento: string;
  vDiasAtendCartaoBloqueado: Integer;
begin
  //verificar a condicao do cartão do beneficiario
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT HANDLE FROM SAM_BENEFICIARIO_CARTAOIDENTIF WHERE BENEFICIARIO = :BENEFICIARIO');
  Q.ParamByName('BENEFICIARIO').Value := pHandle;
  Q.Open;
  if Q.IsEmpty then
    MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOSEMCARTAO,
      'Não existe nenhum cartão cadastrado para o beneficiário.'
      )
  else
  begin
    samauto_BENEFICIARIO_CARTAOIDENTIF.Close;
    samauto_BENEFICIARIO_CARTAOIDENTIF.ParamByName('BENEFICIARIO').Value := pHandle;
    samauto_BENEFICIARIO_CARTAOIDENTIF.ParamByName('DV').Value := pDV;
    samauto_BENEFICIARIO_CARTAOIDENTIF.Open;
    if samauto_BENEFICIARIO_CARTAOIDENTIF.IsEmpty then
      MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOSEMCARTAO,
        'O DV informado não corresponde a nenhuma via de Cartão'
        )
    else
    begin
      // Fábio - 04/06/2002
      // começaram a repetir os DVs para os beneficiários cujos cartões são cancelados a cada 3 meses.
      // com isso, podem existir vários cartões com o mesmo DV.
      // verificar qual desses cartões estão com situação Normal e se nenhum estiver, pegar o de maior via para obter as negações.
      while (samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('SITUACAO').AsString <> 'N') and
        (not samauto_BENEFICIARIO_CARTAOIDENTIF.EOF) do
        samauto_BENEFICIARIO_CARTAOIDENTIF.Next;
      if samauto_BENEFICIARIO_CARTAOIDENTIF.EOF then
        samauto_BENEFICIARIO_CARTAOIDENTIF.First;

      if not SAM_PARAMETROSBENEFICIARIO.Active then
        SAM_PARAMETROSBENEFICIARIO.Open;

      if (samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('SITUACAO').AsString = 'C') and

      //Verificar se é permitido atendimento com cartão cancelado
      ((SAM_PARAMETROSBENEFICIARIO.FieldByName('PERMITEATENDCARTAOCANCEL').AsString = 'N') or
        ((SAM_PARAMETROSBENEFICIARIO.FieldByName('PERMITEATENDCARTAOCANCEL').AsString = 'S') and
        (samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('HCARTAOMOTIVO').AsInteger <>
        SAM_PARAMETROSBENEFICIARIO.FieldByName('CARTAOMOTIVODESBLOQUEIO').AsInteger))) and

      (pData >
        samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('DATACANCELAMENTO').AsDateTime) then
      begin
        vcomplemento := format('Data de atendimento (%s) é posterior à data de cancelamento (%s) do cartão' + #13 +
          'Motivo:  %s',
          [DateToStr(pData), samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('DATACANCELAMENTO').AsString,
          samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('MOTIVOCANCELAMENTO').AsString]
            );
        MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOIDCANCELADO, vComplemento);
      end;

      //Verificar dias de atendimento para um cartão bloqueado
      //if (SAM_BENEFICIARIO_CARTAOIDENTIF.FieldByName('SITUACAO').asString='B')
      //then  MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOIDBLOQUEADO,'A situação do cartão está como bloqueada');
      if (samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('SITUACAO').AsString = 'B') then
      begin
        Q.Close;
        Q.SQL.Clear;
        Q.SQL.Add('SELECT C.DIASATENDCARTAOBLOQUEADO');
        Q.SQL.Add('FROM SAM_BENEFICIARIO B, SAM_CONTRATO C');
        Q.SQL.Add('WHERE B.HANDLE = :HBENEFICIARIO');
        Q.SQL.Add('  AND C.HANDLE = B.CONTRATO');
        Q.ParamByName('HBENEFICIARIO').AsInteger := pHandle;
        Q.Open;

        vDiasAtendCartaoBloqueado := Q.FieldByName('DIASATENDCARTAOBLOQUEADO').AsInteger;

        Q.Close;
        Q.SQL.Clear;
        Q.SQL.Add('SELECT HANDLE');
        Q.SQL.Add('FROM SAM_BENEFICIARIO_CARTAOIDENTIF');
        Q.SQL.Add('WHERE BENEFICIARIO = :HBENEFICIARIO');
        Q.SQL.Add('  AND SITUACAO = ''N''');
        Q.ParamByName('HBENEFICIARIO').AsInteger :=
          pHandle;
        Q.Open;

        if not (Q.IsEmpty) or
          (vDiasAtendCartaoBloqueado = 0) or
          ((samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('DATAGERACAO').AsDateTime +
          vDiasAtendCartaoBloqueado) < pData) then
          MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOIDBLOQUEADO, 'A situação do cartão está como bloqueada');
        Q.Close;
      end;

      //Checar se o beneficiario pode ser atendido na data solicitada

      DataParaCompetencia(pData, vDiaInicial, vDiaFinal); //vem de rotinas.pas

      if
        (
        (vDiaInicial < PrimeiroDiaCompetencia(samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('COMPETENCIAINICIALVALIDADE').AsDateTime)) or
        (
        (vDiaFinal > UltimoDiaCompetencia(samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('COMPETENCIAFINALVALIDADE').AsDateTime)) and
        (not samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('COMPETENCIAFINALVALIDADE').isNull)
        )
        ) then
      begin
        vComplemento := 'Data de atendimento fora do período de validade do Cartão:' + #13 +
          'Data de atendimento: %s' + #13 +
          'Atendimento a partir de: %s';
        if (samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('COMPETENCIAFINALVALIDADE').isNull) then
        begin
          vComplemento := format(vComplemento,
            [DateToStr(pData),
            samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('COMPETENCIAINICIALVALIDADE').AsString
              ]
              );
        end
        else
        begin
          vComplemento := vComplemento + #13 + 'Atendimento até: %s';
          vComplemento := format(vComplemento,
            [DateToStr(pData),
            samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('COMPETENCIAINICIALVALIDADE').AsString,
              DateToStr(ultimodiacompetencia(samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('COMPETENCIAFINALVALIDADE').AsDateTime))
              ]
              );
        end;

        MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOIDVALIDADE, vComplemento);
      end;
    end;
  end;

  vDataAutorizacaoMenorDataAdesao := pData < samauto_BENEFICIARIO.FieldByName('BDATAADESAO').AsDateTime;

  vDataCancelamentoNaoNula := not (samauto_BENEFICIARIO.FieldByName('BDATACANCELAMENTO').isnull);

  vDataAutorizacaoMaiorDataCancelamento := pData > samauto_BENEFICIARIO.FieldByName('BDATACANCELAMENTO').AsDateTime;

  vAtendimentoAteNaoNulo := not (samauto_BENEFICIARIO.FieldByName('ATENDIMENTOATE').isnull);

  vDataAutorizacaoMenorAtendimentoAte := pData <= samauto_BENEFICIARIO.FieldByName('ATENDIMENTOATE').AsDateTime;

  if (vDataAutorizacaoMenorDataAdesao) or
    (vDataCancelamentoNaoNula and vDataAutorizacaoMaiorDataCancelamento) then
  begin
    if (not vDataAutorizacaoMenorDataAdesao) and (vAtendimentoAteNaoNulo) and (vDataAutorizacaoMenorAtendimentoAte) then
    begin
      //Beneficiario inativo, mas com atendimento
      vComplemento := 'Beneficiário inativo c/ atendimento:' + #13 +
        'Prazo máximo para atendimento: %s' + #13 +
        'Data atendimento solicitada  : %s'; //+ #13 +
      // Garcia
      // A data de atendimento não é posterior a data limite de atendimento,
      // considerando o campo ATENDIMENTOATE
      //'*A Data de atendimento é posterior à data limite para atendimento';
      vComplemento := format(vComplemento,
        [samauto_BENEFICIARIO.FieldByName('ATENDIMENTOATE').AsString, DateToStr(pData)]
        );
      MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOINATIVOATENDIMENTO, vComplemento);
    end
    else
    begin
      if (vDataAutorizacaoMenorDataAdesao) or
        not (vAtendimentoAteNaoNulo) or
        (vDataAutorizacaoMaiorDataCancelamento) then
      begin
        vComplemento := 'Beneficiário inativo.' + #13 +
          'A data de atendimento (%s), esta fora do intervalo:' + #13 +
          'Data de adesão: %s' + #13 +
          'Data de cancelamento: %s' + #13;
        vComplemento := Format(vComplemento,
          [DateToStr(pData),
          samauto_BENEFICIARIO.FieldByName('BDATAADESAO').AsString,
            samauto_BENEFICIARIO.FieldByName('BDATACANCELAMENTO').AsString
            ]
            );
        MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOINATIVO, vComplemento);
      end;
    end;
  end;

  if not (samauto_BENEFICIARIO.FieldByName('BDATABLOQUEIO').isnull) then
  begin
    vComplemento := Format('Bloqueado em: %s', [samauto_BENEFICIARIO.FieldByName('BDATABLOQUEIO').AsString]);
    MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOBLOQUEADO, vComplemento);
  end;

  // Fábio 01/08/2002
  // Suspensão na família/contrato
  vComplemento := '';
  SUSPENSAO.Close;
  SUSPENSAO.ParamByName('BENEFICIARIO').Value := samauto_BENEFICIARIO.FieldByName('BHANDLE').AsInteger;
  SUSPENSAO.ParamByName('DATA').Value := pData;
  SUSPENSAO.Open;

  if (not SUSPENSAO.FieldByName('BDATAINICIALSUSPENSAO').isnull) then
  begin
    if (SUSPENSAO.FieldByName('BDATAFINALSUSPENSAO').isnull) then
      vComplemento := 'Beneficiário suspenso a partir de %s %s'
    else
      vComplemento := 'Beneficiário suspenso de %s a %s';
    vComplemento := format(vComplemento, [SUSPENSAO.FieldByName('BDATAINICIALSUSPENSAO').AsString, SUSPENSAO.FieldByName('BDATAFINALSUSPENSAO').AsString]);
  end
  else if (not SUSPENSAO.FieldByName('FDATAINICIALSUSPENSAO').isnull) then
  begin
    if (SUSPENSAO.FieldByName('FDATAFINALSUSPENSAO').isnull) then
      vComplemento := 'Família suspensa a partir de %s %s'
    else
      vComplemento := 'Família suspensa de %s a %s';
    vComplemento := format(vComplemento, [SUSPENSAO.FieldByName('FDATAINICIALSUSPENSAO').AsString, SUSPENSAO.FieldByName('FDATAFINALSUSPENSAO').AsString]);
  end
  else if (not SUSPENSAO.FieldByName('CDATAINICIALSUSPENSAO').isnull) then
  begin
    if (SUSPENSAO.FieldByName('CDATAFINALSUSPENSAO').isnull) then
      vComplemento := 'Contrato suspenso a partir de %s %s'
    else
      vComplemento := 'Contrato suspenso de %s a %s';
    vComplemento := format(vComplemento, [SUSPENSAO.FieldByName('CDATAINICIALSUSPENSAO').AsString, SUSPENSAO.FieldByName('CDATAFINALSUSPENSAO').AsString]);
  end;
  if vComplemento <> '' then
    MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOSUSPENSO, vComplemento);

  if samauto_BENEFICIARIO.FieldByName('EHTITULAR').AsString = 'N' then
  begin
    vComplemento := '';
    SUSPENSAO_TITULAR.Close;
    SUSPENSAO_TITULAR.ParamByName('BENEFICIARIO').Value := samauto_BENEFICIARIO.FieldByName('BHANDLE').AsInteger;
    SUSPENSAO_TITULAR.ParamByName('DATA').Value := pData;
    SUSPENSAO_TITULAR.Open;
    if (not SUSPENSAO_TITULAR.FieldByName('BDATAINICIALSUSPENSAO').isnull) then
    begin
      if (SUSPENSAO_TITULAR.FieldByName('BDATAFINALSUSPENSAO').isnull) then
        vComplemento := 'Beneficiário suspenso a partir de %s %s'
      else
        vComplemento := 'Beneficiário suspenso de %s a %s';
      vComplemento := format(vComplemento, [SUSPENSAO_TITULAR.FieldByName('BDATAINICIALSUSPENSAO').AsString, SUSPENSAO_TITULAR.FieldByName('BDATAFINALSUSPENSAO').AsString]);
    end
    else if (not SUSPENSAO_TITULAR.FieldByName('FDATAINICIALSUSPENSAO').isnull) then
    begin
      if (SUSPENSAO_TITULAR.FieldByName('FDATAFINALSUSPENSAO').isnull) then
        vComplemento := 'Família suspensa a partir de %s %s'
      else
        vComplemento := 'Família suspensa de %s a %s';
      vComplemento := format(vComplemento, [SUSPENSAO_TITULAR.FieldByName('FDATAINICIALSUSPENSAO').AsString, SUSPENSAO_TITULAR.FieldByName('FDATAFINALSUSPENSAO').AsString]);
    end
    else if (not SUSPENSAO_TITULAR.FieldByName('CDATAINICIALSUSPENSAO').isnull) then
    begin
      if (SUSPENSAO_TITULAR.FieldByName('CDATAFINALSUSPENSAO').isnull) then
        vComplemento := 'Contrato suspenso a partir de %s %s'
      else
        vComplemento := 'Contrato suspenso de %s a %s';
      vComplemento := format(vComplemento, [SUSPENSAO_TITULAR.FieldByName('CDATAINICIALSUSPENSAO').AsString, SUSPENSAO_TITULAR.FieldByName('CDATAFINALSUSPENSAO').AsString]);
    end;
    if vComplemento <> '' then
      MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOTITULARSUSPENSO, vComplemento);
  end;

  //Junior - 13/12/2000
  //Testar licença por acidente de trabalho
  FINALIDADEATENDIMENTO.Close;
  FINALIDADEATENDIMENTO.ParamByName('FINALIDADEATENDIMENTO').AsInteger := vgFINALIDADEATENDIMENTO;
  FINALIDADEATENDIMENTO.Open;

  samauto_BENEFICIARIO_LICENCA.Close;
  samauto_BENEFICIARIO_LICENCA.ParamByName('BENEFICIARIO').AsInteger := samauto_BENEFICIARIO.FieldByName('BHANDLE').AsInteger;
  samauto_BENEFICIARIO_LICENCA.ParamByName('DATA').AsDateTime := pData;
  samauto_BENEFICIARIO_LICENCA.Open;
  if not samauto_BENEFICIARIO_LICENCA.isEmpty then
  begin
    if FINALIDADEATENDIMENTO.FieldByName('ACIDENTETRABALHO').AsString <>
      samauto_BENEFICIARIO_LICENCA.FieldByName('ACIDENTETRABALHO').AsString then
      if FINALIDADEATENDIMENTO.FieldByName('ACIDENTETRABALHO').AsString = 'S' then
        MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOSEMACIDTRABALHO, '')
      else if samauto_BENEFICIARIO_LICENCA.FieldByName('ACIDENTETRABALHO').AsString = 'S' then
        MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOCOMACIDTRABALHO, '');
  end;

  FINALIDADEATENDIMENTO.Close;
  samauto_BENEFICIARIO_LICENCA.Close;

  if not (samauto_BENEFICIARIO.FieldByName('FDATABLOQUEIO').IsNull) then
  begin
    vComplemento := format('Familia bloqueada em: %s', [samauto_BENEFICIARIO.FieldByName('FDATABLOQUEIO').AsString]);
    MontaNegacaoBenefPrestador(SAM_ERRO_FAMILIABLOQUEADA, vComplemento);
  end;

  if ChecarFamiliaInativa(pData) then
  begin
    vComplemento := 'Data de atendimento (%s) está fora do intervalo válido entre:' + #13 +
      'Data de adesão (%s) e Data de cancelamento (%s)';
    vComplemento := format(vComplemento,
      [DateToStr(pData),
      samauto_BENEFICIARIO.FieldByName('FDATAADESAO').AsString,
        samauto_BENEFICIARIO.FieldByName('FDATACANCELAMENTO').AsString]
        );
    MontaNegacaoBenefPrestador(SAM_ERRO_FAMILIAINATIVA, vComplemento);
  end;

  if not (samauto_BENEFICIARIO.FieldByName('CDATABLOQUEIO').IsNull) then
  begin
    vComplemento := format('Contrato bloqueado em: %s', [samauto_BENEFICIARIO.FieldByName('CDATABLOQUEIO').AsString]);
    MontaNegacaoBenefPrestador(SAM_ERRO_CONTRATOBLOQUEADO, vComplemento);
  end;

  if ChecarContratoInativo(pData) then
  begin
    vComplemento := 'Data de atendimento (%s) está fora do intervalo da data de adesão (%s) e data de cancelamento (%s)';
    vComplemento := format(vComplemento,
      [DateToStr(pData),
      samauto_BENEFICIARIO.FieldByName('CDATAADESAO').AsString,
        samauto_BENEFICIARIO.FieldByName('CDATACANCELAMENTO').AsString]
        );
    MontaNegacaoBenefPrestador(SAM_ERRO_CONTRATOINATIVO, vComplemento);
  end;

  // Eduardo - 06/01/2004 - SMS 22356
  // Abre a query se já não estiver aberta
  if not SAM_PARAMETROSGERAIS.Active then
    SAM_PARAMETROSGERAIS.Open;
  // fim SMS 22356

  //Junior - 17/11/2000
  //Verificar se o contrato pode ter reembolso
  if (vgLOCALATENDIMENTO =
    SAM_PARAMETROSGERAIS.FieldByName('LOCALATENDIMENTORESSARCIMENTO').AsInteger) and
    (samauto_BENEFICIARIO.FieldByName('BPERMITEREEMBOLSO').AsString = 'N') then
    MontaNegacaoBenefPrestador(SAM_ERRO_CONTRATOLIVREESCOLHA, 'Não é permitido reembolso para o beneficiário');
  //Garcia/Fábio 09.08.2002
  //Verificar se ao beneficiário é pemitido reembolso.
  if (vgLOCALATENDIMENTO =
    SAM_PARAMETROSGERAIS.FieldByName('LOCALATENDIMENTORESSARCIMENTO').AsInteger) and
    (samauto_BENEFICIARIO.FieldByName('CPERMITEREEMBOLSO').AsString = 'N') then
    MontaNegacaoBenefPrestador(SAM_ERRO_CONTRATOLIVREESCOLHA, 'Contrato não permite reembolso');
  ChecarFamiliaSemResponsavel(pData);

end;


procedure TDM.ChecarBeneficiarioDoc(pBeneficiario,
  pContrato: Integer;
  pData,
  pDataNascimento,
  pBeneficiarioDataAdesao: TDateTime);
var
  vDia,
    vMes,
    vIdade: word;
  vDataFinalParaApresentacao: TDateTime;
  vComplemento: WideString;
  vObservacao: WideString;
  //  vDataParaAniversario:TDateTime;
begin
  if LerMotivoNegacao(SAM_ERRO_BENEFICIARIODOCUMENTO, vRegimePgto, gLiberaPorAuxilio) = nulo then
    exit; //Não levar em consideração as negacoes de documentação

  //VERIFICAR NO CONTRATO ----------- E PEGAR O TPDEP DO BENEFICIARIO
  samauto_CONTRATO_TPDEP.Close;
  samauto_CONTRATO_TPDEP.ParamByName('BENEFICIARIO').Value := pBeneficiario;
  samauto_CONTRATO_TPDEP.Open;
  if samauto_CONTRATO_TPDEP.IsEmpty then
  begin
    MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOTPDEPINVALIDO,
      'Falta o tipo dependente para o beneficiario.'
      );
    Exit;
  end;

  vDia := 0;
  vMes := 0;
  vIdade := 0;
  DiferencaData(pData, pDataNascimento, vDia, vMes, vIdade);

  //beneficiario com idade superior a permitida em seu tipo dep
  if vIdade >= samauto_CONTRATO_TPDEP.FieldByName('IDADEMAXIMA').AsInteger then
  begin
    vComplemento := 'Idade máxima permitida: %s' + #13 +
      'Idade do Beneficiario : %s anos e %s meses' + #13 +
      'Aniversário:%s' + #13 +
      'Atendimento:%s';
    vComplemento := format(vComplemento,
      [samauto_CONTRATO_TPDEP.FieldByName('IDADEMAXIMA').AsString,
      IntToStr(vIdade),
        IntToStr(vMes),
        FormatDateTime('dd "de" mmmm "de" yyyy', pDataNascimento),
        FormatDateTime('dd "de" mmmm "de" yyyy', pData)
        ]
        );
    MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOIDADESUPERIOR, vComplemento);
  end;

  //Quantidade de Dias que o beneficiario tem de plano ate a autorizacao
  //selecionar todos os documentos que o beneficiario nao entregou e aqueles que entregou e ja venceu
  //excluir desta lista os que estiverem no prazo de entrega e que a acaoFalta seja = nada

  samauto_CONTRATO_TPDEP_DOC.Close;
  samauto_CONTRATO_TPDEP_DOC.ParamByName('IDADE').Value := vIdade;
  samauto_CONTRATO_TPDEP_DOC.ParamByName('TD').Value := samauto_CONTRATO_TPDEP.FieldByName('TIPODEPENDENTE').AsInteger;
  samauto_CONTRATO_TPDEP_DOC.ParamByName('BN').Value := pBeneficiario;
  samauto_CONTRATO_TPDEP_DOC.ParamByName('CO').Value := pContrato;
  samauto_CONTRATO_TPDEP_DOC.ParamByName('DATAAUTO').Value := pData;
  samauto_CONTRATO_TPDEP_DOC.Open;
  samauto_CONTRATO_TPDEP_DOC.First;
  vComplemento := '';
  vObservacao := '';
  while not samauto_CONTRATO_TPDEP_DOC.EOF do
  begin
    samauto_BENEFICIARIO_DOCENTREGUE.Close;
    samauto_BENEFICIARIO_DOCENTREGUE.ParamByName('BENEFICIARIO').Value := pBeneficiario;
    samauto_BENEFICIARIO_DOCENTREGUE.ParamByName('TIPODOCUMENTO').Value := samauto_CONTRATO_TPDEP_DOC.FieldByName('DOCUMENTO').AsInteger;
    samauto_BENEFICIARIO_DOCENTREGUE.Open;

    if samauto_BENEFICIARIO_DOCENTREGUE.IsEmpty then
      vDataFinalParaApresentacao := pBeneficiarioDataAdesao + samauto_CONTRATO_TPDEP_DOC.FieldByName('DIASAPRESENTACAO').AsInteger
    else
      vDataFinalParaApresentacao := samauto_BENEFICIARIO_DOCENTREGUE.FieldByName('ULTIMADATA').AsDateTime +
        samauto_CONTRATO_TPDEP_DOC.FieldByName('DIASAPRESENTACAO').AsInteger;

    if vDataFinalParaApresentacao < pData then
    begin
      if (samauto_CONTRATO_TPDEP_DOC.FieldByName('ACAOFALTA').AsString = 'R') then
      begin
        vComplemento := 'Documento em falta: ';
        vComplemento := vComplemento + samauto_CONTRATO_TPDEP_DOC.FieldByName('DESCRICAO').AsString + '.' + #13;
      end
      else if (samauto_CONTRATO_TPDEP_DOC.FieldByName('ACAOFALTA').AsString = 'O') then
      begin
        vObservacao := 'Documento em falta: ';
        vObservacao := vObservacao + samauto_CONTRATO_TPDEP_DOC.FieldByName('DESCRICAO').AsString + '.' + #13;
      end;
    end;
    samauto_CONTRATO_TPDEP_DOC.Next;
  end;

  if vComplemento <> '' then
    MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIODOCUMENTO, vComplemento);

  if vObservacao <> '' then
    FrmAlertas.MontaObs(vObservacao);

  vgDocumentosEmFalta := vComplemento + vObservacao;

  samauto_CONTRATO_TPDEP_DOC.Close;
  samauto_CONTRATO_TPDEP.Close;
  //Application.hint := '...';
end;
// pModo => 0 - solicitante; 1 - executante; 2 - recebedor

procedure TDM.ChecarPrestadorDoc(pPrestador, pModo: Integer; pDataCredenciamento, pDataInclusao: TDateTime);
var
  vDataFinalParaApresentacao,
    vData: TDateTime;
  vModoSolicitante,
    vModoExecutor,
    vModoRecebedor,
    vModoLocalExecucao: string;
  vComplemento: WideString;
  vObservacao: WideString;
  vProcessa: boolean;
begin
  if LerMotivoNegacao(SAM_ERRO_PRESTADORDOCPENDENTE, vRegimePgto, gLiberaPorAuxilio) = nulo then
    exit; //Não levar em consideração as negacoes de documentação

  //Application.hint := 'Checando documentação do Prestador...';

  samauto_PRESTADOR_ISENTADOC.Close;
  samauto_PRESTADOR_ISENTADOC.ParamByName('hPRESTADOR').Value := pPrestador;
  samauto_PRESTADOR_ISENTADOC.Open;

  if samauto_PRESTADOR_ISENTADOC.FieldByName('ISENTADOCUMENTO').Value = 'S' then
    Exit;

  vModoSolicitante := 'N';
  vModoExecutor := 'N';
  vModoRecebedor := 'N';
  vModoLocalExecucao := 'N';

  case pModo of
    0: vModoSolicitante := 'S';
    1: vModoExecutor := 'S';
    2: vModoRecebedor := 'S';
    3: vModoLocalExecucao := 'S';
  end;

  //selecionar todos os documentos que o prestador nao entregou e aqueles que entregou e ja venceu
  //excluir desta lista os que estiverem no prazo de entrega e que a acaoFalta seja = nada

  samauto_TIPOPRESTADOR_DOC.Close;
  samauto_TIPOPRESTADOR_DOC.ParamByName('hTIPOPRESTADOR').Value := samauto_PRESTADOR_ISENTADOC.FieldByName('TIPOPRESTADOR').AsInteger;
  samauto_TIPOPRESTADOR_DOC.ParamByName('hCATEGORIA').Value := samauto_PRESTADOR_ISENTADOC.FieldByName('CATEGORIA').AsInteger;
  samauto_TIPOPRESTADOR_DOC.Open;

  samauto_TIPOPRESTADOR_DOC.First;

  vComplemento := '';
  vObservacao := '';

  while not samauto_TIPOPRESTADOR_DOC.EOF do
  begin

    vProcessa := False;

    if vModoSolicitante = 'S' then
    begin
      if samauto_TIPOPRESTADOR_DOC.FieldByName('SOLICITANTE').Value = 'S' then
        vProcessa := True;
    end
    else if vModoExecutor = 'S' then
    begin
      if samauto_TIPOPRESTADOR_DOC.FieldByName('EXECUTOR').Value = 'S' then
        vProcessa := True;
    end
    else if vModoRecebedor = 'S' then
    begin
      if samauto_TIPOPRESTADOR_DOC.FieldByName('RECEBEDOR').Value = 'S' then
        vProcessa := True;
    end
    else if vModoLocalExecucao = 'S' then
    begin
      if samauto_TIPOPRESTADOR_DOC.FieldByName('LOCALEXECUCAO').Value = 'S' then
        vProcessa := True;
    end;

    if vProcessa then
    begin

      samauto_PRESTADOR_DOCENTREGUE.Close;
      samauto_PRESTADOR_DOCENTREGUE.ParamByName('hPRESTADOR').Value := pPrestador;
      samauto_PRESTADOR_DOCENTREGUE.ParamByName('hTIPODOCUMENTO').Value := samauto_TIPOPRESTADOR_DOC.FieldByName('TIPODOCUMENTO').AsInteger;
      samauto_PRESTADOR_DOCENTREGUE.Open;

      if samauto_PRESTADOR_DOCENTREGUE.IsEmpty then
        vDataFinalParaApresentacao := pDataCredenciamento + samauto_TIPOPRESTADOR_DOC.FieldByName('DIASAPRESENTACAO').AsInteger
      else
        vDataFinalParaApresentacao := samauto_PRESTADOR_DOCENTREGUE.FieldByName('ULTIMADATA').AsDateTime +
          samauto_TIPOPRESTADOR_DOC.FieldByName('DIASAPRESENTACAO').AsInteger;

      if (samauto_TIPOPRESTADOR_DOC.FieldByName('TABDATA').Value = 'C') then
      begin
        if not (pDataCredenciamento = null) then
          vData := pDataCredenciamento
        else
          vData := pDataInclusao;
      end
      else if samauto_TIPOPRESTADOR_DOC.FieldByName('TABDATA').Value = 'I' then
        vData := pDataInclusao;

      // PdATA DEVE SER DE ACORDO COM PARAMENTROS OU CREDENCIAMENTO OU DATA INCLUSAO
      if vDataFinalParaApresentacao < vData then
      begin
        if (samauto_TIPOPRESTADOR_DOC.FieldByName('ACAOFALTA').AsString = 'R') then
        begin
          if vModoSolicitante = 'S' then
            vComplemento := vComplemento + 'Solicitante - '
          else if vModoExecutor = 'S' then
            vComplemento := vComplemento + 'Executor - '
          else if vModoRecebedor = 'S' then
            vComplemento := vComplemento + 'Recebedor - '
          else if vModoLocalExecucao = 'S' then
            vComplemento := vComplemento + 'Local de execução - ';

          vComplemento := vComplemento + 'Documento em falta: ';
          vComplemento := vComplemento + samauto_TIPOPRESTADOR_DOC.FieldByName('DESCRICAO').AsString + '.' + #13;
        end
        else if (samauto_TIPOPRESTADOR_DOC.FieldByName('ACAOFALTA').AsString = 'O') then
        begin
          if vModoSolicitante = 'S' then
            vObservacao := vObservacao + 'Solicitante - '
          else if vModoExecutor = 'S' then
            vObservacao := vObservacao + 'Executor - '
          else if vModoRecebedor = 'S' then
            vObservacao := vObservacao + 'Recebedor - '
          else if vModoLocalExecucao = 'S' then
            vObservacao := vObservacao + 'Local de execução - ';

          vObservacao := vObservacao + 'Documento em falta: ';
          vObservacao := vObservacao + samauto_TIPOPRESTADOR_DOC.FieldByName('DESCRICAO').AsString + '.' + #13;
        end;
      end;
    end;

    samauto_TIPOPRESTADOR_DOC.Next;

  end;

  if vComplemento <> '' then
    MontaNegacaoBenefPrestador(SAM_ERRO_PRESTADORDOCPENDENTE, vComplemento);

  if vObservacao <> '' then
    FrmAlertas.MontaObs(vObservacao);

  vgDocumentosEmFalta := vComplemento + vObservacao;

  samauto_TIPOPRESTADOR_DOC.Close;
  samauto_PRESTADOR_DOCENTREGUE.Close;
end;

// pModo => 0 - solicitante; 1 - executante; 2 - recebedor; 3 - local execução

procedure TDM.ChecarCarencia(pHandleOrigem,
  pEvento,
  pGrau,
  pFinalidadeAtendimento,
  pCondicaoAtendimento,
  pLocalAtendimento,
  pObjetivoTratamento,
  pRegimeAtendimento,
  pTipoTratamento,
  pBeneficiario,
  pFamilia,
  pContrato,
  pBeneficiarioDiasCompraCarencia: Integer;
  pData,
  pBeneficiarioDataAdesaoModulo: TDateTime;
  pAcidentePessoal: string;
  pDataAdesaoDoBeneficiario: TdateTime;
  pOrigemCarencia: integer);
var
  vDias, vDiasReducao, vDiasCalc: integer;
  vComplemento: WideString;
  vBD, vFD, vCD: string;
  vBR, vFR, vCR: string;
  vCDOC, vFDOC: string;
  vRedePropria: boolean;
begin

  if LerMotivoNegacao(SAM_ERRO_BENEFICIARIOCARENCIA, vRegimePgto, gLiberaPorAuxilio) = nulo then
    exit; //Não checar carencia

  if samauto_BENEFICIARIO.FieldByName('NAOTEMCARENCIA').AsString <> 'S' then
  begin
    //Application.hint := 'Checando carência...';
    if pAcidentePessoal <> 'S' then
    begin //nao verifica carencia quando acidente pessoal

      if pBeneficiarioDataAdesaoModulo <> pDataAdesaoDoBeneficiario then
        pBeneficiarioDiasCompraCarencia := 0;

      CARENCIA_REDUCAO.Close;
      CARENCIA_REDUCAO.ParamByName('CONTRATOMOD').Value := vgContratoModQueDeuCobertura;
      CARENCIA_REDUCAO.ParamByName('TIPODEPENDENTE').Value := samauto_BENEFICIARIO.FieldByName('TIPODEPENDENTE').AsInteger;
      CARENCIA_REDUCAO.ParamByName('DATA').Value := pData;
      CARENCIA_REDUCAO.Open;

      vDiasReducao := CARENCIA_REDUCAO.FieldByName('DESCONTO').AsInteger;
      vDias := Round(pData - pBeneficiarioDataAdesaoModulo);

      CARENCIA.Close;
      CARENCIA.ParamByName('Evento').Value := pEvento;
      CARENCIA.ParamByName('Grau').Value := pGrau;
      //Junior - 13/12/2000
      CARENCIA.ParamByName('FinalidadeAtendimento').Value := pFinalidadeAtendimento;
      CARENCIA.ParamByName('CondicaoAtendimento').Value := pCondicaoAtendimento;
      CARENCIA.ParamByName('LocalAtendimento').Value := pLocalAtendimento;
      CARENCIA.ParamByName('ObjetivoTratamento').Value := pObjetivoTratamento;
      CARENCIA.ParamByName('RegimeAtendimento').Value := pRegimeAtendimento;
      CARENCIA.ParamByName('TipoTratamento').Value := pTipoTratamento;
      CARENCIA.ParamByName('Beneficiario').Value := pBeneficiario;
      CARENCIA.ParamByName('Familia').Value := pFamilia;
      CARENCIA.ParamByName('Contrato').Value := pContrato;
      CARENCIA.ParamByName('Familia').Value := pFamilia;
      CARENCIA.ParamByName('data1').Value := pBeneficiarioDataAdesaoModulo;
      CARENCIA.ParamByName('ORIGEMCARENCIA').Value := pOrigemCarencia;
      CARENCIA.Open;
      vComplemento := '';
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT REDEPROPRIA FROM SAM_LOCALATENDIMENTO WHERE HANDLE = :HANDLE');
      Q.ParamByName('HANDLE').Value := vgLocalAtendimento;
      Q.Open;
      if Q.FieldByName('REDEPROPRIA').AsString = 'S' then
        vRedePropria := True
      else
        vRedePropria := False;
      while not CARENCIA.EOF do
      begin
        if vRedePropria then
        begin // se for rede própria
          vBD := 'BDRP'; // dias de carência no beneficiário rede própria
          vBR := 'BRRP'; // regra de carência no beneficiário rede própria
          vFD := 'FDRP'; // dias de carência na família rede própria
          vFR := 'BRRP'; // regra de carência na família rede própria
          vCD := 'CDRP'; // dias de carência no contrato rede própria
          vCR := 'CRRP'; // regra de carência no contrato rede própria

          vCDOC := 'CDOCRP'; // dias de carência na origem de carência do contrato rede própria
          vFDOC := 'FDOCRP'; // dias de carência na origem de carência da família rede própria

        end
        else // se for rede credenciada
        begin
          vBD := 'BD'; // dias de carência no beneficiário rede credenciada
          vBR := 'BR'; // regra de carência no beneficiário rede credenciada
          vFD := 'FD'; // dias de carência na família rede credenciada
          vFR := 'FR'; // regra de carência na família rede credenciada
          vCD := 'CD'; // dias de carência no contrato rede credenciada
          vCR := 'CR'; // regra de carência no contrato rede credenciada

          vCDOC := 'CDOC'; // dias de carência na origem de carência do contrato rede credenciada
          vFDOC := 'FDOC'; // dias de carência na origem de carência da família rede credenciada

        end;

        if not CARENCIA.FieldByName('BC').IsNull then
        begin // CARENCIA DO BENEFICIARIO
          if CARENCIA.FieldByName(vBR).AsInteger = 1 then
          begin
            if not CARENCIA.FieldByName(vBD).isNull then
            begin
              if (vDias + pBeneficiarioDiasCompraCarencia + vDiasReducao) < CARENCIA.FieldByName(vBD).AsInteger then
              begin // QTDDIA BENEFICIARIO
                vDiasCalc := CARENCIA.FieldByName(vBD).AsInteger - (vDias + pBeneficiarioDiasCompraCarencia + vDiasReducao);
                vComplemento := vComplemento + 'Beneficiário: ' + CARENCIA.FieldByName('DESCRICAO').AsString + ' - ' +
                  IntToStr(vDiasCalc) + ' dias faltando.' + #13;
              end;
            end;
          end
          else
          begin
            if not CarenciaPorPagamentoComBaixada(pBeneficiario) then
              vComplemento := 'Fatura para carência do beneficiário não baixada.';
          end;
        end
        else if not CARENCIA.FieldByName('FC').IsNull then
        begin // CARENCIA DA FAMILIA
          if CARENCIA.FieldByName(vCR).AsInteger = 1 then
          begin
            if not CARENCIA.FieldByName(vFDOC).isNull then // se tiver dias de origem, usa os dias definidos na origem
              vFD := vFDOC;
            if not CARENCIA.FieldByName(vFD).isNull then
            begin
              if (vDias + pBeneficiarioDiasCompraCarencia + vDiasReducao) < CARENCIA.FieldByName(vFD).AsInteger then
              begin // QTDDIA FAMILIA
                vDiasCalc := CARENCIA.FieldByName(vFD).AsInteger - (vDias + pBeneficiarioDiasCompraCarencia + vDiasReducao);
                vComplemento := vComplemento + 'Família: ' + CARENCIA.FieldByName('DESCRICAO').AsString + ' - ' +
                  IntToStr(vDiasCalc) + ' dias faltando.' + #13;
              end;
            end;
          end
          else
          begin
            if not CarenciaPorPagamentoComBaixada(pBeneficiario) then
              vComplemento := 'Fatura para carência da família não baixada.';
          end;
        end
        else if not CARENCIA.FieldByName('CC').IsNull then
        begin // CARENCIA CONTRATO
          if CARENCIA.FieldByName(vCR).AsInteger = 1 then
          begin
            if not CARENCIA.FieldByName(vCDOC).isNull then // se tiver dias de origem, usa os dias definidos na origem
              vCD := vCDOC;
            if not CARENCIA.FieldByName(vCD).isNull then
            begin
              if (vDias + pBeneficiarioDiasCompraCarencia) < CARENCIA.FieldByName(vCD).AsInteger then
              begin //QTDDIA CONTRATO
                vDiasCalc := CARENCIA.FieldByName(vCD).AsInteger - (vDias + pBeneficiarioDiasCompraCarencia + vDiasReducao);
                vComplemento := vComplemento + 'Contrato: ' + CARENCIA.FieldByName('DESCRICAO').AsString + ' - ' +
                  IntToStr(vDiasCalc) + ' dias faltando.' + #13;
              end;
            end;
          end
          else
          begin
            if not CarenciaPorPagamentoComBaixada(pBeneficiario) then
              vComplemento := 'Fatura para carência do contrato não baixada.';
          end;
        end;
        CARENCIA.Next;
      end;
      if vComplemento > '' then
      begin
        if CARENCIA.FieldByName('EHCPT').AsString = 'S' then
          vComplemento := ChecarCarenciaCPT(pBeneficiario, pEvento, vComplemento);
        if vComplemento > '' then
          MontaNegacao(pHandleOrigem, SAM_ERRO_BENEFICIARIOCARENCIA, vComplemento, -1);
      end;
    end;
  end;
end;

function TDM.CarenciaPorPagamentoComBaixada(pBeneficiario: integer): boolean;
var
  vDll: Variant;
  vHContaFin: integer;
begin
  vDll := AbrirDll(Sys.CurrentSystem, 'Financeiro.ContaFin');
  vHContaFin := vDll.Qual(pBeneficiario, C_ContaFinBeneficiario);
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT F.HANDLE');
  Q.SQL.Add('  FROM SFN_FATURA F, SAM_CONTRATO C, SAM_BENEFICIARIO B');
  Q.SQL.Add(' WHERE F.CONTAFINANCEIRA = :HCONTAFIN');
  Q.SQL.Add('   AND F.SITUACAO = ''B''');
  Q.SQL.Add('   AND F.TIPOFATURAMENTO = C.TIPOFATURAMENTO');
  Q.SQL.Add('   AND C.HANDLE = B.CONTRATO');
  Q.SQL.Add('   AND ((C.LOCALFATURAMENTO = ''C'' AND F.CONTRATO = B.CONTRATO) OR (C.LOCALFATURAMENTO = ''F'' AND F.FAMILIA = B.FAMILIA))');
  Q.SQL.Add('   AND B.HANDLE = :HBENEFICIARIO');
  Q.ParamByName('HCONTAFIN').Value := vHContaFin;
  Q.ParamByName('HBENEFICIARIO').Value := pBeneficiario;
  Q.Open;
  if Q.isEmpty then // não tem faturas baixadas então está em carência.
    Result := False
  else
    Result := True;
end;

function TDM.ChecarCarenciaCPT(pBeneficiario, pEvento: integer; vComplemento: ansistring): ansistring;
// checar Cobertura Parcial Temporária
begin
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT ALTACOMPLEXIDADE FROM SAM_TGE WHERE HANDLE = :EVENTO');
  Q.ParamByName('EVENTO').Value := pEvento;
  Q.Open;
  if Q.FieldByName('ALTACOMPLEXIDADE').AsString = 'N' then
  begin // carência encontrada será emitida com antes.
    Result := vComplemento;
    exit;
  end
  else
  begin // checar Cobertura Parcial Temporária
    CARENCIA_CPT.Close;
    CARENCIA_CPT.ParamByName('BENEFICIARIO').Value := pBeneficiario;
    CARENCIA_CPT.ParamByName('EVENTO').Value := pEvento;
    CARENCIA_CPT.Open;
    //    if CARENCIA_CPT.FieldByName('LOCAL').asString = 'BENEFICIARIO' then ... se precisar especificar onde achou a CPT
    if not CARENCIA_CPT.isEmpty then
    begin
      Result := vComplemento + #13 + 'Carência relacionada à Cobertura Parcial Temporária.';
      exit;
    end;
  end;
end;

procedure TDM.ChecarEvento(pHandleOrigem,
  pBeneficiario,
  pGrauGerado,
  pMatricula,
  pEvento,
  pGrau: integer;
  pQuantidade: currency;
  pBeneficiarioSexo: string;
  pBeneficiarioDataNascimento,
  pBeneficiarioDataAdesao,
  pData: TDateTime;
  pTipoAutorizacao,
  pExecutor,
  pRecebedor,
  pLocalExecucao: integer);
//se dependencia volta -1 então a rotina entrou em loop de dependencia
var
  vDias,
    vMeses,
    vIdade: Word;
  aux: integer;
  vComplemento, vComplementoPrazoIntervalar: string;
  vQtdAutorizada, vOcorrenciasIntervalo: Currency;
  vPrazoIntervalar: array of tPrazoIntervalar;
  vPeriodoBusca: Integer;
  i, j: Integer;
  vInicioIntervalo: TDateTime;
  vVerifica: integer;
begin

  // PRAZOINTERVALAR por EXECUTOR feito por Durval em 20/08/2002
  // apenas colocado por Fábio a partir do SMS.

  vQtdAutorizada := 0;
  vVerifica := 0;

  if not SAM_PARAMETROSGERAIS.Active then
    SAM_PARAMETROSGERAIS.Open;

  samauto_TGE.Close;
  samauto_TGE.ParamByName('EVENTO').Value := pEvento;
  samauto_TGE.Open;

  //Matheus - Negação: Origem do evento solicitado e a origem do evento do prestador são diferentes
  qAux.Close; //Verifica se o evento possui origem
  qAux.SQL.Clear;
  qAux.SQL.Add('SELECT ORIGEMEVENTO');
  qAux.SQL.Add('  FROM SAM_TGE');
  qAux.SQL.Add(' WHERE HANDLE = :EVENTO');
  qAux.ParamByName('EVENTO').AsInteger := pEvento;
  qAux.Open;

  if not qAux.EOF then
  begin
    qOrigemEvento.Close;
    qOrigemEvento.ParamByName('EVENTO').AsInteger := pEvento;

    if pRecebedor > 0 then
      qOrigemEvento.ParamByName('HANDLEPRESTADOR').AsInteger := pRecebedor
    else
      qOrigemEvento.ParamByName('HANDLEPRESTADOR').AsInteger := pLocalExecucao;

    qOrigemEvento.ParamByName('DATACORRENTE').AsDateTime := Sys.ServerDate;
    qOrigemEvento.Open;

    if qOrigemEvento.EOF then
    begin
      MontaNegacao(pHandleOrigem, SAM_ERRO_ORIGEMEVENTOSOLICITADO, 'Origem do evento solicitado e a origem do evento do prestador são diferentes', -1);
    end;

    qOrigemEvento.Close;
  end;
  qAux.Close;
  //fim sms 34916

  if LerMotivoNegacao(SAM_ERRO_EVENTOPREDECESSOR, vRegimePgto, gLiberaPorAuxilio) <> nulo then
  begin
    //Application.hint := 'Checando evento predecessor...';
    EVENTO_PREDECESSOR.Close;
    EVENTO_PREDECESSOR.SQL.Clear;

    EVENTO_PREDECESSOR.SQL.Add('SELECT ''S'' OK                                                                                             ');
    EVENTO_PREDECESSOR.SQL.Add('  FROM SAM_TGE A                                                                                            ');
    EVENTO_PREDECESSOR.SQL.Add(' WHERE A.HANDLE = :EVENTO                                                                                   ');
    EVENTO_PREDECESSOR.SQL.Add('   AND NOT EXISTS (SELECT HANDLE                                                                            ');
    EVENTO_PREDECESSOR.SQL.Add('                     FROM SAM_INCOMP_EVENTOS_PREDECESSOR B                                                  ');
    EVENTO_PREDECESSOR.SQL.Add('                    WHERE B.EVENTO = A.HANDLE                                                               ');
    EVENTO_PREDECESSOR.SQL.Add('                  )                                                                                         ');
    EVENTO_PREDECESSOR.SQL.Add('UNION                                                                                                       ');
    EVENTO_PREDECESSOR.SQL.Add('SELECT ''S'' OK                                                                                             ');
    EVENTO_PREDECESSOR.SQL.Add('  FROM SAM_INCOMP_EVENTOS_PREDECESSOR A                                                                     ');
    EVENTO_PREDECESSOR.SQL.Add(' WHERE EVENTO = :EVENTO                                                                                     ');
    EVENTO_PREDECESSOR.SQL.Add('   AND (EXISTS (SELECT B.HANDLE                                                                             ');
    EVENTO_PREDECESSOR.SQL.Add('                 FROM SAM_AUTORIZ_EVENTOGERADO B, SAM_AUTORIZ C                                             ');
    EVENTO_PREDECESSOR.SQL.Add('                WHERE B.EVENTOGERADO = A.EVENTOPREDECESSOR                                                  ');
    EVENTO_PREDECESSOR.SQL.Add('                  AND C.HANDLE = B.AUTORIZACAO                                                              ');
    EVENTO_PREDECESSOR.SQL.Add('                  AND C.BENEFICIARIO = :BENEFICIARIO                                                        ');
    EVENTO_PREDECESSOR.SQL.Add('                  AND A.CONSIDERAR IN (''1'',''3'')                                                         ');
    EVENTO_PREDECESSOR.SQL.Add('                  AND (((' + Sys.SQLAddDay('B.DATAATENDIMENTO', 'A.QTDDIASPRECENTE') + ') >= :DATA) AND (B.DATAATENDIMENTO <= :DATA)) ');
    EVENTO_PREDECESSOR.SQL.Add('                  AND B.SITUACAO <> ''C''                                                                   ');
    EVENTO_PREDECESSOR.SQL.Add('              )                                                                                             ');
    EVENTO_PREDECESSOR.SQL.Add('        OR                                                                                                  ');
    EVENTO_PREDECESSOR.SQL.Add('        EXISTS (SELECT D.HANDLE                                                                             ');
    EVENTO_PREDECESSOR.SQL.Add('                  FROM SAM_GUIA_EVENTOS D, SAM_GUIA E                                                       ');
    EVENTO_PREDECESSOR.SQL.Add('                 WHERE D.EVENTO = A.EVENTOPREDECESSOR                                                       ');
    EVENTO_PREDECESSOR.SQL.Add('                   AND E.HANDLE = D.GUIA                                                                    ');
    EVENTO_PREDECESSOR.SQL.Add('                   AND E.BENEFICIARIO = :BENEFICIARIO                                                       ');
    EVENTO_PREDECESSOR.SQL.Add('                   AND A.CONSIDERAR IN (''2'',''3'')                                                        ');

    EVENTO_PREDECESSOR.SQL.Add('                   AND (((' + Sys.SQLAddDay('D.DATAATENDIMENTO', 'A.QTDDIASPRECENTE') + ') >= :DATA) AND (D.DATAATENDIMENTO <= :DATA))');

    EVENTO_PREDECESSOR.SQL.Add('               )                                                                                            ');
    EVENTO_PREDECESSOR.SQL.Add('        )                                                                                                   ');

    EVENTO_PREDECESSOR.ParamByName('EVENTO').Value := pEvento;
    EVENTO_PREDECESSOR.ParamByName('BENEFICIARIO').Value := pBeneficiario;
    EVENTO_PREDECESSOR.ParamByName('DATA').Value := pData;
    EVENTO_PREDECESSOR.Open;
    // juliana 02/10/2003 - sms  13960
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT ESTRUTURA, DESCRICAO FROM SAM_TGE TGE');
    Q.SQL.Add('                            JOIN SAM_INCOMP_EVENTOS_PREDECESSOR INC ON (INC.EVENTOPREDECESSOR=TGE.HANDLE)');
    Q.SQL.Add('WHERE INC.EVENTO= :EVENTO');
    Q.ParamByName('EVENTO').Value := pEvento;
    Q.Open;

    if EVENTO_PREDECESSOR.FieldByName('OK').AsString <> 'S' then
    begin
      vComplemento := 'É necessário realização do seguinte evento predecessor %s' + #13 +
        'estrutura              : %s' + #13 +
        'descrição              : %s';
      vComplemento := format(vComplemento,
        ['',
        Q.FieldByName('ESTRUTURA').AsString,
          Q.FieldByName('DESCRICAO').AsString
          ]
          );
      //Junior - 03/05/2000
      MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOPREDECESSOR, vComplemento, -1);

    end;
    //Application.hint := '...';
  end;

  // Fábio - 22/11/2001
  // Eventos Válidos para o tipo de autorização
  if pTipoAutorizacao > 0 then
    if LerMotivoNegacao(SAM_ERRO_EVENTOINVALIDO, vRegimePgto, gLiberaPorAuxilio) <> nulo then
    begin
      qEventosValidos.Close;
      qEventosValidos.ParamByName('EVENTO').Value := pEvento;
      qEventosValidos.ParamByName('TIPOAUTORIZACAO').Value := pTipoAutorizacao;
      qEventosValidos.Open;
      if qEventosValidos.IsEmpty then
        MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOINVALIDO, '', -1);
      qEventosValidos.Close;
    end;

  //Junior - 20/02/2001
  //Negação quando o usuário não tem nível para autorizar o evento

//  if vgOrigemDoProcesso = 'A' then
//07/04 - retirada a checagem pois só dava essa negação na autorização, a pedido do Larini
// deveria dar também no processamento de contas ao processar um PEG. Juliana
  if LerMotivoNegacao(SAM_ERRO_USUARIONAOTEMNIVEL, vRegimePgto, gLiberaPorAuxilio) <> nulo then
  begin
    GRUPOUSUARIO.Close;
    GRUPOUSUARIO.ParamByName('HGRUPOUSUARIO').AsInteger :=
      vgCurrentUser;
    GRUPOUSUARIO.Open;

    if GRUPOUSUARIO.FieldByName('NIVELAUTORIZACAO').AsInteger <
      samauto_TGE.FieldByName('NIVELAUTORIZACAO').AsInteger then
      MontaNegacao(pHandleOrigem, SAM_ERRO_USUARIONAOTEMNIVEL, '', -1);
    GRUPOUSUARIO.Close;
  end;

  //VERIFICAR EVENTOS DEPENDENTES
  if LerMotivoNegacao(SAM_ERRO_EVENTODEPENDENTE, vRegimePgto, gLiberaPorAuxilio) <> nulo then
  begin
    aux := ChecarEventoDependente(pEvento, pEvento, pMatricula);
    vgDependencia := aux;
    if aux <> 0 then
    begin
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT ESTRUTURA, DESCRICAO FROM SAM_TGE WHERE HANDLE=:EVENTO');
      Q.Prepare;
      if aux = -1 then
      begin
        Q.ParamByName('EVENTO').Value := pEvento;
        Q.Open;
        vgEventoDependente := Q.FieldByName('DESCRICAO').AsString;
        if Sys.VisibleMode then
          ShowMessage('Evento em loop de dependencia: ' +
            Q.FieldByName('ESTRUTURA').AsString + '-' +
            Q.FieldByName('DESCRICAO').AsString
            );
      end
      else
      begin
        Q.ParamByName('EVENTO').AsInteger := aux;
        Q.Open;
        //Junior - 03/05/2000
        MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTODEPENDENTE, Q.FieldByName('DESCRICAO').AsString, -1);
      end;
    end;
  end;
  // Verificar se o evento comporta o grau solicitado na autorização.
  if (LerMotivoNegacao(SAM_ERRO_EVENTOGRAU, vRegimePgto, gLiberaPorAuxilio) <> nulo) and (VerificaGrauValido(pGrauGerado)) then
  begin
    //Application.hint := 'Checando se o evento suporta o grau...';
    //VERIFICAR SE O EVENTO SUPORTA O GRAU
    samauto_TGE_GRAU.Close;
    samauto_TGE_GRAU.ParamByName('EVENTO').Value := pEvento;
    samauto_TGE_GRAU.ParamByName('GRAU').Value := pGrauGerado;
    samauto_TGE_GRAU.Open;
    if samauto_TGE_GRAU.IsEmpty then
      MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOGRAU, '', -1);
    samauto_TGE_GRAU.Close;
  end;

  //Gera uma negação se o evento exige exame PRE-OPERATORIO
  if (samauto_TGE.FieldByName('EXAMEPREOPERATORIO').AsString = 'S') or
    ((samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('GERARPERICIAMANUAL').AsString = 'S') and
    (LerMotivoNegacao(SAM_ERRO_EVENTOPREOPERATORIO, vRegimePgto, gLiberaPorAuxilio) <> nulo)) then
    MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOPREOPERATORIO, '', -1);

  //Gera uma negaçao se o evento exige exame PÓS-OPERATÓRIO
  if (samauto_TGE.FieldByName('EXAMEPOSOPERATORIO').AsString = 'S') then
  begin
    if vgOrigemdoProcesso = 'P' then
      MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOPOSOPERATORIO, '', -1)
    else
    begin
      FrmAlertas.MontaObs(format('O evento %s (%s) exige perícia após sua realização.',
        [samauto_TGE.FieldByName('ESTRUTURA').AsString,
        samauto_TGE.FieldByName('DESCRICAO').AsString]
          )
        );
    end;
  end;

  //JUSTIFICATIVA MEDICA
  if (samauto_TGE.FieldByName('JUSTIFICATIVA').AsString = 'S') then
    MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOJUSTIFICATIVA, '', -1);

  if (samauto_TGE.FieldByName('PARECERADMINISTRATIVO').AsString = 'S') then
    MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOPARECERADMINISTRATIVO, '', -1);

  if (vgCodigoPagto > 0) and
    (vgCodigoPagto <> SAM_PARAMETROSGERAIS.FieldByName('CODIGOPAGTO').AsInteger) then
  begin
    //Verificar evento
    if LerMotivoNegacao(SAM_ERRO_EVENTOCODIGOPAGTO, vRegimePgto, gLiberaPorAuxilio) <> nulo then
    begin
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT COMPORTACODIGOPAGTO');
      Q.SQL.Add('FROM SAM_TGE');
      Q.SQL.Add('WHERE HANDLE = :HEVENTO');
      Q.ParamByName('HEVENTO').AsInteger := pEvento;
      Q.Open;

      if Q.FieldByName('COMPORTACODIGOPAGTO').AsString = 'N' then
        MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOCODIGOPAGTO, '', -1);
      Q.Close;
    end;

    //Verificar grau
    if LerMotivoNegacao(SAM_ERRO_GRAUCODIGOPAGTO, vRegimePgto, gLiberaPorAuxilio) <> nulo then
    begin
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT COMPORTACODIGOPAGTO');
      Q.SQL.Add('FROM SAM_GRAU');
      Q.SQL.Add('WHERE HANDLE = :HGRAU');
      Q.ParamByName('HGRAU').AsInteger := pGrauGerado;
      Q.Open;

      if Q.FieldByName('COMPORTACODIGOPAGTO').AsString = 'N' then
        MontaNegacao(pHandleOrigem, SAM_ERRO_GRAUCODIGOPAGTO, '', -1);
      Q.Close;
    end;
  end;

  //Junior - 30/01/2001
  //Verificar se o grau aceita XTHM
  if (vgXTHM > 0) and
    (vgXTHM <> SAM_PARAMETROSGERAIS.FieldByName('CODIGOXTHM').AsInteger) then
  begin
    if LerMotivoNegacao(SAM_ERRO_GRAUXTHM, vRegimePgto, gLiberaPorAuxilio) <> nulo then
    begin
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT XTHM');
      Q.SQL.Add('FROM SAM_GRAU');
      Q.SQL.Add('WHERE HANDLE = :HGRAU');
      Q.ParamByName('HGRAU').AsInteger := pGrauGerado;
      Q.Open;

      if Q.FieldByName('XTHM').AsString = 'N' then
        MontaNegacao(pHandleOrigem, SAM_ERRO_GRAUXTHM, '', -1);
      Q.Close;
    end;
  end;

  //Junior - 31/08/2000
  //Não testar se o beneficiário for nulo
  if pBeneficiario > 0 then
  begin
    //Verificar se a ocorrência máxima na vida
    //Junior - 25/01/2001
    //Se a ocorrência máxima estiver nula
    //não dar a negação
    //juliana 23/04/2002 se o registro no prontuario for todos ou for só o principal(verifiar se o gerado é o principa;)

    if (not (samauto_TGE.FieldByName('OCORRENCIAMAXIMA').isNull)) and
      ((samauto_TGE.FieldByName('PRONTUARIO').AsString = 'T') or
      ((samauto_TGE.FieldByName('PRONTUARIO').AsString = 'P') and (pGrauGerado = samauto_TGE.FieldByName('GRAUPRINCIPAL').AsInteger))) and
      (LerMotivoNegacao(SAM_ERRO_EVENTOOCORRENCIAVIDA, vRegimePgto, gLiberaPorAuxilio) <> nulo) then
    begin
      //VERIFICAR A OCORRENCIA NA VIDA
      samauto_PRONTUARIO.Close;
      samauto_PRONTUARIO.ParamByName('MATRICULA').Value := pMatricula;
      samauto_PRONTUARIO.ParamByName('EVENTO').Value := pEvento;
      samauto_PRONTUARIO.Open;
      //Junior - 04/05/2000
      if (pQuantidade +
        samauto_PRONTUARIO.FieldByName('OCORRENCIA').AsInteger) >
        samauto_TGE.FieldByName('OCORRENCIAMAXIMA').AsInteger then
      begin
        if samauto_PRONTUARIO.FieldByName('OCORRENCIA').AsInteger <
          samauto_TGE.FieldByName('OCORRENCIAMAXIMA').AsInteger then
          vQtdAutorizada := samauto_TGE.FieldByName('OCORRENCIAMAXIMA').AsInteger -
            samauto_PRONTUARIO.FieldByName('OCORRENCIA').AsInteger
        else
          vQtdAutorizada := 0;

        vComplemento := 'Ocorrências até agora.: %s' + #13 +
          'Máximo permitido......: %s' + #13 +
          'Quantidade solicitada.: %s' + #13 +
          'Liberação máxima atual: %s';
        vComplemento := format(vComplemento,
          [samauto_PRONTUARIO.FieldByName('OCORRENCIA').AsString,
          samauto_TGE.FieldByName('OCORRENCIAMAXIMA').AsString,
            FloatToStr(pQuantidade),
            FloatToStr(vQtdAutorizada)]
            );
        MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOOCORRENCIAVIDA, vComplemento,
          vQtdAutorizada);
      end;
    end;

    if pExecutor <> nulo then
    begin
      PRAZOPRESTADOR.Close;
      PRAZOPRESTADOR.ParamByName('EVENTO').AsInteger := pEvento;
      PRAZOPRESTADOR.ParamByName('PRESTADOR').AsInteger := pExecutor;
      PRAZOPRESTADOR.Open;
    end;

    if (pExecutor <> nulo) and (not PRAZOPRESTADOR.IsEmpty) and
      (LerMotivoNegacao(SAM_ERRO_EVENTOINTERVALAR, vRegimePgto, gLiberaPorAuxilio) <> nulo) then
    begin

      vInicioIntervalo := pData - (PRAZOPRESTADOR.FieldByName('PRAZOINTERVALAR').AsInteger - 1);
      vPeriodoBusca := (2 * PRAZOPRESTADOR.FieldByName('PRAZOINTERVALAR').AsInteger) - 1;

      PRAZO_INTERVALAR_AUTORIZ.Close;
      PRAZO_INTERVALAR_GUIA.Close;
      PRAZO_INTERVALAR_AUX.Close;

      // DEFINE QUERYS DO PRAZO INTERVALAR  PARA AUTORIZACAO E PARA EVENTO
      // RODRIGO - A PEDIDO DO LARINI FOI ALTERADA A QUERY DE PRAZO INTERVALAR E QUEBRADA
      // NAS DUAS QUERYS ABAIXO.
      PRAZO_INTERVALAR_AUTORIZ.SQL.Clear;
      PRAZO_INTERVALAR_AUTORIZ.Close;
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('SELECT NUMERO , SOLICITANTE, RECEBEDOR, EXECUTOR, DATA, SUM(QUANTIDADE) OCORRENCIA, CONDICAO, ORIGEM');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('FROM');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('(');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('SELECT A.AUTORIZACAO NUMERO, P1.NOME SOLICITANTE, P2.NOME RECEBEDOR, P3.NOME EXECUTOR, EG.DATAATENDIMENTO DATA, SUM(QTDAUTORIZADA) QUANTIDADE, ''A'' ORIGEM, CA.DESCRICAO CONDICAO');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO EG');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  JOIN SAM_AUTORIZ_EVENTOSOLICIT ES ON (EG.EVENTOSOLICITADO = ES.HANDLE)');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  JOIN SAM_AUTORIZ A ON (ES.AUTORIZACAO = A.HANDLE)');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  JOIN SAM_CONDATENDIMENTO CA ON (A.CONDICAOATENDIMENTO = CA.HANDLE)');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  LEFT JOIN SAM_PRESTADOR P1 ON (ES.SOLICITANTE = P1.HANDLE)');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  LEFT JOIN SAM_PRESTADOR P2 ON (ES.RECEBEDOR = P2.HANDLE)');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  LEFT JOIN SAM_PRESTADOR P3 ON (ES.EXECUTOR = P3.HANDLE)');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add(' WHERE  (EG.HANDLE <> :HEVENTOGERADO)');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (EG.EVENTOGERADO = :EVENTO)');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (EG.SENHA <> :SENHA)');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (ES.AUTORIZACAO <> :HAUTORIZ)');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (ES.SITUACAO = ''A'')');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (A.BENEFICIARIO=:BENEFICIARIO)');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (EG.DATAATENDIMENTO BETWEEN :DATAINICIAL AND :DATAFINAL)');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (EG.SITUACAO IN (''A'',''L''))');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND NOT EXISTS(SELECT EVENTOGERADO');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('               FROM SAM_GUIA_EVENTOS_AUTORIZ');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('               WHERE EVENTOGERADO = EG.HANDLE)');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add(' GROUP BY EG.DATAATENDIMENTO, A.AUTORIZACAO, P1.NOME, P2.NOME, P3.NOME, DESCRICAO');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add(' ) X');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  GROUP BY DATA, NUMERO, SOLICITANTE, EXECUTOR, RECEBEDOR, CONDICAO, ORIGEM');
      PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  ORDER BY DATA');

      PRAZO_INTERVALAR_GUIA.SQL.Clear;
      PRAZO_INTERVALAR_GUIA.Close;
      PRAZO_INTERVALAR_GUIA.SQL.Add(' SELECT B.GUIA NUMERO, P3.NOME SOLICITANTE, P1.NOME RECEBEDOR, P2.NOME EXECUTOR, A.DATAATENDIMENTO DATA, SUM(QTDPAGTO) QUANTIDADE, ''G'' ORIGEM, CA.DESCRICAO CONDICAO');
      PRAZO_INTERVALAR_GUIA.SQL.Add('   FROM SAM_GUIA_EVENTOS A');
      PRAZO_INTERVALAR_GUIA.SQL.Add('   JOIN SAM_GUIA B ON (A.GUIA = B.HANDLE)');
      //      PRAZO_INTERVALAR_GUIA.SQL.Add('   LEFT JOIN SAM_AUTORIZ SA ON (B.AUTORIZACAO = SA.HANDLE)');
      PRAZO_INTERVALAR_GUIA.SQL.Add('   LEFT JOIN SAM_CONDATENDIMENTO CA ON (B.CONDICAOATENDIMENTO = CA.HANDLE)');
      PRAZO_INTERVALAR_GUIA.SQL.Add('   LEFT JOIN SAM_PRESTADOR P1 ON (A.RECEBEDOR = P1.HANDLE)');
      PRAZO_INTERVALAR_GUIA.SQL.Add('   LEFT JOIN SAM_PRESTADOR P2 ON (A.EXECUTOR = P2.HANDLE)');
      PRAZO_INTERVALAR_GUIA.SQL.Add('   LEFT JOIN SAM_PRESTADOR P3 ON (B.SOLICITANTE = P3.HANDLE)');
      PRAZO_INTERVALAR_GUIA.SQL.Add('  WHERE (A.DATAATENDIMENTO BETWEEN :DATAINICIAL AND :DATAFINAL)');
      PRAZO_INTERVALAR_GUIA.SQL.Add('    AND   (A.EVENTO = :EVENTO)');
      PRAZO_INTERVALAR_GUIA.SQL.Add('    AND   (A.BENEFICIARIO = :BENEFICIARIO)');
      PRAZO_INTERVALAR_GUIA.SQL.Add('    AND   (A.HANDLE <> :HGUIAEVENTO)');
      PRAZO_INTERVALAR_GUIA.SQL.Add('  GROUP BY B.GUIA, A.DATAATENDIMENTO, P3.NOME, P1.NOME, P2.NOME, P3.NOME, DESCRICAO');
      /// FIM  -

      //Junior - 20/09/2000
      //Testar a origem do processo
      if vgOrigemDoProcesso = 'P' then
      begin
        //Junior - 17/01/2001
        //Testar se samauto_GUIAEVENTOS está ligada a samauto_AUTORIZ_EVENTOGERADO
        samauto_GUIAEVENTOS.Close;
        samauto_GUIAEVENTOS.ParamByName('HGUIAEVENTO').AsInteger := pHandleOrigem;
        samauto_GUIAEVENTOS.Open;

        PRAZO_INTERVALAR_AUTORIZ.ParamByName('HAUTORIZ').AsInteger :=
          samauto_GUIAEVENTOS.FieldByName('AUTORIZACAO').AsInteger;

        PRAZO_INTERVALAR_AUTORIZ.ParamByName('SENHA').AsInteger :=
          samauto_GUIAEVENTOS.FieldByName('SENHA').AsInteger;

        PRAZO_INTERVALAR_AUX.ParamByName('HAUTORIZ').AsInteger :=
          samauto_GUIAEVENTOS.FieldByName('AUTORIZACAO').AsInteger;

        PRAZO_INTERVALAR_AUX.ParamByName('SENHA').AsInteger :=
          samauto_GUIAEVENTOS.FieldByName('SENHA').AsInteger;
        samauto_GUIAEVENTOS.Close;

        PRAZO_INTERVALAR_AUTORIZ.ParamByName('HEVENTOGERADO').AsInteger := 0;
        // juliana 21384 não estava passando o evento
        PRAZO_INTERVALAR_AUTORIZ.ParamByName('EVENTO').Value := 0;
        //        PRAZO_INTERVALAR_AUTORIZ.ParamByName('HGUIAEVENTO').asInteger := pHandleOrigem;
        PRAZO_INTERVALAR_AUX.ParamByName('HEVENTOGERADO').AsInteger := 0;
        PRAZO_INTERVALAR_AUX.ParamByName('HGUIAEVENTO').AsInteger := pHandleOrigem;
      end
      else
      begin
        //Junior - 17/01/2001
        PRAZO_INTERVALAR_AUTORIZ.ParamByName('HAUTORIZ').AsInteger := 0;
        PRAZO_INTERVALAR_AUTORIZ.ParamByName('SENHA').AsInteger := 0;

        PRAZO_INTERVALAR_AUX.ParamByName('HAUTORIZ').AsInteger := 0;
        PRAZO_INTERVALAR_AUX.ParamByName('SENHA').AsInteger := 0;

        PRAZO_INTERVALAR_AUTORIZ.ParamByName('EVENTO').Value := pEvento;
        PRAZO_INTERVALAR_AUTORIZ.ParamByName('HEVENTOGERADO').AsInteger := pHandleOrigem;
        //        PRAZO_INTERVALAR_AUTORIZ.ParamByName('HGUIAEVENTO').asInteger := 0;
        PRAZO_INTERVALAR_AUX.ParamByName('HEVENTOGERADO').AsInteger := pHandleOrigem;
        PRAZO_INTERVALAR_AUX.ParamByName('HGUIAEVENTO').AsInteger := 0;
      end;

      PRAZO_INTERVALAR_GUIA.ParamByName('HGUIAEVENTO').AsInteger := pHandleOrigem;
      PRAZO_INTERVALAR_GUIA.ParamByName('EVENTO').AsInteger := pEvento;
      PRAZO_INTERVALAR_GUIA.ParamByName('DATAINICIAL').AsDateTime := vInicioIntervalo;
      //Junior - 17/01/2001
      PRAZO_INTERVALAR_GUIA.ParamByName('DATAFINAL').AsDateTime := pData + (PRAZOPRESTADOR.FieldByName('PRAZOINTERVALAR').AsInteger - 1);

      PRAZO_INTERVALAR_AUTORIZ.ParamByName('BENEFICIARIO').AsInteger := pBeneficiario;
      PRAZO_INTERVALAR_GUIA.ParamByName('BENEFICIARIO').AsInteger := pBeneficiario;

      PRAZO_INTERVALAR_AUTORIZ.ParamByName('DATAINICIAL').AsDateTime := vInicioIntervalo;
      //Junior - 17/01/2001
      PRAZO_INTERVALAR_AUTORIZ.ParamByName('DATAFINAL').AsDateTime := pData + (PRAZOPRESTADOR.FieldByName('PRAZOINTERVALAR').AsInteger - 1);

      //Junior - 26/07/2000
      //Fazer a checagem com o grau gerado
      //      PRAZO_INTERVALAR_AUTORIZ.ParamByName('GRAU').asInteger := pGrauGerado;
      //      PRAZO_INTERVALAR_GUIA.ParamByName('GRAU').asInteger := pGrauGerado;
      // PARA PRESTADOR NAO TEM GRAU.

      PRAZO_INTERVALAR_AUX.ParamByName('BENEFICIARIO').AsInteger := pBeneficiario;
      PRAZO_INTERVALAR_AUX.ParamByName('EVENTO').AsInteger := pEvento;
      PRAZO_INTERVALAR_AUX.ParamByName('GRAU').AsInteger := pGrauGerado;

      PRAZO_INTERVALAR_AUTORIZ.Open;

      // Rodrigo - Separando querys de prazo intervalar da autorizacao de query de prazo intervalar da guia
      if PRAZO_INTERVALAR_AUTORIZ.IsEmpty then
        PRAZO_INTERVALAR_GUIA.Open;
      // Fim

      if (PRAZO_INTERVALAR_AUTORIZ.IsEmpty) and (PRAZO_INTERVALAR_GUIA.IsEmpty) then
      begin
        if PRAZOPRESTADOR.Active then // tava dando pau aqui
          if pQuantidade >
            PRAZOPRESTADOR.FieldByName('QTDAMAXIMAINTERVALAR').AsInteger then
          begin
            vQtdAutorizada := PRAZOPRESTADOR.FieldByName('QTDAMAXIMAINTERVALAR').AsInteger;

            vComplemento := 'Restrição do prazo intervalar no Prestador !' + #13 +
              'Nenhum Evento ocorrido anteriormente' + #13 +
              'Quantidade permitida para o intervalo : %s' + #13 +
              'Quantidade solicitada: %s' + #13 +
              'Liberação máxima atual: %s';
            vComplemento := format(vComplemento,
              [PRAZOPRESTADOR.FieldByName('QTDAMAXIMAINTERVALAR').AsString,
              FloatToStr(pQuantidade),
                FloatToStr(vQtdAutorizada)
                ]
                );
            vVerifica := nulo;
            MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOINTERVALAR, vComplemento,
              vQtdAutorizada)
          end;
      end
      else
      begin
        //Montar lista de datas
        SetLength(vPrazoIntervalar, vPeriodoBusca);
        for i := 0 to vPeriodoBusca - 1 do
        begin
          vPrazoIntervalar[i].Data := vInicioIntervalo + i;
          vPrazoIntervalar[i].Quantidade := 0;
        end;

        //Alimentar o intervalo
        while not PRAZO_INTERVALAR_AUTORIZ.EOF do
        begin
          i := Trunc(PRAZO_INTERVALAR_AUTORIZ.FieldByName('DATA').AsDateTime - vInicioIntervalo);
          vPrazoIntervalar[i].Quantidade :=
            PRAZO_INTERVALAR_AUTORIZ.FieldByName('OCORRENCIA').AsFloat;

          PRAZO_INTERVALAR_AUTORIZ.Next;
        end;

        while not PRAZO_INTERVALAR_GUIA.EOF do
        begin
          i := Trunc(PRAZO_INTERVALAR_GUIA.FieldByName('DATA').AsDateTime - vInicioIntervalo);
          vPrazoIntervalar[i].Quantidade :=
            PRAZO_INTERVALAR_GUIA.FieldByName('QUANTIDADE').AsFloat;

          PRAZO_INTERVALAR_GUIA.Next;
        end;

        vComplementoPrazoIntervalar := '';

        //Fazer o janelamento
        //Junior - 18/01/2001
        for i := 0 to (PRAZOPRESTADOR.FieldByName('PRAZOINTERVALAR').AsInteger - 1) do
        begin
          vOcorrenciasIntervalo := 0;
          //Junior - 18/01/2001
          for j := i to i + (PRAZOPRESTADOR.FieldByName('PRAZOINTERVALAR').AsInteger - 1) do
            vOcorrenciasIntervalo := vOcorrenciasIntervalo +
              vPrazoIntervalar[j].Quantidade;

          if (pQuantidade +
            vOcorrenciasIntervalo) >
            PRAZOPRESTADOR.FieldByName('QTDAMAXIMAINTERVALAR').AsInteger then
          begin
            //Junior - 08/01/2001
            vQtdAutorizada := 0;

            vComplementoPrazoIntervalar := 'Restrição do prazo intervalar no Prestador !' + #13 +
              'Verificar todo o período anterior e posterior à solicitação' + #13#10;

            Break;
          end;
        end;
        if vComplementoPrazoIntervalar <> '' then
        begin
          MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOINTERVALAR, vComplementoPrazoIntervalar,
            vQtdAutorizada);
          vVerifica := nulo;
        end;
      end;

      vPrazoIntervalar := nil;
      PRAZO_INTERVALAR_AUTORIZ.Close;
      PRAZO_INTERVALAR_AUX.Close;
    end
      //****************************************************
      // Se não encontrou no Prestador procurar no Evento
      //****************************************************
      // Aqui termina a verificaÇão do prazo intervalar -- para O PRESTADOR
      //******************************************************************************
      //VERIFICAR PRAZO INTERVALAR do EVENTO
      // vVerifica = - 1 ==> achou uma negação no prazo do prestador , não precisa procurar no Evento (samauto_TGE)
    else
    begin
      // Eduardo - 04/08/2004 - SMS 31324
      // Adicionada checagem se prazo intervalar no evento for por grau verifica campo
      // PROVIDENCIAPRAZO na SAM_TGE_GRAU ao invés da SAM_TGE
      samauto_TGE_GRAU.Close;
      samauto_TGE_GRAU.ParamByName('EVENTO').Value := pEvento;
      samauto_TGE_GRAU.ParamByName('GRAU').Value := pGrauGerado;
      samauto_TGE_GRAU.Open;
      if (LerMotivoNegacao(SAM_ERRO_EVENTOINTERVALAR, vRegimePgto, gLiberaPorAuxilio) <> nulo) and
        ((samauto_TGE.FieldByName('PROVIDENCIAPRAZO').AsString <> 'N') and (samauto_TGE.FieldByName('TABPRAZOINTERVALAR').AsString = '1') or
        (samauto_TGE_GRAU.FieldByName('PROVIDENCIAPRAZO').AsString <> 'N') and (samauto_TGE.FieldByName('TABPRAZOINTERVALAR').AsString = '2')) and
        (vVerifica <> nulo) then
        // fim SMS 31324
      begin
        // Fábio - 29/01/2003
        // Prazo intervalar por grau.
        // Antes já estava considerando grau a grau, apenas mudou o local onde se pega prazo (evento ou grau)
        PRAZOINTERVALAR_EVENTO_GRAU.Close;
        PRAZOINTERVALAR_EVENTO_GRAU.ParamByName('EVENTO').Value := pEvento;
        PRAZOINTERVALAR_EVENTO_GRAU.ParamByName('GRAU').Value := pGrau;
        PRAZOINTERVALAR_EVENTO_GRAU.Open;

        // DEFINE QUERYS DO PRAZO INTERVALAR  PARA AUTORIZACAO E PARA EVENTO
        // RODRIGO - A PEDIDO DO LARINI FOI ALTERADA A QUERY DE PRAZO INTERVALAR E QUEBRADA
        // NAS DUAS QUERYS ABAIXO.
        PRAZO_INTERVALAR_AUTORIZ.SQL.Clear;
        PRAZO_INTERVALAR_AUTORIZ.Close;
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('SELECT NUMERO , SOLICITANTE, RECEBEDOR, EXECUTOR, DATA, SUM(QUANTIDADE) OCORRENCIA, CONDICAO, ORIGEM');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('FROM');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('(');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('SELECT A.AUTORIZACAO NUMERO, P1.NOME SOLICITANTE, P2.NOME RECEBEDOR, P3.NOME EXECUTOR, EG.DATAATENDIMENTO DATA, SUM(QTDAUTORIZADA) QUANTIDADE, ''A'' ORIGEM, CA.DESCRICAO CONDICAO');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO EG');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  JOIN SAM_AUTORIZ_EVENTOSOLICIT ES ON (EG.EVENTOSOLICITADO = ES.HANDLE)');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  JOIN SAM_AUTORIZ A ON (ES.AUTORIZACAO = A.HANDLE)');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  JOIN SAM_CONDATENDIMENTO CA ON (A.CONDICAOATENDIMENTO = CA.HANDLE)');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  LEFT JOIN SAM_PRESTADOR P1 ON (ES.SOLICITANTE = P1.HANDLE)');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  LEFT JOIN SAM_PRESTADOR P2 ON (ES.RECEBEDOR = P2.HANDLE)');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  LEFT JOIN SAM_PRESTADOR P3 ON (ES.EXECUTOR = P3.HANDLE)');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add(' WHERE  (EG.HANDLE <> :HEVENTOGERADO)');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (EG.EVENTOGERADO = :EVENTO)');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (EG.SENHA <> :SENHA)');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (ES.AUTORIZACAO <> :HAUTORIZ)');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (ES.SITUACAO = ''A'')');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (A.BENEFICIARIO=:BENEFICIARIO)');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (EG.DATAATENDIMENTO BETWEEN :DATAINICIAL AND :DATAFINAL)');
        if PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('TABPRAZOINTERVALAR').AsString = '2' then
          PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (EG.GRAUGERADO=:GRAU)');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND  (EG.SITUACAO IN (''A'',''L''))');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('   AND NOT EXISTS(SELECT EVENTOGERADO');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('               FROM SAM_GUIA_EVENTOS_AUTORIZ');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('               WHERE EVENTOGERADO = EG.HANDLE)');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add(' GROUP BY EG.DATAATENDIMENTO, A.AUTORIZACAO, P1.NOME, P2.NOME, P3.NOME, DESCRICAO');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add(' ) X');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  GROUP BY DATA, NUMERO, SOLICITANTE, EXECUTOR, RECEBEDOR, CONDICAO, ORIGEM');
        PRAZO_INTERVALAR_AUTORIZ.SQL.Add('  ORDER BY DATA');

        PRAZO_INTERVALAR_GUIA.SQL.Clear;
        PRAZO_INTERVALAR_GUIA.Close;
        PRAZO_INTERVALAR_GUIA.SQL.Add(' SELECT B.GUIA NUMERO, P3.NOME SOLICITANTE, P1.NOME RECEBEDOR, P2.NOME EXECUTOR, A.DATAATENDIMENTO DATA, SUM(QTDPAGTO) QUANTIDADE, ''G'' ORIGEM, CA.DESCRICAO CONDICAO');
        PRAZO_INTERVALAR_GUIA.SQL.Add('   FROM SAM_GUIA_EVENTOS A');
        PRAZO_INTERVALAR_GUIA.SQL.Add('   JOIN SAM_GUIA B ON (A.GUIA = B.HANDLE)');
        PRAZO_INTERVALAR_GUIA.SQL.Add('   LEFT JOIN SAM_AUTORIZ SA ON (B.AUTORIZACAO = SA.HANDLE)');
        PRAZO_INTERVALAR_GUIA.SQL.Add('   LEFT JOIN SAM_CONDATENDIMENTO CA ON (SA.CONDICAOATENDIMENTO = CA.HANDLE)');
        PRAZO_INTERVALAR_GUIA.SQL.Add('   LEFT JOIN SAM_PRESTADOR P1 ON (A.RECEBEDOR = P1.HANDLE)');
        PRAZO_INTERVALAR_GUIA.SQL.Add('   LEFT JOIN SAM_PRESTADOR P2 ON (A.EXECUTOR = P2.HANDLE)');
        PRAZO_INTERVALAR_GUIA.SQL.Add('   LEFT JOIN SAM_PRESTADOR P3 ON (B.SOLICITANTE = P3.HANDLE)');
        PRAZO_INTERVALAR_GUIA.SQL.Add('  WHERE (A.DATAATENDIMENTO BETWEEN :DATAINICIAL AND :DATAFINAL)');
        PRAZO_INTERVALAR_GUIA.SQL.Add('    AND   (A.EVENTO = :EVENTO)');
        PRAZO_INTERVALAR_GUIA.SQL.Add('    AND   (A.BENEFICIARIO = :BENEFICIARIO)');
        PRAZO_INTERVALAR_GUIA.SQL.Add('    AND   (A.HANDLE <> :HGUIAEVENTO)');
        if PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('TABPRAZOINTERVALAR').AsString = '2' then
          PRAZO_INTERVALAR_GUIA.SQL.Add('    AND    (A.GRAU = :GRAU)');
        PRAZO_INTERVALAR_GUIA.SQL.Add('  GROUP BY B.GUIA, A.DATAATENDIMENTO, P3.NOME, P1.NOME, P2.NOME, P3.NOME, DESCRICAO');
        /// FIM  -
        vInicioIntervalo := pData - (PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('PRAZOINTERVALAR').AsInteger - 1);
        vPeriodoBusca := (2 * PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('PRAZOINTERVALAR').AsInteger) - 1;

        PRAZO_INTERVALAR_AUTORIZ.Close;
        PRAZO_INTERVALAR_GUIA.Close;

        //Testar a origem do processo
        if vgOrigemDoProcesso = 'P' then
        begin
          //Testar se SAM_GUIAEVENTOS está ligada a SAM_AUTORIZ_EVENTOGERADO
          samauto_GUIAEVENTOS.Close;
          samauto_GUIAEVENTOS.ParamByName('HGUIAEVENTO').AsInteger := pHandleOrigem;
          samauto_GUIAEVENTOS.Open;

          PRAZO_INTERVALAR_AUTORIZ.ParamByName('HAUTORIZ').AsInteger :=
            samauto_GUIAEVENTOS.FieldByName('AUTORIZACAO').AsInteger;

          PRAZO_INTERVALAR_AUTORIZ.ParamByName('SENHA').AsInteger :=
            samauto_GUIAEVENTOS.FieldByName('SENHA').AsInteger;

          PRAZO_INTERVALAR_AUX.ParamByName('HAUTORIZ').AsInteger :=
            samauto_GUIAEVENTOS.FieldByName('AUTORIZACAO').AsInteger;

          PRAZO_INTERVALAR_AUX.ParamByName('SENHA').AsInteger :=
            samauto_GUIAEVENTOS.FieldByName('SENHA').AsInteger;

          samauto_GUIAEVENTOS.Close;

          PRAZO_INTERVALAR_AUTORIZ.ParamByName('EVENTO').Value := pEvento;
          PRAZO_INTERVALAR_AUTORIZ.ParamByName('HEVENTOGERADO').AsInteger := 0;
          //PRAZO_INTERVALAR_AUTORIZ.ParamByName('HGUIAEVENTO').asInteger := pHandleOrigem;

          PRAZO_INTERVALAR_AUX.ParamByName('HEVENTOGERADO').AsInteger := 0;
          PRAZO_INTERVALAR_AUX.ParamByName('HGUIAEVENTO').AsInteger := pHandleOrigem;

        end
        else
        begin
          PRAZO_INTERVALAR_AUTORIZ.ParamByName('HAUTORIZ').AsInteger := 0;
          PRAZO_INTERVALAR_AUTORIZ.ParamByName('SENHA').AsInteger := 0;
          PRAZO_INTERVALAR_AUX.ParamByName('HAUTORIZ').AsInteger := 0;
          PRAZO_INTERVALAR_AUX.ParamByName('SENHA').AsInteger := 0;

          PRAZO_INTERVALAR_AUTORIZ.ParamByName('EVENTO').Value := pEvento;
          PRAZO_INTERVALAR_AUTORIZ.ParamByName('HEVENTOGERADO').AsInteger := pHandleOrigem;
          //PRAZO_INTERVALAR_AUTORIZ.ParamByName('HGUIAEVENTO').asInteger := 0;
          PRAZO_INTERVALAR_AUX.ParamByName('HEVENTOGERADO').AsInteger := pHandleOrigem;
          PRAZO_INTERVALAR_AUX.ParamByName('HGUIAEVENTO').AsInteger := 0;
        end;

        PRAZO_INTERVALAR_GUIA.ParamByName('BENEFICIARIO').AsInteger := pBeneficiario;
        PRAZO_INTERVALAR_GUIA.ParamByName('HGUIAEVENTO').AsInteger := pHandleOrigem;
        PRAZO_INTERVALAR_GUIA.ParamByName('EVENTO').AsInteger := pEvento;

        if PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('TABPRAZOINTERVALAR').AsString = '2' then
          PRAZO_INTERVALAR_GUIA.ParamByName('GRAU').AsInteger := pGrauGerado;

        PRAZO_INTERVALAR_GUIA.ParamByName('DATAINICIAL').AsDateTime := vInicioIntervalo;
        PRAZO_INTERVALAR_GUIA.ParamByName('DATAFINAL').AsDateTime := pData + (PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('PRAZOINTERVALAR').AsInteger - 1);

        PRAZO_INTERVALAR_AUTORIZ.ParamByName('BENEFICIARIO').AsInteger := pBeneficiario;
        PRAZO_INTERVALAR_AUTORIZ.ParamByName('EVENTO').AsInteger := pEvento;
        PRAZO_INTERVALAR_AUTORIZ.ParamByName('HEVENTOGERADO').AsInteger := pHandleOrigem;
        PRAZO_INTERVALAR_AUTORIZ.ParamByName('DATAINICIAL').AsDateTime := vInicioIntervalo;
        PRAZO_INTERVALAR_AUTORIZ.ParamByName('DATAFINAL').AsDateTime := pData + (PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('PRAZOINTERVALAR').AsInteger - 1);

        //Fazer a checagem com o grau gerado
        if PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('TABPRAZOINTERVALAR').AsString = '2' then
          PRAZO_INTERVALAR_AUTORIZ.ParamByName('GRAU').AsInteger := pGrauGerado;

        PRAZO_INTERVALAR_AUX.ParamByName('BENEFICIARIO').AsInteger := pBeneficiario;
        PRAZO_INTERVALAR_AUX.ParamByName('EVENTO').AsInteger := pEvento;
        PRAZO_INTERVALAR_AUX.ParamByName('GRAU').AsInteger := pGrauGerado;

        PRAZO_INTERVALAR_AUTORIZ.Open;

        if (PRAZO_INTERVALAR_AUTORIZ.IsEmpty) then
          PRAZO_INTERVALAR_GUIA.Open;

        if (PRAZO_INTERVALAR_AUTORIZ.IsEmpty) and (PRAZO_INTERVALAR_GUIA.IsEmpty) then
        begin
          if pQuantidade >
            PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('QTDMAXIMAINTERVALAR').AsInteger then
          begin
            vQtdAutorizada := PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('QTDMAXIMAINTERVALAR').AsInteger;

            vComplemento := 'Nenhum Evento ocorrido anteriormente' + #13 +
              'Quantidade permitida para o intervalo: %s' + #13 +
              'Quantidade solicitada: %s' + #13 +
              'Liberação máxima atual: %s';
            vComplemento := format(vComplemento,
              [PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('QTDMAXIMAINTERVALAR').AsString,
              FloatToStr(pQuantidade),
                FloatToStr(vQtdAutorizada)
                ]
                );
            if (PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('PROVIDENCIAPRAZO').AsString = 'R') then
              MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOINTERVALAR, vComplemento,
                vQtdAutorizada)
            else if (PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('PROVIDENCIAPRAZO').AsString = 'O') then
            begin
              FrmAlertas.MontaObs('Evento fora do prazo intervalar' + #13#10 + vComplemento);
            end;
          end;
        end
        else
        begin
          //Montar lista de datas
          SetLength(vPrazoIntervalar, vPeriodoBusca);
          for i := 0 to vPeriodoBusca - 1 do
          begin
            vPrazoIntervalar[i].Data := vInicioIntervalo + i;
            vPrazoIntervalar[i].Quantidade := 0;
          end;

          //Alimentar o intervalo
          while not PRAZO_INTERVALAR_AUTORIZ.EOF do
          begin
            i := Trunc(PRAZO_INTERVALAR_AUTORIZ.FieldByName('DATA').AsDateTime - vInicioIntervalo);
            vPrazoIntervalar[i].Quantidade :=
              PRAZO_INTERVALAR_AUTORIZ.FieldByName('OCORRENCIA').AsFloat;

            PRAZO_INTERVALAR_AUTORIZ.Next;
          end;

          while not PRAZO_INTERVALAR_GUIA.EOF do
          begin
            i := Trunc(PRAZO_INTERVALAR_GUIA.FieldByName('DATA').AsDateTime - vInicioIntervalo);
            vPrazoIntervalar[i].Quantidade :=
              PRAZO_INTERVALAR_GUIA.FieldByName('QUANTIDADE').AsFloat;

            PRAZO_INTERVALAR_GUIA.Next;
          end;

          vComplementoPrazoIntervalar := '';

          //Fazer o janelamento
          for i := 0 to (PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('PRAZOINTERVALAR').AsInteger - 1) do
          begin
            vOcorrenciasIntervalo := 0;

            for j := i to i + (PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('PRAZOINTERVALAR').AsInteger - 1) do
              vOcorrenciasIntervalo := vOcorrenciasIntervalo +
                vPrazoIntervalar[j].Quantidade;

            if (pQuantidade +
              vOcorrenciasIntervalo) >
              PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('QTDMAXIMAINTERVALAR').AsInteger then
            begin

              vQtdAutorizada := 0;

              vComplementoPrazoIntervalar := 'Verificar todo o período anterior e posterior à solicitação' + #13#10;

              Break;
            end;
          end;
          if vComplementoPrazoIntervalar <> '' then
            if (PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('PROVIDENCIAPRAZO').AsString = 'R') then
              MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOINTERVALAR, vComplementoPrazoIntervalar,
                vQtdAutorizada)
            else if (PRAZOINTERVALAR_EVENTO_GRAU.FieldByName('PROVIDENCIAPRAZO').AsString = 'O') then
            begin
              FrmAlertas.MontaObs('Evento fora do prazo intervalar' + #13#10 + vComplementoPrazoIntervalar);
            end
        end;

        vPrazoIntervalar := nil;
        PRAZO_INTERVALAR_AUTORIZ.Close;
        PRAZO_INTERVALAR_AUX.Close;
      end;
    end;
    //*********************************************************
    //Aqui termina a verificação do Prazo intervalar do Evento
    //*********************************************************
    DiferencaData(UltimoDiaCompetencia(IncMonth(pData, -1)),
      pBeneficiarioDataNascimento,
      vDias,
      vMeses,
      vIdade);

    //Verificar idade para atendimento
    // se resultado do teste for verdadeiro entao esta fora da idade permitida pelo evento
    if (vIdade < samauto_TGE.FieldByName('IDADEMINIMA').AsInteger) or
      (vIdade > samauto_TGE.FieldByName('IDADEMAXIMA').AsInteger) then
    begin
      vComplemento := 'Idade do beneficiário fora da faixa etária do evento' + #13 +
        'Idade Mínima..:%s' + #13 +
        'Idade Máxima..:%s' + #13 +
        'Idade do Benef:%s' + #13 +
        'Aniversário...:%s' + #13 +
        'Atendimento...:%s';
      vComplemento := format(vcomplemento,
        [samauto_TGE.FieldByName('IDADEMINIMA').AsString,
        samauto_TGE.FieldByName('IDADEMAXIMA').AsString,
          IntToStr(vIdade),
          FormatDateTime('dd "de" mmmm "de" yyyy', pBeneficiarioDataNascimento),
          FormatDateTime('dd "de" mmmm "de" yyyy', pData)]
          );
      if (samauto_TGE.FieldByName('PROVIDENCIAIDADE').AsString = 'R') then
        MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOIDADE, vComplemento, -1)
      else if (samauto_TGE.FieldByName('PROVIDENCIAIDADE').AsString = 'O') then
        FrmAlertas.MontaObs(vComplemento);
    end;

    //Verificar se o sexo é compativel com o evento
    if (pBeneficiarioSexo <> samauto_TGE.FieldByName('SEXO').AsString) and
      (samauto_TGE.FieldByName('SEXO').AsString <> 'A') then
    begin
      if (samauto_TGE.FieldByName('PROVIDENCIASEXO').AsString = 'R') then
        MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOSEXO, '', -1)
      else if (samauto_TGE.FieldByName('PROVIDENCIASEXO').AsString = 'O') then
        FrmAlertas.MontaObs('Sexo do Beneficiário é incompatível com o evento');
    end;

    //Verificar a preexistencia
    //Se a Data Adesao + os meses de preexistencia maior ou igual à data de atendimento verificar preexistencia
    if IncMonth(pBeneficiarioDataAdesao, samauto_TGE.FieldByName('MESESPREEXISTENCIA').AsInteger) > pData then
    begin
      if (samauto_TGE.FieldByName('PREEXISTENCIA').AsString = 'S') then
        MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOPREEXISTENCIA, '', -1)
      else if (samauto_TGE.FieldByName('PREEXISTENCIA').AsString = 'P') then
        MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOPASSIVELPREEXISTENCIA, '', -1);
    end;

    if not SAM_PARAMETROSGERAIS.Active then
      SAM_PARAMETROSGERAIS.Open;

    if vgLOCALATENDIMENTO = SAM_PARAMETROSGERAIS.FieldByName('LOCALATENDIMENTORESSARCIMENTO').AsInteger then
    begin
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT PFINFORMADO');
      Q.SQL.Add('FROM SAM_AUTORIZ_EVENTOGERADO');
      Q.SQL.Add('WHERE HANDLE = :HANDLEORIGEM');
      Q.ParamByName('HANDLEORIGEM').AsInteger :=
        pHandleOrigem;
      Q.Open;
      //Verificar ressarcimento com PF integral
      if not Q.FieldByName('PFINFORMADO').isNull then
      begin
        if (LerMotivoNegacao(SAM_ERRO_BENEFICIARIORESSARCIMENTOPFINTEGRAL, vRegimePgto, gLiberaPorAuxilio) <> nulo) and
          (Q.FieldByName('PFINFORMADO').AsInteger =
          SAM_PARAMETROSGERAIS.FieldByName('CODIGOPFINTEGRAL').AsInteger) then

          MontaNegacao(pHandleOrigem, SAM_ERRO_BENEFICIARIORESSARCIMENTOPFINTEGRAL,
            'Não pode usar PF Integral em regime de ressarcimento', -1);
      end
      else
        ChecarLimitePF(pHandleOrigem, pBeneficiario,
          samauto_BENEFICIARIO.FieldByName('FHANDLE').AsInteger,
          samauto_BENEFICIARIO.FieldByName('CHANDLE').AsInteger, pEvento, pGrau,
          pData, pQuantidade);
      Q.Close;
    end;
  end; //if beneficiario nulo

  //quantidade acima da permitida por cada guia
  //Junior - 25/01/2001
  //Se a incidência máxima estiver nula
  //não dar a negação
  q.SQL.Clear;
  q.Close;
  q.SQL.Add('SELECT CLASSIFICACAO FROM SAM_TIPOGRAU TG');
  q.SQL.Add('                     JOIN SAM_GRAU G ON (G.TIPOGRAU=TG.HANDLE)');
  q.SQL.Add('                     WHERE G.HANDLE = :GRAU');
  q.ParamByName('GRAU').Value := pGrau;
  q.Open;

  if (qparamGeralatendimento.FieldByName('TIPOACOMODACAO').AsString = 'G') and (q.FieldByName('CLASSIFICACAO').AsString = '3') then
  begin
  end
  else
  begin
    if not (samauto_TGE.FieldByName('INCIDENCIAMAXIMAAUTORIZ').isNull) and
      (samauto_TGE.FieldByName('INCIDENCIAMAXIMAAUTORIZ').AsInteger < pQuantidade) then
    begin
      vComplemento := 'Incidência máxima permitida na autorização: %s' + #13 +
        'Quantidade solicitada              : %s';
      vComplemento := format(vComplemento,
        [samauto_TGE.FieldByName('INCIDENCIAMAXIMAAUTORIZ').AsString,
        FloatToStr(pQuantidade)
          ]
          );
      //Junior - 03/05/2000
      MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOINCIDENCIA, vComplemento,
        samauto_TGE.FieldByName('INCIDENCIAMAXIMAAUTORIZ').AsInteger);
    end;
  end;
  //Application.hint := '...';

  // Eduardo - 19/11/2003 - SMS 12674
  // Verifica se negação se evento foi solicitado mais de uma vez na mesma data de atendimento na autorização está ligada
  if LerMotivoNegacao(SAM_ERRO_EVENTOREPETIDODATA, vRegimePgto, gLiberaPorAuxilio) <> nulo then
  begin
    // consultando o Handle da autorizacao, evento solicitado e data atendimento
    qAux.Close;
    qAux.SQL.Clear;
    qAux.SQL.Add('SELECT AUTORIZACAO, EVENTOSOLICITADO, DATAATENDIMENTO');
    qAux.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO                      ');
    qAux.SQL.Add(' WHERE HANDLE = :EVENTOGERADO                        ');
    qAux.ParamByName('EVENTOGERADO').AsInteger := pHandleOrigem;
    qAux.Open;

    // Verifica se evento foi solicitado mais de uma vez na mesma data de atendimento na autorização
    // e se este não é o primeiro a ser solicitado (negação não deve ser dada para o primeiro evento solicitado)
    q.Close;
    q.SQL.Clear;
    q.SQL.Add('SELECT HANDLE                                      ');
    q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOSOLICIT                   ');
    q.SQL.Add(' WHERE AUTORIZACAO = :AUTORIZACAO                  ');
    q.SQL.Add('   AND EVENTO = :EVENTO                            ');
    q.SQL.Add('   AND GRAU = :GRAU                                ');
    q.SQL.Add('   AND DATAATENDIMENTO = :DATA                     ');
    q.SQL.Add('   AND SITUACAO <> ''C''                           ');
    q.SQL.Add('   AND HANDLE <> (                                 ');
    q.SQL.Add('                  SELECT MIN(HANDLE)               ');
    q.SQL.Add('                    FROM SAM_AUTORIZ_EVENTOSOLICIT ');
    q.SQL.Add('                   WHERE AUTORIZACAO = :AUTORIZACAO');
    q.SQL.Add('                     AND EVENTO = :EVENTO          ');
    q.SQL.Add('                     AND GRAU = :GRAU              ');
    q.SQL.Add('                     AND DATAATENDIMENTO = :DATA   ');
    q.SQL.Add('                     AND SITUACAO <> ''C''         ');
    q.SQL.Add('                 )                                 ');
    q.SQL.Add('   AND HANDLE = :HANDLESOLICITADO                  ');

    q.ParamByName('AUTORIZACAO').AsInteger := qAux.FieldByName('AUTORIZACAO').AsInteger;
    q.ParamByName('EVENTO').AsInteger := pEvento; // Evento na SAM_TGE
    q.ParamByName('GRAU').AsInteger := pGrau;
    q.ParamByName('DATA').AsDateTime := qAux.FieldByName('DATAATENDIMENTO').AsDateTime;
    q.ParamByName('HANDLESOLICITADO').AsInteger := qAux.FieldByName('EVENTOSOLICITADO').AsInteger;
    q.Open;
    if not q.IsEmpty then
      MontaNegacao(pHandleOrigem, SAM_ERRO_EVENTOREPETIDODATA, '', -1);
    q.Close;
    qAux.Close;
  end;
end;

procedure TDM.ChecarRegimeAtendimentoTipoPrestador(
  pPrestador, pEvento: integer; pTipo: char);
var
  vComplemento, vAux: string;
begin

  if pPrestador = nulo then
    exit;

  if LerMotivoNegacao(SAM_ERRO_REGIMEATENDIMENTO, vRegimePgto, gLiberaPorAuxilio) <> nulo then
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT C.REGIMEATENDIMENTO REGATEND_EVENTO,');
    Q.SQL.Add('       B.REGIMEATENDIMENTO REGATEND_TIPOPRESTADOR');
    Q.SQL.Add('  FROM SAM_PRESTADOR A,');
    Q.SQL.Add('       SAM_TIPOPRESTADOR B,');
    Q.SQL.Add('       SAM_TGE C');
    Q.SQL.Add(' WHERE B.HANDLE = A.TIPOPRESTADOR');
    Q.SQL.Add('   AND A.HANDLE = :PRESTADOR');
    Q.SQL.Add('   AND C.HANDLE = :EVENTO');
    Q.ParamByName('PRESTADOR').AsInteger := pPrestador;
    Q.ParamByName('EVENTO').AsInteger := pEvento;
    Q.Open;
    vComplemento := '';

    case pTipo of
      'E': vAux := ' (executor) ';
      'R': vAux := ' (recebedor) ';
      'S': vAux := ' (solicitante) ';
      'L': vAux := ' (local de execução) ';
    end;

    if ((Q.FieldByName('REGATEND_EVENTO').AsString = '1') and (Q.FieldByName('REGATEND_TIPOPRESTADOR').AsString = '2')) then
    begin
      vComplemento := 'Regime de atendimento do evento é somente ambulatorial e regime de atendimento do tipo de prestador' + vAux + 'é somente internação.';
      MontaNegacaoBenefPrestador(SAM_ERRO_REGIMEATENDIMENTOTPPRESTADOR, vComplemento);
    end;
    if ((Q.FieldByName('REGATEND_EVENTO').AsString = '2') and (Q.FieldByName('REGATEND_TIPOPRESTADOR').AsString = '1')) then
    begin
      vComplemento := 'Regime de atendimento do evento é somente internação e regime de atendimento do tipo de prestador ' + vAux + 'é somente ambulatorial.';
      MontaNegacaoBenefPrestador(SAM_ERRO_REGIMEATENDIMENTOTPPRESTADOR, vComplemento);
    end;
  end;

end;

procedure TDM.ChecarSituacaoPrestador(P: TBennerQuery;
  pData: TDateTime;
  pEvento: integer;
  pTipoPrestador: char;
  pLocalExecucao: integer);
var
  vComplemento: WideString;
  vTpAux: Char;
  vTipoRegime: byte;
  DataCredNula,
    DataAtendimentoMenorDataCred,
    DataDescrNaoNula,
    DataAtendimentoMaiorDataDescr: boolean;
  // o tipo de regime do executor e local de execução é utilizado na checagem de pode executar, por isso são globais
  // do recebedor é utilizado somente localmente.
begin
  //Application.hint := 'Checando situação do prestador...';
  // SE O PRESTADOR FOR CREDENCIADO NUNCA CONSIDERARÁ O CORPO-CLÍNICO, MESMO QUE O EXECUTOR, RECEBEDOR E SOLICITANTE SEJAM INFORMADOS.
  if ((not P.FieldByName('DATACREDENCIAMENTO').IsNull) and (P.FieldByName('DATACREDENCIAMENTO').AsDateTime <= pData))
    and
    ((P.FieldByName('DATADESCREDENCIAMENTO').IsNull) or (pData <= P.FieldByName('DATADESCREDENCIAMENTO').AsDateTime)) then
    vTpAux := 'C'
  else
  begin //não é credenciado;
    samauto_PRESTADOR_PRESTADORDAENTID.Close;
    samauto_PRESTADOR_PRESTADORDAENTID.ParamByName('PRESTADOR').AsInteger := P.FieldByName('HANDLE').AsInteger;
    samauto_PRESTADOR_PRESTADORDAENTID.ParamByName('ENTIDADE').AsInteger := pLocalExecucao;
    samauto_PRESTADOR_PRESTADORDAENTID.ParamByName('DATA').AsDateTime := pData;
    samauto_PRESTADOR_PRESTADORDAENTID.Open;
    if not samauto_PRESTADOR_PRESTADORDAENTID.IsEmpty then
    begin
      vTpAux := 'M'; //Membro de corpo clínico
      if pTipoPrestador = 'E' then
        vgExecutorMembroDe := samauto_PRESTADOR_PRESTADORDAENTID.FieldByName('ENTIDADE').AsInteger
      else if pTipoPrestador = 'R' then
        vgRecebedorMembroDe := samauto_PRESTADOR_PRESTADORDAENTID.FieldByName('ENTIDADE').AsInteger;
    end
    else
      vTpAux := 'O'; //Não é credenciado nem membro de corpo clinico
  end;

  vComplemento := '';
  samauto_PRESTADOR_AFASTAMENTO.Close;
  samauto_PRESTADOR_AFASTAMENTO.ParamByName('DATAAUTO').Value := pData;
  samauto_PRESTADOR_AFASTAMENTO.ParamByName('PR').Value := P.FieldByName('HANDLE').AsInteger;
  samauto_PRESTADOR_AFASTAMENTO.Open;
  if not samauto_PRESTADOR_AFASTAMENTO.IsEmpty then
  begin
    vComplemento := '';
    while not samauto_PRESTADOR_AFASTAMENTO.EOF do
    begin
      vComplemento := vComplemento + samauto_PRESTADOR_AFASTAMENTO.FieldByName('DESCRICAO').AsString + #13;
      samauto_PRESTADOR_AFASTAMENTO.Next;
    end;
  end;
  samauto_PRESTADOR_AFASTAMENTO.Close;

  // Eduardo - 06/01/2004 - SMS 22356
  // Abre a query se já não estiver aberta
  if not SAM_PARAMETROSGERAIS.Active then
    SAM_PARAMETROSGERAIS.Open;
  // fim SMS 22356

  if pTipoPrestador <> 'S' then
  begin
    case vTpAux of
      'C':
        begin
          if vgLOCALATENDIMENTO = SAM_PARAMETROSGERAIS.FieldByName('LOCALATENDIMENTORESSARCIMENTO').AsInteger then
            vTipoRegime := CredenciadoEmRegimeLivreEscolha
          else
            vTipoRegime := CredenciadoEmRegimeCredenciamento
        end;
      'O':
        begin
          if vgLOCALATENDIMENTO = SAM_PARAMETROSGERAIS.FieldByName('LOCALATENDIMENTORESSARCIMENTO').AsInteger then
            vTipoRegime := NaoCredenciadoEmRegimeLivreEscolha
          else
            vTipoRegime := NaoCredenciadoEmRegimeCredenciamento
        end;
      'M':
        begin
          if vgLOCALATENDIMENTO = SAM_PARAMETROSGERAIS.FieldByName('LOCALATENDIMENTORESSARCIMENTO').AsInteger then
            vTipoRegime := CredenciadoEmRegimeLivreEscolha
          else
            vTipoRegime := CredenciadoEmRegimeCredenciamento;
        end;
    end;
  end;

  case pTipoPrestador of
    'S':
      begin //Quando é solicitante
        if vTpAux = 'O' then
          vgSolicitanteNaoEhCredenciado := True;
        if vComplemento <> '' then
          MontaNegacaoBenefPrestador(SAM_ERRO_SOLICITANTEAFASTADO, vComplemento);
        if P.FieldByName('SOLICITANTE').AsString <> 'S' then
          MontaNegacaoBenefPrestador(SAM_ERRO_PRESTADORNAOSOLICITANTE,
            'O prestador não pode ser solicitante (não está marcado como solicitante em seu cadastro.'
            );
        if not (P.FieldByName('DATABLOQUEIO').IsNull) then
          MontaNegacaoBenefPrestador(SAM_ERRO_SOLICITANTEBLOQUEADO,
            format('Bloqueado em: %s' + #13 +
            'Motivo: %s',
            [P.FieldByName('DATABLOQUEIO').AsString,
            P.FieldByName('MOTIVOBLOQUEIO').AsString]
              )
            );
        ChecarRegimeAtendimentoTipoPrestador(P.FieldByName('HANDLE').AsInteger, pEvento, pTipoPrestador);
      end; // solicitante

    'E': // EXECUTOR pode ser membro do CC do LOCAL DE EXECUÇÃO.
      begin //Quando é Executor  .
        vgTipoExecutorRegime := vTipoRegime;
        if vComplemento <> '' then
          MontaNegacaoBenefPrestador(SAM_ERRO_EXECUTORAFASTADO, vComplemento);
        if P.FieldByName('EXECUTOR').AsString <> 'S' then
          MontaNegacaoBenefPrestador(SAM_ERRO_PRESTADORNAOEXECUTOR,
            'O prestador não está marcado como executor em seu cadastro.'
            );
        if not (P.FieldByName('DATABLOQUEIO').IsNull) then
          MontaNegacaoBenefPrestador(SAM_ERRO_EXECUTORBLOQUEADO,
            format('Bloqueado em: %s' + #13 +
            'Motivo: %s',
            [P.FieldByName('DATABLOQUEIO').AsString,
            P.FieldByName('MOTIVOBLOQUEIO').AsString]
              )
            );
        case vgTipoExecutorRegime of
          //Prestador (Não Credenciado) não pode executar em regime de Credenciamento
          //Quando o local de execucao for corpo clínico aberto
          //qualquer prestador pode executar
          NaoCredenciadoEmRegimeCredenciamento:
            if (pLocalExecucao = nulo) or
              ((pLocalExecucao <> nulo) and (LOCALEXECUCAO.FieldByName('FISICAJURIDICA').AsInteger = C_PessoaFisica)) then
              MontaNegacaoBenefPrestador(SAM_ERRO_EXECUTORNAOCREDENCIADO,
                'O executor NÃO CREDENCIADO não pode executar eventos em regime de credenciamento'
                )
            else if (pLocalExecucao <> nulo) and
              (LOCALEXECUCAO.FieldByName('CORPOCLINICO').AsString = 'S') and
              (LOCALEXECUCAO.FieldByName('FISICAJURIDICA').AsInteger = C_PessoaJuridica) then
            begin
              MontaNegacaoBenefPrestador(SAM_ERRO_EXECUTORNAOCREDENCIADO,
                'O executor NÃO CREDENCIADO não pode executar eventos em regime de credenciamento (não é membro de corpo clínico fechado)'
                ); // se for corpo-clínico aberto, pode executar mesmo que não credenciado
            end;
          CredenciadoEmRegimeCredenciamento:
            if (pLocalExecucao <> nulo) and
              (LOCALEXECUCAO.FieldByName('CORPOCLINICO').AsString = 'S') and
              (LOCALEXECUCAO.FieldByName('FISICAJURIDICA').AsInteger = C_PessoaJuridica) and
              (pLocalExecucao <> P.FieldByName('HANDLE').AsInteger) then
            begin
              Q.Close;
              Q.SQL.Clear;
              Q.SQL.Add('SELECT P.ENTIDADE');
              Q.SQL.Add('FROM   SAM_PRESTADOR_PRESTADORDAENTID P');
              Q.SQL.Add('WHERE  P.PRESTADOR = :EXECUTOR');
              Q.SQL.Add('AND    P.ENTIDADE  = :LOCALEXECUCAO');
              Q.SQL.Add('AND    P.DATAINICIAL <= :DATA');
              Q.SQL.Add('AND    (P.DATAFINAL IS NULL OR :DATA <=P.DATAFINAL)');
              Q.ParamByName('LOCALEXECUCAO').Value := pLocalExecucao;
              Q.ParamByName('EXECUTOR').Value := P.FieldByName('HANDLE').AsInteger;
              Q.ParamByName('DATA').Value := pData;
              Q.Open;
              if Q.IsEmpty then
                MontaNegacaoBenefPrestador(SAM_ERRO_EXECUTORNAOEHMEMBROCORPOCLINICO,
                  'Executor não faz parte do corpo clinico do local de execução'
                  );
            end;
        end; // end do case
        ChecarRegimeAtendimentoTipoPrestador(P.FieldByName('HANDLE').AsInteger, pEvento, pTipoPrestador);
      end; // executor

    'R': // RECEBEDOR pode ser membro do CC do LOCAL DE EXECUÇÃO.
      begin //Quando é recebedor
        if vComplemento <> '' then
          MontaNegacaoBenefPrestador(SAM_ERRO_RECEBEDORAFASTADO, vComplemento);
        if P.FieldByName('RECEBEDOR').AsString <> 'S' then
          MontaNegacaoBenefPrestador(SAM_ERRO_PRESTADORNAORECEBEDOR,
            'O prestador não está marcado como recebedor em seu cadastro.'
            );
        if not (P.FieldByName('DATABLOQUEIO').IsNull) then
          MontaNegacaoBenefPrestador(SAM_ERRO_RECEBEDORBLOQUEADO,
            format('Bloqueado em: %s' + #13 +
            'Motivo: %s',
            [P.FieldByName('DATABLOQUEIO').AsString,
            P.FieldByName('MOTIVOBLOQUEIO').AsString]
              )
            );
        // se não for reembolso tem q ser credenciado ou esse negações estar desligada
        if vgLOCALATENDIMENTO <> SAM_PARAMETROSGERAIS.FieldByName('LOCALATENDIMENTORESSARCIMENTO').AsInteger then
          if LerMotivoNegacao(SAM_ERRO_RECEBEDORNAOCREDENCIADO, vRegimePgto, gLiberaPorAuxilio) <> nulo then
          begin
            DataCredNula := RECEBEDOR.FieldByName('DATACREDENCIAMENTO').Isnull;
            DataAtendimentoMenorDataCred := pData < RECEBEDOR.FieldByName('DATACREDENCIAMENTO').AsDateTime;
            DataDescrNaoNula := not (RECEBEDOR.FieldByName('DATADESCREDENCIAMENTO').IsNull);
            DataAtendimentoMaiorDataDescr := pData > RECEBEDOR.FieldByName('DATADESCREDENCIAMENTO').AsDateTime;
            if (DataCredNula or DataAtendimentoMenorDataCred) or
              (DataDescrNaoNula and DataAtendimentoMaiorDataDescr) then
            begin
              MontaNegacaoBenefPrestador(SAM_ERRO_RECEBEDORNAOCREDENCIADO,
                'O recebedor não é um prestador credenciado.'
                );
            end;
          end;
        case vTipoRegime of
          //Prestador (Não Credenciado) não pode executar em regime de Credenciamento
          //Quando o recebedor for corpo clínico aberto
          //qualquer prestador pode executar
          NaoCredenciadoEmRegimeCredenciamento:
            if ((not LerMotivoNegacao(SAM_ERRO_RECEBEDORNAOCREDENCIADO, vRegimePgto, gLiberaPorAuxilio) <> nulo) and
              (LerMotivoNegacao(SAM_ERRO_RECEBEDORNAOCREDENCIADOMEMBROCC, vRegimePgto, gLiberaPorAuxilio) <> nulo)) then
            begin
              if (pLocalExecucao = nulo) or
                ((pLocalExecucao <> nulo) and
                (LOCALEXECUCAO.FieldByName('FISICAJURIDICA').AsInteger = C_PessoaFisica)) then
                MontaNegacaoBenefPrestador(SAM_ERRO_RECEBEDORNAOCREDENCIADOMEMBROCC,
                  'O recebedor NÃO CREDENCIADO não pode receber em regime de credenciamento'
                  )
              else if (pLocalExecucao <> nulo) and (LOCALEXECUCAO.FieldByName('CORPOCLINICO').AsString = 'N') and
                (LOCALEXECUCAO.FieldByName('FISICAJURIDICA').AsInteger = C_PessoaJuridica) then
                MontaNegacaoBenefPrestador(SAM_ERRO_RECEBEDORNAOCREDENCIADOMEMBROCC,
                  'O recebedor NÃO CREDENCIADO não pode receber em regime de credenciamento (membro de corpo-clínico aberto)'
                  ) // se for corpo-clínico aberto, NÃO pode receber qdo não credenciado (executar pode)
              else if (pLocalExecucao <> nulo) and (LOCALEXECUCAO.FieldByName('CORPOCLINICO').AsString = 'S') and
                (LOCALEXECUCAO.FieldByName('FISICAJURIDICA').AsInteger = C_PessoaJuridica) then
              begin
                MontaNegacaoBenefPrestador(SAM_ERRO_RECEBEDORNAOCREDENCIADOMEMBROCC,
                  'O recebedor NÃO CREDENCIADO não pode receber em regime de credenciamento (não é membro do corpo clínico fechado)'
                  );
              end;
            end;

          CredenciadoEmRegimeCredenciamento:
            if (pLocalExecucao <> nulo) and
              (LOCALEXECUCAO.FieldByName('CORPOCLINICO').AsString = 'S') and
              (LOCALEXECUCAO.FieldByName('FISICAJURIDICA').AsInteger = C_PessoaJuridica) and
              (pLocalExecucao <> P.FieldByName('HANDLE').AsInteger) then
            begin
              Q.Close;
              Q.SQL.Clear;
              Q.SQL.Add('SELECT P.ENTIDADE');
              Q.SQL.Add('FROM   SAM_PRESTADOR_PRESTADORDAENTID P');
              Q.SQL.Add('WHERE  P.PRESTADOR = :RECEBEDOR');
              Q.SQL.Add('AND    P.ENTIDADE  = :LOCALEXECUCAO');
              Q.SQL.Add('AND    P.DATAINICIAL <= :DATA');
              Q.SQL.Add('AND    (P.DATAFINAL IS NULL OR :DATA <=P.DATAFINAL)');
              Q.ParamByName('LOCALEXECUCAO').Value := pLocalExecucao;
              Q.ParamByName('RECEBEDOR').Value := P.FieldByName('HANDLE').AsInteger;
              Q.ParamByName('DATA').Value := pData;
              Q.Open;
              if Q.IsEmpty then
                MontaNegacaoBenefPrestador(SAM_ERRO_RECEBEDORNAOEHMEMBROCORPOCLINICO,
                  'Recebedor não faz parte do corpo clinico do local de execução'
                  );
            end;
        end; // fim do case
        ChecarRegimeAtendimentoTipoPrestador(P.FieldByName('HANDLE').AsInteger, pEvento, pTipoPrestador);
      end;

    'L': // LOCAL DE EXECUÇÃO PODE SER ENTIDADE/CC DO EXECUTOR E RECEBEDOR
      begin //Quando é Local de execução
        vgTipoLocalExecucaoRegime := vTipoRegime;
        if vComplemento <> '' then
          MontaNegacaoBenefPrestador(SAM_ERRO_LOCALEXECUCAOAFASTADO, vComplemento);
        if P.FieldByName('LOCALEXECUCAO').AsString <> 'S' then
          MontaNegacaoBenefPrestador(SAM_ERRO_PRESTADORNAOLOCALEXECUCAO,
            'O prestador não está marcado como local de execução em seu cadastro.'
            );
        if not (P.FieldByName('DATABLOQUEIO').IsNull) then
          MontaNegacaoBenefPrestador(SAM_ERRO_LOCALEXECUCAOBLOQUEADO,
            format('Bloqueado em: %s' + #13 +
            'Motivo: %s',
            [P.FieldByName('DATABLOQUEIO').AsString,
            P.FieldByName('MOTIVOBLOQUEIO').AsString]
              )
            );
        ChecarRegimeAtendimentoTipoPrestador(P.FieldByName('HANDLE').AsInteger, pEvento, pTipoPrestador);
      end; // local execução
  end;

  //  ************** Executor e recebedor não podem ser usuário  ****************
  if not vgOrigemClinica then
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT USUARIO FROM CLI_RECURSO_USUARIO WHERE PRESTADOR = :HPRESTADOR');
    Q.ParamByName('HPRESTADOR').Value := P.FieldByName('HANDLE').AsInteger;
    Q.Open;
    vComplemento := '';
    case pTipoPrestador of // somente será dada a negação se for executor ou recebedor
      'S': vComplemento := '';
      'E': vComplemento := vComplemento + #13 + 'Usuário é executor';
      'R': vComplemento := vComplemento + #13 + 'Usuário é recebedor';
      'L': vComplemento := '';
    end;
    if (Q.FieldByName('USUARIO').Value = Sys.currentuser) and (vComplemento <> '') then
      MontaNegacaoBenefPrestador(SAM_ERRO_PRESTADORUSUARIO, vComplemento);
  end;

end;

procedure TDM.ChecarSeRecebedorPodeReceber(pRecebedor,
  pExecutor: integer;
  pData: TDateTime);
var
  DataCredNula,
    DataAtendimentoMenorDataCred,
    DataDescrNaoNula,
    DataAtendimentoMaiorDataDescr: boolean;
  vComplemento: WideString;
begin
  // Eduardo - 06/01/2004 - SMS 22356
  // Abre a query se já não estiver aberta
  if not SAM_PARAMETROSGERAIS.Active then
    SAM_PARAMETROSGERAIS.Open;
  // fim SMS 22356

  //Se for regime de reembolso qualquer um pode receber.
  if vgLOCALATENDIMENTO <>
    SAM_PARAMETROSGERAIS.FieldByName('LOCALATENDIMENTORESSARCIMENTO').AsInteger then
  begin
    if RECEBEDOR.FieldByName('RECEBEDOR').AsString <> 'S' then
    begin
      vComplemento := vComplemento +
        'O prestador não pode receber pelo(s) evento(s)' + #13 +
        'pois não está marcado como recebedor em seu cadastro.';
      MontaNegacaoBenefPrestador(SAM_ERRO_PRESTADORNAORECEBEDOR, vComplemento);
    end;

    //Fazer o teste mesmo quando recebedor e prestador forem iguais
    if (pRecebedor <> nulo) then
    begin // and (pRecebedor <> pExecutor) then begin
      DataCredNula := RECEBEDOR.FieldByName('DATACREDENCIAMENTO').Isnull;
      DataAtendimentoMenorDataCred := pData < RECEBEDOR.FieldByName('DATACREDENCIAMENTO').AsDateTime;
      DataDescrNaoNula := not (RECEBEDOR.FieldByName('DATADESCREDENCIAMENTO').IsNull);
      DataAtendimentoMaiorDataDescr := pData > RECEBEDOR.FieldByName('DATADESCREDENCIAMENTO').AsDateTime;
      if (DataCredNula or DataAtendimentoMenorDataCred) or
        (DataDescrNaoNula and DataAtendimentoMaiorDataDescr) then
      begin
        vComplemento := 'O recebedor não é um prestador credenciado.' + #13;
        MontaNegacaoBenefPrestador(SAM_ERRO_RECEBEDORNAOCREDENCIADO, vComplemento)
      end;
    end;
  end;
end;

function TDM.ChecarRedeRestrita(pHandleOrigem,
  pPrestador,
  pContrato,
  pModulo,
  pPlano,
  pEvento: integer
  ): boolean;
begin
  WriteBDebug('SamAuto.DM.ChecarRedeRestrita - Início');
  Result := True;
  if (LerMotivoNegacao(SAM_ERRO_BENEFICIARIOREDERESTRITA, vRegimePgto, gLiberaPorAuxilio) <> nulo) and
    (pPrestador <> nulo) then
  begin
    //se o módulo que deu a cobertura tiver rede restrita no Contrato,
    //então a rede restrita deve possuir o prestador
    REDE_RESTRITA.Close;
    REDE_RESTRITA.ParamByName('MODULO').Value := pModulo;
    REDE_RESTRITA.ParamByName('PLANO').Value := pPlano;
    REDE_RESTRITA.ParamByName('CONTRATO').Value := pContrato;
    REDE_RESTRITA.Open;
    // utiliza a a rede restrita do módulo, desde que esteja marcada como "Restrição de Prestadores"
    if (not REDE_RESTRITA.IsEmpty) then
    begin
      if (REDE_RESTRITA.FieldByName('RESTRICAOPRESTADORES').AsString = 'S') then
      begin
        vgRedeRestrita := REDE_RESTRITA.FieldByName('REDERESTRITA').AsInteger;
        //não tem rede restrita no contrato, então OK
        //procurar o prestador nesta rede restrita ( tem que estar lá ).
        samauto_REDERESTRITA_PRESTADOR.Close;
        samauto_REDERESTRITA_PRESTADOR.ParamByName('PRESTADOR').Value := pPrestador;
        samauto_REDERESTRITA_PRESTADOR.ParamByName('REDERESTRITA').Value := REDE_RESTRITA.FieldByName('REDERESTRITA').AsInteger;
        samauto_REDERESTRITA_PRESTADOR.Open;
        if samauto_REDERESTRITA_PRESTADOR.IsEmpty {//O Prestador não faz parta de rede restrita} then
        begin
          Result := False;
          MontaNegacao(pHandleOrigem, SAM_ERRO_BENEFICIARIOREDERESTRITA, '', -1);
        end;
      end
      else
        ChecarRedeRestritaContrato(pHandleOrigem, pPrestador, pContrato); //vgRedeRestrita := nulo;
    end
      //se o modulo não tiver rede restrita ou
      //se a rede do módulo não estiver marcada "Restrição de prestadores,
      //verificar se tem a rede no contrato marcada como "restrição de prestadores"
    else
      ChecarRedeRestritaContrato(pHandleOrigem, pPrestador, pContrato);
  end;
  WriteBDebug(Concat('SamAuto.DM.ChecarRedeRestrita - Result [', BoolToStr(Result, True), ']'));
end;

function TDM.ChecarRedeRestritaContrato(pHandleOrigem,
  pPrestador,
  pContrato: integer
  ): boolean;
begin
  WriteBDebug('SamAuto.DM.ChecarRedeRestritaContrato - Início');
  Result := True;
  REDE_RESTRITA_CONTRATO.Close;
  REDE_RESTRITA_CONTRATO.ParamByName('CONTRATO').Value := pContrato;
  REDE_RESTRITA_CONTRATO.Open;
  if (not REDE_RESTRITA_CONTRATO.IsEmpty) then
  begin
    vgRedeRestrita := REDE_RESTRITA_CONTRATO.FieldByName('REDERESTRITA').AsInteger;
    //não tem rede restrita no contrato, então OK
    //procurar o prestador nesta rede restrita ( tem que estar lá ).
    samauto_REDERESTRITA_PRESTADOR.Close;
    samauto_REDERESTRITA_PRESTADOR.ParamByName('PRESTADOR').Value := pPrestador;
    samauto_REDERESTRITA_PRESTADOR.ParamByName('REDERESTRITA').Value := REDE_RESTRITA_CONTRATO.FieldByName('REDERESTRITA').AsInteger;
    samauto_REDERESTRITA_PRESTADOR.Open;
    if samauto_REDERESTRITA_PRESTADOR.IsEmpty {//O Prestador não faz parta de rede restrita} then
    begin
      Result := False;
      if (LerMotivoNegacao(SAM_ERRO_BENEFICIARIOREDERESTRITA, vRegimePgto, gLiberaPorAuxilio) <> nulo) then // Eduardo - 12/07/2004 - Checa se a negação está ligada antes de gerar
        MontaNegacao(pHandleOrigem, SAM_ERRO_BENEFICIARIOREDERESTRITA, '', -1);
    end;
  end;
  WriteBDebug(Concat('SamAuto.DM.ChecarRedeRestritaContrato - Result [', BoolToStr(Result, True), ']'));
end;

procedure TDM.ChecarIncompatibilidade(pHandleOrigem,
  pBeneficiario,
  pExecutor: integer;
  pData: TDateTime);
var
  vNeg: WideString;
begin
  if LerMotivoNegacao(SAM_ERRO_ESPECIALIDADESEXOIDADE, vRegimePgto, gLiberaPorAuxilio) <> nulo then
  begin

    vNeg := vgOLESamIncomp.Especialidade(Sys.CurrentSystem, pBeneficiario,
      pExecutor,
      pData
      );
    if vNeg <> '' then
      MontaNegacao(pHandleOrigem, SAM_ERRO_ESPECIALIDADESEXOIDADE, vNeg, -1);
  end;
end;

procedure TDM.ChecarIncompatibilidadeEvento(pHandleOrigem,
  pExecutor,
  pEvento,
  pGrau: Integer;
  pData: TDateTime;
  pBeneficiario: Integer);
var
  vSamIncompDLL: Variant;
  vListaEventos: ansistring;
begin

  vSamIncompDLL := AbrirDll(Sys.CurrentSystem, 'SamIncomp.Check');
  vSamIncompDll.Inicializar(Sys.CurrentSystem);
  vListaEventos := vSamIncompDLL.EventoLista(Sys.CurrentSystem,
    pExecutor,
    nulo, // evento da guia a não ser considerado
    pEvento,
    pGrau,
    pData,
    pBeneficiario);
  if Sys.VisibleMode then
    if vListaEventos <> '' then
      ShowMessage(vListaEventos);
end;

procedure TDM.ChecarEventoSolicitante(pHandleOrigem, pEvento, pPrestador: integer; pData: TDateTime);
begin
  if vgSolicitanteNaoEhCredenciado then
    exit; //Se Solicitante não for credenciado ele pode pedir tudo;

  if vgCodigoSolicitanteInvalido then
    exit; //Codigo de solicitante inválido - ja negado anteriormetne

  if LerMotivoNegacao(SAM_ERRO_SOLICITANTEEVENTO, vRegimePgto, gLiberaPorAuxilio) = nulo then
    exit; //Não considera negacao de solicitante / evento

  samauto_TGE.Close;
  samauto_TGE.ParamByName('EVENTO').Value := pEvento;
  samauto_TGE.Open;
  if samauto_TGE.FieldByName('VERIFICACADASTROSOLICITANTE').AsString = 'S' then
  begin
    samauto_PRESTADOR_ESPECIALIDADE.Close;
    samauto_PRESTADOR_ESPECIALIDADE.ParamByName('PRESTADOR').Value := pPrestador;
    samauto_PRESTADOR_ESPECIALIDADE.ParamByName('EVENTO').Value := pEvento;
    samauto_PRESTADOR_ESPECIALIDADE.ParamByName('DATA').Value := pData;
    samauto_PRESTADOR_ESPECIALIDADE.ParamByName('REDERESTRITA').Value := vgRedeRestrita;
    samauto_PRESTADOR_ESPECIALIDADE.Open;
    //não achou o evento na especialidade, o solicitante nao pode solicitar o evento
    if samauto_PRESTADOR_ESPECIALIDADE.IsEmpty then
      MontaNegacao(pHandleOrigem, SAM_ERRO_SOLICITANTEEVENTO, '', -1);
    samauto_PRESTADOR_ESPECIALIDADE.Close;
  end;
  samauto_TGE.Close;
end;

procedure TDM.ChecarEventoExecutor(pHandleOrigem,
  pEvento,
  pGrau,
  pExecutor,
  pLocalExecucao,
  pRegimeAtendimento: Integer;
  pData: TDateTime);
var
  vComplemento: string;
begin

  if vgCodigoExecutorInvalido then
    exit; //Codigo do executor é inválido não executar a rotina

  vComplemento := '';
  samauto_GRAU.Close;
  samauto_GRAU.ParamByName('GRAU').Value := pGrau;
  samauto_GRAU.Open;

  //Verificar o Tipo de pessoa permitida no Grau de Atuação
  //Aletaradas Querys samauto_GRAU e EXECUTOR
  //SMS: 4460
  if (samauto_GRAU.FieldByName('TIPOEXECUTOR').AsString <> 'A') and
    (LerMotivoNegacao(SAM_ERRO_GRAUFISICAJURIDICA, vRegimePgto, gLiberaPorAuxilio) <> nulo) then
  begin
    if (samauto_GRAU.FieldByName('TIPOEXECUTOR').AsString = 'F') and
      (EXECUTOR.FieldByName('FISICAJURIDICA').AsInteger = C_PessoaJuridica) then
      MontaNegacao(pHandleOrigem,
        SAM_ERRO_GRAUFISICAJURIDICA,
        'O grau permite apenas pessoa Física',
        -1
        )
    else if (samauto_GRAU.FieldByName('TIPOEXECUTOR').AsString = 'J') and
      (EXECUTOR.FieldByName('FISICAJURIDICA').AsInteger = C_PessoaFisica) then
      MontaNegacao(pHandleOrigem,
        SAM_ERRO_GRAUFISICAJURIDICA,
        'O grau permite apenas pessoa Jurídica',
        -1
        );
  end;

  case vgTipoExecutorRegime of
    //Credenciado em Regime de Credenciamento - Normal.
    CredenciadoEmRegimeCredenciamento:
      begin
        if (samauto_GRAU.FieldByName('VERIFICACADASTROEXECUTOR').AsString = 'S') and
          (LerMotivoNegacao(SAM_ERRO_EXECUTOREVENTO, vRegimePgto, gLiberaPorAuxilio) <> nulo) then
        begin
          REGRA_EXECUCAO.Close;
          REGRA_EXECUCAO.ParamByName('PRESTADOR').Value := pExecutor;
          REGRA_EXECUCAO.ParamByName('EVENTO').Value := pEvento;
          REGRA_EXECUCAO.ParamByName('DATA').Value := pData;
          REGRA_EXECUCAO.ParamByName('REGIMEATENDIMENTO').Value := pRegimeAtendimento;
          REGRA_EXECUCAO.ParamByName('REDERESTRITA').Value := vgRedeRestrita;
          REGRA_EXECUCAO.Open;
          if REGRA_EXECUCAO.isEmpty then
          begin
            if vgExecutorMembroDe = 0 then
            begin
              if not (ChkPrestadorEventoExec(pExecutor, pEvento, pRegimeAtendimento, pData)) then
                MontaNegacao(pHandleOrigem,
                  SAM_ERRO_EXECUTOREVENTO,
                  'O executor não pode executar o evento pelas especialidades',
                  -1
                  );
            end
            else
            begin
              if not (ChkPrestadorDaEntidadeEventoExec(pExecutor, vgExecutorMembroDe, pEvento, pData)) then
                MontaNegacao(pHandleOrigem,
                  SAM_ERRO_EXECUTOREVENTO,
                  'O executor não pode executar o evento. Exceção da especialidade no corpo clínico.',
                  -1
                  );
            end;
          end
          else
          begin
            if REGRA_EXECUCAO.FieldByName('REGRAEXCECAO').AsString = 'E' then
              MontaNegacao(pHandleOrigem,
                SAM_ERRO_EXECUTOREVENTO,
                'O executor não pode executar o evento, pois este evento está' + #13 +
                'marcado como exceção no cadastro de Regras e Exceções',
                -1
                );
          end;
          REGRA_EXECUCAO.Close;
          if LerMotivoNegacao(SAM_ERRO_EXECUTORHABILITACAO, vRegimePgto, gLiberaPorAuxilio) <> nulo then
          begin
            PRESTADOR_HABILITACAO.Close; //SELECIONA AS HABILITACAO QUE O PRESTADOR NAO POSSUI PARA EXECUTAR O EVENTO
            PRESTADOR_HABILITACAO.ParamByName('EVENTO').Value := pEvento;
            PRESTADOR_HABILITACAO.ParamByName('DATAAUTO').Value := pData;
            PRESTADOR_HABILITACAO.ParamByName('PRESTADOR').Value := pExecutor;
            PRESTADOR_HABILITACAO.Open;
            if not PRESTADOR_HABILITACAO.IsEmpty then
              MontaNegacao(pHandleOrigem, SAM_ERRO_EXECUTORHABILITACAO,
                'O executor não possui as habilitaçoes para executar o evento',
                -1);
            PRESTADOR_HABILITACAO.Close;
          end;
        end; //if verificar cadastro do executor
      end; //Credenciado em Regime de Credenciamento (normal);

    //Executor não Credenciado em Regime de Livre-Escolha.
    CredenciadoEmRegimeLivreEscolha:
      begin

        if not SAM_PARAMETROSPRESTADOR.Active then
          SAM_PARAMETROSPRESTADOR.Open;

        if SAM_PARAMETROSPRESTADOR.FieldByName('CREDENCIADOEMLIVREESCOLHA').AsString = 'S' then
        begin

          if LerMotivoNegacao(SAM_ERRO_EXECUTOREVENTOLIVREESCOLHA, vRegimePgto, gLiberaPorAuxilio) <> nulo then
          begin
            REGRA_EXECUCAO.Close;
            REGRA_EXECUCAO.ParamByName('PRESTADOR').Value := pExecutor;
            REGRA_EXECUCAO.ParamByName('EVENTO').Value := pEvento;
            REGRA_EXECUCAO.ParamByName('DATA').Value := pData;
            REGRA_EXECUCAO.ParamByName('REGIMEATENDIMENTO').Value := pRegimeAtendimento;
            REGRA_EXECUCAO.ParamByName('REDERESTRITA').Value := vgRedeRestrita;
            REGRA_EXECUCAO.Open;
            if REGRA_EXECUCAO.isEmpty then
            begin
              if (ChkPrestadorEventoExec(pExecutor, pEvento, pRegimeAtendimento, pData)) then
                MontaNegacao(pHandleOrigem,
                  SAM_ERRO_EXECUTOREVENTOLIVREESCOLHA,
                  'O executor (credenciado) não pode executar o evento em regime de' + #13 +
                  'Livre Escolha pois este evento está cadastrado' + #13 +
                  'em suas especialidades',
                  -1
                  );
            end
            else
            begin
              if REGRA_EXECUCAO.FieldByName('REGRAEXCECAO').AsString = 'R' then
                MontaNegacao(pHandleOrigem,
                  SAM_ERRO_EXECUTOREVENTOLIVREESCOLHA,
                  'O executor (credenciado) não pode executar o evento em regime de' + #13 +
                  'Livre Escolha pois este evento está marcado como regra no' + #13 +
                  'cadastro de Regras e Exceções',
                  -1
                  );
            end;
            REGRA_EXECUCAO.Close;
          end; //LerMotivoNegacao
        end
        else if LerMotivoNegacao(SAM_ERRO_EXECUTOREVENTOLIVREESCOLHA, vRegimePgto, gLiberaPorAuxilio) <> nulo then
          MontaNegacao(pHandleOrigem,
            SAM_ERRO_EXECUTOREVENTOLIVREESCOLHA,
            'O executor (credenciado) não pode executar o evento em regime de' + #13 +
            'Livre Escolha',
            -1
            );
      end; //Executor Credenciado em Regime de LIvre Escolha

    //Fazer testes também para não credenciados
    NaoCredenciadoEmRegimeCredenciamento:
      begin
        if (samauto_GRAU.FieldByName('VERIFICACADASTROEXECUTOR').AsString = 'S') and
          (LerMotivoNegacao(SAM_ERRO_EXECUTOREVENTO, vRegimePgto, gLiberaPorAuxilio) <> nulo) then
        begin
          REGRA_EXECUCAO.Close;
          REGRA_EXECUCAO.ParamByName('PRESTADOR').Value := pExecutor;
          REGRA_EXECUCAO.ParamByName('EVENTO').Value := pEvento;
          REGRA_EXECUCAO.ParamByName('DATA').Value := pData;
          REGRA_EXECUCAO.ParamByName('REGIMEATENDIMENTO').Value := pRegimeAtendimento;
          REGRA_EXECUCAO.ParamByName('REDERESTRITA').Value := vgRedeRestrita;
          REGRA_EXECUCAO.Open;
          if REGRA_EXECUCAO.isEmpty then
          begin
            if not (ChkPrestadorEventoExec(pExecutor, pEvento, pRegimeAtendimento, pData)) then
              MontaNegacao(pHandleOrigem,
                SAM_ERRO_EXECUTOREVENTO,
                'O executor não pode executar o evento pelas especialidades',
                -1
                );
          end
          else
          begin
            if REGRA_EXECUCAO.FieldByName('REGRAEXCECAO').AsString = 'E' then
              MontaNegacao(pHandleOrigem,
                SAM_ERRO_EXECUTOREVENTO,
                'O executor não pode executar o evento, pois este evento está' + #13 +
                'marcado como exceção no cadastro de Regras e Exceções',
                -1
                );
          end;
          REGRA_EXECUCAO.Close;
          if LerMotivoNegacao(SAM_ERRO_EXECUTORHABILITACAO, vRegimePgto, gLiberaPorAuxilio) <> nulo then
          begin
            PRESTADOR_HABILITACAO.Close; //SELECIONA AS HABILITACAO QUE O PRESTADOR NAO POSSUI PARA EXECUTAR O EVENTO
            PRESTADOR_HABILITACAO.ParamByName('EVENTO').Value := pEvento;
            PRESTADOR_HABILITACAO.ParamByName('DATAAUTO').Value := pData;
            PRESTADOR_HABILITACAO.ParamByName('PRESTADOR').Value := pExecutor;
            PRESTADOR_HABILITACAO.Open;
            if not PRESTADOR_HABILITACAO.IsEmpty then
              MontaNegacao(pHandleOrigem, SAM_ERRO_EXECUTORHABILITACAO,
                'O executor não possui as habilitaçoes para executar o evento',
                -1);
            PRESTADOR_HABILITACAO.Close;
          end;
        end; //if verificar cadastro do executor
      end;

    //Fazer testes também para não credenciados
    NaoCredenciadoEmRegimeLivreEscolha:
      begin
        Q.Close;
        Q.SQL.Clear;
        Q.SQL.Add('SELECT P.ENTIDADE');
        Q.SQL.Add('FROM   SAM_PRESTADOR_PRESTADORDAENTID P');
        Q.SQL.Add('WHERE  P.PRESTADOR = :EXECUTOR');
        Q.SQL.Add('AND    P.DATAINICIAL <= :DATA');
        Q.SQL.Add('AND    (P.DATAFINAL IS NULL OR :DATA <=P.DATAFINAL)');
        Q.ParamByName('EXECUTOR').Value := pExecutor;
        Q.ParamByName('DATA').Value := pData;
        Q.Open;
        if not Q.IsEmpty then //Só negar se for membro de alguma entidade
        begin
          if LerMotivoNegacao(SAM_ERRO_EXECUTORMEMBROENTIDADEEVENTOLIVREESCOLHA, vRegimePgto, gLiberaPorAuxilio) <> nulo then
          begin
            REGRA_EXECUCAO.Close;
            REGRA_EXECUCAO.ParamByName('PRESTADOR').Value := pExecutor;
            REGRA_EXECUCAO.ParamByName('EVENTO').Value := pEvento;
            REGRA_EXECUCAO.ParamByName('DATA').Value := pData;
            REGRA_EXECUCAO.ParamByName('REGIMEATENDIMENTO').Value := pRegimeAtendimento;
            REGRA_EXECUCAO.ParamByName('REDERESTRITA').Value := vgRedeRestrita;
            REGRA_EXECUCAO.Open;
            if REGRA_EXECUCAO.isEmpty then
            begin
              if (ChkPrestadorEventoExec(pExecutor, pEvento, pRegimeAtendimento, pData)) then
                MontaNegacao(pHandleOrigem,
                  SAM_ERRO_EXECUTORMEMBROENTIDADEEVENTOLIVREESCOLHA,
                  'O executor membro de entidade não pode executar o evento em regime de' + #13 +
                  'Livre Escolha pois este evento está cadastrado' + #13 +
                  'em suas especialidades',
                  -1
                  );
            end
            else
            begin
              if REGRA_EXECUCAO.FieldByName('REGRAEXCECAO').AsString = 'R' then
                MontaNegacao(pHandleOrigem,
                  SAM_ERRO_EXECUTORMEMBROENTIDADEEVENTOLIVREESCOLHA,
                  'O executor membro de entidade não pode executar o evento em regime de' + #13 +
                  'Livre Escolha pois este evento está marcado como regra no' + #13 +
                  'cadastro de Regras e Exceções',
                  -1
                  );
            end;
            REGRA_EXECUCAO.Close;
          end; //LerMotivoNegacao
        end;
        Q.Close;
      end; //Executor Não Credenciado em Regime de LIvre Escolha
  end; //Case
  samauto_GRAU.Close;

end;

procedure TDM.ChecarEventoLocalExecucao(pHandleOrigem,
  pEvento,
  pGrau,
  pLocalExecucao,
  pRegimeAtendimento: Integer;
  pData: TDateTime);
var
  vComplemento: string;
begin

  if vgCodigoLocalExecucaoInvalido then
    exit; //Codigo do local de execução é inválido não executar a rotina

  vComplemento := '';
  samauto_GRAU.Close;
  samauto_GRAU.ParamByName('GRAU').Value := pGrau;
  samauto_GRAU.Open;

  //Junior - 01/10/2001
  //Verificar o Tipo de pessoa permitida no Grau de Atuação
  //Aletaradas Querys SAM_GRAU e EXECUTOR
  //SMS: 4460
  if (samauto_GRAU.FieldByName('TIPOEXECUTOR').AsString <> 'A') and
    (LerMotivoNegacao(SAM_ERRO_GRAUFISICAJURIDICALOCALEXECUCAO, vRegimePgto, gLiberaPorAuxilio) <> nulo) then
  begin
    if (samauto_GRAU.FieldByName('TIPOEXECUTOR').AsString = 'F') and
      (LOCALEXECUCAO.FieldByName('FISICAJURIDICA').AsInteger = C_PessoaJuridica) then
      MontaNegacao(pHandleOrigem,
        SAM_ERRO_GRAUFISICAJURIDICALOCALEXECUCAO,
        'O grau permite apenas pessoa Física',
        -1
        )
    else if (samauto_GRAU.FieldByName('TIPOEXECUTOR').AsString = 'J') and
      (LOCALEXECUCAO.FieldByName('FISICAJURIDICA').AsInteger = C_PessoaFisica) then
      MontaNegacao(pHandleOrigem,
        SAM_ERRO_GRAUFISICAJURIDICALOCALEXECUCAO,
        'O grau permite apenas pessoa Jurídica',
        -1
        );
  end;

  case vgTipoLocalExecucaoRegime of
    //Credenciado em Regime de Credenciamento - Normal.
    CredenciadoEmRegimeCredenciamento:
      begin
        if (samauto_GRAU.FieldByName('VERIFICACADASTROEXECUTOR').AsString = 'S') and
          (LerMotivoNegacao(SAM_ERRO_LOCALEXECUCAOEVENTO, vRegimePgto, gLiberaPorAuxilio) <> nulo) then
        begin
          REGRA_EXECUCAO.Close;
          REGRA_EXECUCAO.ParamByName('PRESTADOR').Value := pLocalExecucao;
          REGRA_EXECUCAO.ParamByName('EVENTO').Value := pEvento;
          REGRA_EXECUCAO.ParamByName('DATA').Value := pData;
          REGRA_EXECUCAO.ParamByName('REGIMEATENDIMENTO').Value := pRegimeAtendimento;
          REGRA_EXECUCAO.ParamByName('REDERESTRITA').Value := vgRedeRestrita;
          REGRA_EXECUCAO.Open;
          if REGRA_EXECUCAO.isEmpty then
          begin
            if not (ChkPrestadorEventoExec(pLocalExecucao, pEvento, pRegimeAtendimento, pData)) then
              MontaNegacao(pHandleOrigem,
                SAM_ERRO_LOCALEXECUCAOEVENTO,
                'O local de execução não pode executar o evento pelas especialidades',
                -1
                );
          end
          else
          begin
            if REGRA_EXECUCAO.FieldByName('REGRAEXCECAO').AsString = 'E' then
              MontaNegacao(pHandleOrigem,
                SAM_ERRO_LOCALEXECUCAOEVENTO,
                'O local de execução não pode executar o evento, pois este evento está' + #13 +
                'marcado como exceção no cadastro de Regras e Exceções',
                -1
                );
          end;
          REGRA_EXECUCAO.Close;
          if LerMotivoNegacao(SAM_ERRO_EXECUTORHABILITACAO, vRegimePgto, gLiberaPorAuxilio) <> nulo then
          begin
            PRESTADOR_HABILITACAO.Close; //SELECIONA AS HABILITACAO QUE O PRESTADOR NAO POSSUI PARA EXECUTAR O EVENTO
            PRESTADOR_HABILITACAO.ParamByName('EVENTO').Value := pEvento;
            PRESTADOR_HABILITACAO.ParamByName('DATAAUTO').Value := pData;
            PRESTADOR_HABILITACAO.ParamByName('PRESTADOR').Value := pLocalExecucao;
            PRESTADOR_HABILITACAO.Open;
            if not PRESTADOR_HABILITACAO.IsEmpty then
              MontaNegacao(pHandleOrigem, SAM_ERRO_EXECUTORHABILITACAO,
                'O local de execução não possui as habilitaçoes para executar o evento',
                -1);
            PRESTADOR_HABILITACAO.Close;
          end;
        end; //if verificar cadastro do executor
      end; //Credenciado em Regime de Credenciamento (normal);

    //Executor não Credenciado em Regime de Livre-Escolha.
    CredenciadoEmRegimeLivreEscolha:
      begin
        //Junior - 17/11/2000
        if not SAM_PARAMETROSPRESTADOR.Active then
          SAM_PARAMETROSPRESTADOR.Open;

        if SAM_PARAMETROSPRESTADOR.FieldByName('CREDENCIADOEMLIVREESCOLHA').AsString = 'S' then
        begin

          if LerMotivoNegacao(SAM_ERRO_LOCALEXECUCAOEVENTOLIVREESCOLHA, vRegimePgto, gLiberaPorAuxilio) <> nulo then
          begin
            REGRA_EXECUCAO.Close;
            REGRA_EXECUCAO.ParamByName('PRESTADOR').Value := pLocalExecucao;
            REGRA_EXECUCAO.ParamByName('EVENTO').Value := pEvento;
            REGRA_EXECUCAO.ParamByName('DATA').Value := pData;
            REGRA_EXECUCAO.ParamByName('REGIMEATENDIMENTO').Value := pRegimeAtendimento;
            REGRA_EXECUCAO.ParamByName('REDERESTRITA').Value := vgRedeRestrita;
            REGRA_EXECUCAO.Open;
            if REGRA_EXECUCAO.isEmpty then
            begin
              if (ChkPrestadorEventoExec(pLocalExecucao, pEvento, pRegimeAtendimento, pData)) then
                MontaNegacao(pHandleOrigem,
                  SAM_ERRO_LOCALEXECUCAOEVENTOLIVREESCOLHA,
                  'O local de execução (credenciado) não pode executar o evento em regime de' + #13 +
                  'Livre Escolha pois este evento está cadastrado' + #13 +
                  'em suas especialidades',
                  -1
                  );
            end
            else
            begin
              if REGRA_EXECUCAO.FieldByName('REGRAEXCECAO').AsString = 'R' then
                MontaNegacao(pHandleOrigem,
                  SAM_ERRO_LOCALEXECUCAOEVENTOLIVREESCOLHA,
                  'O local de execução (credenciado) não pode executar o evento em regime de' + #13 +
                  'Livre Escolha pois este evento está marcado como regra no' + #13 +
                  'cadastro de Regras e Exceções',
                  -1
                  );
            end;
            REGRA_EXECUCAO.Close;
          end; //LerMotivoNegacao
        end
        else if LerMotivoNegacao(SAM_ERRO_LOCALEXECUCAOEVENTOLIVREESCOLHA, vRegimePgto, gLiberaPorAuxilio) <> nulo then
          MontaNegacao(pHandleOrigem,
            SAM_ERRO_EXECUTOREVENTOLIVREESCOLHA,
            'O local de execução (credenciado) não pode executar o evento em regime de' + #13 +
            'Livre Escolha',
            -1
            );

      end; //Executor Credenciado em Regime de LIvre Escolha
    //Junior - 20/06/2000
    //Fazer testes também para não credenciados
    NaoCredenciadoEmRegimeCredenciamento:
      begin
        if (samauto_GRAU.FieldByName('VERIFICACADASTROEXECUTOR').AsString = 'S') and
          (LerMotivoNegacao(SAM_ERRO_LOCALEXECUCAOEVENTO, vRegimePgto, gLiberaPorAuxilio) <> nulo) then
        begin
          REGRA_EXECUCAO.Close;
          REGRA_EXECUCAO.ParamByName('PRESTADOR').Value := pLocalExecucao;
          REGRA_EXECUCAO.ParamByName('EVENTO').Value := pEvento;
          REGRA_EXECUCAO.ParamByName('DATA').Value := pData;
          REGRA_EXECUCAO.ParamByName('REGIMEATENDIMENTO').Value := pRegimeAtendimento;
          REGRA_EXECUCAO.ParamByName('REDERESTRITA').Value := vgRedeRestrita;
          REGRA_EXECUCAO.Open;
          if REGRA_EXECUCAO.isEmpty then
          begin
            if not (ChkPrestadorEventoExec(pLocalExecucao, pEvento, pRegimeAtendimento, pData)) then
              MontaNegacao(pHandleOrigem,
                SAM_ERRO_LOCALEXECUCAOEVENTO,
                'O local de execução não pode executar o evento pelas especialidades',
                -1
                );
          end
          else
          begin
            if REGRA_EXECUCAO.FieldByName('REGRAEXCECAO').AsString = 'E' then
              MontaNegacao(pHandleOrigem,
                SAM_ERRO_LOCALEXECUCAOEVENTO,
                'O local de execução não pode executar o evento, pois este evento está' + #13 +
                'marcado como exceção no cadastro de Regras e Exceções',
                -1
                );
          end;
          REGRA_EXECUCAO.Close;
          if LerMotivoNegacao(SAM_ERRO_EXECUTORHABILITACAO, vRegimePgto, gLiberaPorAuxilio) <> nulo then
          begin
            PRESTADOR_HABILITACAO.Close; //SELECIONA AS HABILITACAO QUE O PRESTADOR NAO POSSUI PARA EXECUTAR O EVENTO
            PRESTADOR_HABILITACAO.ParamByName('EVENTO').Value := pEvento;
            PRESTADOR_HABILITACAO.ParamByName('DATAAUTO').Value := pData;
            PRESTADOR_HABILITACAO.ParamByName('PRESTADOR').Value := pLocalExecucao;
            PRESTADOR_HABILITACAO.Open;
            if not PRESTADOR_HABILITACAO.IsEmpty then
              MontaNegacao(pHandleOrigem, SAM_ERRO_EXECUTORHABILITACAO,
                'O local de execução não possui as habilitaçoes para executar o evento',
                -1);
            PRESTADOR_HABILITACAO.Close;
          end;
        end; //if verificar cadastro do executor
      end;

  end; //Case
  samauto_GRAU.Close;
end;

procedure TDM.ChecarEventoRecebedor(pHandleOrigem,
  pEvento,
  pRecebedor,
  pRegimeAtendimento: Integer;
  pData: TDateTime);
begin

  if pRecebedor = nulo then
    exit; //Beneficiario é nulo

  if vgCodigoRecebedorInvalido then
    exit; //Codigo do recebedor é inválido não executar a rotina

  if LerMotivoNegacao(SAM_ERRO_RECEBEDOREVENTO, vRegimePgto, gLiberaPorAuxilio) = nulo then
    exit;

  REGRA_RECEBIMENTO.Close;
  REGRA_RECEBIMENTO.ParamByName('PRESTADOR').Value := pRecebedor;
  REGRA_RECEBIMENTO.ParamByName('EVENTO').Value := pEvento;
  REGRA_RECEBIMENTO.ParamByName('DATA').Value := pData;
  REGRA_RECEBIMENTO.ParamByName('REGIMEATENDIMENTO').Value := pRegimeAtendimento;
  REGRA_RECEBIMENTO.ParamByName('REDERESTRITA').Value := vgRedeRestrita;
  REGRA_RECEBIMENTO.Open;
  if REGRA_RECEBIMENTO.IsEmpty then
  begin
    if vgRecebedorMembroDe = 0 then
    begin
      if not (ChkRecebedorEventoExec(pRecebedor, pEvento, pRegimeAtendimento, pData)) then
        MontaNegacao(pHandleOrigem,
          SAM_ERRO_RECEBEDOREVENTO,
          'O executor não pode executar o evento pelas especialidades',
          -1
          );
    end
    else
    begin
      if not (ChkRecebedorDaEntidadeEventoExec(pRecebedor, vgRecebedorMembroDe, pEvento, pData)) then
        MontaNegacao(pHandleOrigem,
          SAM_ERRO_RECEBEDOREVENTO,
          'O recebedor não pode receber o evento. Exceção da especialidade no corpo clínico.',
          -1
          );
    end;
  end
  else
  begin
    if REGRA_RECEBIMENTO.FieldByName('REGRAEXCECAO').AsString = 'E' then
      MontaNegacao(pHandleOrigem,
        SAM_ERRO_RECEBEDOREVENTO,
        'O prestador não pode receber pelo evento, pois este evento está' + #13 +
        'marcado como exceção no cadastro de Regras e Exceções',
        -1
        );
  end;
  REGRA_RECEBIMENTO.Close;
end;

procedure TDM.ChecarGrauExecutor(pHandleOrigem,
  pGrau,
  pExecutor: integer;
  pData: TDateTime);
begin
  if pExecutor = nulo then
    exit;

  samauto_GRAU.Close;
  samauto_GRAU.ParamByName('GRAU').Value := pGrau;
  samauto_GRAU.Open;
  if (samauto_GRAU.FieldByName('VERIFICACADASTROEXECUTOR').AsString = 'N') then
    exit;

  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT A.REGRAEXCECAO');
  Q.SQL.Add('FROM   SAM_PRESTADOR_GRAU A');
  Q.SQL.Add('WHERE  (A.PRESTADOR = :PRESTADOR)');
  Q.SQL.Add('AND    (A.GRAU    = :GRAU)');
  Q.SQL.Add('AND    ((A.DATAINICIAL <= :DATA) AND ((:DATA <= A.DATAFINAL) OR (A.DATAFINAL IS NULL)))');
  Q.ParamByName('PRESTADOR').Value := pExecutor;
  Q.ParamByName('GRAU').Value := pGrau;
  Q.ParamByName('DATA').Value := pData;
  Q.Open;

  if Q.isEmpty then // checa a regra do grau que é por tipo de prestador
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT HANDLE');
    Q.SQL.Add('FROM   SAM_TIPOPRESTADOR A');
    Q.SQL.Add('WHERE  HANDLE = :HANDLE');
    Q.SQL.Add('AND    (NOT EXISTS(SELECT HANDLE');
    Q.SQL.Add('                   FROM   SAM_TIPOPRESTADOR_GRAU B');
    Q.SQL.Add('                   WHERE  B.TIPOPRESTADOR = A.HANDLE');
    Q.SQL.Add('                  )');
    Q.SQL.Add('        OR');
    Q.SQL.Add('        EXISTS(SELECT HANDLE');
    Q.SQL.Add('               FROM   SAM_TIPOPRESTADOR_GRAU C');
    Q.SQL.Add('               WHERE  C.TIPOPRESTADOR = A.HANDLE');
    Q.SQL.Add('               AND    C.GRAU = :GRAU');
    Q.SQL.Add('              )');
    Q.SQL.Add('       )');
    Q.ParamByName('HANDLE').Value := EXECUTOR.FieldByName('TIPOPRESTADOR').AsInteger;
    Q.ParamByName('GRAU').Value := pGrau;
    Q.Open;

    if Q.IsEmpty then
      MontaNegacao(phandleOrigem,
        SAM_ERRO_EXECUTORGRAU,
        'Executor não comporta o grau pelo cadastro do tipo de prestador',
        -1
        );

  end
  else
  begin
    if Q.FieldByName('REGRAEXCECAO').AsString = 'E' then // checa a exeção do grau que é por prestador
    begin

      MontaNegacao(phandleOrigem,
        SAM_ERRO_EXECUTORGRAU,
        'O prestador não pode executar o evento, pois o grau está marcado como exceção no cadastro de graus do prestador',
        -1
        )

    end;
  end;
  Q.Close;

end;

procedure TDM.ChecarGrauLocalExecucao(pHandleOrigem,
  pGrau,
  pLocalExecucao: integer);
begin
  if not LOCALEXECUCAO.Active then
  begin
    LOCALEXECUCAO.Close;
    LOCALEXECUCAO.ParamByName('HANDLE').Value := pLocalExecucao;
    LOCALEXECUCAO.Open;
    if LOCALEXECUCAO.IsEmpty then
      exit;
  end;
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT HANDLE');
  Q.SQL.Add('FROM   SAM_TIPOPRESTADOR A');
  Q.SQL.Add('WHERE  HANDLE = :HANDLE');
  Q.SQL.Add('AND    (NOT EXISTS(SELECT HANDLE');
  Q.SQL.Add('                   FROM   SAM_TIPOPRESTADOR_GRAU B');
  Q.SQL.Add('                   WHERE  B.TIPOPRESTADOR = A.HANDLE');
  Q.SQL.Add('                  )');
  Q.SQL.Add('        OR');
  Q.SQL.Add('        EXISTS(SELECT HANDLE');
  Q.SQL.Add('               FROM   SAM_TIPOPRESTADOR_GRAU C');
  Q.SQL.Add('               WHERE  C.TIPOPRESTADOR = A.HANDLE');
  Q.SQL.Add('               AND    C.GRAU = :GRAU');
  Q.SQL.Add('              )');
  Q.SQL.Add('       )');
  Q.ParamByName('HANDLE').Value := LOCALEXECUCAO.FieldByName('TIPOPRESTADOR').AsInteger;
  Q.ParamByName('GRAU').Value := pGrau;
  Q.Open;
  if Q.IsEmpty then
    MontaNegacao(phandleOrigem,
      SAM_ERRO_LOCALEXECUCAOGRAU,
      'Local de execução não comporta o grau' + #13 +
      'Verifique no cadastro o campo "Tipo do Prestador"',
      -1
      );
  Q.Close;
  Q.SQL.Clear;
end;

function TDM.ChecarEventoRegime(pTabela: string;
  pRegimeAtendimento,
  pRegra: integer): Integer;
var
  vVazio, vPossui: Boolean;
begin
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT REGIMEATENDIMENTO FROM');
  Q.SQL.Add(pTabela);
  Q.SQL.Add('WHERE REGRA=:REGRA');
  Q.ParamByName('REGRA').AsInteger := pRegra;
  Q.Open;
  vVazio := Q.IsEmpty;
  vPossui := False;
  if not vVazio then
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT REGIMEATENDIMENTO FROM');
    Q.SQL.Add(pTabela);
    Q.SQL.Add('WHERE (REGRA=:REGRA) AND (REGIMEATENDIMENTO=:REGIMEATENDIMENTO)');
    Q.ParamByName('REGRA').AsInteger := pRegra;
    Q.ParamByName('RA').AsInteger := pRegimeAtendimento;
    Q.Open;
    vPossui := not Q.IsEmpty; //se Possui o RegimeAtendimento então = True(pois nao está Vazio)
  end;

  //ok, pode executar o evento
  if (vVazio) or (vPossui) then
    Result := SAM_OK
  else
    Result := SAM_ERRO;
end;

function TDM.ChecarEventoDependente(pEventoOriginal,
  pEvento,
  pMatricula: integer): integer;
var
  vPais: array of integer;
  a, b, c: integer;
begin
  Result := -1;
  samauto_TGE_DEPENDENTE.Close;
  samauto_TGE_DEPENDENTE.ParamByName('EVENTO').AsInteger := pEvento;
  samauto_TGE_DEPENDENTE.Open;
  b := samauto_TGE_DEPENDENTE.RecordCount;
  if b = 0 then
  begin
    Result := 0;
    samauto_TGE_DEPENDENTE.Close;
    exit;
  end;

  SetLength(vPais, b);
  for a := 0 to b - 1 do
  begin
    vPais[a] := samauto_TGE_DEPENDENTE.FieldByName('EVENTO').AsInteger;
    samauto_TGE_DEPENDENTE.Next;
  end;
  samauto_TGE_DEPENDENTE.Close;

  for a := 0 to b - 1 do
  begin
    samauto_PRONTUARIO.Close;
    samauto_PRONTUARIO.ParamByName('EVENTO').Value := vPais[a];
    samauto_PRONTUARIO.ParamByName('MATRICULA').Value := pMatricula;
    samauto_PRONTUARIO.Open;
    c := samauto_PRONTUARIO.FieldByName('OCORRENCIA').AsInteger;
    samauto_PRONTUARIO.Close;
    if c > 0 then
    begin
      Result := vPais[a];
      break;
    end
    else
    begin
      if (vPais[a] = pEventoOriginal) then
        Result := -1 //esta em loop
      else
        Result := ChecarEventoDependente(pEventoOriginal, vPais[a], pMatricula); //chamada recursiva
      if Result <> 0 then
        break;
    end;
  end;
end;

procedure TDM.ChecarCobertura(pHandleOrigem,
  pEvento,
  pBeneficiario,
  pExecutor,
  pRecebedor,
  pContrato,
  pFinalidadeAtendimento,
  pCondicaoAtendimento,
  pLocalAtendimento,
  pObjetivoTratamento,
  pRegimeAtendimento,
  pTipoTratamento: Integer;
  pData,
  pBeneficiarioDataAdesao: TDateTime);
var
  vbBeneficiarioFazParteRedeRestrita: Boolean;
  vbContratoRedeRestrita: Boolean;
  vbAchou: Boolean;
begin
  WriteBDebug('SamAuto.DM.ChecarCobertura - Início');
  // Eduardo - 12/07/2004 - SMS 29875
  // Checagem da negação de rede restrita "independente" se achou módulo que deu cobertura
  if AcharModuloCobertura(
    pEvento,
    pBeneficiario,
    pData,
    pBeneficiarioDataAdesao,
    pFinalidadeAtendimento,
    pCondicaoAtendimento,
    pLocalAtendimento,
    pObjetivoTratamento,
    pRegimeAtendimento,
    pTipoTratamento) <> nulo then
    vbAchou := True
  else
    vbAchou := False;
  if vbAchou then
  begin
    WriteBDebug('SamAuto.DM.ChecarCobertura - Achou cobertura');
    //Achou um módulo que dava cobertura
    vgDataAdesaoModuloBeneficiario := MODULO_COBERTURA.FieldByName('DATAADESAO').AsDateTime;
    vgModuloQueDeuCobertura := MODULO_COBERTURA.FieldByName('MODULO').AsInteger;
    vgContratoModQueDeuCobertura := MODULO_COBERTURA.FieldByName('CONTRATOMOD').AsInteger;
    vgPlanoQueDeuCobertura := MODULO_COBERTURA.FieldByName('PLANO').AsInteger; //Valeska - sms 21638
    vgBeneficiarioModulo := MODULO_COBERTURA.FieldByName('BENEFICIARIOMOD').AsInteger;
    //Junior - 26/06/2001
    //Trocado executor por recebedor
    vbBeneficiarioFazParteRedeRestrita := ChecarRedeRestrita(pHandleOrigem,
      pRecebedor,
      pContrato,
      MODULO_COBERTURA.FieldByName('MODULO').AsInteger,
      MODULO_COBERTURA.FieldByName('PLANO').AsInteger,
      pEvento
      );
  end
  else
  begin
    WriteBDebug('SamAuto.DM.ChecarCobertura - Não achou cobertura');
    if LerMotivoNegacao(SAM_ERRO_BENEFICIARIOCOBERTURA, vRegimePgto, gLiberaPorAuxilio) <> nulo then
      MontaNegacao(pHandleOrigem, SAM_ERRO_BENEFICIARIOCOBERTURA, '', -1);
    vgModuloQueDeuCobertura := 0;
    vbContratoRedeRestrita := ChecarRedeRestritaContrato(pHandleOrigem, pRecebedor, pContrato);
    if vbContratoRedeRestrita then
    begin
      // Procurando pelo módulo obrigatório do contrato caso não achou módulo que deu cobertura
      // e checagem de rede restrita no contrato está ok
      q.Close;
      q.SQL.Clear;
      q.SQL.Add('SELECT CM.MODULO, CM.PLANO           ');
      q.SQL.Add('FROM SAM_CONTRATO_MOD CM,            ');
      q.SQL.Add('     SAM_MODULO M                    ');
      q.SQL.Add('WHERE CM.MODULO = M.HANDLE           ');
      q.SQL.Add('  AND CM.CONTRATO = :CONTRATO        ');
      q.SQL.Add('  AND CM.OBRIGATORIO = ''S''         ');
      q.ParamByName('CONTRATO').AsInteger := pContrato;
      q.Open;
      if not q.IsEmpty then
      begin
        ChecarRedeRestrita(pHandleOrigem,
          pRecebedor,
          pContrato,
          q.FieldByName('MODULO').AsInteger,
          q.FieldByName('PLANO').AsInteger,
          pEvento
          );
      end;
      q.Close;
    end;
  end;
  MODULO_COBERTURA.Close;
  WriteBDebug('SamAuto.DM.ChecarCobertura - Fim');
end;

function TDM.AcharModuloCobertura(
  pEvento,
  pBeneficiario: integer;
  pData,
  pBeneficiarioDataAdesao: TDateTime;
  pFinalidadeAtendimento,
  pCondicaoAtendimento,
  pLocalAtendimento,
  pObjetivoTratamento,
  pRegimeAtendimento,
  pTipoTratamento: integer): integer;
begin
  //procurar modulo que dá cobertura ao evento no beneficiario
  MODULO_COBERTURA.Close;
  MODULO_COBERTURA.ParamByName('EVENTO').Value := pEvento;
  MODULO_COBERTURA.ParamByName('BENEFICIARIO').Value := pBeneficiario;
  MODULO_COBERTURA.ParamByName('DATAAUTORIZACAO').Value := pData;
  MODULO_COBERTURA.Open;
  if MODULO_COBERTURA.IsEmpty then
  begin
    //NÃO ENCONTROU NENHUM MÓDULO QUE DÁ COBERTURA AO EVENTO PARA O BENEFICIARIO
    //RETORNAR ENTAO A DATA DE ADESAO DO BENEFICIARIO
    vgModuloQueDeuCobertura := 0;
    vgDataAdesaoModuloBeneficiario := pBeneficiarioDataAdesao;
  end;
  //Valeska - sms 21638
  vgPlanoQueDeuCobertura := MODULO_COBERTURA.FieldByName('PLANO').AsInteger;
  if vgPlanoQueDeuCobertura = 0 then
  begin
    //Beneficiário não tem cobertura para o evento
    vgPlanoQueDeuCobertura := DM.samauto_BENEFICIARIO.FieldByName('PLANO').AsInteger;
  end;

  //caract atendimento
  Result := nulo;
  while not MODULO_COBERTURA.EOF do
  begin
    CARAC_ATENDIMENTO.Close;
    CARAC_ATENDIMENTO.ParamByName('MODULO').Value := MODULO_COBERTURA.FieldByName('MODULO').AsInteger;
    //Junior - 13/12/200
    CARAC_ATENDIMENTO.ParamByName('FA').Value := pFinalidadeAtendimento;
    CARAC_ATENDIMENTO.ParamByName('CA').Value := pCondicaoAtendimento;
    CARAC_ATENDIMENTO.ParamByName('LA').Value := pLocalAtendimento;
    CARAC_ATENDIMENTO.ParamByName('OT').Value := pObjetivoTratamento;
    CARAC_ATENDIMENTO.ParamByName('RA').Value := pRegimeAtendimento;
    CARAC_ATENDIMENTO.ParamByName('TT').Value := pTipoTratamento;
    CARAC_ATENDIMENTO.Open;
    if not CARAC_ATENDIMENTO.IsEmpty then
    begin
      Result := MODULO_COBERTURA.FieldByName('MODULO').AsInteger;
      break; //achou o modulo que satisfaz
    end;
    MODULO_COBERTURA.Next;
  end;
end;

function TDM.BeneficiarioDvOk(pHandle: Integer;
  pDV: string;
  pData: TDateTime): boolean;
var
  vVigenciaInicial, vVigenciaFinal: TDateTime;
begin
  //Funcao para verificar se o DV do beneficiario está oK
  samauto_BENEFICIARIO_CARTAOIDENTIF.Close;
  samauto_BENEFICIARIO_CARTAOIDENTIF.ParamByName('BENEFICIARIO').AsInteger := pHandle;
  samauto_BENEFICIARIO_CARTAOIDENTIF.ParamByName('DV').AsString := pDV;
  samauto_BENEFICIARIO_CARTAOIDENTIF.Open;
  if samauto_BENEFICIARIO_CARTAOIDENTIF.IsEmpty then
  begin
    Result := False;
    exit;
  end
  else
  begin
    if (samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('SITUACAO').AsString <> 'N') then
      Result := False
    else
    begin
      vVigenciaInicial := PrimeiroDiaCompetencia(samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('COMPETENCIAINICIALVALIDADE').AsDateTime);
      vVigenciaFinal := UltimoDiaCompetencia(samauto_BENEFICIARIO_CARTAOIDENTIF.FieldByName('COMPETENCIAFINALVALIDADE').AsDateTime);
      if (vVigenciaInicial <= pData) and (pData <= vVigenciaFinal) then
        Result := True
      else
        Result := False;
    end;
  end;
end;

procedure TDM.ContQtdPagaEG(pHandleEventoGerado: integer;
  pQuantidade, pValorCalculado: double);
begin
  if ABS(pQuantidade) > 0 then
  begin
    X.Close;
    X.SQL.Clear;
    X.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO');
    X.SQL.Add('SET    QTDPAGA = QTDPAGA + :QUANTIDADE');
    X.SQL.Add('WHERE  (HANDLE = :HANDLE)');
    X.ParamByName('HANDLE').AsInteger := pHandleEventoGerado;
    X.ParamByName('QUANTIDADE').AsFloat := pQuantidade;
    X.ExecSql;

    X.Close;
    X.SQL.Clear;

    X.SQL.Add('UPDATE SAM_BENEFICIARIO_CONTLIM');
    X.SQL.Add('SET    QTDAUTORIZADA = QTDAUTORIZADA - :QUANTIDADE');
    X.SQL.Add('WHERE HANDLE IN (SELECT DISTINCT CONTLIMBENEFICIARIO');
    X.SQL.Add('                 FROM SAM_BENEFICIARIO_CONTLIMEVENTO');
    X.SQL.Add('                 WHERE EVENTOGERADO = :EVENTOGERADO)');

    X.ParamByName('EVENTOGERADO').AsInteger := pHandleEventoGerado;
    X.ParamByName('QUANTIDADE').AsFloat := pQuantidade;
    X.ExecSql;

    X.Close;
    X.SQL.Clear;
    X.SQL.Add('UPDATE SAM_FAMILIA_CONTLIM');
    X.SQL.Add('SET    QTDAUTORIZADA = QTDAUTORIZADA - :QUANTIDADE');
    X.SQL.Add(' WHERE HANDLE IN (SELECT DISTINCT CONTLIMFAMILIA');
    X.SQL.Add('                  FROM SAM_FAMILIA_CONTLIMEVENTO');
    X.SQL.Add('                  WHERE EVENTOGERADO = :EVENTOGERADO)');

    X.ParamByName('EVENTOGERADO').AsInteger := pHandleEventoGerado;
    X.ParamByName('QUANTIDADE').AsFloat := pQuantidade;
    X.ExecSql;

    X.Close;
    X.SQL.Clear;
    X.SQL.Add('UPDATE SAM_CONTRATO_CONTLIM');
    X.SQL.Add('SET    QTDAUTORIZADA = QTDAUTORIZADA - :QUANTIDADE');
    X.SQL.Add('WHERE HANDLE IN (SELECT DISTINCT CONTLIMCONTRATO');
    X.SQL.Add('                 FROM SAM_CONTRATO_CONTLIMEVENTO');
    X.SQL.Add('                 WHERE EVENTOGERADO = :EVENTOGERADO)');

    X.ParamByName('EVENTOGERADO').AsInteger := pHandleEventoGerado;
    X.ParamByName('QUANTIDADE').AsFloat := pQuantidade;
    X.ExecSql;
  end;

  if ABS(pValorCalculado) > 0 then
  begin
    X.Close;
    X.SQL.Clear;
    X.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO');
    X.SQL.Add('SET    VALORPAGO = VALORPAGO + :VALOR');
    X.SQL.Add('WHERE  (HANDLE = :HANDLE)');
    X.ParamByName('HANDLE').AsInteger := pHandleEventoGerado;
    X.ParamByName('VALOR').AsFloat := pValorCalculado;
    X.ExecSql;

    X.Close;
    X.SQL.Clear;
    X.SQL.Add('UPDATE SAM_BENEFICIARIO_CONTLIM');
    X.SQL.Add('SET    VALORAUTORIZADO = VALORAUTORIZADO - :VALOR');
    X.SQL.Add('WHERE HANDLE IN (SELECT DISTINCT CONTLIMBENEFICIARIO');
    X.SQL.Add('                 FROM SAM_BENEFICIARIO_CONTLIMEVENTO');
    X.SQL.Add('                 WHERE EVENTOGERADO = :EVENTOGERADO)');

    X.ParamByName('EVENTOGERADO').AsInteger := pHandleEventoGerado;
    X.ParamByName('VALOR').AsFloat := pValorCalculado;
    X.ExecSql;

    X.Close;
    X.SQL.Clear;
    X.SQL.Add('UPDATE SAM_FAMILIA_CONTLIM');
    X.SQL.Add('SET    VALORAUTORIZADO = VALORAUTORIZADO - :VALOR');
    X.SQL.Add(' WHERE HANDLE IN (SELECT DISTINCT CONTLIMFAMILIA');
    X.SQL.Add('                  FROM SAM_FAMILIA_CONTLIMEVENTO');
    X.SQL.Add('                  WHERE EVENTOGERADO = :EVENTOGERADO)');

    X.ParamByName('EVENTOGERADO').AsInteger := pHandleEventoGerado;
    X.ParamByName('VALOR').AsFloat := pValorCalculado;
    X.ExecSql;

    X.Close;
    X.SQL.Clear;
    X.SQL.Add('UPDATE SAM_CONTRATO_CONTLIM');
    X.SQL.Add('SET    VALORAUTORIZADO = VALORAUTORIZADO - :VALOR');
    X.SQL.Add('WHERE HANDLE IN (SELECT DISTINCT CONTLIMCONTRATO');
    X.SQL.Add('                 FROM SAM_CONTRATO_CONTLIMEVENTO');
    X.SQL.Add('                 WHERE EVENTOGERADO = :EVENTOGERADO)');

    X.ParamByName('EVENTOGERADO').AsInteger := pHandleEventoGerado;
    X.ParamByName('VALOR').AsFloat := pValorCalculado;
    X.ExecSql;
  end;

end;

procedure TDM.ChecarFamiliaSemResponsavel(pData: TDateTime);
var
  vComplemento: string;
begin
  case samauto_BENEFICIARIO.FieldByName('FTABRESPONSAVEL').AsInteger of
    1:
      begin
        if samauto_BENEFICIARIO.FieldByName('FTITULARRESPONSAVEL').IsNull then
          MontaNegacaoBenefPrestador(SAM_ERRO_FAMILIASEMRESPONSAVEL, '')
        else
        begin
          Q.Close;
          Q.SQL.Clear;
          Q.SQL.Add('SELECT DATAADESAO, DATABLOQUEIO, DATACANCELAMENTO FROM SAM_BENEFICIARIO WHERE HANDLE = :HANDLE');
          Q.ParamByName('HANDLE').Value := samauto_BENEFICIARIO.FieldByName('FTITULARRESPONSAVEL').AsInteger;
          Q.Open;
          if not Q.IsEmpty then
          begin
            if not Q.FieldByName('DATACANCELAMENTO').IsNull then
              if not ((Q.FieldByName('DATAADESAO').AsDateTime <= pData) and (pData <= Q.FieldByName('DATACANCELAMENTO').AsDateTime)) then
              begin
                vComplemento := 'Data de adesão do responsável: %s' + #13 +
                  'Data de cancelamento.........: %s' + #13 +
                  'Data de atendimento..........: %s';
                vComplemento := format(vComplemento,
                  [Q.FieldByName('DATAADESAO').AsString, Q.FieldByName('DATACANCELAMENTO').AsString, DateToStr(pData)]
                  );
                MontaNegacaoBenefPrestador(SAM_ERRO_FAMILIARESPONSAVELINATIVO, vComplemento);
              end;

            if not Q.FieldByName('DATABLOQUEIO').IsNull then
              if not (Q.FieldByName('DATAADESAO').IsNull) then
                MontaNegacaoBenefPrestador(SAM_ERRO_FAMILIARESPONSAVELBLOQUEADO,
                  format('Bloqueado em: %s', [Q.FieldByName('DATABLOQUEIO').AsString])
                  );
          end;
          Q.Close;
        end;
      end;
    2:
      begin
        if samauto_BENEFICIARIO.FieldByName('FPESSOARESPONSAVEL').IsNull then
          MontaNegacaoBenefPrestador(SAM_ERRO_FAMILIASEMRESPONSAVEL, '')
        else
        begin
          Q.Close;
          Q.SQL.Clear;
          Q.SQL.Add('SELECT DATAENTRADA, DATASAIDA FROM SFN_PESSOA WHERE HANDLE = :HANDLE');
          Q.ParamByName('HANDLE').Value := samauto_BENEFICIARIO.FieldByName('FPESSOARESPONSAVEL').AsInteger;
          Q.Open;
          if not Q.IsEmpty then
          begin
            if not (Q.FieldByName('DATASAIDA').IsNull) and
              not ((Q.FieldByName('DATAENTRADA').AsDateTime <= pData) and (pData <= Q.FieldByName('DATASAIDA').AsDateTime)) then
            begin
              vComplemento := 'Data de adesão do responsável: %s' + #13 +
                'Data de cancelamento.........: %s' + #13 +
                'Data de atendimento..........: %s';
              vComplemento := format(vComplemento,
                [Q.FieldByName('DATAENTRADA').AsString, Q.FieldByName('DATASAIDA').AsString, DateToStr(pData)]
                );
              MontaNegacaoBenefPrestador(SAM_ERRO_FAMILIARESPONSAVELINATIVO, vComplemento);
            end;
          end;
          Q.Close;
        end;
      end // do Tabtiporesponsavel = 2 - pessoa
  end; //do Case
end;

                  {   FUNÇÕES E PROCEDIMENTOS GENÉRICOS }


procedure TDM.CriarObjetos;
begin
  FrmAlertas.vLstObs := TList.Create;
  FrmAlertas.vLstAlerta := TList.Create;
  vLstNegacao := TList.Create;
  DMLimite.vLstLimite := TList.Create;
  vLstNegacaoBenefPrestador := TList.Create;
  vLstNegacoesValidas := TList.Create;
end;

procedure TDM.LimparObjetos;
var
  i: integer;
begin

  with FrmAlertas do
  begin
    for i := 0 to vLstObs.Count - 1 do
      Dispose(vLstObs.items[i]);
    vLstObs.Clear;
    for i := 0 to vLstAlerta.Count - 1 do
      Dispose(vLstAlerta.Items[i]);
    vLstAlerta.Clear;
  end;

  for i := 0 to vLstNegacao.Count - 1 do
    Dispose(vLstNegacao.items[i]);
  vLstNegacao.Clear;

  for i := 0 to DMLimite.vLstLimite.Count - 1 do
    Dispose(DMLimite.vLstLimite.Items[i]);
  DMLimite.vLstLimite.Clear;

  for i := 0 to vLstNegacaoBenefPrestador.Count - 1 do
    Dispose(vLstNegacaoBenefPrestador.items[i]);
  vLstNegacaoBenefPrestador.Clear;
end;

procedure TDM.PrepararQueries;
begin
  SQLPCTPRESTADOR.Prepare;
  SQLPCTMUNICIPIO.Prepare;
  SQLPCTESTADO.Prepare;
  SQLPCTGERAL.Prepare;
  SQLTGECOMPLEMENTAR.Prepare;
  samauto_AUTORIZ_EVENTOSOLICIT.Prepare;
  EXECUTOR.Prepare;
  SAM_PARAMETROSGERAIS.Prepare;
  samauto_ACOMODACAO_EVENTO.Prepare;
  samauto_BENEFICIARIO.Prepare;
  samauto_BENEFICIARIO_CARTAOIDENTIF.Prepare;
  samauto_CONTRATO_TPDEP.Prepare;
  samauto_CONTRATO_TPDEP_DOC.Prepare;
  samauto_PRESTADOR_ESPECIALIDADE.Prepare;
  samauto_PRESTADOR_AFASTAMENTO.Prepare;
  samauto_TGE.Prepare;
  samauto_TGE_GRAU.Prepare;
  samauto_PRONTUARIO.Prepare;
  PRAZO_INTERVALAR_AUTORIZ.Prepare;
  PRAZO_INTERVALAR_GUIA.Prepare;
  samauto_TGE_DEPENDENTE.Prepare;
  MODULO_COBERTURA.Prepare;
  CARAC_ATENDIMENTO.Prepare;
  REDE_RESTRITA.Prepare;
  samauto_REDERESTRITA_PRESTADOR.Prepare;
  samauto_REDEDIFERENCIADA_PRESTADOR.Prepare;
  REGRA_EXECUCAO.Prepare;
  PODEEXECUTAR.Prepare;
  samauto_PRESTADOR_PRESTADORDAENTID.Prepare;
  PRESTADOR_HABILITACAO.Prepare;
  CARENCIA.Prepare;
  SUSPENSAO.Prepare;
  SUSPENSAO_TITULAR.Prepare;
  with FrmAlertas do
  begin
    ALERTA_BENEFICIARIO.Prepare;
    ALERTA_CONTRATO.Prepare;
    ALERTA_PLANO.Prepare;
    ALERTA_FAMILIA.Prepare;
    ALERTA_MUNICIPIO.Prepare;
    ALERTA_PRESTADOR.Prepare;
    ALERTA_ESTADO.Prepare;
    ALERTA_GERAL.Prepare;
  end;
  SOLICITANTE.Prepare;
  EXECUTOR_AUX.Prepare;
  samauto_AUTORIZ_EVENTONEGACAO.Prepare;
  MOTIVO_NEGACAO.Prepare;
  samauto_GRAU.Prepare;
  with DMLimite do
  begin
    LIMITACAO.Prepare;
    BENEFICIARIO_POR_FAMILIAMOD.Prepare;
    BENEFICIARIO_POR_CONTRATOMOD.Prepare;
    samauto_BENEFICIARIO_CONTLIM.Prepare;
    samauto_FAMILIA_CONTLIM.Prepare;
    samauto_CONTRATO_CONTLIM.Prepare;
    CONT_BENEFICIARIO.Prepare;
    CONT_FAMILIA.Prepare;
    CONT_CONTRATO.Prepare;
    CONTA_LIMITES.Prepare;
  end;
end;

procedure TDM.MontaNegacao(pHandleOrigem, pNegacao: integer;
  pComplemento: WideString; pQtdAutorizada: Currency);
begin
  MontaNegacaoInterno(pHandleOrigem, pNegacao,
    pComplemento, pQtdAutorizada, -1);
end;

procedure TDM.MontaNegacao(pHandleOrigem, pNegacao: integer;
  pComplemento: WideString; pQtdAutorizada, pValorAutorizado: Currency);
begin
  MontaNegacaoInterno(pHandleOrigem, pNegacao,
    pComplemento, pQtdAutorizada, pValorAutorizado);
end;

procedure TDM.MontaNegacaoDeAlertas(pHandleOrigem,
  pNegacao: integer;
  pComplemento: WideString);
begin
  New(RecNegacao);
  RecNegacao^.Negacao := pNegacao;
  RecNegacao^.HandleOrigem := pHandleOrigem;
  RecNegacao^.Complemento := pComplemento;
  RecNegacao^.SamMotivoNegacao := pNegacao;
  RecNegacao^.QtdAutorizada := -1;
  RecNegacao^.QtdLiberadaAuxilio := -1;
  vLstNegacao.Add(RecNegacao);
end;

procedure TDM.MontaNegacaoBenefPrestador(pNegacao: integer;
  pComplemento: WideString);
var
  vSamMotivoNegacao: integer;
begin
  vSamMotivoNegacao := LerMotivoNegacao(pNegacao, vRegimePgto, gLiberaPorAuxilio);
  if vSamMotivoNegacao <> nulo then
  begin
    New(RecNegacaoBenefPrestador);
    RecNegacaoBenefPrestador^.Negacao := pNegacao;
    RecNegacaoBenefPrestador^.Complemento := pComplemento;
    RecNegacaoBenefPrestador^.SamMotivoNegacao := vSamMotivoNegacao;
    vLstNegacaoBenefPrestador.Add(RecNegacaoBenefPrestador);
  end;
end;

procedure TDM.LerBeneficiario(pHandle: integer);
begin
  WriteBDebug(Concat('SamAuto.DM.LerBeneficiario - pHandle [', IntToStr(pHandle),']'));
  samauto_BENEFICIARIO.Close;
  samauto_BENEFICIARIO.ParamByName('BENEFICIARIOHANDLE').Value := pHandle;
  samauto_BENEFICIARIO.Open;
end;

procedure TDM.LerExecutor(pHandle: integer);
begin
  WriteBDebug(Concat('SamAuto.DM.LerExecutor - pHandle [', IntToStr(pHandle),']'));
  EXECUTOR.Close;
  EXECUTOR.ParamByName('PRESTADOR').Value := pHandle;
  EXECUTOR.Open;
end;

procedure TDM.LerRecebedor(pHandle: integer);
begin
  WriteBDebug(Concat('SamAuto.DM.LerRecebedor - pHandle [', IntToStr(pHandle), ']'));
  RECEBEDOR.Close;
  RECEBEDOR.ParamByName('PRESTADOR').Value := pHandle;
  RECEBEDOR.Open;
end;

procedure TDM.LerSolicitante(pHandle: integer);
begin
  WriteBDebug(Concat('SamAuto.DM.LerSolicitante - pHandle [', IntToStr(pHandle), ']'));
  SOLICITANTE.Close;
  SOLICITANTE.ParamByName('PRESTADOR').Value := pHandle;
  SOLICITANTE.Open;
end;

procedure TDM.LerLocalExecucao(pHandle: integer);
begin
  WriteBDebug(Concat('SamAuto.DM.LerLocalExecucao - pHandle [', IntToStr(pHandle), ']'));
  LOCALEXECUCAO.Close;
  LOCALEXECUCAO.ParamByName('PRESTADOR').Value := pHandle;
  LOCALEXECUCAO.Open;
end;

procedure TDM.AbrirTabelas;
begin
  WriteBDebug('SamAuto.DM.AbrirTabelas');
  SAM_PARAMETROSGERAIS.Open;
  SAM_PARAMETROSPRESTADOR.Open;
end;

procedure TDM.FecharTabelas;
begin
  WriteBDebug('SamAuto.DM.FecharTabelas');
  samauto_AUTORIZ_EVENTOSOLICIT.Close;
  SAM_PARAMETROSGERAIS.Close;
  SAM_PARAMETROSPRESTADOR.Close;
end;

function TDM.TemEventosGeradosPagos(pHandleOrigem: integer; pLocal: char): boolean;
begin
  WriteBDebug(Concat('SamAuto.DM.TemEventosGeradosPagos - pHandleOrigem [', IntToStr(pHandleOrigem), '] pLocal [', pLocal, ']'));
  Result := False;
  case pLocal of
    'A':
      begin //Autorizacao
        Q.Close;
        Q.SQL.Clear;
        Q.SQL.Add('SELECT COUNT(*) PAGOS');
        Q.SQL.Add('FROM   SAM_AUTORIZ A');
        Q.SQL.Add('JOIN   SAM_AUTORIZ_EVENTOSOLICIT ES ON ES.AUTORIZACAO = A.HANDLE');
        Q.SQL.Add('JOIN   SAM_AUTORIZ_EVENTOGERADO EG ON EG.EVENTOSOLICITADO = ES.HANDLE');
        Q.SQL.Add('WHERE  A.HANDLE = :HANDLE');
        Q.SQL.Add('AND    EG.QTDPAGA IS NOT NULL');
        Q.SQL.Add('AND    EG.QTDPAGA >0');
        Q.Prepare;
        Q.ParamByName('HANDLE').Value := pHandleOrigem;
        Q.Open;
        if Q.FieldByName('PAGOS').AsCurrency > 0 then
          Result := True
        else
          Result := False;
      end;
    'S':
      begin //Solicitacao
        Q.Close;
        Q.SQL.Clear;
        Q.SQL.Add('SELECT COUNT(*) PAGOS');
        Q.SQL.Add('FROM   SAM_AUTORIZ_EVENTOSOLICIT ES');
        Q.SQL.Add('JOIN   SAM_AUTORIZ_EVENTOGERADO EG ON EG.EVENTOSOLICITADO = ES.HANDLE');
        Q.SQL.Add('WHERE  ES.HANDLE = :HANDLE');
        Q.SQL.Add('AND    EG.QTDPAGA IS NOT NULL');
        Q.SQL.Add('AND    EG.QTDPAGA >0');
        Q.Prepare;
        Q.ParamByName('HANDLE').Value := pHandleOrigem;
        Q.Open;
        if Q.FieldByName('PAGOS').AsCurrency > 0 then
          Result := True
        else
          Result := False;
      end;
    'G':
      begin //Evento Gerado
        Q.Close;
        Q.SQL.Clear;
        Q.SQL.Add('SELECT COUNT(*) PAGOS');
        Q.SQL.Add('FROM   SAM_AUTORIZ_EVENTOGERADO');
        Q.SQL.Add('WHERE  HANDLE = :HANDLE');
        Q.SQL.Add('AND    QTDPAGA IS NOT NULL');
        Q.SQL.Add('AND    QTDPAGA >0');
        Q.Prepare;
        Q.ParamByName('HANDLE').Value := pHandleOrigem;
        Q.Open;
        if Q.FieldByName('PAGOS').AsCurrency > 0 then
          Result := True
        else
          Result := False;
      end;
  end;
  WriteBDebug(Concat('SamAuto.DM.TemEventosGeradosPagos - Result [', BoolToStr(Result, True), ']'));
end;

function TDM.FindTGEPos(pHandle: longint): string;
begin
  //Vericar dar como resultado a exigencia ou não de exames pós-operatórios
  samauto_TGE.Close;
  samauto_TGE.Params[0].Value := pHandle;
  samauto_TGE.Open;
  Result := samauto_TGE.FieldByName('EXAMEPOSOPERATORIO').AsString;
  samauto_TGE.Close;
end;

function TDM.LerMotivoNegacao(pMotivoNegacao, pRegimePgto: integer; var pLiberaPorAuxilio: string): integer;
var
  i: integer;
begin
  Result := nulo;
  for i := 0 to vLstNegacoesValidas.Count - 1 do
  begin
    RecNegacoesValidas := vLstNegacoesValidas.items[i];
    if (RecNegacoesValidas.Codigo = pMotivoNegacao) and
      ((vgOrigemDoProcesso = 'A') or
      ((vgOrigemDoProcesso = 'P') and
      (RecNegacoesValidas.ConsideraNoPagamento = 'S')) or
      (vgOrigemClinica)
      ) and ((RecNegacoesValidas.RegimePagamento = '9') or
      (RecNegacoesValidas.RegimePagamento = IntToStr(pRegimePgto)
      )
      ) then
    begin
      pLiberaPorAuxilio := RecNegacoesValidas.LiberaPorAuxilio;
      Result := RecNegacoesValidas.HandleNegacao;
      break;
    end;
  end;
end;

procedure TDM.CarregarNegacoes;
var
  i: integer;
begin
  for i := 0 to vLstNegacoesValidas.Count - 1 do
    Dispose(vLstNegacoesValidas.Items[i]);
  vLstNegacoesValidas.Clear;
  if ((vgOrigemdoProcesso = 'P') or (vgOrigemdoProcesso = 'R')) then
  begin
    MOTIVO_NEGACAO.SQL.Clear;
    MOTIVO_NEGACAO.Close;
    MOTIVO_NEGACAO.SQL.Add('SELECT SIS_MOTIVONEGACAO.CODIGO, ');
    MOTIVO_NEGACAO.SQL.Add('       SAM_MOTIVONEGACAO.HANDLE, ');
    MOTIVO_NEGACAO.SQL.Add('       NA.HANDLE LIBERAPORAUXILIO,');
    MOTIVO_NEGACAO.SQL.Add('       SAM_MOTIVONEGACAO_SIS.CONSIDERANOPAGAMENTO, ');
    MOTIVO_NEGACAO.SQL.Add('       SAM_MOTIVONEGACAO.REGIMEPAGAMENTO');
    MOTIVO_NEGACAO.SQL.Add('  FROM SIS_MOTIVONEGACAO');
    MOTIVO_NEGACAO.SQL.Add('  JOIN SAM_MOTIVONEGACAO_SIS ON (SAM_MOTIVONEGACAO_SIS.SISMOTIVONEGACAO = SIS_MOTIVONEGACAO.HANDLE)');
    MOTIVO_NEGACAO.SQL.Add('  JOIN SAM_MOTIVONEGACAO     ON (SAM_MOTIVONEGACAO.HANDLE               = SAM_MOTIVONEGACAO_SIS.SAMMOTIVONEGACAO)');
    MOTIVO_NEGACAO.SQL.Add('  LEFT JOIN SAM_MOTIVONEGACAO_AUXILIO NA ON (NA.MOTIVONEGACAO = SAM_MOTIVONEGACAO.HANDLE)');
    MOTIVO_NEGACAO.SQL.Add(' WHERE SAM_MOTIVONEGACAO_SIS.CONSIDERANOPAGAMENTO = ''S'' ');
    // sms 19900 - desconsiderar negações passadas como parâmetro ao montar o select
    // juliana 15/10/2003
    if vgNegacoesDesconsiderar <> '' then
    begin
      MOTIVO_NEGACAO.SQL.Add(' AND SIS_MOTIVONEGACAO.CODIGO NOT IN (:NEGACOESDESCONSIDERAR)');
      MOTIVO_NEGACAO.ParamByName('NEGACOESDESCONSIDERAR').Value := vgNegacoesDesconsiderar;
    end;
    MOTIVO_NEGACAO.Open;
  end
  else
  begin
    MOTIVO_NEGACAO.SQL.Clear;
    MOTIVO_NEGACAO.Close;
    MOTIVO_NEGACAO.SQL.Add('SELECT SIS_MOTIVONEGACAO.CODIGO, ');
    MOTIVO_NEGACAO.SQL.Add('       SAM_MOTIVONEGACAO.HANDLE, ');
    MOTIVO_NEGACAO.SQL.Add('       NA.HANDLE LIBERAPORAUXILIO,');
    MOTIVO_NEGACAO.SQL.Add('       SAM_MOTIVONEGACAO_SIS.CONSIDERANOPAGAMENTO, ');
    MOTIVO_NEGACAO.SQL.Add('       SAM_MOTIVONEGACAO.REGIMEPAGAMENTO');
    MOTIVO_NEGACAO.SQL.Add('  FROM SIS_MOTIVONEGACAO');
    MOTIVO_NEGACAO.SQL.Add('  JOIN SAM_MOTIVONEGACAO_SIS ON (SAM_MOTIVONEGACAO_SIS.SISMOTIVONEGACAO = SIS_MOTIVONEGACAO.HANDLE)');
    MOTIVO_NEGACAO.SQL.Add('  JOIN SAM_MOTIVONEGACAO     ON (SAM_MOTIVONEGACAO.HANDLE               = SAM_MOTIVONEGACAO_SIS.SAMMOTIVONEGACAO)');
    MOTIVO_NEGACAO.SQL.Add('  LEFT JOIN SAM_MOTIVONEGACAO_AUXILIO NA ON (NA.MOTIVONEGACAO = SAM_MOTIVONEGACAO.HANDLE)');
    MOTIVO_NEGACAO.Open;
  end;
  while not MOTIVO_NEGACAO.EOF do
  begin
    New(RecNegacoesValidas);
    vLstNegacoesValidas.Add(RecNegacoesValidas);
    RecNegacoesValidas.Codigo := MOTIVO_NEGACAO.FieldByName('CODIGO').AsInteger;
    RecNegacoesValidas.HandleNegacao := MOTIVO_NEGACAO.FieldByName('HANDLE').AsInteger;

    if MOTIVO_NEGACAO.FieldByName('LIBERAPORAUXILIO').IsNull then
      RecNegacoesValidas.LiberaPorAuxilio := 'N'
    else
      RecNegacoesValidas.LiberaPorAuxilio := 'S';

    //Junior - 31/10/2001
    if vgOrigemClinica then
      RecNegacoesValidas.ConsideraNoPagamento := 'S';
    RecNegacoesValidas.ConsideraNoPagamento := MOTIVO_NEGACAO.FieldByName('CONSIDERANOPAGAMENTO').AsString;
    RecNegacoesValidas.RegimePagamento := MOTIVO_NEGACAO.FieldByName('REGIMEPAGAMENTO').AsString;

    MOTIVO_NEGACAO.Next;
  end;
end;

function TDM.ChkPrestadorEventoExec(
  pExecutor,
  pEvento,
  pRegimeAtendimento: integer;
  pData: TDateTime): boolean;
begin
  PODEEXECUTAR.Close;
  PODEEXECUTAR.ParamByName('PRESTADOR').AsInteger := pExecutor;
  PODEEXECUTAR.ParamByName('EVENTO').AsInteger := pEvento;
  PODEEXECUTAR.ParamByName('REGIMEATENDIMENTO').AsInteger := pRegimeAtendimento;
  PODEEXECUTAR.ParamByName('DATA').AsDateTime := pData;
  PODEEXECUTAR.ParamByName('REDERESTRITA').Value := vgRedeRestrita;
  PODEEXECUTAR.Open;
  if PODEEXECUTAR.IsEmpty then
    Result := False //Gera Uma Negacao
  else
    Result := True; //Prestador pode executar o evento
  PODEEXECUTAR.Close;
end;

function TDM.ChkPrestadorDaEntidadeEventoExec(
  pMembro,
  pEntidade,
  pEvento: integer;
  pData: TDateTime): boolean;
begin
  if pEntidade <> nulo then
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT A.HANDLE');
    Q.SQL.Add('  FROM SAM_MEMBRO_ESPECIALIDADE A,');
    Q.SQL.Add('       SAM_PRESTADOR_PRESTADORDAENTID B');
    Q.SQL.Add(' WHERE B.HANDLE = A.CORPOCLINICO');
    Q.SQL.Add('   AND B.PRESTADOR = :PRESTADOR');
    Q.SQL.Add('   AND B.ENTIDADE = :ENTIDADE');
    Q.ParamByName('PRESTADOR').Value := pMembro;
    Q.ParamByName('ENTIDADE').Value := pEntidade;
    Q.Open;
    if not Q.isEmpty then
    begin
      PODEEXECUTAR_MEMBROENTIDADE.Close;
      PODEEXECUTAR_MEMBROENTIDADE.ParamByName('PRESTADOR').AsInteger := pMembro;
      PODEEXECUTAR_MEMBROENTIDADE.ParamByName('ENTIDADE').AsInteger := pEntidade;
      PODEEXECUTAR_MEMBROENTIDADE.ParamByName('EVENTO').AsInteger := pEvento;
      PODEEXECUTAR_MEMBROENTIDADE.ParamByName('DATA').AsDateTime := pData;
      PODEEXECUTAR_MEMBROENTIDADE.ParamByName('REDERESTRITA').AsInteger := vgRedeRestrita;
      PODEEXECUTAR_MEMBROENTIDADE.Open;
      if PODEEXECUTAR_MEMBROENTIDADE.IsEmpty then
        Result := False //Gera Uma Negacao
      else
        Result := True; //Prestador pode executar o evento
      PODEEXECUTAR_MEMBROENTIDADE.Close;
    end
    else
      Result := True; //Prestador pode executar o evento
  end
  else
    Result := True;
end;

function TDM.ChkRecebedorDaEntidadeEventoExec(
  pMembro,
  pEntidade,
  pEvento: integer;
  pData: TDateTime): boolean;
begin
  if pEntidade <> nulo then
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT A.HANDLE');
    Q.SQL.Add('  FROM SAM_MEMBRO_ESPECIALIDADE A,');
    Q.SQL.Add('       SAM_PRESTADOR_PRESTADORDAENTID B');
    Q.SQL.Add(' WHERE B.HANDLE = A.CORPOCLINICO');
    Q.SQL.Add('   AND B.PRESTADOR = :PRESTADOR');
    Q.SQL.Add('   AND B.ENTIDADE = :ENTIDADE');
    Q.ParamByName('PRESTADOR').Value := pMembro;
    Q.ParamByName('ENTIDADE').Value := pEntidade;
    Q.Open;
    if not Q.isEmpty then
    begin
      PODERECEBER_MEMBROENTIDADE.Close;
      PODERECEBER_MEMBROENTIDADE.ParamByName('PRESTADOR').AsInteger := pMembro;
      PODERECEBER_MEMBROENTIDADE.ParamByName('ENTIDADE').AsInteger := pEntidade;
      PODERECEBER_MEMBROENTIDADE.ParamByName('EVENTO').AsInteger := pEvento;
      PODERECEBER_MEMBROENTIDADE.ParamByName('DATA').AsDateTime := pData;
      PODEEXECUTAR_MEMBROENTIDADE.ParamByName('REDERESTRITA').AsInteger := vgRedeRestrita;
      PODERECEBER_MEMBROENTIDADE.Open;
      if PODERECEBER_MEMBROENTIDADE.IsEmpty then
        Result := False //Gera Uma Negacao
      else
        Result := True; //Prestador pode executar o evento
      PODERECEBER_MEMBROENTIDADE.Close;
    end
    else
      Result := True; //Prestador pode executar o evento
  end
  else
    Result := True;
end;

function TDM.ChkRecebedorEventoExec(
  pRecebedor,
  pEvento,
  pRegimeAtendimento: integer;
  pData: TDateTime): boolean;
begin
  PODERECEBER.Close;
  PODERECEBER.ParamByName('PRESTADOR').AsInteger := pRecebedor;
  PODERECEBER.ParamByName('EVENTO').AsInteger := pEvento;
  PODERECEBER.ParamByName('REGIMEATENDIMENTO').AsInteger := pRegimeAtendimento;
  PODERECEBER.ParamByName('DATA').AsDateTime := pData;
  PODERECEBER.ParamByName('REDERESTRITA').Value := vgRedeRestrita;
  PODERECEBER.Open;
  if PODERECEBER.IsEmpty then
    Result := False //Gera Uma Negacao
  else
    Result := True; //Prestador pode executar o evento
  PODERECEBER.Close;
end;

function TDM.ChecarFamiliaInativa(pData: TDateTime): boolean;
begin
  if not (samauto_BENEFICIARIO.FieldByName('FDATACANCELAMENTO').IsNull) then
    if not ((samauto_BENEFICIARIO.FieldByName('FDATAADESAO').AsDateTime <= pData) and
      (pData <= samauto_BENEFICIARIO.FieldByName('FDATACANCELAMENTO').AsDateTime)) then
      Result := True
    else
      Result := False
  else
    Result := False;
end;

function TDM.ChecarContratoInativo(pData: TDateTime): boolean;
begin
  if not (samauto_BENEFICIARIO.FieldByName('CDATACANCELAMENTO').IsNull) then
    if not (
      (samauto_BENEFICIARIO.FieldByName('CDATAADESAO').AsDateTime <= pData) and
      (pData <= samauto_BENEFICIARIO.FieldByName('CDATACANCELAMENTO').AsDateTime)
      ) then
      Result := True
    else
      Result := False
  else
    Result := False;
end;

function TDM.VerificaGrauValido(pGrauGerado: integer): boolean;
begin
  samauto_GRAU.Close;
  samauto_GRAU.ParamByName('GRAU').Value := pGrauGerado;
  samauto_GRAU.Open;
  if samauto_GRAU.IsEmpty then
    Result := True
  else if samauto_GRAU.FieldByName('VERIFICAGRAUSVALIDOS').AsString = 'S' then
    Result := True
  else
    Result := False;
end;

procedure TDM.ChecarLimitePF(pHandleOrigem, pBeneficiario, pFamilia, pContrato,
  pEvento, pGrau: Integer; pDataAutorizacao: TDateTime; pQtdAuto: Double);
var
  qtdAnterior, MaiorQtd, LiberacaoMaxima: Double;
  a, Ponteiro: Integer;
  QTabPF, QFaixa: TBennerQuery;
  Handlexx, vez: Integer;
  Nivel,
    vComplemento: string;
  qtds: array[0..20] of tqtd;
  Especifico: Variant;
  pGuiaEvento: Integer;
  pPFEventoBSql, pPFEventoFSql, pPFEventoCSql: WideString;
begin

  // Ricardo Matiello - CASACARESC - SMS 88574 - 16/10/2007 - Início
  pGuiaEvento := pHandleOrigem;
  pPFEventoBSql := QPFEventoB.SQL.Text;
  pPFEventoFSql := QPFEventoF.SQL.Text;
  pPFEventoCSql := QPFEventoC.SQL.Text;
  Especifico := AbrirDLL(Sys.CurrentSystem, 'ESPECIFICO.UESPECIFICO');
  if (not Especifico.CSC_ATE_ConsultaPFEvento(Sys.CurrentSystem,
    pGuiaEvento,
    pPFEventoBSql,
    pPFEventoFSql,
    pPFEventoCSql,
    EmptyStr)) then
  begin
    QPFEventoB.SQL.Text := pPFEventoBSql;
    QPFEventoF.SQL.Text := pPFEventoFSql;
    QPFEventoC.SQL.Text := pPFEventoCSql;
  end;
  Especifico := Unassigned;
  // Ricardo Matiello - CASACARESC - SMS 88574 - 16/10/2007 - Fim

  Handlexx := 0;

  //selecionar todas as tabelas de participação financeira que satisfaça os requisitos
  vez := 1;
  QTabPF := QPFEventoC; //INIT
  QFaixa := QPFFaixaC; //INIT
  repeat
    case Vez of
      1:
        begin //beneficiario
          Handlexx := pBeneficiario;
          QTabPF := QPFEventoB;
          QFaixa := QPFFaixaB;
          Nivel := 'B';
        end;
      2:
        begin
          Handlexx := pFamilia;
          QTabPF := QPFEventoF;
          QFaixa := QPFFaixaF;
          Nivel := 'F';
        end;
      3:
        begin
          Handlexx := pContrato;
          QTabPF := QPFEventoC;
          QFaixa := QPFFaixaC;
          Nivel := 'C';
        end;
    end;
    QTabPF.Prepare;
    QTabPF.ParamByName('HANDLE').AsInteger := Handlexx;
    QTabPF.ParamByName('EVENTO').AsInteger := pEvento;
    QTabPF.ParamByName('DATA').AsDateTime := pDataAutorizacao;
    QTabPF.ParamByName('FA').AsInteger := vgFINALIDADEATENDIMENTO;

    QTabPF.ParamByName('TT').AsInteger := vgTIPOTRATAMENTO;
    QTabPF.ParamByName('OT').AsInteger := vgOBJETIVOTRATAMENTO;
    QTabPF.ParamByName('CA').AsInteger := vgCONDICAOATENDIMENTO;
    QTabPF.ParamByName('LA').AsInteger := vgLOCALATENDIMENTO;
    QTabPF.ParamByName('RA').AsInteger := vgREGIMEATENDIMENTO;
    QTabPF.ParamByName('GRAU').AsInteger := pGrau;
    //Valeska - sms 21638
    if qTabPF = QPFEventoC then
      QTabPF.ParamByName('HPLANO').AsInteger := vgPlanoQueDeuCobertura;
    QTabPF.Open;
    Inc(vez);
    if QTabPF.isempty then
      QTabPF.Close;
  until (not QTabPF.isempty) or (vez = 4);

  if (QTabPF.active = False) then // o beneficiario não possui PF em nenhuma hipótese
  begin //retornar o valor da PF definida nos Parâmetros gerais
    QTabPF.Close;
    Exit;
  end;

  for a := 0 to 20 do
  begin
    qtds[a].QTDMaxima := 0;
    qtds[a].QTDPaga := 0;
  end;

  a := 0;

  while not QTabPF.EOF do
  begin
    if (qTabPF.FindField('TIPOCONTAGEM') <> nil) then
      Nivel := qTabPF.FindField('TIPOCONTAGEM').AsString
    else
      Nivel := 'B'; ///beneficiario

    if nivel = 'B' then
    begin
      Handlexx := pBeneficiario;
      Nivel := 'BENEFICIARIO';
      if LerMotivoNegacao(SAM_ERRO_BENEFICIARIOLIMITERESSARCIMENTO, vRegimePgto, gLiberaPorAuxilio) = nulo then
      begin
        QTabPF.Next;
        Continue;
      end;
    end
    else if nivel = 'F' then
    begin
      handlexx := pFamilia;
      Nivel := 'FAMILIA';
      if LerMotivoNegacao(SAM_ERRO_BENEFICIARIOLIMITERESSARCIMENTOFAMILIA, vRegimePgto, gLiberaPorAuxilio) = nulo then
      begin
        QTabPF.Next;
        Continue;
      end;
    end
    else if Nivel = 'C' then
    begin
      handlexx := pContrato;
      Nivel := 'CONTRATO';
      if LerMotivoNegacao(SAM_ERRO_BENEFICIARIOLIMITERESSARCIMENTOCONTRATO, vRegimePgto, gLiberaPorAuxilio) = nulo then
      begin
        QTabPF.Next;
        Continue;
      end;
    end;

    //quantidade com mesma pf anterior //quantidade com mesma pf anterior
    qQtdAntPF.SQL.Clear;
    qQtdAntPF.SQL.Add('SELECT SUM(QTDPAGA) SOMA FROM SAM_' + nivel + '_CONTPF ');
    qQtdAntPF.SQL.Add('WHERE ' + nivel + '=:HANDLE ');
    qQtdAntPF.SQL.Add('AND TABPF=:PF ');
    qQtdAntPF.SQL.Add('AND DATAINICIAL<=:DATA ');
    qQtdAntPF.SQL.Add('AND (DATAFINAL IS NULL OR DATAFINAL>=:DATA)');

    qQtdAntPF.Prepare;
    qQtdAntPF.ParamByName('HANDLE').AsInteger := Handlexx;
    qQtdAntPF.ParamByName('PF').AsInteger := qTabPF.FieldByName('TABELAPFEVENTO').AsInteger;
    qQtdAntPF.ParamByName('DATA').AsDateTime := pDataAutorizacao;
    qQtdAntPF.Open;
    qtdAnterior := qQtdAntPF.FieldByName('SOMA').AsFloat;
    qQtdAntPF.Close;

    QFaixa.Prepare;
    QFaixa.ParamByName('TABPF').AsInteger := QTabPF.FieldByName('HANDLE').AsInteger;
    QFaixa.ParamByName('HPFINTEGRAL').AsInteger :=
      SAM_PARAMETROSGERAIS.FieldByName('CODIGOPFINTEGRAL').AsInteger;
    QFaixa.Open;

    if not QFaixa.IsEmpty then
    begin
      qtds[a].QTDMaxima := QFaixa.FieldByName('QTD').AsInteger;
      qtds[a].QTDPaga := QtdAnterior;
      Inc(a);
    end;
    QFaixa.Close;

    QTabPF.Next;
  end;
  QTabPF.Close;

  MaiorQtd := 0;
  Ponteiro := 0;

  for a := 0 to 20 do
    if qtds[a].QTDPaga > MaiorQtd then
    begin
      Ponteiro := a;
      MaiorQtd := qtds[a].QTDPaga;
    end;

  if (qtds[Ponteiro].QTDPaga + pQtdAuto) > qtds[Ponteiro].QTDMaxima then
  begin
    LiberacaoMaxima := qtds[Ponteiro].QTDMaxima -
      qtds[Ponteiro].QTDPaga;
    if LiberacaoMaxima < 0 then
      LiberacaoMaxima := 0;

    vComplemento := 'Quantidade utilizada............: %s' + #13 +
      'Limite máximo para ressarcimento: %s' + #13 +
      'Quantidade solicitada...........: %s' + #13 +
      'Liberação máxima atual..........: %s';
    vComplemento := format(vComplemento,
      [FloatToStr(qtds[Ponteiro].QTDPaga),
      FloatToStr(qtds[Ponteiro].QTDMaxima),
        FloatToStr(pQtdAuto),
        FloatToStr(LiberacaoMaxima)]
        );

    if Nivel = 'BENEFICIARIO' then
    begin
      MontaNegacao(pHandleOrigem,
        SAM_ERRO_BENEFICIARIOLIMITERESSARCIMENTO,
        vComplemento,
        LiberacaoMaxima);
    end
    else if Nivel = 'FAMILIA' then
    begin
      MontaNegacao(pHandleOrigem,
        SAM_ERRO_BENEFICIARIOLIMITERESSARCIMENTOFAMILIA,
        vComplemento,
        LiberacaoMaxima);
    end
    else if Nivel = 'CONTRATO' then
    begin
      MontaNegacao(pHandleOrigem,
        SAM_ERRO_BENEFICIARIOLIMITERESSARCIMENTOCONTRATO,
        vComplemento,
        (qtds[Ponteiro].QTDPaga + pQtdAuto) -
        qtds[Ponteiro].QTDMaxima);
    end;

  end;

end;

procedure TDM.DMDestroy(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i].ClassType = TBennerQuery then
    begin
      if (Components[i] as TBennerQuery).Active then
        (Components[i] as TBennerQuery).Close;
    end;
  end;

  LimparObjetos;

  with FrmAlertas do
  begin
    vLstAlerta.Free;
    vLstAlerta := nil;
    vLstObs.Free;
    vLstObs := nil;
  end;
  vLstNegacao.Free;
  vLstNegacao := nil;
  DMLimite.vLstLimite.Free;
  DmLimite.vLStLimite := nil;
  vLstNegacaoBenefPrestador.Free;
  vLstNegacaoBenefPrestador := nil;

  for i := 0 to vLstNegacoesValidas.Count - 1 do
    Dispose(vLstNegacoesValidas.items[i]);

  vLstNegacoesValidas.Clear;
  vLstNegacoesValidas.Free;
  vLstNegacoesValidas := nil;

  vgOLERestricaoFinan.Finalizar;
  vgOLERestricaoFinan := Unassigned;
  vgOLESamIncomp.Finalizar;
  vgOLESamIncomp := Unassigned;
  FranquiaDLL.Finalizar;
  FranquiaDll := Unassigned;
  vgOLEPeg := Unassigned;
  EspecificoDll := Unassigned; //sms 93618
end;

//Checar a alçada
//Verificar se o evento comporta codigo de pagamento

function TDM.ValidarCodigoPagto(pEvento, pGrau, pCodigoPagto: Integer): Boolean;
begin
  if not SAM_PARAMETROSGERAIS.Active then
    SAM_PARAMETROSGERAIS.Open;

  if pCodigoPagto = 0 then
    Result := False
  else if pCodigoPagto <> SAM_PARAMETROSGERAIS.FieldByName('CODIGOPAGTO').AsInteger then
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT COMPORTACODIGOPAGTO');
    Q.SQL.Add('FROM SAM_TGE');
    Q.SQL.Add('WHERE HANDLE = :HEVENTO');
    Q.ParamByName('HEVENTO').AsInteger := pEvento;
    Q.Open;

    if Q.FieldByName('COMPORTACODIGOPAGTO').AsString = 'S' then
    begin
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT COMPORTACODIGOPAGTO');
      Q.SQL.Add('FROM SAM_GRAU');
      Q.SQL.Add('WHERE HANDLE = :HGRAU');
      Q.ParamByName('HGRAU').AsInteger := pGrau;
      Q.Open;

      if Q.FieldByName('COMPORTACODIGOPAGTO').AsString = 'S' then
        Result := True
      else
        Result := False;
    end
    else
      Result := False;
  end
  else
    Result := True;

  Q.Close;
end;

//geração de pedidos automáticos de auditoria

procedure TDM.GerarAuditoria(pHandleEventoGerado, pHandleAutorizacao, pHandleProtocoloTransacao,
  pHandleBeneficiario, pPrestador: integer);
var
  i: integer;
  vAuditoria, vAuditor: integer;
  vLog: string;
  j: integer;
begin
  WriteBDebug(Concat('SamAuto.DM.GerarAuditoria - pHandleEventoGerado [', IntToStr(pHandleEventoGerado), '] pHandleAutorizacao [', IntToStr(pHandleAutorizacao), '] pHandleProtocoloTransacao [', IntToStr(pHandleProtocoloTransacao), '] pHandleBeneficiario [', IntToStr(pHandleBeneficiario), '] pPrestador [', IntToStr(pPrestador), ']'));
  if not SAM_PARAMETROSGERAIS.Active then
    SAM_PARAMETROSGERAIS.Open;
  X.Close;
  for i := 0 to FrmAlertas.vLstAlerta.Count - 1 do
  begin
    FrmAlertas.RecAlerta := FrmAlertas.vLstAlerta.Items[i];
    if (FrmAlertas.RecAlerta^.GeraAuditoria) = 'S' then
    begin
      X.Close;
      X.SQL.Clear;
      X.SQL.Add('SELECT HANDLE');
      X.SQL.Add('  FROM SAM_AUDITORIA A');
      X.SQL.Add(' WHERE A.AUTORIZACAO = :AUTORIZACAO');
      if pHandleProtocoloTransacao > 0 then
        X.SQL.Add('  AND A.PROTOCOLOTRANSACAO = :PROTOCOLO');
      X.ParamByName('AUTORIZACAO').Value := pHandleAutorizacao;
      if pHandleProtocoloTransacao > 0 then
        X.ParamByName('PROTOCOLO').Value := pHandleProtocoloTransacao;
      X.Open;
      if X.IsEmpty then
      begin
        WriteBDebug('SamAuto.DM.GerarAuditoria - Inserir Auditoria');
        X.SQL.Clear;
        X.SQL.Add('INSERT INTO SAM_AUDITORIA (');
        X.SQL.Add('HANDLE,');
        X.SQL.Add('AUTORIZACAO,');
        if pHandleProtocoloTransacao > 0 then
          X.SQL.Add('PROTOCOLOTRANSACAO,');
        X.SQL.Add('TABREGRAAUDITAR,');
        X.SQL.Add('CRIACAODATA,');
        X.SQL.Add('CRIACAOUSUARIO,');
        X.SQL.Add('MOTIVOAUDITORIA,');
        X.SQL.Add('FILIALORIGEM,');
        X.SQL.Add('FILIALDESTINO,');
        X.SQL.Add('AUDITOR,');
        X.SQL.Add('AUDITORIA)');
        X.SQL.Add('VALUES (');
        X.SQL.Add(':HANDLE,');
        X.SQL.Add(':AUTORIZACAO,');
        if pHandleProtocoloTransacao > 0 then
          X.SQL.Add(':PROTOCOLOTRANSACAO,');
        X.SQL.Add(':TABREGRAAUDITAR,');
        X.SQL.Add(':CRIACAODATA,');
        X.SQL.Add(':CRIACAOUSUARIO,');
        X.SQL.Add(':MOTIVOAUDITORIA,');
        X.SQL.Add(':FILIALORIGEM,');
        X.SQL.Add(':FILIALDESTINO,');
        X.SQL.Add(':AUDITOR,');
        X.SQL.Add(':AUDITORIA)');
        vAuditoria := Sys.NewHandle('SAM_AUDITORIA');
        X.ParamByName('HANDLE').Value := vAuditoria;
        X.ParamByName('AUTORIZACAO').Value := pHandleAutorizacao;
        if pHandleProtocoloTransacao > 0 then
          X.ParamByName('PROTOCOLOTRANSACAO').Value := pHandleProtocoloTransacao;
        X.ParamByName('TABREGRAAUDITAR').Value := 0;
        X.ParamByName('CRIACAODATA').Value := Sys.serverDate;
        X.ParamByName('CRIACAOUSUARIO').Value := Sys.CurrentUser;
        X.ParamByName('MOTIVOAUDITORIA').Value := SAM_PARAMETROSGERAIS.FieldByName('MOTIVOAUDITORIAALERTA').AsInteger;
        X.ParamByName('FILIALORIGEM').Value := GetFilial(Sys.currentUser, 'U');
        X.ParamByName('FILIALDESTINO').Value := GetFilial(pHandleBeneficiario, 'B');
        X.ParamByName('AUDITORIA').Value := vAuditoria;
        vAuditor := SugerirAuditorPerito(pPrestador, X.ParamByName('FILIALDESTINO').AsInteger, 'R');
        X.ParamByName('AUDITOR').datatype := ftInteger;
        if vAuditor > 0 then
          X.ParamByName('AUDITOR').Value := vAuditor
        else
          X.ParamByName('AUDITOR').Clear;
        if (X.ParamByName('FILIALORIGEM').AsInteger = nulo) or
          (X.ParamByName('FILIALDESTINO').AsInteger = nulo) then
          raise Exception.Create('Filial do usuário ou beneficiário nula.')
        else
          X.ExecSql;
      end;
    end;
  end;
  //21/11/2002- Juliana- WriteAudit - Auditoria
  qWriteAudit.SQL.Clear;
  qWriteAudit.Close;
  qWriteAudit.SQL.Add('SELECT * FROM SAM_AUDITORIA WHERE HANDLE= :HANDLE');
  qWriteAudit.ParamByName('HANDLE').Value := vAuditoria;
  qWriteAudit.Open;

  vLog := 'Atualização dos campos: ' + #13;
  for j := 0 to qWriteAudit.FieldCount - 1 do
  begin
    vLog := vLog + #13 + qWriteAudit.Fields[j].FieldName + ': ' + qWriteAudit.FieldByName(qWriteAudit.Fields[j].FieldName).AsString;
  end;
  vLog := vLog + #13 + 'na tabela SAM_AUDITORIA';
  Sys.writeaudit('G', Sys.HandleOfTable('SAM_AUDITORIA'), vAuditoria, vLog);
  WriteBDebug('SamAuto.DM.GerarAuditoria - Fim');
end;

//geração de pedidos automáticos de pericia

procedure TDM.GerarPericia(pHandleEventoGerado, pHandleAutorizacao,
  pHandleBeneficiario, pPrestador: integer);
var
  vPericia, vPerito: integer;
  j: integer;
  vlog: string;
begin

  if not SAM_PARAMETROSGERAIS.Active then
    SAM_PARAMETROSGERAIS.Open;

  if SAM_PARAMETROSGERAIS.FieldByName('EXIGIRPARECERPERICIA').AsString = 'N' then
    exit;

  QA.Close;

  try
    begin
      QA.Close;
      QA.SQL.Clear;
      QA.SQL.Add('SELECT HANDLE');
      QA.SQL.Add('  FROM SAM_PERICIA A');
      QA.SQL.Add(' WHERE A.AUTORIZACAO = :AUTORIZACAO');
      QA.ParamByName('AUTORIZACAO').Value := pHandleAutorizacao;
      QA.Open;
      if QA.IsEmpty then
      begin
        QA.Close;
        QA.SQL.Clear;
        QA.SQL.Add('INSERT INTO SAM_PERICIA (HANDLE, AUTORIZACAO, DATAPEDIDO, TABREGRA, CRIACAODATA, CRIACAOUSUARIO, MOTIVOPERICIA,');
        QA.SQL.Add(' FILIALORIGEM, FILIALDESTINO, AUDITOR, PERICIA, SERVICOPROPRIO)');
        QA.SQL.Add('VALUES (:HANDLE, :AUTORIZACAO, :DATAPEDIDO, :TABREGRA, :CRIACAODATA, :CRIACAOUSUARIO, :MOTIVOPERICIA, ');
        QA.SQL.Add(':FILIALORIGEM, :FILIALDESTINO, :AUDITOR, :PERICIA, :SERVICOPROPRIO)');
        vPericia := Sys.NewHandle('SAM_PERICIA');
        QA.ParamByName('HANDLE').Value := vPericia;
        QA.ParamByName('AUTORIZACAO').Value := pHandleAutorizacao;
        QA.ParamByName('DATAPEDIDO').Value := Sys.serverNow;
        QA.ParamByName('TABREGRA').Value := 0;
        QA.ParamByName('CRIACAODATA').Value := Sys.serverDate;
        QA.ParamByName('CRIACAOUSUARIO').Value := Sys.CurrentUser;
        QA.ParamByName('MOTIVOPERICIA').Value := SAM_PARAMETROSGERAIS.FieldByName('MOTIVOPERICIA').AsInteger;
        QA.ParamByName('FILIALORIGEM').Value := GetFilial(Sys.currentUser, 'U');
        QA.ParamByName('FILIALDESTINO').Value := GetFilial(pHandleBeneficiario, 'B');
        QA.ParamByName('PERICIA').Value := vPericia;
        QA.ParamByName('SERVICOPROPRIO').AsString := 'N';
        vPerito := SugerirAuditorPerito(pPrestador, QA.ParamByName('FILIALDESTINO').AsInteger, 'P');
        QA.ParamByName('AUDITOR').datatype := ftInteger;
        if vPerito > 0 then
          QA.ParamByName('AUDITOR').Value := vPerito
        else
          QA.ParamByName('AUDITOR').Clear;
        if (QA.ParamByName('FILIALORIGEM').AsInteger = nulo) or
          (QA.ParamByName('FILIALDESTINO').AsInteger = nulo) then
          raise Exception.Create('Filial do usuário ou beneficiário nula.')
        else
          QA.ExecSql;
      end
    end;
  except
    raise;
  end;
  //22/11/2002- WriteAudit Juliana Auditoria pericia
  qWriteAudit.SQL.Clear;
  qWriteAudit.Close;
  qWriteAudit.SQL.Add('SELECT * FROM SAM_PERICIA WHERE HANDLE= :HANDLE');
  qWriteAudit.ParamByName('HANDLE').Value := vPericia;
  qWriteAudit.Open;

  vLog := 'Atualização dos campos: ' + #13;
  for j := 0 to qWriteAudit.FieldCount - 1 do
  begin
    vLog := vLog + #13 + qWriteAudit.Fields[j].FieldName + ': ' + qWriteAudit.FieldByName(qWriteAudit.Fields[j].FieldName).AsString;
  end;
  vLog := vLog + #13 + 'na tabela SAM_PERICIA';
  Sys.writeaudit('A', Sys.HandleOfTable('SAM_PERICIA'), vPericia, vLog);
  //fim juliana

end;

function TDM.gerarPericiaPorValor(
  pHandleAutorizacao,
  pHandleContrato: integer;
  pHandleEVENTOGERADO: integer;
  pData: TDateTime;
  pValorEventoAutorizando: currency
  ): boolean;
begin
  // se a autorização ultrapassou o valor não permite reverter e gera perícia.
  // se autorizar direto, precisa gerar negação da perícia para depois ter o que não reverter.
  Result := False;
  if (LerMotivoNegacao(SAM_ERRO_EVENTOPREOPERATORIO, vRegimePgto, gLiberaPorAuxilio) <> nulo) then
  begin

    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT DISTINCT ES.RECEBEDOR,');
    Q.SQL.Add('       ES.EXECUTOR');
    Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO EG');
    Q.SQL.Add('  JOIN SAM_AUTORIZ_EVENTOSOLICIT ES ON (ES.HANDLE = EG.EVENTOSOLICITADO)');
    Q.SQL.Add(' WHERE EG.HANDLE = :EVENTOGERADO');
    Q.ParamByName('EVENTOGERADO').DataType := ftInteger;
    Q.ParamByName('EVENTOGERADO').AsInteger := pHandleEVENTOGERADO;
    Q.Open;

    Q2.Close;
    Q2.SQL.Clear;
    Q2.SQL.Add('SELECT COUNT(1) LIBERAR');
    Q2.SQL.Add('  FROM SAM_PRESTADOR P');
    Q2.SQL.Add('  JOIN MUNICIPIOS M ON (M.HANDLE = P.MUNICIPIOPAGAMENTO)');
    Q2.SQL.Add(' WHERE P.HANDLE IN (:EXECUTOR, :RECEBEDOR)');
    Q2.SQL.Add('   AND M.LIBERAPERICIA = ''S''');
    Q2.ParamByName('EXECUTOR').DataType := ftInteger;
    Q2.ParamByName('EXECUTOR').Asinteger := Q.FieldByName('EXECUTOR').AsInteger;
    Q2.ParamByName('RECEBEDOR').DataType := ftInteger;
    Q2.ParamByName('RECEBEDOR').Asinteger := Q.FieldByName('RECEBEDOR').AsInteger;
    Q2.Open;

    if Q2.FieldByName('LIBERAR').AsInteger = 0 then
    begin
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM (TOTAL) TOTAL, Y.VALORLIMITE');
      Q.SQL.Add('  FROM');
      Q.SQL.Add('      (');
      Q.SQL.Add('      SELECT SUM (QTDAUTORIZADA * (VALORUNITARIOCALCULADO + :VALOR)) TOTAL');
      Q.SQL.Add('        FROM SAM_AUTORIZ_EVENTOGERADO');
      Q.SQL.Add('       WHERE AUTORIZACAO = :HANDLEAUTORIZACAO');
      Q.SQL.Add('         AND VALORUNITARIOINFORMADO IS NULL');
      Q.SQL.Add('         AND SITUACAO IN (''A'', ''L'')');
      Q.SQL.Add('      UNION');
      Q.SQL.Add('      SELECT SUM (QTDAUTORIZADA * (VALORUNITARIOINFORMADO + :VALOR)) TOTAL');
      Q.SQL.Add('        FROM SAM_AUTORIZ_EVENTOGERADO');
      Q.SQL.Add('       WHERE AUTORIZACAO = :HANDLEAUTORIZACAO');
      Q.SQL.Add('         AND VALORUNITARIOINFORMADO IS NOT NULL');
      Q.SQL.Add('         AND SITUACAO IN (''A'', ''L'')');
      Q.SQL.Add('         AND HANDLE = AUTORIZACAO');
      Q.SQL.Add('      ) X , SAM_CONTRATO_PERICIAPORVALOR Y, SAM_AUTORIZ Z');
      Q.SQL.Add(' WHERE Y.CONTRATO = :HANDLECONTRATO');
      Q.SQL.Add('   AND Z.HANDLE = :HANDLEAUTORIZACAO');
      Q.SQL.Add('   AND Y.TIPOAUTORIZACAO = Z.TIPOAUTORIZACAO');
      Q.SQL.Add(especificoDll.ATE_FiltraPericiaPorFilial(Sys.CurrentSystem, pHandleAutorizacao)); //Gabriel TRF - SMS 112942
      Q.SQL.Add('   AND (Y.DATAINICIAL <= :DATA AND ((:DATA <= Y.DATAFINAL) OR (Y.DATAFINAL IS NULL)))');
      Q.SQL.Add(' GROUP BY Y.VALORLIMITE');
      Q.ParamByName('HANDLECONTRATO').Value := pHandleContrato;
      Q.ParamByName('HANDLEAUTORIZACAO').Value := pHandleAutorizacao;
      Q.ParamByName('DATA').Value := pData;
      Q.ParamByName('VALOR').DataType := ftCurrency;
      Q.ParamByName('VALOR').Value := pValorEventoAutorizando;
      Q.Open;
      if (Q.FieldByName('TOTAL').asCurrency > Q.FieldByName('VALORLIMITE').asCurrency) then
        Result := True;
    end
    else
    begin
      Result := False; //Libera pelo Municipio
    end;
  end;
end;

function TDM.SugerirAuditorPerito(pPrestador, pFilial: integer; pAuditorPerito: char): integer;
begin
  if pPrestador <= 0 then
    Result := -1
  else
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT A.HANDLE');
    Q.SQL.Add('  FROM SAM_AUDITOR A');
    Q.SQL.Add('  LEFT JOIN SAM_AUDITOR_PRESTADOR P ON (A.HANDLE = P.AUDITOR)');
    Q.SQL.Add(' WHERE P.PRESTADOR = :PRESTADOR');
    Q.SQL.Add('   AND A.FILIALAUDITOR = :FILIAL');
    Q.SQL.Add('   AND (A.FUNCAO = ''A'' OR A.FUNCAO = :FUNCAO)');
    Q.SQL.Add('   AND (P.DATAINICIAL <= :DATA)');
    Q.SQL.Add('   AND (P.DATAFINAL IS NULL OR P.DATAFINAL >= :DATA)');
    Q.ParamByName('PRESTADOR').Value := pPrestador;
    Q.ParamByName('FILIAL').Value := pFilial;
    Q.ParamByName('FUNCAO').Value := pAuditorPerito;

    Q.ParamByName('DATA').Value := Sys.serverdate;
    Q.Open;
    if Q.isEmpty then
      Result := -1
    else
      Result := Q.FieldByName('HANDLE').AsInteger;
  end;
end;

function TDM.GetFilial(phandle: integer; tipo: char): integer;
var
  X: TBennerQuery;
begin
  WriteBDebug(Concat('SamAuto.DM.GetFilial - pHandle [', IntToStr(pHandle), '] tipo [', tipo, ']'));
  x := TBennerQuery.Create(nil);
  X.DatabaseName := sys.databasename;
  X.Close;
  X.SQL.Clear;
  case tipo of
    'B': X.SQL.Add('SELECT FILIALCUSTO FILIAL FROM SAM_BENEFICIARIO WHERE HANDLE = :HANDLE');
    'U': X.SQL.Add('SELECT FILIALPADRAO FILIAL FROM Z_GRUPOUSUARIOS WHERE HANDLE = :HANDLE');
    'P': X.SQL.Add('SELECT FILIALPADRAO FILIAL FROM SAM_PRESTADOR WHERE HANDLE = :HANDLE');
  end;
  X.ParamByName('HANDLE').Value := pHandle;
  X.Open;
  if X.FieldByName('FILIAL').IsNull then
    Result := nulo
  else
    Result := X.FieldByName('FILIAL').AsInteger;
  x.Close;
  x.Free;
  x := nil;
  WriteBDebug(Concat('SamAuto.DM.GetFilial - Result [', IntToStr(Result), ']'));
end;

procedure TDM.GravarEventoPrincipal(pHandleOrigem: integer; pData: TDateTime);
begin
  WriteBDebug('SamAuto.DM.GravarEventoPrincipal - Início');
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT G.HANDLE, G.EVENTOGERADO, G.DATAATENDIMENTO, G.QTDPAGA, S.EQUIPE, S.VIAACESSO, S.AUTORIZACAO');
  Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO G, SAM_AUTORIZ_EVENTOSOLICIT S');
  Q.SQL.Add(' WHERE S.AUTORIZACAO = (SELECT X.AUTORIZACAO FROM SAM_AUTORIZ_EVENTOSOLICIT X WHERE X.HANDLE=:EVENTOSOLICITADO)');
  Q.SQL.Add('   AND G.EVENTOSOLICITADO = S.HANDLE');
  Q.SQL.Add('   AND (G.SITUACAO = ''A'' OR G.SITUACAO = ''L'')');
  Q.SQL.Add(' ORDER BY G.VALORUNITARIOCALCULADO DESC');
  Q.ParamByName('EVENTOSOLICITADO').Value := pHandleOrigem;
  Q.Open;
  if Q.IsEmpty then // não gerou eventos
  begin
    UPD.SQL.Clear;
    UPD.SQL.Add('UPDATE SAM_AUTORIZ');
    UPD.SQL.Add('   SET EVENTOPRINCIPAL = NULL');
    UPD.SQL.Add(' WHERE HANDLE IN (SELECT X.AUTORIZACAO FROM SAM_AUTORIZ_EVENTOSOLICIT X WHERE X.HANDLE=:EVENTOSOLICITADO)');
    UPD.ParamByName('EVENTOSOLICITADO').Value := pHandleOrigem;
    UPD.ExecSql;
    exit;
  end;

  UPD.SQL.Clear;
  UPD.SQL.Add('UPDATE SAM_AUTORIZ');
  UPD.SQL.Add('   SET EVENTOPRINCIPAL = :EVENTOPRINCIPAL');
  UPD.SQL.Add(' WHERE HANDLE = :HANDLE');
  UPD.ParamByName('EVENTOPRINCIPAL').Value := Q.FieldByName('EVENTOGERADO').AsInteger;
  UPD.ParamByName('HANDLE').Value := Q.FieldByName('AUTORIZACAO').AsInteger;
  UPD.ExecSql;

  if not SAM_PARAMETROSGERAIS.Active then
    SAM_PARAMETROSGERAIS.Open;

  if SAM_PARAMETROSGERAIS.FieldByName('CALCCODPAGTOEVENTOCIRURGICO').AsString = 'S' then
  begin
    //Gabriel - SMS: 116702
    sp_BSAut_IniciarEquipeVia.Close;
    sp_BSAut_IniciarEquipeVia.ParamByName('p_Autorizacao').AsInteger := Q.FieldByName('AUTORIZACAO').AsInteger;
    sp_BSAut_IniciarEquipeVia.ParamByName('p_Data').AsDateTime := pData;
    sp_BSAut_IniciarEquipeVia.ExecProc;
  end;
  WriteBDebug('SamAuto.DM.GravarEventoPrincipal - Fim');
end;

function TDM.ChecarBeneficiarioInternado(pBenef: Integer; pDataAtendimento: TDateTime; pHandleOrigem: Integer; pServico: string): boolean;
var
  vAutoriz: Integer;
  vDataIniInternacao, vDataFimInternacao: TDateTime;
  vComplemento: string;
begin
  // verificar existe outra autorizacao em aberto naquele período
  // a data da autorização que está sendo solicitado o evento ...
  // ... pode ser anterior a data de outra internação do beneficiário
  Result := True;

  Q.Close;
  Q.SQL.Clear;
  // gerando o evento
  if pServico = 'G' then
  begin
    Q.SQL.Add('SELECT A.HANDLE, A.DATAINTERNACAO, A.DATAPREVISTAALTA, A.DATAEFETIVAALTA, X.INTERNACAO');
    Q.SQL.Add('  FROM SAM_AUTORIZ A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_REGIMEATENDIMENTO X');
    Q.SQL.Add(' WHERE S.HANDLE = :HANDLEORIGEM');
    Q.SQL.Add('   AND A.HANDLE = S.AUTORIZACAO');
    Q.SQL.Add('   AND X.HANDLE = A.REGIMEATENDIMENTO');

  end
  else //editando/re-validando um evento gerado
  begin
    Q.SQL.Add('SELECT A.HANDLE, A.DATAINTERNACAO, A.DATAPREVISTAALTA, A.DATAEFETIVAALTA, X.INTERNACAO');
    Q.SQL.Add('  FROM SAM_AUTORIZ A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_AUTORIZ_EVENTOGERADO G, SAM_REGIMEATENDIMENTO X');
    Q.SQL.Add(' WHERE S.HANDLE = G.EVENTOSOLICITADO');
    Q.SQL.Add('   AND A.HANDLE = S.AUTORIZACAO');
    Q.SQL.Add('   AND G.HANDLE = :HANDLEORIGEM');
    Q.SQL.Add('   AND X.HANDLE = A.REGIMEATENDIMENTO');
  end;
  Q.ParamByName('HANDLEORIGEM').Value := pHandleOrigem;
  Q.Open;

  if Q.FieldByName('INTERNACAO').AsString <> 'S' then
    exit;

  vAutoriz := Q.FieldByName('HANDLE').AsInteger;
  vDataIniInternacao := Q.FieldByName('DATAINTERNACAO').AsDateTime;
  if Q.FieldByName('DATAEFETIVAALTA').IsNull then
    vDataFimInternacao := Q.FieldByName('DATAPREVISTAALTA').AsDateTime
  else
    vDataFimInternacao := Q.FieldByName('DATAEFETIVAALTA').AsDateTime;
  // quando é a primeira autorização de internação e a data de internação ou de alta está nula não dar a negação e sim apenas informar isso ao usuário.
  // verifica se a data do atendimento esta no periodo da internacao
  if pServico <> 'I' then // se não for prorrogação de internação
  begin
    vComplemento := '';
    if not (q.FieldByName('DATAINTERNACAO').IsNull) then
    begin
      if (pDataAtendimento < vDataIniInternacao) then
        vComplemento := 'Data de atendimento do evento anterior a data de internação';
    end
    else
    begin
      vComplemento := '';
    end;
    if not ((q.FieldByName('DATAPREVISTAALTA').isNULL) or (q.FieldByName('DATAEFETIVAALTA').isnull)) then
    begin
      if (pDataAtendimento > vDataFimInternacao) then
        vComplemento := 'Data de atendimento do evento posterior a data da alta.';
    end
    else
    begin
      vComplemento := '';
    end;

    // alterado para se data nula so dar a mensagem---so se negação existe. Juliana 08/05/2003
    if (vComplemento <> '') and (LerMotivoNegacao(SAM_ERRO_EVENTOINTERVALOINTERNACAO, vRegimePgto, gLiberaPorAuxilio) <> nulo) then
    begin
      if not (q.FieldByName('DATAPREVISTAALTA').isNULL) then
      begin
        if (pDataAtendimento > vDataFimInternacao) then
          MontaNegacaoBenefPrestador(SAM_ERRO_EVENTOINTERVALOINTERNACAO, vComplemento);
      end
      else
      begin
        if qParamGeralAtendimento.FieldByName('EMITIRAVISOFALTADIARIA').AsString = 'S' then
          ShowMessage('Falta especificar quantidade de diária.');
      end;
    end;
  end;

  // a data de atendimento tem não pode estar entre o período de internação de outra autorização
  // e a data de internação tem q ser superior a data de alta das outras autorizações do beneficiário
  qInternacao.Close;
  qInternacao.ParamByName('HBENEF').Value := pBenef;
  qInternacao.ParamByName('DATAATEND').Value := pDataAtendimento;
  qInternacao.ParamByName('DATAMINIMA').Value := vDataIniInternacao;
  qInternacao.ParamByName('HAUTORIZ').Value := vAutoriz;
  qInternacao.Open;

  if (not qInternacao.EOF) then
  begin
    if not (qInternacao.FieldByName('DATAPREVISTAALTA').isNull) then
    begin
      Result := False;
      vComplemento := '';
      while not qInternacao.EOF do
      begin
        vAutoriz := qInternacao.FieldByName('AUTORIZACAO').AsInteger;
        vDataIniInternacao := qInternacao.FieldByName('DATAINTERNACAO').AsDateTime;

        if qInternacao.FieldByName('DATAEFETIVAALTA').IsNull then
          vDataFimInternacao := qInternacao.FieldByName('DATAPREVISTAALTA').AsDateTime
        else
          vDataFimInternacao := qInternacao.FieldByName('DATAEFETIVAALTA').AsDateTime;
        vComplemento := vComplemento +
          'Beneficiário internado pela autorização ' +
          IntToStr(vAutoriz) + ' de ' +
          DateToStr(vDataIniInternacao) + ' à ' +
          DateToStr(vDataFimInternacao) + '.' + #13;
        qInternacao.Next;
      end;
    end;
    if LerMotivoNegacao(SAM_ERRO_BENEFICIARIOINTERNADO, vRegimePgto, gLiberaPorAuxilio) <> nulo then
      MontaNegacaoBenefPrestador(SAM_ERRO_BENEFICIARIOINTERNADO, vComplemento);
  end;
end;

function TDM.ChecarTipoAtendimentoEvento(pHandle: Integer): Boolean;
var
  vComplemento: string;
  vEventoGerado: integer;
  vAcomodacao: integer;
begin
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT G.AUTORIZACAO, G.GRAUGERADO, G.EVENTOGERADO, R.INTERNACAO AUTORIZREGIMEINTERNACAO, T.REGIMEATENDIMENTO REGIMEEVENTO');
  Q.SQL.Add('  FROM SAM_REGIMEATENDIMENTO R, SAM_TGE T, SAM_AUTORIZ_EVENTOGERADO G');
  Q.SQL.Add(' WHERE R.HANDLE=:HREGIMEATENDIMENTO');
  Q.SQL.Add('   AND G.HANDLE=:HEVENTO');
  Q.SQL.Add('   AND T.HANDLE=G.EVENTOGERADO');
  Q.ParamByName('HEVENTO').Value := pHandle;
  Q.ParamByName('HREGIMEATENDIMENTO').Value := vgREGIMEATENDIMENTO;
  Q.Open;

  vEventoGerado := Q.FieldByName('EVENTOGERADO').AsInteger;
  vComplemento := '';
  Result := True;
  if Q.FieldByName('AUTORIZREGIMEINTERNACAO').AsString = 'S' then
  begin
    if Q.FieldByName('REGIMEEVENTO').AsString = '1' then
    begin
      Result := False;
      vComplemento := 'Regime de atendimento da autorização é somente internação e do evento somente ambulatorial.';
      if LerMotivoNegacao(SAM_ERRO_REGIMEATENDIMENTO, vRegimePgto, gLiberaPorAuxilio) <> nulo then
        MontaNegacao(pHandle, SAM_ERRO_REGIMEATENDIMENTO, vComplemento, nulo);
    end;
  end
  else
  begin
    if Q.FieldByName('REGIMEEVENTO').AsString = '2' then
    begin
      Result := False;
      vComplemento := 'Regime de atendimento da autorização é somente ambulatorial e do evento somente internação.';
      if LerMotivoNegacao(SAM_ERRO_REGIMEATENDIMENTO, vRegimePgto, gLiberaPorAuxilio) <> nulo then
        MontaNegacao(pHandle, SAM_ERRO_REGIMEATENDIMENTO, vComplemento, nulo);
    end;
    if LerMotivoNegacao(SAM_ERRO_REGIMEATENDIMENTOACOMODACAO, vRegimePgto, gLiberaPorAuxilio) <> nulo then
    begin
      if SolicitandoDiaria(Q.FieldByName('EVENTOGERADO').AsInteger, Q.FieldByName('GRAUGERADO').AsInteger, vAcomodacao) then
      begin
        MontaNegacao(pHandle,
          SAM_ERRO_REGIMEATENDIMENTOACOMODACAO,
          'Regime de atendimento não suporta acomodação.',
          -1);
      end;
    end;
  end;
end;

//Localizar possível solicitação de auxílio

function TDM.LocalizaAuxilio(pHandleOrigem, pBeneficiario, pEvento, pGrau: Integer;
  pData: TDateTime; pQuantidade: Currency): Boolean;
var
  vQtdLiberadaAuxilio, vQtdMaximaNaoLiberada, vAuxQtd: Currency;
  vPermiteAuxilio: Boolean;
  vContador: Integer;
begin
  vQtdMaximaNaoLiberada := 0;
  vPermiteAuxilio := False;

  for vContador := 0 to vLstNegacao.Count - 1 do
  begin
    RecNegacao := vLstNegacao.Items[vContador];
    if (RecNegacao^.HandleOrigem) = (pHandleOrigem) then
    begin
      vPermiteAuxilio := True;
      //Se existir alguma negação que não puder ser liberada
      //pelo auxílio, não será permitido a utilização do auxílio
      if RecNegacao^.LiberaPorAuxilio = 'N' then
      begin
        vPermiteAuxilio := False;
        Break;
      end;

      if RecNegacao^.QtdAutorizada <> -1 then
      begin
        vAuxQtd := pQuantidade - RecNegacao^.QtdAutorizada;
        if vAuxQtd > vQtdMaximaNaoLiberada then
          vQtdMaximaNaoLiberada := vAuxQtd;
      end
      else
        vQtdMaximaNaoLiberada := pQuantidade;
    end;
  end;

  if vPermiteAuxilio then
  begin
    qAuxilio.Close;
    qAuxilio.ParamByName('HBENEFICIARIO').AsInteger := pBeneficiario;
    qAuxilio.ParamByName('HEVENTO').AsInteger := pEvento;
    qAuxilio.ParamByName('HGRAU').AsInteger := pGrau;
    qAuxilio.ParamByName('DATASOLICITACAO').AsDateTime := pData;
    qAuxilio.Open;
    vQtdLiberadaAuxilio := 0;
    if not qAuxilio.IsEmpty then
    begin
      while not qAuxilio.EOF do
      begin
        if (vQtdMaximaNaoLiberada -
          vQtdLiberadaAuxilio) >
          (qAuxilio.FieldByName('QUANTIDADE').AsFloat -
          qAuxilio.FieldByName('QTDUTILIZADA').AsFloat) then
        begin
          vQtdLiberadaAuxilio :=
            vQtdLiberadaAuxilio +
            (qAuxilio.FieldByName('QUANTIDADE').AsFloat -
            qAuxilio.FieldByName('QTDUTILIZADA').AsFloat);
          vAuxQtd := qAuxilio.FieldByName('QUANTIDADE').AsFloat -
            qAuxilio.FieldByName('QTDUTILIZADA').AsFloat;
        end
        else
        begin
          vAuxQtd := vQtdMaximaNaoLiberada -
            vQtdLiberadaAuxilio;
          vQtdLiberadaAuxilio := vQtdMaximaNaoLiberada;
        end;

        if vgOrigemDoProcesso = 'A' then
          qInsEventoBeneficio.ParamByName('HANDLE').AsInteger :=
            Sys.NewHandle('SAM_SOLICITAUX_BENEFICIO_AUTO')
        else
          qInsEventoBeneficio.ParamByName('HANDLE').AsInteger :=
            Sys.NewHandle('SAM_SOLICITAUX_BENEFICIO_GUIA');

        qInsEventoBeneficio.ParamByName('HSOLICITAUXBENEFICIO').AsInteger :=
          qAuxilio.FieldByName('HBENEFICIO').AsInteger;
        qInsEventoBeneficio.ParamByName('HORIGEM').AsInteger :=
          pHandleOrigem;
        qInsEventoBeneficio.ParamByName('QUANTIDADE').AsFloat :=
          vAuxQtd;
        qInsEventoBeneficio.ExecSql;

        qUpdAuxBeneficio.ParamByName('HBENEFICIO').AsInteger :=
          qAuxilio.FieldByName('HBENEFICIO').AsInteger;
        qUpdAuxBeneficio.ParamByName('QUANTIDADE').AsFloat :=
          vAuxQtd;
        qUpdAuxBeneficio.ExecSql;

        if vQtdLiberadaAuxilio =
          vQtdMaximaNaoLiberada then
          Break;

        qAuxilio.Next;
      end;

      Result := True;

      for vContador := 0 to vLstNegacao.Count - 1 do
      begin
        RecNegacao := vLstNegacao.Items[vContador];
        vAuxQtd := pQuantidade -
          RecNegacao^.QtdAutorizada;
        if (RecNegacao^.HandleOrigem) = (pHandleOrigem) then
          if vAuxQtd >= vQtdLiberadaAuxilio then
            RecNegacao^.QtdLiberadaAuxilio := vQtdLiberadaAuxilio
          else
            RecNegacao^.QtdLiberadaAuxilio := vAuxQtd;
      end;
    end
    else
      Result := False;
    qAuxilio.Close;
  end
  else
    Result := False;
end;

function TDM.EhGrauPrincipal(pHandleOrigem: integer): boolean;
begin
  Q.Close;
  Q.SQL.Clear;
  if vgOrigemdoProcesso = 'A' then
  begin
    Q.SQL.Add('SELECT T.GRAUPRINCIPAL');
    Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO EG,');
    Q.SQL.Add('       SAM_TGE T');
    Q.SQL.Add(' WHERE EG.EVENTOGERADO = T.HANDLE');
    Q.SQL.Add('   AND EG.GRAUGERADO   = T.GRAUPRINCIPAL');
    Q.SQL.Add('   AND EG.HANDLE     = :HANDLE');
  end
  else
  begin
    Q.SQL.Add('SELECT T.GRAUPRINCIPAL');
    Q.SQL.Add('  FROM SAM_GUIA_EVENTOS GE,');
    Q.SQL.Add('       SAM_TGE T');
    Q.SQL.Add(' WHERE GE.EVENTO = T.HANDLE');
    Q.SQL.Add('   AND GE.GRAU   = T.GRAUPRINCIPAL');
    Q.SQL.Add('   AND GE.HANDLE = :HANDLE');
  end;
  Q.ParamByName('HANDLE').Value := pHandleOrigem;
  Q.Open;
  if Q.IsEmpty then
    Result := False
  else
    Result := True;
end;

// ==================== ESSA FUNÇÃO ESTÁ DUPLICADA NA SAMPEG.PROCESSAR !!! ======================
// O LARINI SE RECUSOU A CRIAR UM MÉTODO PARA ESSA FUNÇÃO, ALEGANDO PROBLEMA DE PERFORMANCE,
// SENDO ASSIM, ESSE PROCEDIMENTO FOI DUPLICADO AQUI.

function TDM.ValordaPF2(CodigoPF, Prestador, Beneficiario: OleVariant): Double;
begin
  sp_BSValorPF.ParamByName('p_CodigoPF').Value := CodigoPF;
  sp_BSValorPF.ParamByName('p_Recebedor').Value := Prestador;
  sp_BSValorPF.ParamByName('p_Beneficiario').Value := Beneficiario;
  sp_BSValorPF.ExecProc;
  Result := sp_BSValorPF.ParamByName('p_PercentualPF').AsFloat;
end;

function TDM.SolicitandoDiaria(pEvento, pGrau: integer; var vAcomodacao: integer): boolean;
begin
  if not SAM_PARAMETROSGERAIS.active then
    SAM_PARAMETROSGERAIS.Open;
  if SAM_PARAMETROSGERAIS.FieldByName('TIPOACOMODACAO').AsString = 'G' then
  begin
    X.Close;
    X.SQL.Clear;
    X.SQL.Add('SELECT A.ACOMODACAO, A.GRAU, T.CLASSIFICACAO');
    X.SQL.Add('  FROM SAM_GRAU G, SAM_ACOMODACAO_GRAU A, SAM_TIPOGRAU T');
    X.SQL.Add(' WHERE G.HANDLE = A.GRAU');
    X.SQL.Add('   AND G.HANDLE = :GRAU');
    X.SQL.Add('   AND G.TIPOGRAU = T.HANDLE');
    X.SQL.Add('   AND T.CLASSIFICACAO = ''3''');
    X.ParamByName('GRAU').Value := pGrau;
    X.Open;
  end
  else
  begin
    X.Close;
    X.SQL.Clear;
    //X.SQL.Add('SELECT HANDLE ACOMODACAO');  Coelho acomodacao
    X.SQL.Add('SELECT HANDLE, ACOMODACAO');
    X.SQL.Add('  FROM SAM_ACOMODACAO_EVENTO');
    X.SQL.Add(' WHERE EVENTO = :EVENTO');
    X.ParamByName('EVENTO').Value := pEvento;
    X.Open;
  end;
  if X.IsEmpty then
  begin
    Result := False;
    if vAcomodacao <= 0 then
      vAcomodacao := nulo;
  end
  else
  begin
    // Eduardo - 30/12/2004 - SMS 37327
    // Verificando também se o grau informação é do tipo acomodação para solicitar a diária
    // Somente caso tipo do grau seja acomodação segue solicitando diária
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT TG.HANDLE               ');
    Q.SQL.Add('  FROM SAM_GRAU G,             ');
    Q.SQL.Add('       SAM_TIPOGRAU TG         ');
    Q.SQL.Add(' WHERE G.TIPOGRAU = TG.HANDLE  ');
    Q.SQL.Add('   AND TG.CLASSIFICACAO = ''3''');
    Q.SQL.Add('   AND G.HANDLE = :GRAU        ');
    Q.ParamByName('GRAU').Value := pGrau;
    Q.Open;
    if Q.IsEmpty then
    begin
      Result := False;
      if vAcomodacao <= 0 then
        vAcomodacao := nulo;
    end
    else
    begin
      Result := True;
      vAcomodacao := X.FieldByName('ACOMODACAO').AsInteger;
    end;
  end;
end;


function TDM.PegarAcomodacoes(pAutorizacao: Integer; pTipoEvento: string): string;
var vDll: OleVariant;
  vEvento: Integer;
  vData: TDatetime;
  vTipo: Integer;
  temDiariaProrrogacao: Boolean;
begin
  result := '';

  if (pTipoEvento = 'D') then
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT B.EVENTOSOLICITADO, A.BENEFICIARIO, A.TIPOAUTORIZACAO');
    Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO B, SAM_AUTORIZ A');
    Q.SQL.Add(' WHERE B.AUTORIZACAO = :HAUTORIZACAO');
    Q.SQL.Add('   AND A.HANDLE = B.AUTORIZACAO');
    Q.SQL.Add('   AND B.SITUACAO <> ''C''');
    Q.SQL.Add(' ORDER BY B.VALORUNITARIOCALCULADO DESC');
    Q.ParamByName('HAUTORIZACAO').Value := pAutorizacao;
    Q.Open;

    if (not Q.isEmpty) then
    begin
      samauto_AUTORIZ_EVENTOSOLICIT.Close;
      samauto_AUTORIZ_EVENTOSOLICIT.ParamByName('HANDLE').Value := Q.fieldByname('EVENTOSOLICITADO').asInteger;
      samauto_AUTORIZ_EVENTOSOLICIT.Open;


      // as diárias devem ser geradas embaixo do evento principal
      // entretanto o evento principal pode mudar, as diárias serão geradas no primeiro evento
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT COUNT(*) QTD');
      Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO');
      Q.SQL.Add(' WHERE AUTORIZACAO = :AUTORIZACAO');
      Q.SQL.Add('   AND DATAATENDIMENTO = :DATAATENDIMENTO');
      Q.SQL.Add('   AND SITUACAO <> ''C''');
      Q.SQL.Add('   AND TIPOEVENTO IN (''D'', ''P'')');
      Q.ParamByName('AUTORIZACAO').Value := pAutorizacao;
      Q.ParamByName('DATAATENDIMENTO').AsDateTime := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAATENDIMENTO').AsDateTime;
      Q.Open;

      if Q.fieldbyname('QTD').asInteger > 0 then
        temDiariaProrrogacao := true
      else
        temDiariaProrrogacao := false;


      vDll := AbrirDll(Sys.CurrentSystem, 'SamAuto.Rotinas');
      result := vDll.Procura(Sys.CurrentSystem,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('AUTORIZACAO').AsInteger,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('EVENTO').AsInteger,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('GRAU').AsInteger,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('EXECUTOR').AsInteger,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('RECEBEDOR').AsInteger,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAATENDIMENTO').AsDateTime,
        True,
        'D',
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('BENEFICIARIO').AsInteger,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('ACIDENTEPESSOAL').AsString,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('FINALIDADEATENDIMENTO').AsInteger,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('CONDICAOATENDIMENTO').AsInteger,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('LOCALATENDIMENTO').AsInteger,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('OBJETIVOTRATAMENTO').AsInteger,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('TIPOTRATAMENTO').AsInteger,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('REGIMEATENDIMENTO').AsInteger,
        samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('TIPOACOMODACAO').AsInteger,
        temDiariaProrrogacao);
        (* sétimo parâmetro alterado para True na SMS 77448 - 23.04.2007
      Foi alterado porque, caso o Padrão da Acomodação seja selecionar Sempre, e o usuário já tenha digitado a Acomodação
      na Autorização, caso seja encontrada somente uma Acomodação para o Beneficiário, o sistema automaticamente sugere esta
      Acomodação. Caso seja encontrada mais de uma, aí sim, abre a interface para selecionar uma*)

    end;
  end
  else if pTipoEvento = 'P' then //*_*_*_*_*_*_ PRORROGAÇÃO _*_*_*_*_*_
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add(' SELECT A.BENEFICIARIO,                               ');
    Q.SQL.Add('        A.TIPOAUTORIZACAO,                            ');
    Q.SQL.Add('        A.REGIMEATENDIMENTO,                          ');
    Q.SQL.Add('        A.DATAPREVISTAALTA,                           ');
    Q.SQL.Add('        G.EVENTOSOLICITADO,                           ');
    Q.SQL.Add('        G.HANDLE,                                     ');
    Q.SQL.Add('        G.EVENTOGERADO,                               ');
    Q.SQL.Add('        T.DIASPRORROGACAO                             ');
    Q.SQL.Add('   FROM SAM_AUTORIZ_EVENTOGERADO G,                   ');
    Q.SQL.Add('        SAM_AUTORIZ A,                                ');
    Q.SQL.Add('        SAM_TGE T                                     ');
    Q.SQL.Add('  WHERE A.HANDLE = G.AUTORIZACAO                      ');
    Q.SQL.Add('    AND T.HANDLE = G.EVENTOGERADO                     ');
    Q.SQL.Add('    AND G.AUTORIZACAO = :AUTORIZACAO                  ');
    Q.SQL.Add('    AND G.SITUACAO IN (''A'', ''L'')                  ');
    Q.SQL.Add('    AND EXISTS (SELECT X.HANDLE                       ');
    Q.SQL.Add('                  FROM SAM_AUTORIZ_EVENTOGERADO X     ');
    Q.SQL.Add('                 WHERE X.AUTORIZACAO = A.HANDLE       ');
    Q.SQL.Add('                   AND X.TIPOEVENTO IN (''D'', ''P'') ');
    Q.SQL.Add('                   AND X.SITUACAO <> ''C'')           ');
    Q.SQL.Add('  ORDER BY T.DIASPRORROGACAO DESC                     ');
    Q.ParamByName('AUTORIZACAO').Value := pAutorizacao;
    Q.Open;

    vEvento := Q.FieldByName('EVENTOGERADO').AsInteger;
    vData := Q.FieldByName('DATAPREVISTAALTA').AsDateTime;
    vTipo := Q.FieldByName('TIPOAUTORIZACAO').AsInteger;
    vgREGIMEATENDIMENTO := Q.FieldByName('REGIMEATENDIMENTO').AsInteger;
    vgCurrentUser := Sys.CurrentUser;

    if not Q.IsEmpty then
    begin
      if Q.FieldByName('DIASPRORROGACAO').AsInteger > 0 then
      begin
        samauto_BENEFICIARIO.Close;
        samauto_BENEFICIARIO.ParamByName('BENEFICIARIOHANDLE').Value := Q.FieldByName('BENEFICIARIO').AsInteger;
        samauto_BENEFICIARIO.Open;
      
        X.Close;
        X.SQL.Clear;
        X.SQL.Add('SELECT S.AUTORIZACAO, S.EVENTO, S.GRAU, S.EXECUTOR, S.RECEBEDOR, S.DATAATENDIMENTO,');
        X.SQL.Add('       A.BENEFICIARIO, A.ACIDENTEPESSOAL, A.FINALIDADEATENDIMENTO,');
        X.SQL.Add('       A.CONDICAOATENDIMENTO, A.LOCALATENDIMENTO, A.OBJETIVOTRATAMENTO,');
        X.SQL.Add('       A.TIPOTRATAMENTO, A.REGIMEATENDIMENTO, A.TIPOACOMODACAO');
        X.SQL.Add('  FROM SAM_AUTORIZ_EVENTOSOLICIT S');
        X.SQL.Add('  JOIN SAM_AUTORIZ A ON S.AUTORIZACAO = A.HANDLE');
        X.SQL.Add(' WHERE S.HANDLE = :HANDLE');
        X.ParamByName('HANDLE').Value := Q.FieldByName('EVENTOSOLICITADO').AsInteger;
        X.Open;

        // acrescentado por rodrigo - na cassi - pois estava dando erro na hora de gerar prorrogacao - 13/09
        if qParamGeralAtendimento.FieldByName('PADRAOPRORROGACAO').AsString = 'P' then
        begin
          qAux.Close;
          qAux.SQL.Clear;
          qAux.SQL.Add('SELECT DISTINCT AC.HANDLE                                                                           ');
          qAux.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO AE                                                                  ');
          qAux.SQL.Add('  JOIN SAM_BENEFICIARIO_MOD     BM ON BM.HANDLE = AE.BENEFICIARIOMOD                                ');
          qAux.SQL.Add('  JOIN SAM_CONTRATO_MOD         CM ON CM.HANDLE = BM.MODULO                                         ');
          qAux.SQL.Add('  JOIN SAM_MODULO               MO ON MO.HANDLE = CM.MODULO                                         ');

          if qParamGeralAtendimento.FieldByName('TIPOACOMODACAO').AsString = 'E' then
            qAux.SQL.Add('  JOIN SAM_ACOMODACAO_EVENTO    AC ON AC.EVENTO = AE.EVENTOGERADO AND AC.ACOMODACAO = MO.ACOMODACAO ')
          else
            qAux.SQL.Add('  JOIN SAM_ACOMODACAO_GRAU      AC ON AC.GRAU = AE.GRAUGERADO AND AC.ACOMODACAO = MO.ACOMODACAO     ');

          qAux.SQL.Add(' WHERE AE.EVENTOSOLICITADO = :EVENTOSOLICITADO                                                      ');
          qAux.ParamByName('EVENTOSOLICITADO').Value := Q.FieldByName('EVENTOSOLICITADO').AsInteger;
          qAux.Open;

          if qAux.RecordCount > 0 then
          begin
            qAux.first;
            while not qAux.eof do
            begin
              if Result = '' then
                Result := qAux.FieldByName('HANDLE').AsString
              else
                Result := Result + ',' + qAux.FieldByName('HANDLE').AsString;
              qAux.next;
            end;
          end
          else
            Result := '';
        end
        else
        begin
          vDll := AbrirDll(Sys.CurrentSystem, 'SamAuto.Rotinas');
          result := vDll.Procura(Sys.CurrentSystem,
            X.FieldByName('AUTORIZACAO').AsInteger,
            X.FieldByName('EVENTO').AsInteger,
            X.FieldByName('GRAU').AsInteger,
            X.FieldByName('EXECUTOR').AsInteger,
            X.FieldByName('RECEBEDOR').AsInteger,
            X.FieldByName('DATAATENDIMENTO').AsDateTime,
            False,
            'P',
            X.FieldByName('BENEFICIARIO').AsInteger,
            X.FieldByName('ACIDENTEPESSOAL').AsString,
            X.FieldByName('FINALIDADEATENDIMENTO').AsInteger,
            X.FieldByName('CONDICAOATENDIMENTO').AsInteger,
            X.FieldByName('LOCALATENDIMENTO').AsInteger,
            X.FieldByName('OBJETIVOTRATAMENTO').AsInteger,
            X.FieldByName('TIPOTRATAMENTO').AsInteger,
            X.FieldByName('REGIMEATENDIMENTO').AsInteger,
            X.FieldByName('TIPOACOMODACAO').AsInteger,
            True);
          (* sétimo parâmetro, na prorrogação, continua sem sugerir a Acomodação. Não podemos assumir o Tipo de Acomodação da Autorização.
          porque ela é selecionada somente na digitação da mesma, caso o usuário necessite alterar, é atualizado via update
          na Autorização. *)
        end;

        //GerarDiarias(pAutorizacao, vAcomodacao, 'P');

        samauto_AUTORIZ_EVENTOSOLICIT.Close;
        samauto_BENEFICIARIO.Close;
      end;  
    end
    else
      raise exception.create('Evento do tipo diária inexistente ou negado. Não é possível prorrogar.');
  end;  
end;

procedure TDM.GerarDiarias(pAutorizacao, pAcomodacao, pCodigoTabela: integer; pTipoEvento: string);
var
  vHAcomodacao, vEvento, vGrau, vCodPagto: integer;
  vBeneficiario, vTipoAutorizacao: integer;
  vDataSolicitacao: TDateTime;
  vDias: integer;
  vHandleSAM_AUTORIZ_EVENTOGERADO: integer;
  vExecutor,
    vSolicitante,
    vRecebedor,
    vLocalExecucao: integer;
  viEventoSolicit: Integer;
  vdDataAtendimento: TDateTime;
  vLocalAtendimento: Integer; //SMS 73963 - Marcelo Barbosa - 25/11/2006
  vDiariaTipoAcomodacaoTISS: string;
  vPadraoAcomodacao: string;
begin
  WriteBDebug('SamAuto.DM.GerarDiarias - Início');
  vgCurrentUser:= Sys.CurrentUser;
  //O PARAMETRO PACOMODACAO PODE SER UM HANDLE DA SAM_ACOMODACAO_GRAU OU SAM_ACOMODACAO_EVENTO,
  //DEPENDENDO DO PARAMETRO GERAL TIPOACOMODACAO
  if not SAM_PARAMETROSGERAIS.active then
    SAM_PARAMETROSGERAIS.Open;

  vDiariaTipoAcomodacaoTISS := SAM_PARAMETROSGERAIS.FieldByName('DIARIATIPOACOMODACAOTISS').AsString;
  vPadraoAcomodacao := SAM_PARAMETROSGERAIS.FieldByName('PADRAOACOMODACAO').AsString;

  if pTipoEvento = 'P' then
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT COUNT(A.HANDLE) DIARIAS');
    Q.SQL.Add('  FROM SAM_AUTORIZ A,');
    Q.SQL.Add('       SAM_AUTORIZ_EVENTOSOLICIT B,');
    Q.SQL.Add('       SAM_AUTORIZ_EVENTOGERADO C');
    Q.SQL.Add(' WHERE A.HANDLE = C.AUTORIZACAO');
    Q.SQL.Add('   AND A.HANDLE = B.AUTORIZACAO');
    Q.SQL.Add('   AND A.HANDLE = :HANDLE');
    Q.SQL.Add('   AND C.TIPOEVENTO = ''D''');
    Q.SQL.Add('   AND C.SITUACAO IN (''A'',''L'')');
    Q.ParamByName('HANDLE').Value := pAutorizacao;
    Q.Open;
    if Q.FieldByName('DIARIAS').AsInteger = 0 then
    begin
      raise exception.create('Não existem diárias autorizadas ou liberadas para serem prorrogadas');
    end;
    //SMS 48523 Início - Wagner 09/08/2005 - Verifica se existem ainda negações para prorrogação de diárias
    Q.Close;
    Q.sql.Clear;
    Q.sql.add('SELECT COUNT(A.HANDLE) PRORROGACOES');
    Q.sql.add('  FROM SAM_AUTORIZ A,');
    Q.sql.add('       SAM_AUTORIZ_EVENTOSOLICIT B,');
    Q.sql.add('       SAM_AUTORIZ_EVENTOGERADO C');
    Q.sql.add(' WHERE A.HANDLE = C.AUTORIZACAO');
    Q.sql.add('   AND A.HANDLE = B.AUTORIZACAO');
    Q.sql.add('   AND A.HANDLE = :HANDLE');
    Q.sql.add('   AND C.TIPOEVENTO = ''P''');
    Q.sql.add('   AND C.SITUACAO = ''N''');
    Q.parambyname('HANDLE').Value := pAutorizacao;
    Q.Open;
    if Q.FieldByName('PRORROGACOES').AsInteger > 0 then
    begin
      raise exception.create('Existe um prorrogação negada, não possivel prorrogar novamente sem antes liberar a prorrogação');
    end;
    //SMS 48523 - Fim
  end
  else
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT COUNT(A.HANDLE) DIARIAS');
    Q.SQL.Add('  FROM SAM_AUTORIZ A,');
    Q.SQL.Add('       SAM_AUTORIZ_EVENTOSOLICIT B,');
    Q.SQL.Add('       SAM_AUTORIZ_EVENTOGERADO C');
    Q.SQL.Add(' WHERE A.HANDLE = C.AUTORIZACAO');
    Q.SQL.Add('   AND A.HANDLE = B.AUTORIZACAO');
    Q.SQL.Add('   AND A.HANDLE = :HANDLE');
    Q.SQL.Add('   AND C.TIPOEVENTO = ''D''');
    Q.SQL.Add('   AND C.SITUACAO <> ''C''');
    Q.ParamByName('HANDLE').Value := pAutorizacao;
    Q.Open;
    if Q.FieldByName('DIARIAS').AsInteger > 0 then
    begin
      raise exception.create('Evento diária já existente. Prorrogar se necessário.');
    end;
  end;
  //SMS 66251 - Marcelo Barbosa - 08/08/2006
  //Acrescentada a opção "I"(internação/Prorrogação) pois a data de internação estava sendo gerada errada.
  if (vgServico = 'G') or (vgServico = 'A') or (vgServico = '') or (vgServico = 'I') then
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT MIN(DATAATENDIMENTO) DATAATENDIMENTO FROM SAM_AUTORIZ_EVENTOGERADO WHERE AUTORIZACAO = :HANDLE AND SITUACAO <> ''C''');
    Q.ParamByName('HANDLE').Value := pAutorizacao;
    Q.Open;
    vDataSolicitacao := Q.FieldByName('DATAATENDIMENTO').AsDateTime;
  end
  else
    vDataSolicitacao := Sys.serverdate;

  // Eduardo - 09/12/2003 - SMS 21559
  // Verifica se usuário já informou a acomodação em algum evento/grau solicitado
  if pAcomodacao <= 0 then
  begin
    // sms 54385
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT G.TIPOEVENTO TIPOEVENTO, G.VALORUNITARIOCALCULADO VALOR, A.ACOMODACAOGRAU ACOMODACAO, A.HANDLE HANDLEX, TGE.DIASINTERNACAO DIASINTERNACAO           ');// Coelho SMS: 133639
    Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOSOLICIT A, SAM_AUTORIZ_EVENTOGERADO G, SAM_PARAMETROSATENDIMENTO B, SAM_TGE TGE                ');
    Q.SQL.Add(' WHERE A.AUTORIZACAO = :HANDLE                                 ');
    Q.SQL.Add('   AND A.SITUACAO <> ''C''                                     ');
    Q.SQL.Add('   AND B.TIPOACOMODACAO    = ''G''                                ');
    Q.SQL.Add('   AND G.EVENTOSOLICITADO = A.HANDLE                           ');
    Q.SQL.Add('   AND A.ACOMODACAOGRAU IS NOT NULL                            ');
    Q.SQL.Add('   AND TGE.HANDLE = A.EVENTO                                   '); // Coelho SMS: 133639
    Q.SQL.Add(' UNION                                                         ');
    Q.SQL.Add('SELECT G.TIPOEVENTO TIPOEVENTO, G.VALORUNITARIOCALCULADO VALOR, A.ACOMODACAOEVENTO ACOMODACAO, A.HANDLE HANDLEX, TGE.DIASINTERNACAO DIASINTERNACAO         '); // Coelho SMS: 133639
    Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOSOLICIT A, SAM_AUTORIZ_EVENTOGERADO G, SAM_PARAMETROSATENDIMENTO B, SAM_TGE TGE                ');
    Q.SQL.Add(' WHERE A.AUTORIZACAO = :HANDLE                                 ');
    Q.SQL.Add('   AND A.SITUACAO <> ''C''                                     ');
    Q.SQL.Add('   AND B.TIPOACOMODACAO = ''E''                                ');
    Q.SQL.Add('   AND G.EVENTOSOLICITADO = A.HANDLE                           ');
    Q.SQL.Add('   AND A.ACOMODACAOEVENTO IS NOT NULL                          ');
    Q.SQL.Add('   AND TGE.HANDLE = A.EVENTO                                   ');  // Coelho SMS: 133639
    Q.SQL.Add(' ORDER BY DIASINTERNACAO DESC, TIPOEVENTO, VALOR DESC, HANDLEX DESC        ');  // Coelho SMS: 133639
    // sms 54385
    Q.ParamByName('HANDLE').Value := pAutorizacao;
    Q.Open;
    pAcomodacao := Q.FieldByName('ACOMODACAO').AsInteger; // pega a última acomodação selecionada pelo usuário
    viEventoSolicit := Q.FieldByName('HANDLEX').AsInteger; // grava em qual evento foi informada essa última acomodação
  end;

  if (pAcomodacao > 0) and (viEventoSolicit > 0) then
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT B.HANDLE EVENTOSOLICITADO, A.BENEFICIARIO, A.TIPOAUTORIZACAO');
    Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOSOLICIT B, SAM_AUTORIZ A');
    Q.SQL.Add(' WHERE B.AUTORIZACAO = :HAUTORIZACAO');
    Q.SQL.Add('   AND B.HANDLE = :HEVENTOSOLICIT');
    Q.SQL.Add('   AND A.HANDLE = B.AUTORIZACAO');
    Q.SQL.Add('   AND B.SITUACAO <> ''C''');
    Q.ParamByName('HAUTORIZACAO').Value := pAutorizacao;
    Q.ParamByName('HEVENTOSOLICIT').Value := viEventoSolicit;
    Q.Open;
  end
  else
  begin
    // as diárias devem ser geradas embaixo do evento principal
    // entretanto o evento principal pode mudar, as diárias serão geradas no primeiro evento
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT B.EVENTOSOLICITADO, A.BENEFICIARIO, A.TIPOAUTORIZACAO');
    Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO B, SAM_AUTORIZ A            ');
    Q.SQL.Add(' WHERE B.TIPOEVENTO IN (''D'',''P'')');
    Q.SQL.Add('   AND B.AUTORIZACAO = :HAUTORIZACAO');
    Q.SQL.Add('   AND A.HANDLE = B.AUTORIZACAO');
    Q.SQL.Add('   AND B.SITUACAO <> ''C''');
    Q.ParamByName('HAUTORIZACAO').Value := pAutorizacao;
    Q.Open;

    if Q.isEmpty then //pega por final o de maior valor
    begin
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT B.EVENTOSOLICITADO, A.BENEFICIARIO, A.TIPOAUTORIZACAO');
      Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO B, SAM_AUTORIZ A, SAM_AUTORIZ_EVENTOSOLICIT C, SAM_TGE TGE ');
      Q.SQL.Add(' WHERE B.AUTORIZACAO = :HAUTORIZACAO');
      Q.SQL.Add('   AND A.HANDLE = B.AUTORIZACAO     ');
      Q.SQL.Add('   AND C.HANDLE = B.EVENTOSOLICITADO');
      Q.SQL.Add('   AND TGE.HANDLE = C.EVENTO        ');
      Q.SQL.Add(EspecificoDll.MPU_ATE_GerarDiarias(Sys.CurrentSystem));
      Q.SQL.Add('   AND B.SITUACAO <> ''C''          ');
      Q.SQL.Add(' ORDER BY TGE.DIASINTERNACAO DESC, B.VALORUNITARIOCALCULADO DESC');
      Q.ParamByName('HAUTORIZACAO').Value := pAutorizacao;
      Q.Open;
    end;
  end;

  // fim SMS 21559

  if not q.IsEmpty then
  begin
    viEventoSolicit := Q.FieldByName('EVENTOSOLICITADO').AsInteger;
    samauto_AUTORIZ_EVENTOSOLICIT.Close;
    samauto_AUTORIZ_EVENTOSOLICIT.ParamByName('HANDLE').Value := viEventoSolicit;
    samauto_AUTORIZ_EVENTOSOLICIT.Open;

    if samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('SOLICITANTE').isnull then
      vSolicitante := nulo
    else
    begin
      LerSolicitante(samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('SOLICITANTE').AsInteger);
      vSolicitante := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('SOLICITANTE').AsInteger;
    end;
    if samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('EXECUTOR').isnull then
      vExecutor := nulo
    else
    begin
      LerExecutor(samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('EXECUTOR').AsInteger);
      vExecutor := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('EXECUTOR').AsInteger;
    end;
    if samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('RECEBEDOR').isnull then
      vRecebedor := nulo
    else
    begin
      LerRecebedor(samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('RECEBEDOR').AsInteger);
      vRecebedor := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('RECEBEDOR').AsInteger;
    end;
    if samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('LOCALEXECUCAO').isnull then
      vLocalExecucao := nulo
    else
    begin
      LerLocalExecucao(samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('LOCALEXECUCAO').AsInteger);
      vLocalExecucao := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('LOCALEXECUCAO').AsInteger;
    end;

    vBeneficiario := Q.FieldByName('BENEFICIARIO').AsInteger;
    vTipoAutorizacao := Q.FieldByName('TIPOAUTORIZACAO').AsInteger;
    vEvento := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('EVENTO').AsInteger;

    samauto_BENEFICIARIO.Close;
    samauto_BENEFICIARIO.ParamByName('BENEFICIARIOHANDLE').Value := vBeneficiario;
    samauto_BENEFICIARIO.Open;

    if pAcomodacao <= 0 then
    begin
      if SAM_PARAMETROSGERAIS.FieldByName('TIPOACOMODACAO').AsString = 'G' then
        pAcomodacao := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('ACOMODACAOGRAU').AsInteger
      else
        pAcomodacao := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('ACOMODACAOEVENTO').AsInteger;
    end;

    if pAcomodacao <= 0 then // se não tem acomodação para o evento principal, pega a última acomodação selecionada.
    begin
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT A.ACOMODACAOGRAU ACOMODACAO, A.HANDLE HANDLEX');
      Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOSOLICIT A, SAM_PARAMETROSATENDIMENTO B');
      Q.SQL.Add(' WHERE A.AUTORIZACAO = :HANDLE');
      Q.SQL.Add('   AND B.TIPOACOMODACAO = ''G''');
      Q.SQL.Add('   AND A.SITUACAO <> ''C''');
      Q.SQL.Add(' UNION');
      Q.SQL.Add('SELECT A.ACOMODACAOEVENTO ACOMODACAO, A.HANDLE HANDLEX');
      Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOSOLICIT A, SAM_PARAMETROSATENDIMENTO B');
      Q.SQL.Add(' WHERE A.AUTORIZACAO = :HANDLE');
      Q.SQL.Add('   AND B.TIPOACOMODACAO = ''E''');
      Q.SQL.Add('   AND A.SITUACAO <> ''C''');
      Q.SQL.Add(' ORDER BY HANDLEX DESC');
      Q.ParamByName('HANDLE').Value := pAutorizacao;
      Q.Open;
      pAcomodacao := Q.FieldByName('ACOMODACAO').AsInteger;
    end;
  end;

  if pTipoEvento = 'D' then
  begin
    if (not Q.isEmpty) then
    begin
      if pAcomodacao > 0 then
      begin
        if not SAM_PARAMETROSGERAIS.active then
          SAM_PARAMETROSGERAIS.Open;
        X.Close;
        X.SQL.Clear;

        if SAM_PARAMETROSGERAIS.FieldByName('TIPOACOMODACAO').AsString = 'G' then
          X.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOSOLICIT SET ACOMODACAOGRAU = :ACOMODACAO WHERE HANDLE = :HANDLE')
        else
          X.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOSOLICIT SET ACOMODACAOEVENTO = :ACOMODACAO WHERE HANDLE = :HANDLE');
        X.ParamByName('HANDLE').Value := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('HANDLE').AsInteger;
        X.ParamByName('ACOMODACAO').Value := pAcomodacao;
        X.ExecSql;
      end
      else
      begin
        raise exception.create('Necessário escolher uma acomodação.');
      end;
    end;
  end;

  // SMS 81583 - Artur - Erro com o grau na prorrogação - INICIO
  if (SAM_PARAMETROSGERAIS.FieldByName('TIPOACOMODACAO').AsString = 'G') and (pTipoEvento = 'P') and (pAcomodacao <= 0) then
  begin
    // quando for uma prorrogação e o parametro geral de atendimento "padraoacomodacao" (Acomodação na prorrogação de diárias)
    //  estiver "assumir padrão do módulo", e o parametro "tipo de acomodação" estiver por grau,
    // e por fim, nao foi informado nem grau (na autorização), nem tipo de acomodação (na prorrogação),
    // entao realizará a busca do grau e consequentemente da acomodação através do evento gerado.

    qAux.Close;
    qAux.SQL.Clear;
    qAux.SQL.Add('SELECT AC.HANDLE as ACOMODACAO      ');
    qAux.SQL.Add('  FROM SAM_AUTORIZ A,               ');
    qAux.SQL.Add('       SAM_AUTORIZ_EVENTOSOLICIT ES,');
    qAux.SQL.Add('       SAM_AUTORIZ_EVENTOGERADO EG, ');
    qAux.SQL.Add('       SAM_GRAU G,                  ');
    qAux.SQL.Add('       SAM_TIPOGRAU TG,             ');
    qAux.SQL.Add('       SAM_ACOMODACAO_GRAU AG,      ');
    qAux.SQL.Add('       SAM_ACOMODACAO AC            ');
    qAux.SQL.Add(' WHERE ES.AUTORIZACAO = A.HANDLE    ');
    qAux.SQL.Add('   AND EG.AUTORIZACAO = A.HANDLE    ');
    qAux.SQL.Add('   AND G.HANDLE = EG.GRAUGERADO     ');
    qAux.SQL.Add('   AND TG.HANDLE = G.TIPOGRAU       ');
    qAux.SQL.Add('   AND AG.ACOMODACAO = EG.ACOMODACAO');
    qAux.SQL.Add('   AND AC.HANDLE = AG.ACOMODACAO    ');
    qAux.SQL.Add('   AND A.HANDLE = :HANDLE           ');
    qAux.SQL.Add('   AND EG.TIPOEVENTO = ''D''        ');
    qAux.SQL.Add('   AND EG.SITUACAO <> ''C''         ');
    qAux.SQL.Add('   AND TG.CLASSIFICACAO = ''3''     ');
    qAux.SQL.Add('   AND AG.GRAUPADROACOMODACAO =''S''');
    qAux.ParamByName('HANDLE').Value := pAutorizacao;
    qAux.Open;
    pAcomodacao := qAux.FieldByName('acomodacao').AsInteger;
  end;
  // SMS 81583 - Artur - Erro com o grau na prorrogação - FIM

  Q.Close;
  Q.SQL.Clear;
  if SAM_PARAMETROSGERAIS.FieldByName('TIPOACOMODACAO').AsString = 'G' then
  begin
    Q.SQL.Add('SELECT AG.GRAU, AG.ACOMODACAO');
    Q.SQL.Add('  FROM SAM_ACOMODACAO_GRAU AG');
    Q.SQL.Add(' WHERE AG.HANDLE = :HACOMODACAO');
    Q.ParamByName('HACOMODACAO').Value := pAcomodacao;
    Q.Open;
    vHAcomodacao := Q.FieldByName('ACOMODACAO').AsInteger;
    // Eduardo - 06/02/2004 - SMS 23479
    // Se tipo evento for Prorrogação
    if pTipoEvento = 'P' then
    begin
      qAux.Close;
      qAux.SQL.Clear;
      qAux.SQL.Add('SELECT ES.GRAU                      ');
      qAux.SQL.Add('  FROM SAM_AUTORIZ A,               ');
      qAux.SQL.Add('       SAM_AUTORIZ_EVENTOSOLICIT ES,');
      qAux.SQL.Add('       SAM_AUTORIZ_EVENTOGERADO EG, ');
      qAux.SQL.Add('       SAM_GRAU G,                  ');
      qAux.SQL.Add('       SAM_TIPOGRAU TG              ');
      qAux.SQL.Add(' WHERE A.HANDLE = EG.AUTORIZACAO    ');
      qAux.SQL.Add('   AND A.HANDLE = ES.AUTORIZACAO    ');
      qAux.SQL.Add('   AND G.HANDLE = ES.GRAU           ');
      qAux.SQL.Add('   AND TG.HANDLE = G.TIPOGRAU       ');
      qAux.SQL.Add('   AND A.HANDLE = :HANDLE           ');
      qAux.SQL.Add('   AND EG.TIPOEVENTO = ''D''        ');
      qAux.SQL.Add('   AND EG.SITUACAO <> ''C''         ');
      qAux.SQL.Add('   AND TG.CLASSIFICACAO = ''3''     ');
      qAux.ParamByName('HANDLE').Value := pAutorizacao;
      qAux.Open;
      if not qAux.IsEmpty then
        // Se a diária foi gerada pelo grau do tipo acomodação então pega o mesmo grau da diária
        vGrau := qAux.FieldByName('GRAU').AsInteger
      else
        // Se não, pega o grau da acomodação
        vGrau := Q.FieldByName('GRAU').AsInteger;
    end
    else
      vGrau := Q.FieldByName('GRAU').AsInteger;
    // fim SMS 23479
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT CODIGOPAGTO, COMPORTACODIGOPAGTO');
    Q.SQL.Add('  FROM SAM_TGE WHERE HANDLE = :HANDLE');
    Q.ParamByName('HANDLE').Value := vEvento;
    Q.Open;
    if Q.FieldByName('COMPORTACODIGOPAGTO').AsString = 'N' then
      vCodPagto := nulo
    else
      vCodPagto := Q.FieldByName('CODIGOPAGTO').AsInteger;
  end
  else
  begin
    Q.SQL.Add('SELECT AE.ACOMODACAO, AE.EVENTO, AE.GRAUAGERAR, T.CODIGOPAGTO, COMPORTACODIGOPAGTO');
    Q.SQL.Add('  FROM SAM_ACOMODACAO_EVENTO AE, SAM_TGE T');
    Q.SQL.Add(' WHERE AE.HANDLE = :HACOMODACAO');
    Q.SQL.Add('   AND T.HANDLE = AE.EVENTO');
    Q.ParamByName('HACOMODACAO').Value := pAcomodacao;
    Q.Open;
    vHAcomodacao := Q.FieldByName('ACOMODACAO').AsInteger;
    vEvento := Q.FieldByName('EVENTO').AsInteger;
    vGrau := Q.FieldByName('GRAUAGERAR').AsInteger;
    if Q.FieldByName('GRAUAGERAR').isNull then
      raise Exception.Create('Grau a gerar não cadastrado na tabela de eventos da acomodação!');
    if Q.FieldByName('COMPORTACODIGOPAGTO').AsString = 'N' then
      vCodPagto := nulo
    else
      vCodPagto := Q.FieldByName('CODIGOPAGTO').AsInteger;
  end;

  // Eduardo - 11/12/2003
  // Query estava fechada em certos momentos
  if not samauto_AUTORIZ_EVENTOSOLICIT.Active then
  begin
    samauto_AUTORIZ_EVENTOSOLICIT.Close;
    samauto_AUTORIZ_EVENTOSOLICIT.ParamByName('HANDLE').Value := viEventoSolicit;
    samauto_AUTORIZ_EVENTOSOLICIT.Open;
  end;
  // fim

  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT * FROM SAM_AUTORIZ WHERE HANDLE = :HANDLE');
  Q.ParamByName('HANDLE').Value := pAutorizacao;
  Q.Open;

  if pTipoEvento = 'D' then
    vDias := Q.FieldByName('DIARIASLIBERADAS').AsInteger;
  if pTipoEvento = 'P' then
    vDias := Q.FieldByName('PRORROGACAOLIBERADA').AsInteger;
  //SMS 73963 - Marcelo Barbosa - 25/11/2006
  vLocalAtendimento := q.fieldbyName('LOCALATENDIMENTO').AsInteger;
  //Fim - SMS 73963

  // Dias SMS 40460 01/03/2005 - Inicio
  vdDataAtendimento := samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('DATAATENDIMENTO').AsDateTime;
  if vDias <= 0 then
  begin
    raise exception.Create('Não foi possível gerar diárias. Problema na quantidade de dias para internação.');
  end // Dias SMS 40460 01/03/2005 - fim
  else
  begin
    vHandleSAM_AUTORIZ_EVENTOGERADO := GravarEventoGerado(vEvento,
      vGrau,
      samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('CID').AsInteger,
      vBeneficiario,
      vSolicitante,
      vExecutor,
      vRecebedor,
      vLocalExecucao,
      iif(vDataSolicitacao = 0, vdDataAtendimento, vDataSolicitacao),
      vCodPagto,
      vTipoAutorizacao,
      '',
      pTipoEvento,
      vDias, // qtd dias vai ser alterada mesmo
      vLocalAtendimento, //SMS 73963 - Marcelo Barbosa - 25/11/2006
      pCodigoTabela);
  end;
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT T.DIASPRORROGACAO DIAS, A.DATAINTERNACAO, A.DATAPREVISTAALTA,');
  Q.SQL.Add('       A.BENEFICIARIO, A.DV, A.TIPOAUTORIZACAO, A.FINALIDADEATENDIMENTO,');
  Q.SQL.Add('       A.CONDICAOATENDIMENTO, A.LOCALATENDIMENTO, A.OBJETIVOTRATAMENTO,');
  Q.SQL.Add('       A.REGIMEATENDIMENTO, A.TIPOTRATAMENTO, A.ACIDENTEPESSOAL,');
  Q.SQL.Add('       S.AUTORIZACAO, S.RECEBEDOR, S.LOCALEXECUCAO,');
  Q.SQL.Add('       G.EVENTOGERADO, G.GRAUGERADO, G.EXECUTOR, G.SOLICITANTE, G.AUTORIZACAO,G.TIPOEVENTO,');
  Q.SQL.Add('       G.CODIGOPAGAMENTOINFORMADO, G.XTHMINFORMADO, G.DATAATENDIMENTO, ');
  Q.SQL.Add('       G.HORAATENDIMENTO, S.CID, S.CBOS CBOSSOLICIT, G.CBOS CBOSGERADO');
  Q.SQL.Add('  FROM SAM_TGE T,');
  Q.SQL.Add('       SAM_AUTORIZ A,');
  Q.SQL.Add('       SAM_AUTORIZ_EVENTOSOLICIT S,');
  Q.SQL.Add('       SAM_AUTORIZ_EVENTOGERADO G');
  Q.SQL.Add(' WHERE A.HANDLE = S.AUTORIZACAO');
  Q.SQL.Add('   AND S.HANDLE = G.EVENTOSOLICITADO');
  Q.SQL.Add('   AND T.HANDLE = S.EVENTO');
  Q.SQL.Add('   AND G.HANDLE = :HEVENTOGERADO');
  Q.ParamByName('HEVENTOGERADO').Value := vHandleSAM_AUTORIZ_EVENTOGERADO;
  Q.Open;

  if Q.FieldByName('EXECUTOR').isNull then
    vExecutor := nulo
  else
    vExecutor := Q.FieldByName('EXECUTOR').AsInteger;
  if Q.FieldByName('SOLICITANTE').isNull then
    vSolicitante := nulo
  else
    vSolicitante := Q.FieldByName('SOLICITANTE').AsInteger;
  if Q.FieldByName('RECEBEDOR').isNull then
    vRecebedor := nulo
  else
    vRecebedor := Q.FieldByName('RECEBEDOR').AsInteger;
  if Q.FieldByName('LOCALEXECUCAO').isNull then
    vLocalExecucao := nulo
  else
    vLocalExecucao := Q.FieldByName('LOCALEXECUCAO').AsInteger;

  if Q.FieldByName('TIPOEVENTO').AsString <> 'P' then
  begin
    UPD.Close;
    UPD.SQL.Clear;
    UPD.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO   ');
    UPD.SQL.Add('   SET ACOMODACAO = :HACOMODACAO, ');

     if ((vDiariaTipoAcomodacaoTISS = 'S') and (vHAcomodacao > 0)) then
    begin
      if ((vPadraoAcomodacao = 'P') or (Sys.WebMode)) then
      begin
        X.Close;
        X.SQL.Clear;
        X.SQL.Add(' SELECT T.HANDLE FROM TIS_TIPOACOMODACAO T WHERE T.ACOMODACAO = :ACOMODACAO ');
        X.SQL.Add('            AND T.VERSAOTISS = (SELECT MAX(HANDLE) FROM TIS_VERSAO WHERE ATIVODESKTOP = ''S'')');
        X.ParamByName('ACOMODACAO').AsInteger := vHAcomodacao;
        X.Open;
        if (not X.Eof) then
        begin
          UPD.SQL.Add('       TIPOACOMODACAO = :TIPOACOMODACAO, ');
          UPD.ParamByName('TIPOACOMODACAO').AsInteger := X.FieldByName('HANDLE').AsInteger;
        end;
        X.Close;
      end
      else
      begin
        if (Sys.SessionVar['NOVOTIPOACOMODACAO'] <> '') then
        begin
          UPD.SQL.Add('       TIPOACOMODACAO = :TIPOACOMODACAO, ');
          UPD.ParamByName('TIPOACOMODACAO').AsInteger := Sys.SessionVar['NOVOTIPOACOMODACAO'];
        end;
      end;
    end;
    //Final SMS 77448
    UPD.SQL.Add('       QTDAUTORIZADA = :DIAS      ');
    UPD.SQL.Add(' WHERE HANDLE = :HEVENTOGERADO    ');
    UPD.SQL.Add('AND TIPOEVENTO <> ''P''           ');
    UPD.ParamByName('HEVENTOGERADO').Value := vHandleSAM_AUTORIZ_EVENTOGERADO;
    if vHAcomodacao > 0 then
      UPD.ParamByName('HACOMODACAO').Value := vHAcomodacao
    else
    begin
      UPD.ParamByName('HACOMODACAO').DataType := ftInteger;
      UPD.ParamByName('HACOMODACAO').Clear;
    end;
    UPD.ParamByName('DIAS').Value := vDias;
    UPD.ExecSql;
  end;

  if Q.FieldByName('TIPOEVENTO').AsString = 'P' then
  begin
    UPD.Close;
    UPD.SQL.Clear;
    UPD.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO   ');
    UPD.SQL.Add('   SET ACOMODACAO = :HACOMODACAO, ');

    if ((vDiariaTipoAcomodacaoTISS = 'S') and (vHAcomodacao > 0)) then
    begin
      if Sys.WebMode then
      begin
        X.Close;
        X.SQL.Clear;
        X.SQL.Add(' SELECT T.HANDLE FROM TIS_TIPOACOMODACAO T WHERE T.ACOMODACAO = :ACOMODACAO ');
        X.SQL.Add('            AND T.VERSAOTISS = (SELECT MAX(HANDLE) FROM TIS_VERSAO WHERE ATIVODESKTOP = ''S'')');
        X.ParamByName('ACOMODACAO').AsInteger := vHAcomodacao;
        X.Open;
        if (not X.Eof) then
        begin
          UPD.SQL.Add('       TIPOACOMODACAO = :TIPOACOMODACAO, ');
          UPD.ParamByName('TIPOACOMODACAO').AsInteger := X.FieldByName('HANDLE').AsInteger;
        end;
        X.Close;
      end
      else
      begin
        if (Sys.SessionVar['NOVOTIPOACOMODACAO'] <> '') then
        begin
          UPD.SQL.Add('       TIPOACOMODACAO = :TIPOACOMODACAO, ');
          UPD.ParamByName('TIPOACOMODACAO').AsInteger := Sys.SessionVar['NOVOTIPOACOMODACAO'];
        end;
      end;
    end;

    UPD.SQL.Add('       QTDAUTORIZADA = :DIAS      ');
    UPD.SQL.Add(' WHERE HANDLE = :HEVENTOGERADO    ');
    UPD.SQL.Add('AND TIPOEVENTO = ''P''            ');
    UPD.ParamByName('HEVENTOGERADO').Value := vHandleSAM_AUTORIZ_EVENTOGERADO;
    UPD.ParamByName('HACOMODACAO').Value := vHAcomodacao;
    UPD.ParamByName('DIAS').Value := vDias;
    UPD.ExecSql;
  end;

  vgValidarPartindoDaGeracaoDeOutro := False;
  AlterarSAM_AUTORIZ_EVENTOGERADO(
    vHandleSAM_AUTORIZ_EVENTOGERADO,
    Q.FieldByName('EVENTOGERADO').AsInteger,
    Q.FieldByName('GRAUGERADO').AsInteger,
    Q.FieldByName('CID').AsInteger,
    Sys.CurrentUser,
    Q.FieldByName('BENEFICIARIO').AsInteger,
    Q.FieldByName('DV').AsString,
    vExecutor,
    vSolicitante,
    vRecebedor,
    vLocalExecucao,
    Q.FieldByName('DATAATENDIMENTO').AsDateTime, // Coelho SMS: 79716 deve ser passada a data de atendimento pois a de solicitação não serve para nada
    //iif(vDataSolicitacao > 0, vDataSolicitacao, vdDataAtendimento),
    Q.FieldByName('HORAATENDIMENTO').AsDateTime,
    Q.FieldByName('TIPOAUTORIZACAO').AsInteger,
    Q.FieldByName('FINALIDADEATENDIMENTO').AsInteger,
    Q.FieldByName('CONDICAOATENDIMENTO').AsInteger,
    Q.FieldByName('LOCALATENDIMENTO').AsInteger,
    Q.FieldByName('OBJETIVOTRATAMENTO').AsInteger,
    Q.FieldByName('REGIMEATENDIMENTO').AsInteger,
    Q.FieldByName('TIPOTRATAMENTO').AsInteger,
    Q.FieldByName('ACIDENTEPESSOAL').AsString,
    'I', // Internação/Prorrogação
    vDias,
    nulo,
    Q.FieldByName('CODIGOPAGAMENTOINFORMADO').AsInteger,
    Q.FieldByName('XTHMINFORMADO').AsInteger,
    iif(Q.FieldByName('CBOSGERADO').IsNull, iif(Q.FieldByName('CBOSSOLICIT').IsNull, 0 ,Q.FieldByName('CBOSSOLICIT').AsInteger), Q.FieldByName('CBOSGERADO').AsInteger ),
    vDataSolicitacao,
    SAM_PARAMETROSGERAIS.FieldByName('UTILIZAAUXILIO').AsString,
    '');

  AtualizarPeriodoInternacaoAcomodacao(vHandleSAM_AUTORIZ_EVENTOGERADO);
  WriteBDebug('SamAuto.DM.GerarDiarias - Fim');
end;

procedure TDM.AlinharAuxiliares(pHAutorizacao: integer);
var
  vSolicitante,
    vExecutor,
    vRecebedor,
    vLocalExecucao,
    vEvento,
    vGrau,
    vBeneficiario,
    vTipoAutorizacao,
    vFinalidadeAtendimento,
    vCondicaoAtendimento,
    vLocalAtendimento,
    vObjetivoTratamento,
    vRegimeTratamento,
    vTipoTratamento,
    vCodigoPagamento,
    vXTHM: integer;
  vDV, vAcidentePessoal: string;
  vDataAtendimento, vHoraAtendimento: TDateTime;
  vHandleSAM_AUTORIZ_EVENTOGERADO: integer;
  vCid: Integer;
begin

  if not SAM_PARAMETROSGERAIS.active then
    SAM_PARAMETROSGERAIS.Open;

  if SAM_PARAMETROSGERAIS.FieldByName('ALINHAMENTOAUXILIARES').AsString = 'N' then
    exit;

  if vgValidarPartindoDaGeracaoDeOutro then
    exit;

  // Datas que devem ser analisadas (while)
  ALINHAR_AUXILIARES_DATA.Close;
  ALINHAR_AUXILIARES_DATA.ParamByName('AUTORIZACAO').Value := pHAutorizacao;
  ALINHAR_AUXILIARES_DATA.Open;

  while not ALINHAR_AUXILIARES_DATA.EOF do
  begin
    // ALINHAR_AUXILIARES retorna os graus que faltam ser gerados para cada evento solicitado.
    ALINHAR_AUXILIARES.Close;
    ALINHAR_AUXILIARES.ParamByName('AUTORIZACAO').Value := pHAutorizacao;
    ALINHAR_AUXILIARES.ParamByName('DATA').Value := ALINHAR_AUXILIARES_DATA.FieldByName('DATAATENDIMENTO').AsDateTime;
    ALINHAR_AUXILIARES.Open;

    while not ALINHAR_AUXILIARES.EOF do
    begin
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT A.BENEFICIARIO, A.DV, A.TIPOAUTORIZACAO, A.FINALIDADEATENDIMENTO,');
      Q.SQL.Add('       A.CONDICAOATENDIMENTO, A.LOCALATENDIMENTO, A.OBJETIVOTRATAMENTO,');
      Q.SQL.Add('       A.REGIMEATENDIMENTO, A.TIPOTRATAMENTO, A.ACIDENTEPESSOAL,');
      Q.SQL.Add('       S.AUTORIZACAO, S.EVENTO, S.GRAU,');
      Q.SQL.Add('       S.EXECUTOR, S.SOLICITANTE, S.RECEBEDOR, S.LOCALEXECUCAO,');
      Q.SQL.Add('       S.CODIGOPAGTO, S.XTHM, S.DATAATENDIMENTO, S.HORAATENDIMENTO, S.CID');
      Q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOSOLICIT S,');
      Q.SQL.Add('       SAM_AUTORIZ A,');
      Q.SQL.Add('       SAM_TGE T');
      Q.SQL.Add(' WHERE A.HANDLE = S.AUTORIZACAO');
      Q.SQL.Add('   AND T.HANDLE = S.EVENTO');
      Q.SQL.Add('   AND S.HANDLE = :EVENTOSOLICITADO');
      Q.ParamByName('EVENTOSOLICITADO').Value := ALINHAR_AUXILIARES.FieldByName('EVENTOSOLICITADO').AsInteger;
      Q.Open;

      vCID := q.FieldByName('CID').AsInteger;

      // Tem que gravar o evento gerado para cada solicitado da ALINHA_AUXILIARES
      samauto_AUTORIZ_EVENTOSOLICIT.Close;
      samauto_AUTORIZ_EVENTOSOLICIT.ParamByName('HANDLE').Value := ALINHAR_AUXILIARES.FieldByName('EVENTOSOLICITADO').AsInteger;
      samauto_AUTORIZ_EVENTOSOLICIT.Open;

      vBeneficiario := Q.FieldByName('BENEFICIARIO').AsInteger;
      vEvento := Q.FieldByName('EVENTO').AsInteger;
      vGrau := ALINHAR_AUXILIARES.FieldByName('GRAUGERADO').AsInteger;
      vBeneficiario := Q.FieldByName('BENEFICIARIO').AsInteger;
      vDV := Q.FieldByName('DV').AsString;
      vDataAtendimento := Q.FieldByName('DATAATENDIMENTO').AsDateTime;
      vHoraAtendimento := Q.FieldByName('HORAATENDIMENTO').AsDateTime;
      vTipoAutorizacao := Q.FieldByName('TIPOAUTORIZACAO').AsInteger;
      vFinalidadeAtendimento := Q.FieldByName('FINALIDADEATENDIMENTO').AsInteger;
      vCondicaoAtendimento := Q.FieldByName('CONDICAOATENDIMENTO').AsInteger;
      vLocalAtendimento := Q.FieldByName('LOCALATENDIMENTO').AsInteger;
      vObjetivoTratamento := Q.FieldByName('OBJETIVOTRATAMENTO').AsInteger;
      vRegimeTratamento := Q.FieldByName('REGIMEATENDIMENTO').AsInteger;
      vTipoTratamento := Q.FieldByName('TIPOTRATAMENTO').AsInteger;
      vAcidentePessoal := Q.FieldByName('ACIDENTEPESSOAL').AsString;
      vCodigoPagamento := Q.FieldByName('CODIGOPAGTO').AsInteger;
      vXTHM := Q.FieldByName('XTHM').AsInteger;

      if Q.FieldByName('SOLICITANTE').isnull then
        vSolicitante := nulo
      else
        vSolicitante := Q.FieldByName('SOLICITANTE').AsInteger;
      if Q.FieldByName('EXECUTOR').isnull then
        vExecutor := nulo
      else
        vExecutor := Q.FieldByName('EXECUTOR').AsInteger;
      if Q.FieldByName('RECEBEDOR').isnull then
        vRecebedor := nulo
      else
        vRecebedor := Q.FieldByName('RECEBEDOR').AsInteger;
      if Q.FieldByName('LOCALEXECUCAO').isnull then
        vLocalExecucao := nulo
      else
        vLocalExecucao := Q.FieldByName('LOCALEXECUCAO').AsInteger;
      if Q.FieldByName('CODIGOPAGTO').isnull then
        vCodigoPagamento := nulo
      else
        vCodigoPagamento := Q.FieldByName('CODIGOPAGTO').AsInteger;
      // grava o novo evento gerado (auxiliar) para cada evento solicitado
      vHandleSAM_AUTORIZ_EVENTOGERADO := GravarEventoGerado(
        vEvento,
        vGrau,
        vCID,
        vBeneficiario,
        vSolicitante,
        vExecutor,
        vRecebedor,
        vLocalExecucao,
        vDataAtendimento,
        vCodigoPagamento,
        vTipoAutorizacao,
        '',
        'N',
        1, // quantidade sempre 1 para auxiliares
        vLocalAtendimento, //SMS 73963 - Marcelo Barbosa - 25/11/2006
        0);
      // valida o evento gravado.
      vgValidarPartindoDaGeracaoDeOutro := True;
      AlterarSAM_AUTORIZ_EVENTOGERADO(
        vHandleSAM_AUTORIZ_EVENTOGERADO,
        vEvento,
        vGrau,
        vCID,
        Sys.CurrentUser,
        vBeneficiario,
        vDV,
        vExecutor,
        vSolicitante,
        vRecebedor,
        vLocalExecucao,
        vDataAtendimento,
        vHoraAtendimento,
        vTipoAutorizacao,
        vFinalidadeAtendimento,
        vCondicaoAtendimento,
        vLocalAtendimento,
        vObjetivoTratamento,
        vRegimeTratamento,
        vTipoTratamento,
        vAcidentePessoal,
        'A',
        1, // quantidade sempre 1 para auxiliares
        nulo,
        vCodigoPagamento,
        vXTHM,
        iif (samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('CBOS').IsNull, 0 , samauto_AUTORIZ_EVENTOSOLICIT.FieldByName('CBOS').AsInteger),
        vDataAtendimento,
        SAM_PARAMETROSGERAIS.FieldByName('UTILIZAAUXILIO').AsString,
        '');
      vgValidarPartindoDaGeracaoDeOutro := False;

      // ao alterar o evento é fechada a SAM_AUTORIZ_EVENTOSOLICIT ... sim .. isso é uma gambiarra :(
      if not samauto_AUTORIZ_EVENTOSOLICIT.active then
      begin
        samauto_AUTORIZ_EVENTOSOLICIT.Close;
        samauto_AUTORIZ_EVENTOSOLICIT.ParamByName('HANDLE').Value := ALINHAR_AUXILIARES.FieldByName('EVENTOSOLICITADO').AsInteger;
        samauto_AUTORIZ_EVENTOSOLICIT.Open;
      end;

      ALINHAR_AUXILIARES.Next;
    end;
    ALINHAR_AUXILIARES_DATA.Next;
  end;
end;

procedure TDM.AlterarEquipeVia(pHandleOrigem: integer; pData: TDateTime);
begin
  //Gabriel - SMS:116702
  qHAutoriz.Close;
  qHAutoriz.ParamByName('HANDLE').AsInteger := pHandleOrigem;
  qHAutoriz.Open;
  sp_BSAut_IniciarEquipeVia.Close;
  sp_BSAut_IniciarEquipeVia.ParamByName('p_Autorizacao').AsInteger := qHAutoriz.FieldByName('AUTORIZACAO').AsInteger;
  sp_BSAut_IniciarEquipeVia.ParamByName('p_Data').AsDateTime := pData;
  sp_BSAut_IniciarEquipeVia.ExecProc;
end;

function TDM.ChecarMaximoDiasInternacao(pAutorizacao: integer; pQuantidade: integer): integer;
begin
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT MAX (TGE.DIASINTERNACAO) DIASINTERNACAO');
  Q.SQL.Add(' FROM SAM_AUTORIZ A,');
  Q.SQL.Add('      SAM_AUTORIZ_EVENTOSOLICIT ES,');
  Q.SQL.Add('      SAM_TGE TGE,');
  Q.SQL.Add('      SAM_GRAU GRAU');
  //Q.SQL.Add('      SAM_PRECOGENERICO_DOTAC PRE');
  Q.SQL.Add('WHERE A.HANDLE= :HANDLE');
  Q.SQL.Add('AND   ES.AUTORIZACAO=A.HANDLE');
  Q.SQL.Add('AND   TGE.HANDLE=ES.EVENTO');
  Q.SQL.Add('AND   ES.GRAU=GRAU.HANDLE');
  Q.SQL.Add('AND   TGE.CIRURGICO= ''S''');
  Q.SQL.Add('ORDER BY DIASINTERNACAO DESC');
  Q.ParamByName('HANDLE').Value := pAutorizacao;
  Q.Open;
  Result := q.FieldByName('DIASINTERNACAO').AsInteger;
end;

procedure TDM.MontaNegacaoInterno(pHandleOrigem,
  pNegacao: integer;
  pComplemento: WideString;
  pQtdAutorizada, pValorAutorizado: Currency);
var
  vSamMotivoNegacao: integer;
begin
  vSamMotivoNegacao := LerMotivoNegacao(pNegacao, -1, gLiberaPorAuxilio);
  if vSamMotivoNegacao <> nulo then
  begin
    New(RecNegacao);
    RecNegacao.Negacao := pNegacao;
    RecNegacao.HandleOrigem := pHandleOrigem;
    RecNegacao.Complemento := pComplemento;
    RecNegacao.SamMotivoNegacao := vSamMotivoNegacao;
    //Junior - 03/05/2000
    RecNegacao.QtdAutorizada := pQtdAutorizada;
    RecNegacao.QtdLiberadaAuxilio := -1;
    RecNegacao.LiberaPorAuxilio := gLiberaPorAuxilio;
    RecNegacao.ValorAutorizado := pValorAutorizado;
    vLstNegacao.Add(RecNegacao);
  end;
end;

procedure TDM.DMPrepare(pCurrentSystem: OleVariant);
begin
  qParamGeralAtendimento.Open;
  qParamGeralProc.Open;
  //  InitSys(pcurrentsystem, sys.CurrentSystem, sm, DM);

  qEventoGeradoContagem.SQL.Strings[19] := iif(Pos('SQL', string(Sys.SQLServer)) > 0, VERIFICACAOCAMPONULO_SQLSERVER, iif(Pos('DB2', string(Sys.SQLServer)) > 0, VERIFICACAOCAMPONULO_DB2, iif(Pos('ORA', string(Sys.SQLServer)) > 0, VERIFICACAOCAMPONULO_ORACLE, VERIFICACAOCAMPONULO_CACHE)));
  qEventoGeradoContagem.SQL.Strings[29] := iif(Pos('SQL', string(Sys.SQLServer)) > 0, VERIFICACAOCAMPONULO_SQLSERVER, iif(Pos('DB2', string(Sys.SQLServer)) > 0, VERIFICACAOCAMPONULO_DB2, iif(Pos('ORA', string(Sys.SQLServer)) > 0, VERIFICACAOCAMPONULO_ORACLE, VERIFICACAOCAMPONULO_CACHE)));
  qEventoGeradoContagem.SQL.Strings[39] := iif(Pos('SQL', string(Sys.SQLServer)) > 0, VERIFICACAOCAMPONULO_SQLSERVER, iif(Pos('DB2', string(Sys.SQLServer)) > 0, VERIFICACAOCAMPONULO_DB2, iif(Pos('ORA', string(Sys.SQLServer)) > 0, VERIFICACAOCAMPONULO_ORACLE, VERIFICACAOCAMPONULO_CACHE)));

  qEventoGeradoContagem.SQL.Strings[21] := iif(Pos('SQL', string(Sys.SQLServer)) > 0, EVENTOGERADO_SQLSERVER, iif(Pos('DB2', string(Sys.SQLServer)) > 0, EVENTOGERADO_DB2, iif(Pos('ORA', string(Sys.SQLServer)) > 0, EVENTOGERADO_ORACLE, EVENTOGERADO_CACHE)));
  qEventoGeradoContagem.SQL.Strings[31] := iif(Pos('SQL', string(Sys.SQLServer)) > 0, EVENTOGERADO_SQLSERVER, iif(Pos('DB2', string(Sys.SQLServer)) > 0, EVENTOGERADO_DB2, iif(Pos('ORA', string(Sys.SQLServer)) > 0, EVENTOGERADO_ORACLE, EVENTOGERADO_CACHE)));
  qEventoGeradoContagem.SQL.Strings[41] := iif(Pos('SQL', string(Sys.SQLServer)) > 0, EVENTOGERADO_SQLSERVER, iif(Pos('DB2', string(Sys.SQLServer)) > 0, EVENTOGERADO_DB2, iif(Pos('ORA', string(Sys.SQLServer)) > 0, EVENTOGERADO_ORACLE, EVENTOGERADO_CACHE)));
  
end;

function TDM.PegaPreco(pEvento, pGrau, pBeneficiario, pRecebedor, pLocalExecucao: OleVariant; pQuantidade: Double;
  pData: TDateTime; pCodPagto, pXthm, pAcomodacao, LA, RA, CA, OT, TT, FA: OleVariant; pCBOS:Integer; pHoraAtendimento: TDateTime; pHorarioEspecial : boolean;
  var pValorPrimeira, pValorSegunda, pValorDemais: Double) : Double;
var
  vRedeRestrita, vAcomodacaoVariant, vxthm, vCodPagto: Variant;
  vAuxOrigem: string;
  vMunicPagto: OleVariant;
  vEstadoPagto: OleVariant;
  vFilialPadrao: OleVariant;
  vDLLEspecifico: Olevariant;
begin
  try
    if (RECEBEDOR.active) and (RECEBEDOR.FieldByname('HANDLE').AsInteger > 0) then
    begin
      vMunicPagto := RECEBEDOR.FieldByName('MUNICIPIOPAGAMENTO').AsInteger; // Eduardo - 11/11/2003 - SMS 20838 - Corrigindo erro: Invalid variant type conversion, trocado Value por AsInteger
      vEstadoPagto := RECEBEDOR.FieldByName('ESTADOPAGAMENTO').AsInteger; // Eduardo - 11/11/2003 - SMS 20838 - Corrigindo erro: Invalid variant type conversion, trocado Value por AsInteger
      vFilialPadrao := RECEBEDOR.FieldByName('FILIALPADRAO').AsInteger;
    end
    else
    begin
      // Bacen utiliza uma busca de preço configurada no tipo de autorização
      // caso não seja bacen sempre a variável estado e municipio voltarão nulas
      vDLLEspecifico := AbrirDLL(Sys, 'ESPECIFICO.UEspecifico');
      vDLLEspecifico.BCB_ATE_BuscaEstadoMunicipioPagamento(Sys, iif(pBeneficiario = null, 0, pBeneficiario), LA, g_HandleTipoAutorizacao, Sys.CurrentUSer, vMunicPagto, vEstadoPagto);
    end;

    vAcomodacaoVariant := null;
    if pXTHM = 0 then
    begin
      vXTHM := null;
      if pAcomodacao > 0 then
        vAcomodacaoVariant := pAcomodacao
      else
        vAcomodacaoVariant := null;
      //fim sms 56253
    end
    else
      vxthm := pXTHM;

    if (pCodPagto = null) or (pCodPagto = 0) then
    begin
      if not SAM_PARAMETROSGERAIS.Active then
        SAM_PARAMETROSGERAIS.Open;
      vCodPagto := SAM_PARAMETROSGERAIS.FieldByName('CODIGOPAGTO').AsInteger;
    end
    else
      vCodPagto := pCodPagto;

    if vgRedeRestrita > 0 then
      vRedeRestrita := vgRedeRestrita
    else
      vRedeRestrita := -1;

    vAuxOrigem := vgOrigemdoProcesso;
    vgOLEPeg.PegaPreco(Sys.CurrentSystem,
      pEvento,
      pGrau,
      pBeneficiario,
      precebedor,
      plocalexecucao, // LocalExecucao
      vFilialPadrao,
      vMunicPagto,
      vEstadoPagto,
      null, // convênio
      pData,
      vCodPagto,
      1, // vQtdAutorizada,
      vXTHM,
      vAcomodacaoVariant,
      LA,
      RA,
      CA,
      OT,
      TT,
      FA,
      vRedeRestrita, //Rede restrita do módulo que deu cobertura.
      pCBOS,
      pHoraAtendimento,
      pHorarioEspecial,
      pValorPrimeira,
      pValorSegunda,
      pValorDemais);

    if pQuantidade > 2 then
      Result := pValorPrimeira + pValorSegunda + (pValorDemais * (pQuantidade - 2))
    else if pQuantidade > 1 then
      Result := pValorPrimeira + (pValorDemais * (pQuantidade - 1))
    else
      Result := pValorPrimeira;

  finally
    vgOrigemdoProcesso := vAuxOrigem;
  end;
end;

procedure TDM.RecalcularPFaoRevalidar(
  pHandleOrigem,
  pEvento,
  pGrau,
  pBeneficiario,
  pRecebedor: Integer;

  pData: TDateTime;

  pQuantidade: Currency;

  pCodigoPagto,
  pXTHM: Integer;

  pValorPrimeira,
  pValorSegunda,
  pValorDemais: Double
  );

var

  vDll: OleVariant;

  vAux: Currency;

  vPercPF,
    vAcomodacaoVariant: Variant;

  vParcelamento,
    vFinanciamento,
    vContagemPF,
    vsGrauOrigemValor,
    vAuxOrigem,
    vProcuraVariavel,
    vsSituacao: string;

  vPermiteFaturarPFAut: Boolean;

  vPFINformado,
    vParamTabPF,
    vTabPF,
    vContrato,
    vMunicipio,
    vBeneficiario,
    vMunicPagto,
    vEstadoPagto,
    vCodPagto,
    vXTHM,
    vQtdAutorizada,
    vRedeRestrita,
    vTipoTratamento,
    vObjetivoTratamento,
    vLocalAtendimento,
    vRegimeAtendimento,
    vCondicaoAtendimento,
    vFinalidadeAtendimento: Integer;

  vValorHonorario,
    vValorCustoOperacional,
    vValorFilme,
    vPercAdmContrato,
    vfVlrRepasseAdm,
    vfVlrRepasseINSS,
    vVALORTOTAL,
    vrVALORBASEPF,
    vrBASEBONIFICACAO: Double;

  vVALORFRQBENEFICIARIO,
    vVALORFRQCONTRATO,
    vVALORFRQOPERADORA,
    vVALORSUPPFBENEF,
    vVALORSUPPFOPERADORA: Double;

  vContratoPFEvento : Integer;

begin
  vAuxOrigem := vgOrigemdoProcesso;
  // Rodrigo - 16/10/2003 - sms 14646 - Recalcular PF ao revalidar eventos
  LerRecebedor(pRecebedor);

  // Eduardo - 09/12/2003 - SMS 21255
  // Analisando a origem do grau informado no evento gerado
  q.Close;
  q.SQL.Clear;
  q.SQL.Add('SELECT ORIGEMVALOR     ');
  q.SQL.Add('  FROM SAM_GRAU        ');
  q.SQL.Add(' WHERE HANDLE = :HANDLE');
  q.ParamByName('HANDLE').AsInteger := pGrau;
  q.Open;
  vsGrauOrigemValor := q.FieldByName('ORIGEMVALOR').AsString;
  // fim SMS 21255

  q.Close;
  q.SQL.Clear;
  q.SQL.Add('SELECT QTDAUTORIZADA, BASECALCULOPF, SITUACAO FROM SAM_AUTORIZ_EVENTOGERADO WHERE HANDLE = :HANDLE');
  q.ParamByName('HANDLE').Value := pHandleOrigem;
  q.Open;

  vQtdAutorizada := Q.FieldByName('QTDAUTORIZADA').Value;
  vsSituacao := Q.FieldByName('SITUACAO').AsString;

  // Eduardo - 09/12/2003 - SMS 21255
  // Verifica se a origem do grau informado é valor informado
  if vsGrauOrigemValor = '6' then
    vrVALORBASEPF := q.FieldByName('BASECALCULOPF').AsFloat; // Atribuindo Valor base PF informado
  // fim SMS 21255

  q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT A.BENEFICIARIO,');
  Q.SQL.Add('       A.LOCALATENDIMENTO, A.REGIMEATENDIMENTO,');
  Q.SQL.Add('       A.CONDICAOATENDIMENTO, A.OBJETIVOTRATAMENTO,');
  Q.SQL.Add('       A.TIPOTRATAMENTO, FINALIDADEATENDIMENTO');
  Q.SQL.Add('  FROM SAM_AUTORIZ A');
  Q.SQL.Add('WHERE  A.HANDLE = (SELECT AUTORIZACAO FROM SAM_AUTORIZ_EVENTOGERADO WHERE HANDLE = :HANDLE)');
  Q.ParamByName('HANDLE').Value := pHandleOrigem;
  Q.Open;

  //aqui pegava o preco

  if pXTHM > 0 then
  begin
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT P.CODIGOXTHM, G.XTHM SUPORTAXTHM, X.XTHM');
    Q.SQL.Add('  FROM SAM_PARAMETROSPROCCONTAS P, SAM_GRAU G, SAM_XTHM X');
    Q.SQL.Add(' WHERE X.HANDLE = P.CODIGOXTHM AND G.HANDLE = :HGRAU');
    Q.ParamByName('HGRAU').Value := pGrau;
    Q.Open;
    if Q.FieldByName('SUPORTAXTHM').AsString = 'N' then
    begin
      if Q.FieldByName('CODIGOXTHM').AsInteger <> pXTHM then
      begin
        //vSuportXTHM := false
        q.SQL.Clear;
        q.Close;
        q.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO SET XTHMINFORMADO = NULL WHERE HANDLE = :HANDLE');
        q.ParamByName('HANDLE').Value := pHandleOrigem;
        q.ExecSql;
      end
    end;
  end;

  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT A.HANDLE HANDLEAUTORIZACAO, C.PERMITEFATURARPFAUTORIZACAO, T.TABCOBRANCAPF, B.CONTRATO,         ');
  Q.SQL.Add('       A.BENEFICIARIO, B.DATAADESAO, B.FAMILIA, A.LOCALATENDIMENTO, A.REGIMEATENDIMENTO,               ');
  Q.SQL.Add('       A.TIPOTRATAMENTO, A.OBJETIVOTRATAMENTO, A.FINALIDADEATENDIMENTO, A.CONDICAOATENDIMENTO          ');
  Q.SQL.Add('  FROM SAM_AUTORIZ A, SAM_TIPOAUTORIZ T, SAM_BENEFICIARIO B, SAM_CONTRATO C                            ');
  Q.SQL.Add(' WHERE C.HANDLE = B.CONTRATO AND T.HANDLE = A.TIPOAUTORIZACAO AND B.HANDLE = A.BENEFICIARIO            ');
  Q.SQL.Add('   AND A.HANDLE = (SELECT AUTORIZACAO FROM SAM_AUTORIZ_EVENTOGERADO WHERE HANDLE = :HANDLE)            ');
  Q.ParamByName('HANDLE').Value := pHandleOrigem;
  Q.Open;

  // 27/02-2003- juliana alterado para problemas no orçamento (processamento de contas evento com valor 0)
  vAux := -1;

  if pQuantidade > 2 then
    vValorTotal := pValorPrimeira + pValorSegunda + (pValorDemais * (pQuantidade - 2))
  else if pQuantidade > 1 then
    vValorTotal := pValorPrimeira + (pValorDemais * (pQuantidade - 1))
  else
    vValorTotal := pValorPrimeira;

  if not SAM_PARAMETROSBENEFICIARIO.Active then
    SAM_PARAMETROSBENEFICIARIO.Open;

  vContrato := Q.FieldByName('CONTRATO').AsInteger;
  vMunicipio := 0;

  vTipoTratamento := Q.FieldByName('TIPOTRATAMENTO').AsInteger;
  vObjetivoTratamento := Q.FieldByName('OBJETIVOTRATAMENTO').AsInteger;
  vLocalAtendimento := Q.FieldByName('LOCALATENDIMENTO').AsInteger;
  vRegimeAtendimento := Q.FieldByName('REGIMEATENDIMENTO').AsInteger;
  vCondicaoAtendimento := Q.FieldByName('CONDICAOATENDIMENTO').AsInteger;
  vFinalidadeAtendimento := Q.FieldByName('FINALIDADEATENDIMENTO').AsInteger;
  vPermiteFaturarPFAut := (Q.FieldByName('PERMITEFATURARPFAUTORIZACAO').AsString = 'S') or (SAM_PARAMETROSBENEFICIARIO.FieldByName('LOCALCALCULOPF').AsString = '2');

  vCodPagto := iif(pCodigoPagto <= 0, qparamGeralProc.FieldByName('CODIGOPAGTO').AsInteger, pCodigoPagto);
  vXTHM := iif(pCodigoPagto <= 0, qparamGeralProc.FieldByName('CODIGOXTHM').AsInteger, pXTHM);
  //vProcuraVariavel := iif(Q.FieldByName('TABCOBRANCAPF').asInteger = 1, 'S', 'N');
  vProcuraVariavel := 'S'; // Bruno SMS : 47685

  //  auxOrigem := vgOrigemdoProcesso;
  try
    //vgOlePeg.Inicializar(Sys.CurrentSystem);
    // diferenciação se o código de pagamento estiver ou não nulo.
    // Eduardo - 09/12/2003 - SMS 21255
    // Verifica se a origem do grau informado NÃO É valor informado
    if (vsGrauOrigemValor <> '6') then
    begin
      sp_ValorBasePF.Close;
      sp_ValorBasePF.ParamByName('P_VALORPAGO').AsFloat := -1;
      sp_ValorBasePF.ParamByName('P_DESCONTOCASCATA').AsFloat := 0;
      sp_ValorBasePF.ParamByName('P_EVENTO').AsInteger := pEvento;
      sp_ValorBasePF.ParamByName('P_GRAU').AsInteger := pGrau;
      sp_ValorBasePF.ParamByName('P_CONTRATO').AsInteger := vContrato;
      sp_ValorBasePF.ParamByName('P_RECEBEDOR').AsInteger := pRecebedor;
      sp_ValorBasePF.ParamByName('P_DATA').AsDateTime := pData;
      sp_ValorBasePF.ParamByName('P_QTD').AsFloat := vQtdAutorizada;
      sp_ValorBasePF.ParamByName('P_CODIGOPAGTO').AsInteger := vCodPagto;
      sp_ValorBasePF.ParamByName('P_XTHM').AsFloat := 1; //vXTHM;
      sp_ValorBasePF.ParamByName('P_PLANO').AsInteger := vgPlanoQueDeuCobertura;
      sp_ValorBasePF.ParamByName('P_ADICIONALHE').AsInteger := 0;
      sp_ValorBasePF.ParamByName('P_LOCALATENDIMENTO').AsInteger := vLocalAtendimento;
      sp_ValorBasePF.ParamByName('P_BENEFICIARIO').AsInteger := pBeneficiario;
      sp_ValorBasePF.ParamByName('P_MUNICIPIO').AsInteger := vMunicipio;
      sp_ValorBasePF.ExecProc;

      // Retornando parâmetros
      vrVALORBASEPF := sp_ValorBasePF.ParamByName('P_BASEPF').AsFloat;
      vrBASEBONIFICACAO := sp_ValorBasePF.ParamByName('P_BASEBONIFICACAO').AsFloat;
      vValorHonorario := sp_ValorBasePF.ParamByName('P_VALORHONORARIO').AsFloat;
      vValorCustoOperacional := sp_ValorBasePF.ParamByName('P_VALORCUSTOOPERACIONAL').AsFloat;
      vValorFilme := sp_ValorBasePF.ParamByName('P_VALORFILME').AsFloat;
      vPercAdmContrato := sp_ValorBasePF.ParamByName('P_PERCADMCONTRATO').AsFloat;
      vfVlrRepasseAdm := sp_ValorBasePF.ParamByName('P_VLRREPASSEADM').AsFloat;
      vfVlrRepasseINSS := sp_ValorBasePF.ParamByName('P_VLRREPASSEINSS').AsFloat;
      //sp_ValorBasePF.ParamByName('P_ACRESCIMOUI').AsFloat;

    end;
    // fim SMS 21255
  finally
    //vgOlePeg.Finalizar; // Rodrigo --> Liberar a memória utilizada
    vDLL := AbrirDll(Sys.CurrentSystem, 'SamAuto.Autorizador');
    vDLL.Inicializar(Sys.CurrentSystem, vAuxOrigem);
    vgOrigemdoProcesso := vAuxOrigem;
    vDll.finalizar;
  end;

  if (vrVALORBASEPF < 0) then
    vrVALORBASEPF := vValorTotal;
  if (vrVALORBASEPF < 0) then
    vrVALORBASEPF := 0;

  // 27/02-2003- juliana alterado para problemas no orçamento (processamento de contas evento com valor 0)
  qAux2.Close;
  qAux2.SQL.Clear;
  qAux2.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO');
  qAux2.SQL.Add('   SET BASECALCULOPF = :BASE, VALORUNITARIOCALCULADO=:VALORUNITARIOCALCULADO,');
  qAux2.SQL.Add('   VALORAUTORIZADO=:VALORAUTORIZADO,   ');
  qAux2.SQL.Add('   VLRREPASSEADM = :VLRREPASSEADM,     '); //sms 4567
  qAux2.SQL.Add('   VLRREPASSEINSS = :VLRREPASSEINSS    '); //sms 4567
  qAux2.SQL.Add(' WHERE HANDLE = :HANDLE        ');
  qAux2.ParamByName('VALORAUTORIZADO').AsFloat := vValorTotal;
  qAux2.ParamByName('VALORUNITARIOCALCULADO').AsFloat := Arredonda(pValorPrimeira, 2);
  qAux2.ParamByName('VLRREPASSEADM').AsFloat := Arredonda(vfVlrRepasseAdm, 2); //sms 4567
  qAux2.ParamByName('VLRREPASSEINSS').AsFloat := Arredonda(vfVlrRepasseINSS, 2); //sms 4567

  if vrVALORBASEPF = -1 then
  begin
    qAux2.ParamByName('BASE').DataType := ftFloat;
    qAux2.ParamByName('BASE').clear;
  end
  else
    qAux2.ParamByName('BASE').AsFloat := Arredonda(vrVALORBASEPF, 2); // Eduardo - 13/11/2003 - SMS 20838 - Trocado Value para AsFloat, arrumando erro: Capability not supported

  qAux2.ParamByName('HANDLE').AsInteger := pHandleOrigem; // Eduardo - 13/11/2003 - SMS 20838 - Trocado Value para AsInteger, arrumando erro: Capability not supported
  qAux2.ExecSql;

  qAux2.Close;
  qAux2.SQL.Clear;
  qAux2.SQL.Add('SELECT PFINFORMADO, BASECALCULOPF FROM SAM_AUTORIZ_EVENTOGERADO WHERE HANDLE = :HANDLE');
  qAux2.ParamByName('HANDLE').Value := pHandleOrigem;
  qAux2.Open;

  if qAux2.FieldByName('PFINFORMADO').isnull then
  begin
    if (vPermiteFaturarPFAut) then
    begin
      //      auxOrigem := vgOrigemdoProcesso;
      try
        //vgOlePeg.Inicializar(Sys.CurrentSystem);

        sp_PercentualPF.Close;
        sp_PercentualPF.ParamByName('P_EVENTO').AsInteger := pEvento;
        sp_PercentualPF.ParamByName('P_GRAU').AsInteger := pGrau;
        sp_PercentualPF.ParamByName('P_RECEBEDOR').AsInteger := pRecebedor;
        sp_PercentualPF.ParamByName('P_DATA').AsDateTime := pData;
        sp_PercentualPF.ParamByName('P_QUANTIDADE').AsFloat := vQtdAutorizada;
        sp_PercentualPF.ParamByName('P_VALOR').AsFloat := vrVALORBASEPF;
        sp_PercentualPF.ParamByName('P_BENEFICIARIO').AsInteger := pBeneficiario;
        sp_PercentualPF.ParamByName('P_GUIAEVENTO').Clear;
        sp_PercentualPF.ParamByName('P_EVENTOGERADO').AsInteger := pHandleOrigem;
        sp_PercentualPF.ParamByName('P_LOCALATENDIMENTO').AsInteger := vLocalAtendimento;
        sp_PercentualPF.ParamByName('P_REGIMEATENDIMENTO').AsInteger := vRegimeAtendimento;
        sp_PercentualPF.ParamByName('P_CONDICAOATENDIMENTO').AsInteger := vCondicaoAtendimento;
        sp_PercentualPF.ParamByName('P_TIPOTRATAMENTO').AsInteger := vTipoTratamento;
        sp_PercentualPF.ParamByName('P_OBJETIVOTRATAMENTO').AsInteger := vObjetivoTratamento;
        sp_PercentualPF.ParamByName('P_FINALIDADEATENDIMENTO').AsInteger := vFinalidadeAtendimento;
        sp_PercentualPF.ParamByName('P_CONSIDERASUJEITOLIMITE').AsString := vProcuraVariavel;
        sp_PercentualPF.ParamByName('P_PLANO').AsInteger := vgPlanoQueDeuCobertura;
        sp_PercentualPF.ParamByName('P_BASECALCULOPF').asFloat := qAux2.FieldByName('BASECALCULOPF').AsFloat /
          iif(vQtdAutorizada > 0, vQtdAutorizada, 1); // Dias 22/06/2004 sms 27565
        sp_PercentualPF.ParamByName('P_EXECUTOR').AsInteger := 0;
        sp_PercentualPF.ExecProc;

        vPercPF := sp_PercentualPF.ParamByName('P_PERCENTUALPF').AsFLoat;
        vContagemPF := sp_PercentualPF.ParamByName('P_CONTAGEMPF').AsString;
        vParcelamento := sp_PercentualPF.ParamByName('P_PARCELAMENTO').AsString;
        vFinanciamento := sp_PercentualPF.ParamByName('P_FINANCIAMENTO').AsString;
        vContratoPFEvento := sp_PercentualPF.ParamByName('P_CONTRATOPFEVENTO').AsInteger;

      finally
        //vgOlePeg.Finalizar; // rodrigo --> liberar a memória
        vDLL := AbrirDll(Sys.CurrentSystem, 'SamAuto.Autorizador');
        vAuxOrigem := vgOrigemdoProcesso;
        vDLL.Inicializar(Sys.CurrentSystem, vAuxOrigem);
        vgOrigemdoProcesso := vAuxOrigem;
        vDll.finalizar;
      end;

      // Bruno SMS : 47685
      //   + Armazena os dados da contagem do evento
      if (Trim(vContagemPF) <> '') then
      begin
        q.Close;
        q.SQL.Clear;
        q.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO SET CONTAGEMPF = :pCONTAGEMPF WHERE HANDLE = :pEVENTOFERADO');
        q.ParamByName('pEVENTOFERADO').AsInteger := pHandleOrigem;
        q.ParamByName('pCONTAGEMPF').AsString := Trim(vContagemPF); // Armazena a contagem desse evento gerado para que a mesma seja feita quando o mesmo estiver autorizado
        q.ExecSql;
      end;

      // Eduardo - 12/12/2003 - SMS 21255
      // Verifica se a origem do grau informado NÃO É valor informado
      q.Close;
      q.SQL.Clear;
      if (vsGrauOrigemValor <> '6') and (vPercPF <> null) then
      begin
        //fernando sms 22960
        //RETORNO
        //Se existir valor de franquia de urgência e emergência, a PF será este valor, distribuindo segundo as regras da franquia para o beneficiário,
        //   contrato e operadora. Estes valores devem ser gravados no evento gerado, respectivamente nos campos:
        //  -	VALORFRQBENEFICIARIO
        //  -	VALORFRQCONTRATO
        //  -	VALORFRQOPERADORA
        //Caso se tenha apenas a suplementação de PF, os valores do beneficiário e operadora serão gravados respectivamente em:
        //  -	VALORSUPPFBENEF
        //  -	VALORSUPPFOPERADORA
        sp_SuplementacaoNaAutorizacao.Close;
        sp_SuplementacaoNaAutorizacao.ParamByName('P_HANDLEEVENTOGERADO').AsInteger := pHandleOrigem;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_Beneficiario').AsInteger := pBeneficiario;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_evento').AsInteger := pEvento;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_Grau').AsInteger := pGrau;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_FinalidadeAtendimento').AsInteger := vFinalidadeAtendimento;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_CondicaoAtendimento').AsInteger := vCondicaoAtendimento;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_LocalAtendimento').AsInteger := vLocalAtendimento;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_ObjetivoTratamento').AsInteger := vObjetivoTratamento;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_RegimeAtendimento').AsInteger := vRegimeAtendimento;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_TipoTratamento').AsInteger := vTipoTratamento;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_DataAtendimento').AsDatetime := pData;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_valorbasepf').AsFloat := vrVALORBASEPF;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_valorpf').AsFloat := EspecificoDll.PRO_VerificaLimiteMaximoPF(Sys.CurrentSystem,vContratoPFEvento, Arredonda((vrVALORBASEPF * vPercPF) / 100, 2));
        sp_SuplementacaoNaAutorizacao.ParamByName('v_qtdeapresentada').AsInteger := vQtdAutorizada;
        sp_SuplementacaoNaAutorizacao.execproc;

        vVALORFRQBENEFICIARIO := sp_SuplementacaoNaAutorizacao.ParamByName('p_VALORFRQBENEFICIARIO').AsFLoat;
        vVALORFRQCONTRATO := sp_SuplementacaoNaAutorizacao.ParamByName('p_VALORFRQCONTRATO').AsFLoat;
        vVALORFRQOPERADORA := sp_SuplementacaoNaAutorizacao.ParamByName('p_VALORFRQOPERADORA').AsFLoat;
        vVALORSUPPFBENEF := sp_SuplementacaoNaAutorizacao.ParamByName('p_VALORSUPPFBENEF').AsFLoat;
        vVALORSUPPFOPERADORA := sp_SuplementacaoNaAutorizacao.ParamByName('p_VALORSUPPFOPERADORA').AsFLoat;

        vVALORFRQBENEFICIARIO := abs(vVALORFRQBENEFICIARIO);
        vVALORFRQCONTRATO := abs(vVALORFRQCONTRATO);
        vVALORFRQOPERADORA := abs(vVALORFRQOPERADORA);
        vVALORSUPPFBENEF := abs(vVALORSUPPFBENEF);
        vVALORSUPPFOPERADORA := abs(vVALORSUPPFOPERADORA);

        q.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO                      ');
        q.SQL.Add('   SET VALORCALCPF          = :pVALOR,               ');
        q.SQL.Add('       VALORFRQBENEFICIARIO = :VALORFRQBENEFICIARIO, ');
        q.SQL.Add('       VALORFRQOPERADORA    = :VALORFRQOPERADORA,    ');
        q.SQL.Add('       VALORFRQCONTRATO     = :VALORFRQCONTRATO,     ');
        q.SQL.Add('       VALORSUPPFOPERADORA  = :VALORSUPPFOPERADORA,  ');
        q.SQL.Add('       VALORSUPPFBENEF      = :VALORSUPPFBENEF       ');
        q.SQL.Add(' WHERE HANDLE = :pHANDLE                             ');

        //fernando
        //preencher todos os campos , mesmo tendo valores zerados.
        if vVALORFRQBENEFICIARIO > 0 then
          q.ParamByName('VALORFRQBENEFICIARIO').Value := vVALORFRQBENEFICIARIO
        else
          q.ParamByName('VALORFRQBENEFICIARIO').Value := 0;

        if vVALORFRQOPERADORA > 0 then
          q.ParamByName('VALORFRQOPERADORA').Value := vVALORFRQOPERADORA
        else
          q.ParamByName('VALORFRQOPERADORA').Value := 0;

        if vVALORFRQCONTRATO > 0 then
          q.ParamByName('VALORFRQCONTRATO').Value := vVALORFRQCONTRATO
        else
          q.ParamByName('VALORFRQCONTRATO').Value := 0;

        if vVALORSUPPFOPERADORA > 0 then
          q.ParamByName('VALORSUPPFOPERADORA').Value := vVALORSUPPFOPERADORA
        else
          q.ParamByName('VALORSUPPFOPERADORA').Value := 0;

        if vVALORSUPPFBENEF > 0 then
          q.ParamByName('VALORSUPPFBENEF').Value := vVALORSUPPFBENEF
        else
          q.ParamByName('VALORSUPPFBENEF').Value := 0;

        q.ParamByName('pVALOR').Value := EspecificoDll.PRO_VerificaLimiteMaximoPF(Sys.CurrentSystem,vContratoPFEvento, Arredonda(vrVALORBASEPF * Double(vPercPF) / 100, 3));
      end
      else
        q.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO SET VALORCALCPF = NULL WHERE HANDLE = :pHANDLE');

      q.ParamByName('pHANDLE').Value := pHandleOrigem;
      q.ExecSql;
      // fim SMS 21255
    end
    else // NÃO informou PF e PERMITEFATURARPFAUTORIZACAO = 'N'
    begin
      q.Close;
      q.SQL.Clear;
      q.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO SET VALORCALCPF = NULL WHERE HANDLE = :HANDLE');
      q.ParamByName('HANDLE').Value := pHandleOrigem;
      q.ExecSql;
      //      INSEVENTOGERADO.ParamByName('VALORCALCPF').Clear;
    end;
  end
  else // informou PF
  begin
    if (vPermiteFaturarPFAut) then
    begin
      vPercPF := ValordaPF2(qAux2.FieldByName('PFINFORMADO').AsInteger, precebedor, pBeneficiario);
      //      INSEVENTOGERADO.ParamByName('VALORCALCPF').Value := Arredonda(vrVALORBASEPF * vPercPF / 100, 2);
      // Eduardo - 12/12/2003 - SMS 21255
      // Verifica se a origem do grau informado NÃO É valor informado
      if vsGrauOrigemValor <> '6' then
      begin
        //Fernando
        sp_SuplementacaoNaAutorizacao.Close;
        sp_SuplementacaoNaAutorizacao.ParamByName('P_HANDLEEVENTOGERADO').AsInteger := pHandleOrigem;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_Beneficiario').AsInteger := pBeneficiario;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_evento').AsInteger := pEvento;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_Grau').AsInteger := pGrau;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_FinalidadeAtendimento').AsInteger := vFinalidadeAtendimento;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_CondicaoAtendimento').AsInteger := vCondicaoAtendimento;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_LocalAtendimento').AsInteger := vLocalAtendimento;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_ObjetivoTratamento').AsInteger := vObjetivoTratamento;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_RegimeAtendimento').AsInteger := vRegimeAtendimento;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_TipoTratamento').AsInteger := vTipoTratamento;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_DataAtendimento').AsDatetime := pData;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_valorbasepf').AsFloat := vrVALORBASEPF;
        sp_SuplementacaoNaAutorizacao.ParamByName('v_valorpf').AsFloat := Arredonda(vrVALORBASEPF * Double(vPercPF) / 100, 2);
        sp_SuplementacaoNaAutorizacao.ParamByName('v_qtdeapresentada').AsInteger := vQtdAutorizada;
        sp_SuplementacaoNaAutorizacao.execproc;

        vVALORFRQBENEFICIARIO := sp_SuplementacaoNaAutorizacao.ParamByName('p_VALORFRQBENEFICIARIO').AsFLoat;
        vVALORFRQCONTRATO := sp_SuplementacaoNaAutorizacao.ParamByName('p_VALORFRQCONTRATO').AsFLoat;
        vVALORFRQOPERADORA := sp_SuplementacaoNaAutorizacao.ParamByName('p_VALORFRQOPERADORA').AsFLoat;
        vVALORSUPPFBENEF := sp_SuplementacaoNaAutorizacao.ParamByName('p_VALORSUPPFBENEF').AsFLoat;
        vVALORSUPPFOPERADORA := sp_SuplementacaoNaAutorizacao.ParamByName('p_VALORSUPPFOPERADORA').AsFLoat;

        q.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO                      ');
        q.SQL.Add('   SET VALORCALCPF          = :pVALOR,               ');
        q.SQL.Add('       VALORFRQBENEFICIARIO = :VALORFRQBENEFICIARIO, ');
        q.SQL.Add('       VALORFRQOPERADORA    = :VALORFRQOPERADORA,    ');
        q.SQL.Add('       VALORSUPPFOPERADORA  = :VALORSUPPFOPERADORA,  ');
        q.SQL.Add('       VALORSUPPFBENEF      = :VALORSUPPFBENEF       ');
        q.SQL.Add(' WHERE HANDLE = :pHANDLE                             ');

        //fernando
        //preencher todos os campos , mesmo tendo valores zerados.
        if vVALORFRQBENEFICIARIO > 0 then
          q.ParamByName('VALORFRQBENEFICIARIO').Value := vVALORFRQBENEFICIARIO
        else
          q.ParamByName('VALORFRQBENEFICIARIO').Value := 0;

        if vVALORFRQOPERADORA > 0 then
          q.ParamByName('VALORFRQOPERADORA').Value := vVALORFRQOPERADORA
        else
          q.ParamByName('VALORFRQOPERADORA').Value := 0;

        if vVALORSUPPFOPERADORA > 0 then
          q.ParamByName('VALORSUPPFOPERADORA').Value := vVALORSUPPFOPERADORA
        else
          q.ParamByName('VALORSUPPFOPERADORA').Value := 0;

        if vVALORSUPPFBENEF > 0 then
          q.ParamByName('VALORSUPPFBENEF').Value := vVALORSUPPFBENEF
        else
          q.ParamByName('VALORSUPPFBENEF').Value := 0;

        q.ParamByName('pVALOR').Value := Arredonda(vrVALORBASEPF * Double(vPercPF) / 100, 3); //SMS 72519 - Marcelo Barbosa - 02/02/2007

      end;
      // fim SMS 21255
    end
    else // informou PF e PERMITEFATURARPFAUTORIZACAO = 'N'
    begin
      q.SQL.Clear;
      q.Close;
      q.SQL.Add('UPDATE SAM_AUTORIZ_EVENTOGERADO SET VALORCALCPF = NULL WHERE HANDLE = :HANDLE');
      q.ParamByName('HANDLE').Value := pHandleOrigem;
      q.ExecSql;
    end;
    // Fim 14656
  end;
end;

function TDM.VerificaPrestadorIsentoAutorizacao(piHandleOrigem,
  piRecebedor, piEvento, piRegimeAtendimento: integer): boolean;
begin
  sp_VerificaPrestadorIsento.Close;
  sp_VerificaPrestadorIsento.ParamByName('P_RECEBEDOR').AsInteger := piRecebedor;
  sp_VerificaPrestadorIsento.ParamByName('P_EVENTO').AsInteger := piEvento;
  sp_VerificaPrestadorIsento.ParamByName('P_REGIMEATENDIMENTO').AsInteger := piRegimeAtendimento;
  sp_VerificaPrestadorIsento.ExecProc;

  if sp_VerificaPrestadorIsento.ParamByName('P_ISENTA').AsString = 'S' then
    Result := True
  else if sp_VerificaPrestadorIsento.ParamByName('P_ISENTA').AsString = 'I' then
    Result := True
  else
  begin
    q.Close;
    q.sql.Clear;
    q.Sql.Add('SELECT A.AUTORIZACAO ');
    q.Sql.Add('  FROM SAM_GUIA_EVENTOS B');
    q.Sql.Add('  JOIN SAM_GUIA A ON (B.GUIA = A.HANDLE)');
    Q.SQL.ADD(' WHERE B.HANDLE = :HANDLE');
    q.parambyname('HANDLE').AsInteger := piHandleOrigem;
    q.Open;

    if Q.FieldByName('AUTORIZACAO').isNull then
      Result := False // se não tem autorização na guia, deve dar a negação
    else
      Result := True;
  end;
end;

procedure TDM.BSAut_4250(pEvento, pCid: integer);
var
  vComplemento: string;
begin
  Q.Close;
  q.Sql.Clear;
  q.Sql.Add('SELECT COUNT(1) QTD FROM SAM_CID_EVENTO WHERE EVENTO = :EVENTO');
  q.paramByName('EVENTO').AsInteger := pEvento;
  q.Open;

  if (q.FieldByName('QTD').AsInteger > 0) and (pCid > 0) then
  begin
    Q.Close;
    q.Sql.Clear;
    q.Sql.Add('SELECT COUNT(1) QTD FROM SAM_CID_EVENTO WHERE CID = :CID AND EVENTO = :EVENTO');
    q.parambyname('CID').AsInteger := pCid;
    q.paramByName('EVENTO').AsInteger := pEvento;
    q.Open;

    if q.FieldByName('QTD').AsInteger = 0 then
    begin
      q.Close;
      q.Sql.Clear;
      q.Sql.Add('SELECT A.ESTRUTURA, A.DESCRICAO FROM SAM_CID A');
      q.Sql.Add('  JOIN SAM_CID_EVENTO B ON (B.CID = A.HANDLE) ');
      q.SQL.Add(' WHERE B.EVENTO = :EVENTO');
      q.ParamByName('EVENTO').AsInteger := pEvento;
      q.Open;
      vComplemento := 'CIDs possíveis para o evento:' + #13#10;
      while not q.EOF do
      begin
        vComplemento := vComplemento + q.FieldByName('ESTRUTURA').AsString + ' - ' + q.FieldByName('DESCRICAO').AsString + #13#10;
        q.Next;
      end;

      if Length(vComplemento) > 3500 then
        vComplemento := copy(vComplemento, 1, 3500);
      MontaNegacaoBenefPrestador(4250, vComplemento);
    end;
  end;
end;

procedure TDM.FormPrepare;
begin
  qParamGeralAtendimento.Open;
  qParamGeralProc.Open;
end;


//Todas as chamadas para esse procedimento foram comentado porque o
//controle sobre o campo Sequencia não estava sendo
//feito conforme solicitado anteriormente pela Cabesp. A partir de agora, o campo
//será gerado quando o mat/med é inserido, não sendo alterado na (re)validação.
//SMS 68864 - Débora Rebello - 28/02/2007

procedure TDM.atualizaSequenciaMatMed(piHandleEventoGerado: Integer);
var
  iHandleGrauEventoGerado: Integer;
  iHandleGrauEventoSolicitado: Integer;
  iHandleEventoSolicitado: Integer;
  iSenha: Integer;
  iAutoriazacao: Integer;
  vsSenha: String;
begin
  iHandleGrauEventoGerado := 0;
  iHandleGrauEventoSolicitado := 0;
  iHandleEventoSolicitado := 0;
  iSenha := 0;
  iAutoriazacao := 0;
  q.Close;
  q.SQL.Clear;
  q.SQL.Add('   SELECT C.RADIOPRESTADOROPERADORA');
  q.SQL.Add('     FROM SAM_AUTORIZ_EVENTOGERADO  A');
  q.SQL.Add('     JOIN SAM_AUTORIZ_EVENTOSOLICIT B ON (B.HANDLE = A.EVENTOSOLICITADO)');
  q.SQL.Add('LEFT JOIN SAM_GRAU C ON (C.HANDLE = B.GRAU)');
  q.SQL.Add('    WHERE A.HANDLE = :HANDLE');
  q.ParamByName('HANDLE').AsInteger := piHandleEventoGerado;
  q.Open;
  if not q.FieldByName('RADIOPRESTADOROPERADORA').IsNull and (q.FieldByName('RADIOPRESTADOROPERADORA').AsString = 'O') then
  begin
    try
      StartTransactionEx(Sys.CurrentSystem, 'SamAuto_UDM_atualizaSequenciaMatMed', vsSenha);

      q.Close;
      q.SQL.Clear;
      q.SQL.Add('SELECT A.EVENTOSOLICITADO');
      q.SQL.Add('      ,A.GRAUGERADO');
      q.SQL.Add('      ,A.SENHA');
      q.SQL.Add('      ,B.AUTORIZACAO');
      q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO A');
      q.SQL.Add('  JOIN SAM_AUTORIZ B ON (B.HANDLE = A.AUTORIZACAO)');
      q.SQL.Add(' WHERE A.HANDLE = :HANDLE');
      q.ParamByName('HANDLE').AsInteger := piHandleEventoGerado;
      q.Open;
      iHandleGrauEventoGerado := q.FieldByName('GRAUGERADO').AsInteger;
      iHandleEventoSolicitado := q.FieldByName('EVENTOSOLICITADO').AsInteger;
      iSenha := q.FieldByName('SENHA').AsInteger;
      iAutoriazacao := q.FieldByName('AUTORIZACAO').AsInteger;
      q.Close;
      q.SQL.Clear;
      q.SQL.Add('SELECT GRAU');
      q.SQL.Add('  FROM SAM_AUTORIZ_EVENTOSOLICIT');
      q.SQL.Add(' WHERE HANDLE = :HANDLE');
      q.ParamByName('HANDLE').AsInteger := iHandleEventoSolicitado;
      q.Open;
      iHandleGrauEventoSolicitado := q.FieldByName('GRAU').AsInteger;
      if iHandleGrauEventoGerado = iHandleGrauEventoSolicitado then
      begin
        q.Close;
        q.SQL.Clear;
        q.SQL.Add('SELECT HANDLE');
        q.SQL.Add('      ,SEQUENCIA');
        q.SQL.Add('  FROM SAM_AUTORIZ_MATMED');
        q.SQL.Add(' WHERE EVENTOSOLICITADO = :EVENTOSOLICITADO');
        q.ParamByName('EVENTOSOLICITADO').AsInteger := iHandleEventoSolicitado;
        q.Open;
        while not q.Eof do
        begin
          qAux.Close;
          qAux.SQL.Clear;
          qAux.SQL.Add('UPDATE SAM_AUTORIZ_MATMED');
          qAux.SQL.Add('   SET SEQUENCIA    = :SEQUENCIA');
          qAux.SQL.Add('      ,EVENTOGERADO = :EVENTOGERADO');
          qAux.SQL.Add(' WHERE HANDLE = :HANDLE');
          qAux.ParamByName('HANDLE').AsInteger := q.FieldByName('HANDLE').AsInteger;
          qAux.ParamByName('SEQUENCIA').AsFloat := strtoFloat(InttoStr(iAutoriazacao) + InttoStr(iSenha) + q.FieldByName('SEQUENCIA').AsString);
          qAux.ParamByName('EVENTOGERADO').AsInteger := piHandleEventoGerado;
          qAux.ExecSql;
          q.Next;
        end;
      end;
      CommitEx(Sys.CurrentSystem, vsSenha);
    except
      on E: Exception do
      begin
        RollbackEx(Sys.CurrentSystem, vsSenha);

        if sys.webMode then
          ShowMessage('Erro ao gerar eventos: ' + e.Message)
        else
          raise;
      end;
    end;
  end;
end;

procedure TDM.MostrarAlertasObserva(pHandleAutorizacao: Integer);
var viEventoGerado: Integer;
  vsVisualizar: string;
  i: Integer;
  vsSenha: string;
begin
  if Sys.VisibleMode then
  begin
    try
      StartTransactionEx(Sys.CurrentSystem, 'SamAuto_UDM_MostrarAlertasObserva', vsSenha);

      for i := 0 to FrmAlertas.vLstAlerta.Count - 1 do
        Dispose(FrmAlertas.vLstAlerta.Items[i]);

      FrmAlertas.vLstAlerta.clear;

      if qParamGeralAtendimento.FieldByName('ALERTASOMENTERESUMO').AsString = 'N' then
      begin
        qEventosGerados.Close;
        qEventosGerados.ParamByName('AUTORIZACAO').Value := pHandleAutorizacao;
        qEventosGerados.Open;

        while not qEventosGerados.Eof do
        begin
          viEventoGerado := qEventosGerados.FieldByName('HANDLE').AsInteger;

          qAlertas.Close;
          qAlertas.SQL.Clear;
          qAlertas.SQL.Add('SELECT * FROM ' + PrefixoTmp(Sys.CurrentSystem) + 'TMP_NEGACAOEVENTO');
          qAlertas.SQL.Add(' WHERE HANDLEORIGEM = :HANDLEORIGEM');
          qAlertas.SQL.Add('   AND CHAVE        = :CHAVE');
          qAlertas.ParamByName('HANDLEORIGEM').Value := viEventoGerado;
          qAlertas.ParamByName('CHAVE').Value := vgRecordHandle;
          qAlertas.Open;

          while not qAlertas.EOF do
          begin
            if (qAlertas.FieldByName('TIPO').AsString = 'O') then
            begin
              if (vgOrigemClinica) or (vgOrigemdoProcesso = 'A') or ((qAlertas.FieldByName('CONSIDERANOPAGAMENTO').AsString = 'S') and (vgOrigemdoProcesso = 'P')) then // se veio da clínica deve desconsiderar o flag 'CONSIDERANOPAGAMENTO'
              begin
                New(FrmAlertas.RecObservacao);
                FrmAlertas.RecObservacao^.Observacao := qAlertas.FieldByName('COMPLEMENTO').AsString;
                FrmAlertas.vLstObs.Add(FrmAlertas.RecObservacao);
              end;
            end;
            qAlertas.Next;
          end; // do WHILE DAS NEGAÇÕES

          qEventosGerados.Next;
        end;
      end;

      qAlertas.Close;
      qAlertas.SQL.Clear;
      qAlertas.SQL.Add('SELECT * FROM ' + PrefixoTmp(Sys.CurrentSystem) + 'TMP_ALERTAS');
      qAlertas.SQL.Add(' WHERE CHAVE = :CHAVE');
      qAlertas.ParamByName('CHAVE').Value := vgRecordHandle;
      qAlertas.Open;

      while not qAlertas.Eof do
      begin
        with FrmAlertas do
        begin
          New(RecAlerta);
          RecAlerta.Local := qAlertas.FieldByName('DESCRICAO').AsString;
          RecAlerta.TipoAlerta := qAlertas.FieldByName('TIPOALERTA').AsString;
          RecAlerta.Texto := sys.SQLMemoText(Integer(Pointer(qAlertas.FieldByName('TEXTO'))));
          RecAlerta.Acao := ' '; // isto já foi tratado na Stored Procedure
          RecAlerta.Auto_Pgto := 'A';
          RecAlerta.HandleAlerta := qAlertas.FieldByName('HANDLEALERTA').AsInteger;
          RecAlerta.HandleOrigem := -1;

          qSempreVisualizar.Close;
          qSempreVisualizar.SQL.Clear;

          if (RecAlerta.TipoAlerta = 'BENEFICIARIO') then
            qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTABENEF WHERE HANDLE = :HANDLE');

          if (RecAlerta.TipoAlerta = 'CORPO CLINICO') or
            (RecAlerta.TipoAlerta = 'ASSOCIACAO') or
            (RecAlerta.TipoAlerta = 'EXECUTOR') or
            (RecAlerta.TipoAlerta = 'LOCALEXECUCAO') or
            (RecAlerta.TipoAlerta = 'RECEBEDOR') or
            (RecAlerta.TipoAlerta = 'SOLICITANTE') then
            qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTAPRESTADOR WHERE HANDLE = :HANDLE');

          if (RecAlerta.TipoAlerta = 'MATRICULA') then
            qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTAMATRICULA WHERE HANDLE = :HANDLE');

          if (RecAlerta.TipoAlerta = 'FAMILIA') then
            qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTAFAMILIA WHERE HANDLE = :HANDLE');

          if (RecAlerta.TipoAlerta = 'CONTRATO') then
            qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTACONTRATO WHERE HANDLE = :HANDLE');

          if (RecAlerta.TipoAlerta = 'PLANO') then
            qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTAPLANO WHERE HANDLE = :HANDLE');

          if (RecAlerta.TipoAlerta = 'SOLICITANTEMUNICIPIO') or
            (RecAlerta.TipoAlerta = 'EXECUTORMUNICIPIO') or
            (RecAlerta.TipoAlerta = 'RECEBEDORMUNICIPIO') or
            (RecAlerta.TipoAlerta = 'LOCALEXECMUNICIPIO') then
            qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTAMUNICIPIO WHERE HANDLE = :HANDLE');

          if (RecAlerta.TipoAlerta = 'SOLICITANTEESTADO') or
            (RecAlerta.TipoAlerta = 'EXECUTORESTADO') or
            (RecAlerta.TipoAlerta = 'RECEBEDORESTADO') or
            (RecAlerta.TipoAlerta = 'LOCALEXECUCAOESTADO') then
            qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTAESTADO WHERE HANDLE = :HANDLE');

          if (RecAlerta.TipoAlerta = 'GERAL') then
            qSempreVisualizar.SQL.Add('SELECT SEMPREVISUALIZAR FROM SAM_ALERTAGERAL WHERE HANDLE = :HANDLE');

          qSempreVisualizar.ParamByName('HANDLE').Value := RecAlerta.HandleAlerta;
          qSempreVisualizar.Open;

          vsVisualizar := qSempreVisualizar.FieldByName('SEMPREVISUALIZAR').AsString;

          if (vsVisualizar = 'S') or (qParamGeralAtendimento.FieldByName('ALERTASOMENTERESUMO').AsString = 'N') then
            vLstAlerta.Add(RecAlerta)
          else
            Dispose(RecAlerta);
        end;
        qAlertas.Next;
      end;

      if (vgOrigemDoProcesso = 'A') and (not (vgValidarPartindoDaGeracaoDeOutro)) then
        FrmAlertas.MostrarAlertas;

      Q.SQL.Clear;
      Q.SQL.Add('DELETE FROM ' + PrefixoTmp(Sys.CurrentSystem) + 'TMP_NEGACAOEVENTO');
      Q.SQL.Add(' WHERE CHAVE = :CHAVE        ');
      Q.ParamByName('CHAVE').Value := vgRecordHandle;
      Q.ExecSql;

      Q.SQL.Clear;
      Q.SQL.Add('DELETE FROM ' + PrefixoTmp(Sys.CurrentSystem) + 'TMP_ALERTAS      ');
      Q.SQL.Add(' WHERE CHAVE = :CHAVE        ');
      Q.ParamByName('CHAVE').Value := vgRecordHandle;
      Q.ExecSql;

      CommitEx(Sys.CurrentSystem, vsSenha);
    except
      RollbackEx(Sys.CurrentSystem, vsSenha);
      raise;
    end;
  end;
end;

procedure TDM.VerificaLimiteCentavos(pLimite, pHandleBFM: Integer; pData: TDatetime;
  pTipo, pIncDec: string);
var
  vsRegimePgto, vEventosGerados: string;
  vsChave, vHandleContlinBFC, vDecLimite: integer;
  vsSenha: string;
begin
  exit;
  try
    if pLimite > 0 then
    begin
      StartTransactionEx(Sys.CurrentSystem, 'SamAuto_UDM_VerificaLimiteCentavos', vsSenha);

      //Como na limitação um evento solicitado pode ser revalidado, cancelado ou negado
      //era necessário tirar o valor autorizado da limitação, assim, criou-se uma variável
      //para destinguir o que será realizado.
      if pIncDec = 'I' then
      begin
        q.Close;
        q.SQL.Clear;
        if pTipo = 'B' then
        begin
          q.SQL.Add('SELECT E.EVENTOGERADO, C.HANDLE BCONTLIM  ');
          q.SQL.Add('  FROM SAM_BENEFICIARIO_CONTLIMEVENTO E      ');
          q.SQL.Add('  JOIN SAM_BENEFICIARIO_CONTLIM C ON (C.HANDLE = E.CONTLIMBENEFICIARIO) ');
          q.SQL.Add(' WHERE C.LIMITACAO = :LIMITE   ');
          q.SQL.Add('   AND C.DATAINICIAL <= :DATA  ');
          q.SQL.Add('   AND C.DATAINICIAL <= :DATA  ');
          q.SQL.Add('   AND (DATAFINAL is NULL or :DATA <= DATAFINAL) ');
          q.SQL.Add('   AND C.BENEFICIARIO = :BENEFICIARIO ');
          q.ParamByName('BENEFICIARIO').AsInteger := pHandleBFM;
        end
        else if pTipo = 'F' then
        begin
          q.SQL.Add('SELECT E.EVENTOGERADO, C.HANDLE BCONTLIM  ');
          q.SQL.Add('  FROM SAM_FAMILIA_CONTLIMEVENTO E      ');
          q.SQL.Add('  JOIN SAM_FAMILIA_CONTLIM C ON (C.HANDLE = E.CONTLIMFAMILIA) ');
          q.SQL.Add(' WHERE C.LIMITACAO = :LIMITE   ');
          q.SQL.Add('   AND C.DATAINICIAL <= :DATA  ');
          q.SQL.Add('   AND C.DATAINICIAL <= :DATA  ');
          q.SQL.Add('   AND (DATAFINAL is NULL or :DATA <= DATAFINAL) ');
          q.SQL.Add('   AND C.FAMILIA = :FAMILIA ');
          q.ParamByName('FAMILIA').AsInteger := pHandleBFM;
        end
        else if pTipo = 'C' then
        begin
          q.SQL.Add('SELECT E.EVENTOGERADO, C.HANDLE BCONTLIM  ');
          q.SQL.Add('  FROM SAM_CONTRATO_CONTLIMEVENTO E      ');
          q.SQL.Add('  JOIN SAM_CONTRATO_CONTLIM C ON (C.HANDLE = E.CONTLIMCONTRATO) ');
          q.SQL.Add(' WHERE C.LIMITACAO = :LIMITE   ');
          q.SQL.Add('   AND C.DATAINICIAL <= :DATA  ');
          q.SQL.Add('   AND C.DATAINICIAL <= :DATA  ');
          q.SQL.Add('   AND (DATAFINAL is NULL or :DATA <= DATAFINAL) ');
          q.SQL.Add('   AND C.CONTRATO = :CONTRATO ');
          q.ParamByName('CONTRATO').AsInteger := pHandleBFM;
        end;
        q.ParamByName('LIMITE').AsInteger := pLimite;
        q.ParamByName('DATA').AsDateTime := pData;
        q.Open;
      end
      else
      begin //Por Beneficiario
        pTipo := 'B';
        q.Close;
        q.SQL.Clear;
        q.SQL.Add('SELECT E.EVENTOGERADO, C.HANDLE BCONTLIM, C.LIMITACAO  ');
        q.SQL.Add('  FROM SAM_BENEFICIARIO_CONTLIMEVENTO E      ');
        q.SQL.Add('  JOIN SAM_BENEFICIARIO_CONTLIM C ON (C.HANDLE = E.CONTLIMBENEFICIARIO) ');
        q.SQL.Add(' WHERE C.HANDLE = :HANDLE   ');
        q.ParamByName('HANDLE').AsInteger := pLimite;
        q.Open;
        if q.IsEmpty then //Por Familia
        begin
          pTipo := 'F';
          q.Close;
          q.SQL.Clear;
          q.SQL.Add('SELECT E.EVENTOGERADO, C.HANDLE BCONTLIM, C.LIMITACAO  ');
          q.SQL.Add('  FROM SAM_FAMILIA_CONTLIMEVENTO E      ');
          q.SQL.Add('  JOIN SAM_FAMILIA_CONTLIM C ON (C.HANDLE = E.CONTLIMFAMILIA) ');
          q.SQL.Add(' WHERE C.HANDLE = :HANDLE   ');
          q.ParamByName('HANDLE').AsInteger := pLimite;
          q.Open;
        end;
        if q.IsEmpty then //Por Contrato
        begin
          pTipo := 'C';
          q.Close;
          q.SQL.Clear;
          q.SQL.Add('SELECT E.EVENTOGERADO, C.HANDLE BCONTLIM, C.LIMITACAO  ');
          q.SQL.Add('  FROM SAM_CONTRATO_CONTLIMEVENTO E      ');
          q.SQL.Add('  JOIN SAM_CONTRATO_CONTLIM C ON (C.HANDLE = E.CONTLIMCONTRATO) ');
          q.SQL.Add(' WHERE C.HANDLE = :HANDLE   ');
          q.ParamByName('HANDLE').AsInteger := pLimite;
          q.Open;
        end;
        //Caso encontre a limitação, sendo uma decrementação, joga-se a limitação em vDecLimite
        if not q.IsEmpty then
          vDecLimite := q.fieldbyName('LIMITACAO').AsInteger;
      end;
      q.First;
      //Monta todos os eventos gerados já liberados e ligados a limitação correspondente
      if (not q.IsEmpty) then
      begin
        vHandleContlinBFC := q.fieldbyName('BCONTLIM').AsInteger;
        vEventosGerados := '';
        while not q.Eof do
        begin
          vEventosGerados := vEventosGerados + q.fieldbyName('EVENTOGERADO').AsString;
          q.Next;
          if not q.Eof then
          begin
            vEventosGerados := vEventosGerados + ',';
          end;
        end;

        q1.Close;
        q1.SQL.Clear;
        q1.SQL.Add('SELECT LOCALATENDIMENTORESSARCIMENTO FROM SAM_PARAMETROSPROCCONTAS');
        q1.Open;
        //Seleciona os evento solicitados.
        qAuxLimite.Close;
        qAuxLimite.SQL.Clear;
        qAuxLimite.SQL.Add('SELECT EVENTOSOLICITADO                    ');
        qAuxLimite.SQL.Add('  FROM SAM_AUTORIZ_EVENTOGERADO            ');
        qAuxLimite.SQL.Add(' WHERE HANDLE IN ( ' + vEventosGerados + ') ');
        qAuxLimite.Open;

        qAuxLimite.First;

        SYS.NewCounter('AUTORIZADORSP', 0, 1, vsChave);

        while not qAuxLimite.Eof do
        begin
          //Seleciona os dados do evento gerado para passar como parametros na montagem da TMP_LIMITE
          //Lembro que, os eventos gerados já devem estar liberados.
          qAjustaLimite.Close;
          qAjustaLimite.ParamByName('ORIGEM').AsString := 'S';
          qAjustaLimite.ParamByName('HANDLE').AsInteger := qAuxLimite.fieldbyName('EVENTOSOLICITADO').AsInteger;
          qAjustaLimite.Open;

          if (not q1.FieldbyName('LOCALATENDIMENTORESSARCIMENTO').IsNull) then
          begin
            if qAjustaLimite.FieldByName('LOCALATENDIMENTO').AsInteger = q1.FieldbyName('LOCALATENDIMENTORESSARCIMENTO').AsInteger then
              vsRegimePgto := '2'
            else
              vsRegimePgto := '1';
          end
          else
          begin
            vsRegimePgto := '1';
          end;

          //Busca dados do Beneficiário
          LerBeneficiario(qAjustaLimite.FieldByName('BENEFICIARIO').AsInteger);
          //Busca módulo de cobertura e Plano
          ChecarCobertura(qAjustaLimite.FieldByName('HANDLE').AsInteger,
            qAjustaLimite.FieldByName('EVENTOGERADO').AsInteger,
            qAjustaLimite.FieldByName('BENEFICIARIO').AsInteger,
            qAjustaLimite.FieldByName('EXECUTOR').AsInteger,
            qAjustaLimite.FieldByName('RECEBEDOR').asInteger,
            DM.samauto_BENEFICIARIO.FieldByName('CHANDLE').AsInteger,
            qAjustaLimite.FieldByName('FINALIDADEATENDIMENTO').asInteger,
            qAjustaLimite.FieldByName('CONDICAOATENDIMENTO').AsInteger,
            qAjustaLimite.FieldByName('LOCALATENDIMENTO').AsInteger,
            qAjustaLimite.FieldByName('OBJETIVOTRATAMENTO').AsInteger,
            qAjustaLimite.FieldByName('REGIMEATENDIMENTO').AsInteger,
            qAjustaLimite.FieldByName('TIPOTRATAMENTO').AsInteger,
            qAjustaLimite.FieldByName('DATAATENDIMENTO').AsDateTime,
            DM.samauto_BENEFICIARIO.FieldByName('BDATAADESAO').AsDateTime);
          //Cria a TMP_LIMITE com base nas cargas que estão abaixo do Limite, isso é, os eventos autorizados já estão
          //na limitação, agora é só agrupá-los em uma tabela e achar o valor correto.
          SP_LIMITE.ParamByName('P_HANDLEORIGEM').asInteger := qAjustaLimite.FieldByName('HANDLE').AsInteger;
          SP_Limite.ParamByName('P_EVENTO').asInteger := qAjustaLimite.FieldByName('EVENTOGERADO').AsInteger;
          SP_Limite.ParamByName('P_FINALIDADEATENDIMENTO').asInteger := qAjustaLimite.FieldByName('FINALIDADEATENDIMENTO').asInteger;
          SP_Limite.ParamByName('P_CONDICAOATENDIMENTO').asInteger := qAjustaLimite.FieldByName('CONDICAOATENDIMENTO').AsInteger;
          SP_Limite.ParamByName('P_LOCALATENDIMENTO').asInteger := qAjustaLimite.FieldByName('LOCALATENDIMENTO').AsInteger;
          SP_Limite.ParamByName('P_OBJETIVOTRATAMENTO').asInteger := qAjustaLimite.FieldByName('OBJETIVOTRATAMENTO').AsInteger;
          SP_Limite.ParamByName('P_REGIMEATENDIMENTO').asInteger := qAjustaLimite.FieldByName('REGIMEATENDIMENTO').AsInteger;
          SP_Limite.ParamByName('P_TIPOTRATAMENTO').asInteger := qAjustaLimite.FieldByName('TIPOTRATAMENTO').AsInteger;
          SP_Limite.ParamByName('P_BENEFICIARIO').asInteger := qAjustaLimite.FieldByName('BENEFICIARIO').AsInteger;
          SP_Limite.ParamByName('P_FAMILIA').asInteger := DM.samauto_BENEFICIARIO.FieldByName('FHANDLE').AsInteger;
          SP_Limite.ParamByName('P_CONTRATO').asInteger := DM.samauto_BENEFICIARIO.FieldByName('CHANDLE').AsInteger;
          SP_Limite.ParamByName('P_MODULOQUEDEUCOBERTURA').asInteger := DM.vgModuloQueDeuCobertura;
          SP_Limite.ParamByName('P_PLANOQUEDEUCOBERTURA').asInteger := DM.vgPlanoQueDeuCobertura;
          SP_Limite.ParamByName('P_DATA').AsDateTime := qAjustaLimite.FieldByName('DATAATENDIMENTO').AsDateTime;
          SP_Limite.ParamByName('P_QUANTIDADE').ASfLOAT := qAjustaLimite.FieldByName('QTDAUTORIZADA').AsCurrency;
          SP_Limite.ParamByName('P_VALORCALCULADO').asFloat := (qAjustaLimite.FieldByName('VALORAUTORIZADO').AsFloat - qAjustaLimite.FieldByName('VALORCALCPF').asfloat) - ((qAjustaLimite.FieldByName('VALORAUTORIZADO').asfloat - qAjustaLimite.FieldByName('VALORCALCPF').AsFloat) / qAjustaLimite.FieldByName('QTDAUTORIZADA').AsFloat) * qAjustaLimite.FieldByName('QTDPAGA').asfloat;
          SP_Limite.ParamByName('P_RECEBEDOR').asInteger := qAjustaLimite.FieldByName('RECEBEDOR').asInteger;
          SP_Limite.ParamByName('P_GRAU').asInteger := qAjustaLimite.FieldByName('GRAUGERADO').AsInteger;
          SP_Limite.ParamByName('P_CID').asInteger := qAjustaLimite.FieldByName('CID').AsInteger;
          SP_Limite.ParamByName('P_ORIGEMDOPROCESSO').asString := DM.vgOrigemdoProcesso;
          SP_Limite.ParamByName('P_AUTORIZACAO').asInteger := qAjustaLimite.FieldByName('AUTORIZACAO').asInteger;
          SP_Limite.ParamByName('P_ORIGEMCLINICA').asString := DM.vgServico;
          SP_Limite.ParamByName('P_RECORDHANDLE').asInteger := vsChave;
          SP_Limite.ParamByName('P_CURRENTUSER').asInteger := dm.sys.currentUser;
          SP_Limite.ParamByName('P_DIRETO').asString := 'N';
          SP_Limite.ParamByName('P_REGIMEPGTO').AsString := vsRegimePgto;
          SP_Limite.ExecProc;

          qAuxLimite.Next;
        end;
        //Realiza a soma de todas os eventos autorizados, achando o valor total autorizado
        qCalculaValor.Close;
        qCalculaValor.SQL.Clear;
        qCalculaValor.SQL.Add('SELECT SUM(VALORAUTORIZADO) VALORAUTORIZADO');
        qCalculaValor.SQL.Add('  FROM ' + PrefixoTmp(Sys.CurrentSystem) + 'TMP_LIMITE           ');
        qCalculaValor.SQL.Add(' WHERE CHAVE = :CHAVE       ');
        qCalculaValor.SQL.Add('   AND TABTIPOLIMITE = 2    ');
        qCalculaValor.SQL.Add('   AND TIPO = :TIPO         ');
        qCalculaValor.SQL.Add('   AND LIMITE = :LIMITE     ');

        if pIncDec = 'I' then
          qCalculaValor.ParamByName('LIMITE').AsInteger := pLimite
        else
          qCalculaValor.ParamByName('LIMITE').AsInteger := vDecLimite;
        qCalculaValor.ParamByName('CHAVE').AsInteger := vsChave;
        qCalculaValor.ParamByName('TIPO').AsString := pTipo;
        qCalculaValor.Open;

        //Atualiza o valor autorizado, realizando o arredondamento com o valor total e não mais individual
        q1.close;
        q1.SQL.Clear;
        if pTipo = 'B' then
        begin
          q1.SQL.Add('UPDATE SAM_BENEFICIARIO_CONTLIM ');
          q1.SQL.Add('   SET VALORAUTORIZADO = :VALOR ');
          q1.SQL.Add(' WHERE HANDLE = :LIMITE         ');
        end
        else if pTipo = 'F' then
        begin
          q1.SQL.Add('UPDATE SAM_FAMILIA_CONTLIM ');
          q1.SQL.Add('   SET VALORAUTORIZADO = :VALOR ');
          q1.SQL.Add(' WHERE HANDLE = :LIMITE         ');
        end
        else if pTipo = 'C' then
        begin
          q1.SQL.Add('UPDATE SAM_CONTRATO_CONTLIM ');
          q1.SQL.Add('   SET VALORAUTORIZADO = :VALOR ');
          q1.SQL.Add(' WHERE HANDLE = :LIMITE         ');
        end;
        q1.ParamByName('LIMITE').AsInteger := vHandleContlinBFC;
        q1.ParamByName('VALOR').AsFloat := qCalculaValor.fieldbyName('VALORAUTORIZADO').AsFloat;
        q1.ExecSql;
        //Excluiu os registros da TMP_LIMITE
        q.Close;
        q.SQL.Clear;
        q.SQL.Add('DELETE FROM ' + PrefixoTmp(Sys.CurrentSystem) + 'TMP_LIMITE WHERE CHAVE = :CHAVE');
        q.ParamByName('CHAVE').AsInteger := vsChave;
        q.ExecSql;

      end;
    end;

    CommitEx(Sys.CurrentSystem, vsSenha);
  except
    on E: Exception do
    begin
      RollbackEx(Sys.CurrentSystem, vsSenha);
      raise;
    end;
  end;
end;


procedure TDM.BuscaLimitacao(pHandleEvGerado: Integer);
var
  Tabela1, Tabela2: string;
  vLimite: array of integer;
  i, j: integer;
  Busca: boolean;
  BFC: Char;
begin

  Busca := True;
  BFC := 'B';
  while Busca do
  begin
    case BFC of
      'B':
        begin
          Tabela1 := 'SAM_BENEFICIARIO_CONTLIM A';
          Tabela2 := 'SAM_BENEFICIARIO_CONTLIMEVENTO B ON B.CONTLIMBENEFICIARIO = A.HANDLE';
          BFC := 'F';
        end;
      'F':
        begin
          Tabela1 := 'SAM_FAMILIA_CONTLIM A';
          Tabela2 := 'SAM_FAMILIA_CONTLIMEVENTO B ON B.CONTLIMFAMILIA = A.HANDLE';
          BFC := 'C';

        end;
    else
      Tabela1 := 'SAM_CONTRATO_CONTLIM A';
      Tabela2 := 'SAM_CONTRATO_CONTLIMEVENTO B ON B.CONTLIMCONTRATO = A.HANDLE';
      Busca := false;
    end;

    qAuxLimite.Close;
    qAuxLimite.SQL.Clear;
    qAuxLimite.SQL.Add('SELECT A.HANDLE, A.TABTIPOLIMITE, A.LIMITACAO');
    qAuxLimite.SQL.Add('FROM ' + Tabela1);
    qAuxLimite.SQL.Add('JOIN ' + Tabela2);
    qAuxLimite.SQL.Add('WHERE  B.EVENTOGERADO = :EVENTOGERADO');
    qAuxLimite.ParamByName('EVENTOGERADO').Value := pHandleEvGerado;
    qAuxLimite.Open;

    i := 0;
    if qAuxLimite.RecordCount > 0 then
    begin
      SetLength(vLimite, qAuxLimite.RecordCount);
      qAuxLimite.First;
      while not qAuxLimite.Eof do
      begin
        if qAuxLimite.FieldByName('TABTIPOLIMITE').AsInteger = 2 then
        begin
          //Alimenta o vetor com os handles do contlim
          vLimite[i] := qAuxLimite.FieldByName('HANDLE').AsInteger;
          i := i + 1;
        end;
        qAuxLimite.Next;
      end;
      for j := 0 to i - 1 do
      begin
        VerificaLimiteCentavos(vLimite[j], 0, sys.serverDate, '', 'D');
      end;
      vLimite := nil;
    end;
  end;

end;
//Fim - SMS 72989

//INICIO - SMS 83110 - Vieira

procedure TDM.BuscarPacote(pExecutor,
  pSolicitante,
  pRecebedor,
  pLocalExecucao,
  pEvento,
  pGrau: integer;
  pCid: integer;
  pDataSolicitacao: TDateTime;
  pHandleEventoSolicit,
  pBeneficiario: Integer;
  pTipoAutorizacao,
  pAcomodacao: integer;
  pQuantidade: real);
const
  SQLPOS =
    'SELECT A.EXAMEPOSOPERATORIO FROM SAM_TGE A WHERE A.HANDLE = :HANDLE';
  SQLPCTNEGREDE =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, A.CONVENIO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU FROM SAM_PCTNEGREDE A, SAM_REDERESTRITA_PRESTADOR P, SAM_REDERESTRITA R, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G ' +
    'WHERE A.PRESTADOR = P.HANDLE AND P.REDERESTRITA = R.HANDLE AND P.REDERESTRITA = :REDE AND P.PRESTADOR = :PRESTADOR AND ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT AND ' +
    'R.RESTRICAOPRESTADORES = ''S'' ' +
    'AND A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND A.CONVENIO = :HCONVENIO';
  SQLPCTNEGPRESTADOR =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, A.CONVENIO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU  FROM SAM_PCTNEGPREST A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G WHERE A.PRESTADOR = :PRESTADOR AND ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT ' +
    'AND A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND A.CONVENIO = :HCONVENIO';
  SQLPCTNEGMUNICIPIO =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, A.CONVENIO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU FROM SAM_PCTNEGMUNIC A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G WHERE A.MUNICIPIO = :MUNICIPIO AND ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT ' +
    'AND A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND A.CONVENIO = :HCONVENIO';
  SQLPCTNEGESTADO =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, A.CONVENIO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU FROM SAM_PCTNEGESTADO A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G WHERE A.ESTADO = :ESTADO AND ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT ' +
    'AND A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND A.CONVENIO = :HCONVENIO';
  SQLPCTNEGFILIAL =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, A.CONVENIO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU FROM SAM_PCTNEGFILIAL A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G WHERE A.FILIAL = :FILIAL AND ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT ' +
    'AND A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND A.CONVENIO = :HCONVENIO';
  SQLPCTNEGGERAL =
    'SELECT A.HANDLE, A.GRAUAGERAR, A.EVENTO, A.CONVENIO, S.CODIGOPAGTO, T.DESCRICAO PACOTE, G.DESCRICAO GRAU FROM SAM_PCTNEGGERAL A, SAM_AUTORIZ_EVENTOSOLICIT S, SAM_TGE T, SAM_GRAU G WHERE ' +
    'A.EVENTO = :EVENTO AND A.DATAINICIAL <= :DATA AND (:DATA <= A.DATAFINAL OR A.DATAFINAL IS NULL) AND ' +
    'S.EVENTO = A.EVENTO AND S.HANDLE = :HEVENTOSOLICIT AND ' +
    'A.EVENTO = T.HANDLE AND A.GRAUAGERAR = G.HANDLE AND A.CONVENIO = :HCONVENIO';
  SQLTGECOMPLEMENTARPRESTADOR =
    'SELECT * FROM SAM_TGE_COMPLEMENTAR_PRESTADOR COMP WHERE COMP.PRESTADOR = :HCOMPLEMENTAR AND ' +
    'COMP.EVENTO = :EVENTO';
  SQLTGECOMPLEMENTARMUNICIPIO =
    'SELECT * FROM SAM_TGE_COMPLEMENTAR_MUNICIPIO COMP WHERE COMP.MUNICIPIO = :HCOMPLEMENTAR AND ' +
    'COMP.EVENTO = :EVENTO';
  SQLTGECOMPLEMENTARESTADO =
    'SELECT * FROM SAM_TGE_COMPLEMENTAR_ESTADO COMP WHERE COMP.ESTADO = :HCOMPLEMENTAR AND ' +
    'COMP.EVENTO = :EVENTO';
  SQLTGECOMPLEMENTARGERAL =
    'SELECT * FROM SAM_TGE_COMPLEMENTAR COMP WHERE COMP.EVENTO = :EVENTO';

var
  vModulo: integer;

begin
  SQLGen.Close;
  SQLGEN.SQL.Clear;
  SQLTGEComplementar.Close;
  SQLTGEComplementar.SQL.Clear;
  SQLPCTREDE.Close;
  SQLPCTREDE.SQL.Clear;
  SQLPCTPRESTADOR.Close;
  SQLPCTPRESTADOR.SQL.Clear;
  SQLPCTMUNICIPIO.Close;
  SQLPCTMUNICIPIO.SQL.Clear;
  SQLPCTESTADO.Close;
  SQLPCTESTADO.SQL.Clear;

  if pRecebedor = nulo then
    pRecebedor := pLocalExecucao;

  if (pGrau = nulo) then // o usuário não selecionou grau
  begin
    if not samauto_BENEFICIARIO.Active then
      LerBeneficiario(pBeneficiario);

    vModulo := AcharModuloCobertura(
      pEvento,
      pBeneficiario,
      pDataSolicitacao,
      samauto_BENEFICIARIO.FieldByName('BDATAADESAO').AsDateTime,
      vgFinalidadeAtendimento,
      vgCondicaoAtendimento,
      vgLocalAtendimento,
      vgObjetivoTratamento,
      vgRegimeAtendimento,
      vgTipoTratamento);

    // Multi-plano
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT M.REDERESTRITA, B.HANDLE BENEFICIARIO, B.CONTRATO');
    Q.SQL.Add('  FROM SAM_CONTRATO_MOD M, SAM_BENEFICIARIO B, SAM_CONTRATO C');
    Q.SQL.Add(' WHERE M.MODULO   = :MODULO');
    Q.SQL.Add('   AND B.CONTRATO = C.HANDLE');
    Q.SQL.Add('   AND M.CONTRATO = C.HANDLE');
    Q.SQL.Add('   AND B.HANDLE   = :BENEFICIARIO');
    Q.SQL.Add('   AND M.PLANO    = :PLANO');
    Q.ParamByName('MODULO').Value := vModulo;
    Q.ParamByName('PLANO').Value := vgPlanoQueDeuCobertura;
    Q.ParamByName('BENEFICIARIO').Value := pBeneficiario;
    Q.Open;

    q1.Close;
    q1.SQL.Clear;
    q1.SQL.Add('SELECT CONVENIO               ');
    q1.SQL.Add('  FROM SAM_BENEFICIARIO       ');
    q1.SQL.Add(' WHERE HANDLE = :HBENEFICIARIO');
    q1.ParamByName('HBENEFICIARIO').AsInteger := pBeneficiario;
    q1.Open;

    if pgrau = -1 then
    begin
      SQLGen.Close;
      SQLGen.SQL.Clear;
      SQLGen.SQL.Add(SQLPCTNEGREDE);
      SQLGen.ParamByName('REDE').Value := Q.FieldByName('REDERESTRITA').AsInteger;
      SQLGen.ParamByName('PRESTADOR').Value := pRecebedor;
      SQLGen.ParamByName('EVENTO').Value := pEvento;
      SQLGen.ParamByName('DATA').Value := pDataSolicitacao;
      SQLGen.ParamByName('HEVENTOSOLICIT').Value := pHandleEventoSolicit;
      SQLGen.ParamByName('HCONVENIO').Value := q1.FieldByName('CONVENIO').Value;
      SQLGen.Open;
    end;
    if not SQLGen.IsEmpty then
    begin
      GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'R', pSolicitante, pExecutor, pRecebedor,
        pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
      exit; // Pode sair do procedimento aqui pois já gerou o pacote e os complementares
    end;

    // ----------------- PACOTE REDE NO CONTRATO -----------------
    // descobrir o contrato para achar a rede restrita do contrato
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT B.CONTRATO, C.REDERESTRITA');
    Q.SQL.Add('  FROM SAM_BENEFICIARIO B, SAM_CONTRATO C');
    Q.SQL.Add(' WHERE B.CONTRATO = C.HANDLE');
    Q.SQL.Add('   AND B.HANDLE = :HANDLE');
    Q.ParamByName('HANDLE').Value := pBeneficiario;
    Q.Open;

    if pgrau = -1 then
    begin
      SQLGen.Close;
      SQLGen.SQL.Clear;
      SQLGen.SQL.Add(SQLPCTNEGREDE);
      SQLGen.ParamByName('REDE').Value := Q.FieldByName('REDERESTRITA').AsInteger;
      SQLGen.ParamByName('PRESTADOR').Value := pRecebedor;
      SQLGen.ParamByName('EVENTO').Value := pEvento;
      SQLGen.ParamByName('DATA').Value := pDataSolicitacao;
      SQLGen.ParamByName('HEVENTOSOLICIT').Value := pHandleEventoSolicit;
      SQLGen.ParamByName('HCONVENIO').Value := q1.FieldByName('CONVENIO').Value;
      SQLGen.Open;
    end;
    if not SQLGen.IsEmpty then
    begin
      GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'C', pSolicitante, pExecutor, pRecebedor,
        pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
      exit;
    end;

    // ------------------------ PACOTE PRESTADOR ------------------------
    //Tentar Gerar Pacote para o prestador
    //Procura Pacote para o Prestador
    if pgrau = -1 then
    begin
      SQLGen.Close;
      SQLGen.SQL.Clear;
      SQLGen.SQL.Add(SQLPCTNEGPRESTADOR);
      SQLGen.ParamByName('PRESTADOR').Value := pRecebedor;
      SQLGen.ParamByName('EVENTO').Value := pEvento;
      SQLGen.ParamByName('DATA').Value := pDataSolicitacao;
      SQLGen.ParamByName('HEVENTOSOLICIT').Value := pHandleEventoSolicit;
      SQLGen.ParamByName('HCONVENIO').Value := q1.FieldByName('CONVENIO').Value;
      SQLGen.Open;
    end;
    if not SQLGen.IsEmpty then
    begin
      GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'P', pSolicitante, pExecutor, pRecebedor,
        pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
      exit;
    end;

    // -------------------- PACOTE MUNICÍPIO -------------------------
    //Procura Pacote para o Municipio

    if pGrau = -1 then
    begin
      if not RECEBEDOR.Active then
        LerRecebedor(pRecebedor);

      SQLGen.Close;
      SQLGen.SQL.Clear;
      SQLGen.SQL.Add(SQLPCTNEGMUNICIPIO);
      SQLGen.ParamByName('MUNICIPIO').Value := RECEBEDOR.FieldByName('MUNICIPIOPAGAMENTO').AsInteger;
      SQLGen.ParamByName('EVENTO').Value := pEvento;
      SQLGen.ParamByName('DATA').Value := pDataSolicitacao;
      SQLGen.ParamByName('HEVENTOSOLICIT').Value := pHandleEventoSolicit;
      SQLGen.ParamByName('HCONVENIO').Value := q1.FieldByName('CONVENIO').Value;
      SQLGen.Open;
    end;
    if not SQLGen.IsEmpty then
    begin
      GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'M', pSolicitante, pExecutor, pRecebedor,
        pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
      exit;
    end;

    // ----------------------- PACOTE ESTADO ---------------------------
    if pGrau = -1 then
    begin
      //Procura Pacote para o Estado
      SQLGen.Close;
      SQLGen.SQL.Clear;
      SQLGen.SQL.Add(SQLPCTNEGESTADO);
      SQLGen.ParamByName('ESTADO').Value := RECEBEDOR.FieldByName('ESTADOPAGAMENTO').AsInteger;
      SQLGen.ParamByName('EVENTO').Value := pEvento;
      SQLGen.ParamByName('DATA').Value := pDataSolicitacao;
      SQLGen.ParamByName('HEVENTOSOLICIT').Value := pHandleEventoSolicit;
      SQLGen.ParamByName('HCONVENIO').Value := q1.FieldByName('CONVENIO').Value;
      SQLGen.Open;
    end;
    if not SQLGen.IsEmpty then
    begin
      GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'E', pSolicitante, pExecutor, pRecebedor,
        pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
      exit;
    end;

    // ----------------------- PACOTE ESTADO ---------------------------
    if pGrau = -1 then
    begin
      //Procura Pacote para o Estado
      SQLGen.Close;
      SQLGen.SQL.Clear;
      SQLGen.SQL.Add(SQLPCTNEGFILIAL);
      SQLGen.ParamByName('FILIAL').Value := RECEBEDOR.FieldByName('FILIALPADRAO').AsInteger;
      SQLGen.ParamByName('EVENTO').Value := pEvento;
      SQLGen.ParamByName('DATA').Value := pDataSolicitacao;
      SQLGen.ParamByName('HEVENTOSOLICIT').Value := pHandleEventoSolicit;
      SQLGen.ParamByName('HCONVENIO').Value := q1.FieldByName('CONVENIO').Value;
      SQLGen.Open;
    end;
    if not SQLGen.IsEmpty then
    begin
      GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'E', pSolicitante, pExecutor, pRecebedor,
        pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
      exit;
    end;

    // ------------------------ PACOTE GERAL ------------------------
    //Procura Pacote Geral
    if pGrau = -1 then
    begin
      SQLGen.Close;
      SQLGen.SQL.Clear;
      SQLGen.SQL.Add(SQLPCTNEGGERAL);
      SQLGen.ParamByName('EVENTO').Value := pEvento;
      SQLGen.ParamByName('DATA').Value := pDataSolicitacao;
      SQLGen.ParamByName('HEVENTOSOLICIT').Value := pHandleEventoSolicit;
      SQLGen.ParamByName('HCONVENIO').Value := q1.FieldByName('CONVENIO').Value;
      SQLGen.Open;
    end;
    if not SQLGen.IsEmpty then
    begin
      GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'G', pSolicitante, pExecutor, pRecebedor,
        pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
      exit;
    end;
  end;

  GerarComplementaresManual(pBeneficiario, pEvento, pCid, 'N', pSolicitante, pExecutor, pRecebedor,
    pLocalExecucao, pDataSolicitacao, pTipoAutorizacao, pQuantidade, SQLGEN);
  exit;
end;
//FINAL - SMS 83110 - Vieira

end. // Fim do Programa

