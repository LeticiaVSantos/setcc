package br.com.fatecpg.setcc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.microsoft.sqlserver.jdbc.SQLServerDriver;

public class AzureDatabaseConnector{
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String URL = "jdbc:sqlserver://setcc-db-server.database.windows.net:1433;" +
                    "database=setcc_db;" +
                    "user=setcc@setcc-db-server;" +
                    "password={fatec%2018};" +
                    "encrypt=true;" +
                    "trustServerCertificate=false;" +
                    "hostNameInCertificate=*.database.windows.net;" +
                    "loginTimeout=30;";

    public static void execute(String SQL, Object[] parameters) throws Exception {
        ArrayList<Object[]> list = new ArrayList<>();
        Class.forName(DRIVER).newInstance();
        Connection connection = DriverManager.getConnection(URL);
        PreparedStatement stmt = connection.prepareStatement(SQL);

        for (int i = 0; i < parameters.length; i++) {
            stmt.setObject(i+1, parameters[i]);
        }

        stmt.execute();
        stmt.close();
        connection.close();
    }

    public static ArrayList<Object[]> getQuery(String SQL, Object[] parameters) throws Exception {
        ArrayList<Object[]> list = new ArrayList<>();
        Class.forName(DRIVER).newInstance();
        Connection connection = DriverManager.getConnection(URL);
        PreparedStatement stmt = connection.prepareStatement(SQL);

        for (int i = 0; i < parameters.length; i++) {
            stmt.setObject(i+1, parameters[i]);
        }

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Object row[] = new Object[rs.getMetaData().getColumnCount()];

            for (int i = 0; i < rs.getMetaData().getColumnCount(); i++) {
                row[i] = rs.getObject(i+1);
            }

            list.add(row);
        }

        rs.close();
        stmt.close();
        connection.close();

        return list;
    }
}
