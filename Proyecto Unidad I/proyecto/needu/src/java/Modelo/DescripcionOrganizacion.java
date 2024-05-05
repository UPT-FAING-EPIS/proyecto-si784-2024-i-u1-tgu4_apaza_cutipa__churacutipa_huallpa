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
public class DescripcionOrganizacion {
    private int iddescripcion;
    private String logo;
    private String imagen;
    private String informacion;
    private int idorganizacion;

    public DescripcionOrganizacion() {
    }

    public DescripcionOrganizacion(int iddescripcion, String logo, String imagen, String informacion, int idorganizacion) {
        this.iddescripcion = iddescripcion;
        this.logo = logo;
        this.imagen = imagen;
        this.informacion = informacion;
        this.idorganizacion = idorganizacion;
    }

    CommonMethods.setIddescripcion(this, 123);
    int id = CommonMethods.getIddescripcion(this);
    
    public int getIdorganizacion() {
        return idorganizacion;
    }

    public void setIdorganizacion(int idorganizacion) {
        this.idorganizacion = idorganizacion;
    }
    
}
