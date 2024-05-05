/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;
package org.example;

import Modelo.CommonMethods;

/**
 *
 * @author ERICKPC
 */
public class DescripcionOportunidad {
    private int iddescripcion;
    private String logo;
    private String imagen;
    private String informacion;
    private int idoportunidad;

    public DescripcionOportunidad() {
    }

    public DescripcionOportunidad(int iddescripcion, String logo, String imagen, String informacion, int idoportunidad) {
        this.iddescripcion = iddescripcion;
        this.logo = logo;
        this.imagen = imagen;
        this.informacion = informacion;
        this.idoportunidad = idoportunidad;
    }

    CommonMethods.setIddescripcion(this, 123);
    int id = CommonMethods.getIddescripcion(this);


    public int getIdoportunidad() {
        return idoportunidad;
    }

    public void setIdoportunidad(int idoportunidad) {
        this.idoportunidad = idoportunidad;
    }
    
}
