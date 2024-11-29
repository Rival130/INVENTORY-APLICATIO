/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author aldoa
 */
public class koneksaun {
    private static Connection koneksaun;

    public static Connection getConnection() throws SQLException {
        String db = "jdbc:mysql://localhost:3306/db_sasan";

        if (koneksaun == null) {
            koneksaun = DriverManager.getConnection(db, "root", "");
        }
        return koneksaun;
    }
}
