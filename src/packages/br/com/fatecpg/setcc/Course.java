package br.com.fatecpg.setcc;

import java.util.ArrayList;

public class Course {
    private Long id;
    private String nameCourse;
    private Long idSeason;

    public Course(Long id, String nameCourse, Long idSeason) {
        this.id = id;
        this.nameCourse = nameCourse;
        this.idSeason = idSeason;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNameCourse() {
        return nameCourse;
    }

    public void setNameCourse(String nameCourse) {
        this.nameCourse = nameCourse;
    }

    public Long getIdSeason() {
        return idSeason;
    }

    public void setIdSeason(Long idSeason) {
        this.idSeason = idSeason;
    }

    public static ArrayList<Course> getCourses() throws Exception  {
        String SQL = "SELECT * FROM teste.courses";
        ArrayList<Course> courses = new ArrayList<>();
        ArrayList<Object[]> list = AzureDatabaseConnector.getQuery(SQL, new Object[]{});

        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            Course c = new Course(
                    new Long((int)row[0])
                    , (String) row[1]
                    , new Long((int)row[2])
            );

            courses.add(c);

        }

        return courses;

    }

    public static void addCourse(String nameCourse, Long idSeason) throws  Exception {
        String SQL = "INSERT INTO teste.courses VALUES (" +
                " '" + nameCourse +
                "' , ?)";

        Object parameters[] = {idSeason};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

    public static void altCourse(Long id, String nameCourse) throws Exception {
        String SQL = "UPDATE teste.courses SET " +
                "nm_course = '" + nameCourse +
                "' WHERE id_course = " + id;

        Object parameters[] = {};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

    public static void removeCourse(Long id) throws Exception {
        String SQL = "DELETE FROM teste.courses WHERE id_course = ?";

        Object parameters[] = {id};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

}
