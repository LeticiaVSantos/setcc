package br.com.fatecpg.setcc;

import java.util.ArrayList;

public class Project {
    private Long id;
    private String name;
    private Long idStudent;
    private Long idProfessor;
    private Long idSeason;
    private String pdfProject;
    
    public Project(Long id, String name, Long idStudent, Long idProfessor, Long idSeason, String pdfProject) {
        this.id = id;
        this.name = name;
        this.idStudent = idStudent;
        this.idProfessor = idProfessor;
        this.idSeason = idSeason;
        this.pdfProject = pdfProject;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getIdStudent() {
        return idStudent;
    }

    public void setIdStudent(Long idStudent) {
        this.idStudent = idStudent;
    }

    public Long getIdProfessor() {
        return idProfessor;
    }

    public void setIdProfessor(Long idProfessor) {
        this.idProfessor = idProfessor;
    }

    public Long getIdSeason() {
        return idSeason;
    }

    public void setIdSeason(Long idSeason) {
        this.idSeason = idSeason;
    }

    public String getPdfProject() {
        return pdfProject;
    }

    public void setPdfProject(String pdfProject) {
        this.pdfProject = pdfProject;
    }

    public static ArrayList<Project> getProjects() throws Exception {
        String SQL = "SELECT * FROM teste.projects";
        ArrayList<Project> projects = new ArrayList<>();
        ArrayList<Object[]> list = AzureDatabaseConnector.getQuery(SQL, new Object[]{});

        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            Project p = new Project (
                    new Long((int) row[0])
                    , (String) row[1]
                    , new Long((int)row[2])
                    , new Long((int)row[3])
                    , new Long((int)row[4])
                    , (String) row[5]
            );

            projects.add(p);

        }

        return projects;

    }

    public static void addProject(String name, Long idStudent, Long idProfessor, Long idSeason, String pdfProject) {
        String SQL = "INSERT INTO teste.projects VALUES (" +
                " ?" +
                ", ?" +
                ", ?" +
                ", ?" +
                ", ?" +
                ")";

        Object parameters[] = {name, idStudent, idProfessor, idSeason, pdfProject};

        try {
            AzureDatabaseConnector.execute(SQL, parameters);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void altProject(Long id, String name, Long idStudent, Long idProfessor, Long idSeason, String pdfProject) {
        String SQL = "UPDATE teste.projects SET " +
                "nm_temaProject = '" + name +
                "', id_student = " + idStudent +
                ", id_professor = " + idProfessor +
                ", id_season = " + idSeason +
                ", pdf_project = '" + pdfProject + "'" +
                " WHERE id_project = " + id;
    }

    public static void removeProject(Long id) throws Exception {
        String SQL = "DELETE FROM teste.projects WHERE id_project = ?";

        Object parameters[] = {id};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

}
