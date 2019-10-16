package com.example.demoplsql.dao.impl;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demoplsql.dao.api.TrabajadorDaoAPI;
import com.example.demoplsql.model.Trabajador;

import oracle.jdbc.internal.OracleTypes;

@Repository
public class TrabajadorDaoImpl implements TrabajadorDaoAPI {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void save(Trabajador trabajador) {
		StringBuilder sql = new StringBuilder();
		sql.append("DECLARE ");
		sql.append("trabajador TRABA%ROWTYPE; ");
		sql.append(" BEGIN  ");
		sql.append("Select ");
		sql.append("?,");
		sql.append("?,");
		sql.append("?,");
		sql.append("?,");
		sql.append("?,");
		sql.append("?,");
		sql.append("?,");
		sql.append("?,");
		sql.append("?");
		sql.append("INTO trabajador ");
		sql.append("From dual; ");
		sql.append(" Pkg4SD_CB_TRABA.pr_InsRecord(trabajador); ");
		sql.append("END; ");
		
		jdbcTemplate.update(sql.toString(), trabajador.getCedula(), trabajador.getNombre(),trabajador.getApellido1(),
				trabajador.getApellido2(), trabajador.getFechaInicio(), trabajador.getEstado(),
				trabajador.getObservacion(), trabajador.getSexo(), trabajador.getId());

	}

	@Override
	public Trabajador getById(Long id) {
		Trabajador trabajador = jdbcTemplate.execute("{ ? = call PKG4SD_UT_TRABA.FUN4SD_GETRECORD(?) }", new CallableStatementCallback<Trabajador>() {

			@Override
			public Trabajador doInCallableStatement(CallableStatement cs) throws SQLException, DataAccessException {
				cs.registerOutParameter(1, OracleTypes.CURSOR);
				cs.setObject(2, id);
				cs.execute();
				
				ResultSet rs = (ResultSet) cs.getObject(1);
				Trabajador trabajador = new Trabajador();
				while (rs.next()) {
					trabajador.setCedula(rs.getLong("TRACED"));
					trabajador.setNombre(rs.getString("TRANOM"));
					trabajador.setApellido1(rs.getString("TRAAPE1"));
					trabajador.setApellido2(rs.getString("TRAAPE2"));
					trabajador.setFechaInicio(rs.getDate("TRAFECINI"));
					trabajador.setEstado(rs.getString("TRAEST"));
					trabajador.setObservacion(rs.getString("TRAOBS"));
					trabajador.setSexo(rs.getString("TRASEX"));
					trabajador.setId(rs.getLong("TRAID"));
				}
				return trabajador;
			}
		});
		return trabajador;
	}

}
