CREATE OR REPLACE PACKAGE PKG4SD_UT_TRABA AS
/*==============================================================*/
/* SISTEMA:     4SD - PACKAGE UTIL           					*/
/* PAQUETE:     PKG4SD_UT_TRABA.sql     	                    */
/* DESCRIPCION: UTILIDADES PARA: TRABAJADOR       			    */
/* AUTOR:       Carlos Salazar							        */
/* FECHA:       10/09/2019                                      */
/*==============================================================*/
  /* Declaración de variable tipo cursor */
  
  Type type_cursor Is Ref Cursor Return TRABA%ROWTYPE;
  
  -----------------------------------------------------------------------------
  -- Fun4SD_Exist FUNCION PARA DETERMINAR QUE EL TRAID EXISTA
  -----------------------------------------------------------------------------
  Function Fun4SD_Exist
	(
		pvId_Docu   IN    TRABA.TRAID%TYPE
	)
	Return Boolean; 
	
  -----------------------------------------------------------------------------
  -- Fun4SD_GetRecord FUNCION PARA OBTENER UN CURSOR CON SUS DATOS
  -----------------------------------------------------------------------------  
  Function Fun4SD_GetRecord
	(
		pvId_Docu   IN    TRABA.TRAID%TYPE
	)
  Return TRABA%ROWTYPE;
  
End PKG4SD_UT_TRABA;
/
create or replace Package Body PKG4SD_UT_TRABA As
/*==============================================================*/
/* SISTEMA:     4SD - PACKAGE UTIL           					*/
/* PAQUETE:     PKG4SD_UT_TRABA.sql    		                    */
/* DESCRIPCION: UTILIDADES PARA: TRABAJADOR              		*/
/* AUTOR:       Carlos Salazar							        */
/* FECHA:       10/09/2019                                      */
/*==============================================================*/
  -------------------------------------------------------------------------------
  --  CURSOR EXPLICITO PARA CONTAR LOS REGISTROS DE TRABA
  -------------------------------------------------------------------------------
  Cursor cur_TRABA_count
	(
		 pvId_Docu      IN TRABA.TRAID%TYPE
	)
	Is

  Select
    Count(1)
  From
    TRABA
  Where
    TRAID = pvId_Docu;
	
  -----------------------------------------------------------------------------
  -- Fun4SD_Exist FUNCION PARA DETERMINAR QUE EL TRAID EXISTA
  -----------------------------------------------------------------------------
  Function Fun4SD_Exist
	(
		pvId_Docu   IN    TRABA.TRAID%TYPE
	)
	RETURN BOOLEAN
	IS

	Cuantos number:=0;
	
	/*Un bloque anónimo PL/SQL*/
	BEGIN
	 OPEN cur_TRABA_count
		(
		 	pvId_Docu
		);
		FETCH cur_TRABA_count INTO Cuantos;
     CLOSE cur_TRABA_count;
     
	 IF ( Cuantos = 0 ) THEN
        RETURN (FALSE);
     END IF;
		RETURN (TRUE);
	END Fun4SD_Exist;

  -------------------------------------------------------------------------------
  --  Fun4SD_GetRecord FUNCION PARA OBTENER UN CURSOR CON SUS DATOS
  -------------------------------------------------------------------------------
  Function Fun4SD_GetRecord
	(
		pvId_Docu   IN    TRABA.TRAID%TYPE
	)
  Return TRABA%ROWTYPE Is

  /*VARIABLE CURSOR*/
  cur4SDCed type_cursor;
  r4SDCed TRABA%ROWTYPE;

	Begin

   Open cur4SDCed For
       Select
        *
       From
        TRABA
       Where
        TRAID = pvId_Docu;

    Fetch cur4SDCed Into r4SDCed;

    Return r4SDCed;

	End Fun4SD_GetRecord;

End PKG4SD_UT_TRABA;
/