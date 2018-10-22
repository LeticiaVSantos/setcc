package br.com.fatecpg.setcc;

import java.util.ArrayList;

public class Student {
    private Long id;
    private String RA;
    private Long idUser;
    private Long idPeriod;

    public Student(Long id, String RA, Long idUser, Long idPeriod) {
        this.id = id;
        this.RA = RA;
        this.idUser = idUser;
        this.idPeriod = idPeriod;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRA() {
        return RA;
    }

    public void setRA(String RA) {
        this.RA = RA;
    }

    public Long getIdUser() {
        return idUser;
    }

    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    }

    public Long getIdPeriod() {
        return idPeriod;
    }

    public void setIdPeriod(Long idPeriod) {
        this.idPeriod = idPeriod;
    }

    public static ArrayList<Student> getStudents() throws Exception {
        String SQL = "SELECT * FROM teste.students";
        ArrayList<Student> students = new ArrayList<>();
        ArrayList<Object[]> list = AzureDatabaseConnector.getQuery(SQL, new Object[]{});

        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            Student s = new Student(
                    new Long((int)row[0])
                    ,(String) row[1]
                    , new Long((int)row[2])
                    , new Long((int)row[3])
            );

            students.add(s);

        }

        return students;

    }

    public static void addStudent(String ra, Long idUser, Long idPeriod) throws Exception {
        String SQL = "INSERT INTO teste.students VALUES (" +
                " '" + ra +
                "', ?" +
                ", ?)";

        Object parameters[] = {idUser, idPeriod};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

    public static void altStudent(Long id, String ra) throws Exception {
        String SQL = "UPDATE teste.students SET " +
                "cd_ra = '" + ra +
                "' WHERE id_student = " + id;

        Object parameters[] = {ra};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

    public static void removeStudent(Long id) throws Exception {
        String SQL = "DELETE FROM teste.students WHERE id_user = ?";

        Object parameters[] = {id};

        AzureDatabaseConnector.execute(SQL, parameters);
    }
}
