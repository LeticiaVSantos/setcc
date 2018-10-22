package br.com.fatecpg.setcc;

import java.util.ArrayList;

public class Professor {
    private Long id;
    private String cdUnique;
    private Long idUser;

    public Professor(Long id, String cdUnique, Long idUser) {
        this.id = id;
        this.cdUnique = cdUnique;
        this.idUser = idUser;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCdUnique() {
        return cdUnique;
    }

    public void setCdUnique(String cdUnique) {
        this.cdUnique = cdUnique;
    }

    public Long getIdUser() {
        return idUser;
    }

    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    }

    public static ArrayList<Professor> getProfessors() throws Exception {
        String SQL = "SELECT * FROM teste.professors";
        ArrayList<Professor> professors = new ArrayList<>();
        ArrayList<Object[]> list = AzureDatabaseConnector.getQuery(SQL, new Object[]{});

        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            Professor p = new Professor(
                    new Long((int) row[0])
                    , (String) row[1]
                    , new Long((int) row[2])
            );

            professors.add(p);

        }

        return professors;

    }

    public static void addProfessor(String cdUnique, Long idUser) throws Exception {
        String SQL = "INSERT INTO teste.professors VALUES (" +
                " '" + cdUnique +
                "', ?)";

        Object parameters[] = {idUser};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

    public static void altProfessor(Long id, String cdUnique) throws Exception {
        String SQL = "UPDATE teste.professors SET " +
                "cd_unique = '" + cdUnique +
                "' WHERE id_professor = " + id;

        Object parameters[] = {cdUnique};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

    public static void removeProfessor(Long id) throws Exception {
        String SQL = "DELETE FROM teste.professors WHERE id_user = ?";

        Object parameters[] = {id};

        AzureDatabaseConnector.execute(SQL, parameters);
    }
}
