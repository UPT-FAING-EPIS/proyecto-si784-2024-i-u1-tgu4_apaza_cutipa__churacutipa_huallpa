/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;
package org.example;

import Config.Conexion;
import Interfaces.CRUDUbicacion;
import Modelo.Ubicacion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ERICKPC
 */
public class UbicacionDAO implements CRUDUbicacion{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public int registrarUbicacion(Ubicacion ubi) {
        String sql = "Insert into tbubicacion(pais,ciudad,direccion) values(?,?,?)";
        try {
            con = (Connection) cn.getConnection();
            ps = con.prepareStatement(sql, new String[]{"idubicacion"}); // para obtener el id autoincrementable
            ps.setString(1,ubi.getPais());
            ps.setString(2,ubi.getCiudad());
            ps.setString(3, ubi.getDireccion());
            
            <%@ include file="common3.java" %>
        }catch(SQLException e){
            e.printStackTrace();
        }
        return -1;
    }
    
    
    public List<Ubicacion> listarUbicaciones() {
        List<Ubicacion> listaUbicaciones = new ArrayList<>();
        String sql = "SELECT * FROM tbubicacion";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Ubicacion ubi = new Ubicacion();
                ubi.setIdubicacion(rs.getInt("idubicacion"));
                ubi.setPais(rs.getString("pais"));
                ubi.setCiudad(rs.getString("ciudad"));
                ubi.setDireccion(rs.getString("direccion"));
                listaUbicaciones.add(ubi);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listaUbicaciones;
    }
    
    
    
    
    
    
    
    
    
}
