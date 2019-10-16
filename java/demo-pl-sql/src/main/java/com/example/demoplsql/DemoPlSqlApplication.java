package com.example.demoplsql;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.demoplsql.dao.api.TrabajadorDaoAPI;
import com.example.demoplsql.model.Trabajador;

@SpringBootApplication
public class DemoPlSqlApplication implements CommandLineRunner{
	
	@Autowired
	private TrabajadorDaoAPI trabajadorDaoAPI;

	public static void main(String[] args) {
		SpringApplication.run(DemoPlSqlApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		Trabajador trabajador = new Trabajador();
		trabajador.setId(1L);
		trabajador.setNombre("Jordy");
		trabajador.setApellido1("Rodriguez");
		trabajador.setApellido2("Arango");
		trabajador.setCedula(3442323L);
		trabajador.setFechaInicio(new Date());
		trabajador.setEstado("A");
		trabajador.setObservacion("Nada por aquí");
		trabajador.setSexo("M");
		
		trabajadorDaoAPI.save(trabajador);
		
		Trabajador traba = trabajadorDaoAPI.getById(1L);
		System.out.println(traba);
	}

}
