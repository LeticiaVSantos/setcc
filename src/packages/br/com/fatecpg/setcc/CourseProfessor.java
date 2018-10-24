package br.com.fatecpg.setcc;

import java.util.ArrayList;

public class CourseProfessor {
    private Long id;
    private Long idProfessor;
    private Long idCourse;

    public CourseProfessor(Long id, Long idProfessor, Long idCourse) {
        this.id = id;
        this.idProfessor = idProfessor;
        this.idCourse = idCourse;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdProfessor() {
        return idProfessor;
    }

    public void setIdProfessor(Long idProfessor) {
        this.idProfessor = idProfessor;
    }

    public Long getIdCourse() {
        return idCourse;
    }

    public void setIdCourse(Long idCourse) {
        this.idCourse = idCourse;
    }

    public static ArrayList<CourseProfessor> getCourseProfessors() throws Exception {
        String SQL = "SELECT * FROM teste.courseProfessors";
        ArrayList<CourseProfessor> courseProfessors = new ArrayList<>();
        ArrayList<Object[]> list = AzureDatabaseConnector.getQuery(SQL, new Object[]{});

        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            CourseProfessor cp = new CourseProfessor(
                    new Long((int) row[0])
                    , new Long((int) row[1])
                    , new Long((int) row[2])
            );

            courseProfessors.add(cp);

        }

        return courseProfessors;

    }

    public static void addCourseProfessor(Long idProfessor, Long idCourse) throws Exception {
        String SQL = "INSERT INTO teste.courseProfessors VALUES (" +
                "?" +
                ", ?)";

        Object parameters[] = {idProfessor, idCourse};

        AzureDatabaseConnector.execute(SQL, parameters);
    }
}
