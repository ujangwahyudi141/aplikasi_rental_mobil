/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Koneksi;
import java.sql.*;
/**
 *
 * @author Ardiansyah
 */
public class koneksi {
    private Connection koneksi;
    public Connection konek(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Berhasil Koneksi");                                      
        } catch (ClassNotFoundException cnfe) {
            System.out.println("Gagal Koneksi" + cnfe);
        }
        String url="jdbc:mysql://localhost:3306/db_rental_mobil";
        try {
            koneksi=DriverManager.getConnection(url, "root","");
            System.out.println("Data Berhasil Tersambung");
        } catch (SQLException se){
            System.out.println("Tidak ada database" + se);
        }
        return koneksi;
    }
}
