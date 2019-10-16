package com.example.demoplsql.dao.api;

import com.example.demoplsql.model.Trabajador;

public interface TrabajadorDaoAPI {

	void save(Trabajador trabajador);
	
	Trabajador getById(Long id);
}
