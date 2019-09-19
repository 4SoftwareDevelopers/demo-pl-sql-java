CREATE OR REPLACE PACKAGE Pkg4SD_CB_TRABA AS
/*==============================================================*/
/* SISTEMA:     4SD - PACKAGE CRUD           					          */
/* PAQUETE:     Pkg4SD_CB_TRABA.sql     	                      */
/* DESCRIPCION: CRUD PARA: TRABAJADOR       			        */
/* AUTOR:       Carlos Salazar							                    */
/* FECHA:       10/09/2019                                      */
/*==============================================================*/
/*--------------------------------------------------------------------------------
	Métodos   
	--------------------------------------------------------------------------------
	Procedimientos 
	--------------------------------------------------------------------------------
		Statement INSERT
	--------------------------------------------------------------------------------
	pr_InsRecord[Record]
	--------------------------------------------------------------------------------
		Statement  UPDATE
	--------------------------------------------------------------------------------
	pr_UpRecord[Record]
	--------------------------------------------------------------------------------
		Statement  DELETE
	--------------------------------------------------------------------------------
	pr_DelRecord[Key]
	--------------------------------------------------------------------------------*/

  -----------------------------------------------------------------------------
  -- pr_InsRecord
  -----------------------------------------------------------------------------
	PROCEDURE pr_InsRecord
	(
		PrcTraba  IN  TRABA%ROWTYPE
	);
 
  -----------------------------------------------------------------------------
  -- pr_UpRecord
  -----------------------------------------------------------------------------
	PROCEDURE pr_UpRecord
	(
		PrcTraba  IN  TRABA%ROWTYPE
	);

  -----------------------------------------------------------------------------
  -- pr_DelRecord
  -----------------------------------------------------------------------------
	PROCEDURE pr_DelRecord
	(
		 PtyId_Docu   IN  TRABA.TRAID%TYPE
	);

 
END Pkg4SD_CB_TRABA;
/
create or replace PACKAGE BODY Pkg4SD_CB_TRABA AS
/*==============================================================*/
/* SISTEMA:     4SD - PACKAGE CRUD           					          */
/* PAQUETE:     Pkg4SD_CB_TRABA.sql     	                      */
/* DESCRIPCION: CRUD PARA: TRABAJADOR       			        */
/* AUTOR:       Carlos Salazar							                    */
/* FECHA:       10/09/2019                                      */
/*==============================================================*/
  -----------------------------------------------------------------------------
  -- pr_InsRecord
  -----------------------------------------------------------------------------
	PROCEDURE pr_InsRecord
	(
		PrcTraba IN TRABA%ROWTYPE
	)
	IS


	BEGIN

		INSERT INTO TRABA
		(
		TRACED,
		TRANOM,
		TRAAPE1,
		TRAAPE2,
		TRAFECINI,
		TRAEST,
		TRAOBS,
		TRASEX,
		TRAID
		)
		VALUES
		(
		PrcTraba.TRACED,
		PrcTraba.TRANOM,
		PrcTraba.TRAAPE1,
		PrcTraba.TRAAPE2,
		PrcTraba.TRAFECINI,
		PrcTraba.TRAEST,
		PrcTraba.TRAOBS,
		PrcTraba.TRASEX,
		PrcTraba.TRAID
		);

	END pr_InsRecord;


  -----------------------------------------------------------------------------
  -- pr_UpRecord
  -----------------------------------------------------------------------------
	PROCEDURE pr_UpRecord
	(
		PrcTraba IN TRABA%ROWTYPE
	)
	IS


	BEGIN

		UPDATE TRABA
		SET
		TRACED	=	PrcTraba.TRACED,
		TRANOM	=	PrcTraba.TRANOM,
		TRAAPE1	=	PrcTraba.TRAAPE1,
		TRAAPE2	=	PrcTraba.TRAAPE2,
		TRAFECINI =	PrcTraba.TRAFECINI,
		TRAEST	=	PrcTraba.TRAEST,
		TRAOBS	=	PrcTraba.TRAOBS,
		TRASEX	=	PrcTraba.TRASEX,
		TRAID	=	PrcTraba.TRAID
		WHERE
        TRAID = PrcTraba.TRAID;

	END pr_UpRecord;

  -----------------------------------------------------------------------------
  -- pr_DelRecord
  -----------------------------------------------------------------------------
	PROCEDURE pr_DelRecord
	(
		 PtyId_Docu   IN  TRABA.TRAID%TYPE
	)

	IS

	BEGIN

	DELETE
        TRABA
    WHERE
        TRAID 	=	PtyId_Docu;

	END pr_DelRecord;

END Pkg4SD_CB_TRABA;
/