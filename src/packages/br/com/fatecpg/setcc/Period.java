package br.com.fatecpg.setcc;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class Period {
    private Long id;
    private String namePeriod;

    public Period(Long id, String namePeriod) {
        this.id = id;
        this.namePeriod = namePeriod;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNamePeriod() {
        return namePeriod;
    }

    public void setNamePeriod(String namePeriod) {
        this.namePeriod = namePeriod;
    }

    public static ArrayList<Period> getPeriods() throws Exception {
        String SQL = "SELECT * FROM teste.periods";
        ArrayList<Period> periods = new ArrayList<>();
        ArrayList<Object[]> list = AzureDatabaseConnector.getQuery(SQL, new Object[]{});

        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            Period p = new Period(
                    new Long((int)row[0])
                    , (String) row[1]
            );

            periods.add(p);

        }

        return periods;

    }

    public static void addPeriod(String name) throws Exception {
        String SQL = "INSERT INTO teste.periods VALUES ( ?)";

        Object parameters[] = {name};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

    public static void altPeriod(Long id, String name) throws Exception {
        String SQL = "UPDATE teste.periods SET " +
                "nm_period = '?'" +
                "WHERE id_period = " + id;

        Object parameters[] = {name};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

    public static void removePeriod(Long id) throws Exception {
        String SQL = "DELETE FROM teste.periods WHERE id_period = ?";

        Object parameters[] = {id};

        AzureDatabaseConnector.execute(SQL, parameters);
    }
}
