package br.com.fatecpg.setcc;

import java.util.ArrayList;

public class Season {
    private Long id;
    private String inicioSeason;
    private String fimSeason;
    private String deadlineProjeto;

    public Season(Long id, String inicioSeason, String fimSeason, String deadlineProjeto) {
        this.id = id;
        this.inicioSeason = inicioSeason;
        this.fimSeason = fimSeason;
        this.deadlineProjeto = deadlineProjeto;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getInicioSeason() {
        return inicioSeason;
    }

    public void setInicioSeason(String inicioSeason) {
        this.inicioSeason = inicioSeason;
    }

    public String getFimSeason() {
        return fimSeason;
    }

    public void setFimSeason(String fimSeason) {
        this.fimSeason = fimSeason;
    }

    public String getDeadlineProjeto() {
        return deadlineProjeto;
    }

    public void setDeadlineProjeto(String deadlineProjeto) {
        this.deadlineProjeto = deadlineProjeto;
    }

    public static ArrayList<Season> getSeasons() throws Exception {
        String SQL = "SELECT * FROM teste.seasons";
        ArrayList<Season> seasons = new ArrayList<>();
        ArrayList<Object []> list = AzureDatabaseConnector.getQuery(SQL, new Object[]{});

        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            Season s = new Season(
                    new Long((int)row[0])
                    , (String) row[1]
                    , (String) row[2]
                    , (String) row[3]
            );

            seasons.add(s);

        }

        return seasons;

    }

    public static void addSeason(String inicioSeason, String fimSeason, String deadlineProjeto) throws Exception {
        String SQL = "INSERT INTO teste.seasons VALUES (" +
                " '" + inicioSeason +
                "', '" + fimSeason +
                "', '" + deadlineProjeto +
                "')";

        Object parameters[] = {};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

    public static void altSeason(Long id, String inicioSeason, String fimSeason, String deadlineProjeto) throws Exception {
        String SQL = "UPDATE teste.seasons SET " +
                " dt_inicioSeason = '" + inicioSeason +
                "', dt_fimSeason = '" + fimSeason +
                "', dt_deadlineProjeto = '" + deadlineProjeto +
                "' WHERE id_season = " + id;

        Object parameters[] = {};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

    public static void removeSeason(Long id) throws Exception {
        String SQL = "DELETE FROM teste.seasons WHERE id_season = ?";

        Object parameters[] = {id};

        AzureDatabaseConnector.execute(SQL, parameters);
    }
}
