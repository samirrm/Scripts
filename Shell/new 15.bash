
##CMSPRODUCAO
00 23 * * 1 su - root -c /opt/pentaho/CMSPRODUCAO/pentaho.sh

##M2_CALCULADO
00 00 3 * * su - root -c /opt/pentaho/M2_CALCULADO/pentaho.sh

## Telemetria
#*/1 * * * * su - root -c /Telemetria.sh

##NIELSEN
00 23 * * * su - root -c /opt/pentaho/NIELSEN/pentaho.sh

##SAC
00 23 * * * su - root -c /opt/pentaho/SAC/pentaho.sh

##SSS_PRODUTO_DIARIO
00 6 * * * su - root -c /opt/pentaho/SSS_PRODUTO_DIARIO/pentaho.sh

##SALESFORCEENVIO INCREMENTO
00 4 * * 1-5 su - root -c /opt/pentaho/SALESFORCEENVIO/pentaho1.sh

##SALESFORCEENVIO COMPLETO
00 4 * * 7 su - root -c /opt/pentaho/SALESFORCEENVIO/pentaho.sh

##ColetarEstoqueFornecedor
10 09 * * * su - root -c /opt/pentaho/ColetarEstoqueFornecedor/pentaho.sh

##EncontrarDivergencias
00 5 * * * su - root -c /opt/pentaho/EncontrarDivergencias/pentaho.sh

##ENG_RT_IntegracaoSCCD
*/30 * * * * su - root -c /opt/pentaho/ENG_RT_IntegracaoSCCD/pentaho.sh

##ENG_RT_IntegracaoVSTS
*/60 * * * * su - root -c /opt/pentaho/ENG_RT_IntegracaoVSTS/pentaho.sh

##Tranferencia_Solicitacoes_Ativacoes_Produtos
* 21 * * * su - root -c /opt/pentaho/Tranferencia_Solicitacoes_Ativacoes_Produtos/pentaho.sh

##LOG_RT_EntradaDireta_SF
*/5 * * * * su - root -c /opt/pentaho/LOG_RT_EntradaDireta_SF/pentaho.sh

##CargaSaldoSempre
#00 5 * * * su - root -c /opt/pentaho/CargaSaldoSempre/pentaho.sh

##IntegracaoAcessoRH_ETL
00 2 * * * su - root -c /opt/pentaho/IntegracaoAcessoRH_ETL/pentaho.sh

##SincronizadorBrSupply
#*/60 * * * * su - root -c /opt/pentaho/SincronizadorBrSupply/pentaho.sh

##TaxWeb
00 3 * * * su - root -c /opt/pentaho/TaxWeb/pentaho.sh

##MASTER_NOTAS_DEVOLUCAO_ESTORNO
00 5 * * * su - root -c /opt/pentaho/MASTER_NOTAS_DEVOLUCAO_ESTORNO/pentaho.sh

##RC_RT_SincronizadorDados_ETL

#0 1 * * 0 su - root -c /opt/pentaho/RC_RT_SincronizadorDados_ETL/pentaho.sh

##SincronizadorSymphony
30 00 * * 7 su - root -c /opt/pentaho/SincronizadorSymphony/pentaho.sh

##UNDELIVERABLE_SALESFORCE
00 4 * * 5 su - root -c /opt/pentaho/UNDELIVERABLE_SALESFORCE/pentaho.sh

##CARGA_CONVENIO
#30 * * * * su - root -c /opt/pentaho/CARGA_CONVENIO/pentaho.sh

##ImportarNotasEntradaDivergencia
00 5 * * * su - root -c /opt/pentaho/ImportarNotasEntradaDivergencia/pentaho.sh

##MASTER_RELATORIO_DE_FUNCIONAMENTO
00 9 * * * su - root -c /opt/pentaho/MASTER_RELATORIO_DE_FUNCIONAMENTO/pentaho.sh

##ETLSolicitacoesDeCancelamentoPedidosPendentes
00 8 * * * su - root -c /opt/pentaho/ETLSolicitacoesDeCancelamentoPedidosPendentes/pentaho2.sh

##ENTREGA_DELIVERY
00 */12 * * * su - root -c /opt/pentaho/ENTREGA_DELIVERY/Job/Produtos/pentaho.sh

## SincronizadorClinicar
#05 00 * * * su - root -c /opt/pentaho/SincronizadorClinicar/pentaho.sh

## NPSSalesforce
*/10 * * * * su - root -c /opt/pentaho/NPSSalesforce/pentaho.sh

## ENVIOS_NPS_POR_FILIAL
00 15 * * * su - root -c /opt/pentaho/ENVIOS_NPS_POR_FILIAL/pentaho.sh

## checar ETL
#*/5 * * * * su - root -c /opt/pentaho/Checa_ETL.sh
#00 00 * * * su - root -c /opt/pentaho/ETL/Reinicia_ETL_Diario.sh

## RC_RT_Saneador_base_clientes_ETL
10 * * * * su - root -c /opt/pentaho/RC_RT_Saneador_base_clientes_ETL/pentaho.sh

## LIMPANDO ARQUIVOS /tmp e /opt/pentaho/ETL/RELATORIOS ##
00 */6 * * * su - root -c /root/bin/Limpaarquivos.sh

## PROCESSAR_CAMPANHA_ETL
#00 */2 * * * su - root -c /opt/pentaho/PROCESSAR_CAMPANHA_ETL/pentaho.sh

## FrenteLoja_ETL
00 23 * * * su - root -c /opt/pentaho/FrenteLoja_ETL/pentaho.sh

### Envia NeoGrid
#*/10 * * * * su - root -c /opt/NeoGridClient/envia_neogrid.sh >> /opt/NeoGridClient/envia_neogrid.log

## SincronizadorEpharmaSend
#0 23 * * * su - root -c /opt/pentaho/SincronizadorEpharmaSend/pentaho.sh

## Indisponibilidade
*/5 * * * * su - root -c /opt/pentaho/Indisponibilidade/pentaho.sh

## RELATORIO_IQVIA
* 8 * * * su - root -c /opt/pentaho/RELATORIO_IQVIA/pentaho.sh

## Telemetria
*/5 * * * * su - root -c /opt/pentaho/Telemetria/pentaho.sh

## Logistica Reversa
00 07 * * * su - root -c /opt/pentaho/LogisticaReversa/pentaho.sh
00 13 * * * su - root -c /opt/pentaho/LogisticaReversa/pentaho.sh
00 15 * * * su - root -c /opt/pentaho/LogisticaReversa/pentaho.sh

## MasterNeoGridDiario
00 03 * * * su - root -c /opt/pentaho/MasterNeogridDiario/pentaho.sh


## NPS_Fidelidade
#30 23 * * * su - root -c /opt/pentaho/NPS_FIDELIDADE/pentaho.sh

## Importacao_XML
00 * * * * su - root -c /opt/pentaho/Importacao_xml_brs_ETL/pentaho.sh

## Sincronizacao_SalesForce
00 02 * * * su - root -c /opt/pentaho/Sincronizacao_SalesForce/pentaho.sh

## Despesas
#00 20 * * * su - root -c /opt/pentaho/DESPESAS/pentaho.sh
##Correcoes da Proteus
00 4 * * 1-5 su - root -c /opt/backup/correcoes.sh

## Digital_ETL
#00 5 * * * su - root -c /opt/pentaho/Digital_ETL/pentaho.sh

## ProspectarAmeService_ETL
00 22 * * * su - root -c /opt/pentaho/ProspectarAmeServiceETL/pentaho.sh

## Clinic_Farma_PDI
#00 5 * * * su - root -c /opt/pentaho/Clinic_Farma_PDI/pentaho.sh

## ICMS_Start_ETL
00 7 * * * su - root -c /opt/pentaho/ICMS_Start_ETL/pentaho.sh

## ICMS_Envio_ETL
*/5 * * * * su - root -c /opt/pentaho/ICMS_Envio_ETL/pentaho.sh

## ICMS_Verificacao_ETL
*/10 * * * * su - root -c /opt/pentaho/ICMS_Verificacao_ETL/pentaho.sh