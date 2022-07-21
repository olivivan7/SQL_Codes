-- Insere dados na dimensão tempo a partir da geração automática de datas
CALL fed_dw_final.cargaDimTempo('2015');
COMMIT;
CALL fed_dw_final.cargaDimTempo('2016');
COMMIT;
CALL fed_dw_final.cargaDimTempo('2017');
COMMIT;
CALL fed_dw_final.cargaDimTempo('2018');
COMMIT;
CALL fed_dw_final.cargaDimTempo('2019');
COMMIT;
CALL fed_dw_final.cargaDimTempo('2020');
COMMIT;

SELECT * FROM fed_dw_final.dim_tempo;


