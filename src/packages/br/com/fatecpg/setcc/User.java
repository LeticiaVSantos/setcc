package br.com.fatecpg.setcc;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;

public class User {
    private Long id;
    private String name;
    private String login;
    private String passwordHash;
    private String tipoDeUsuario;

    public User() {

    }

    public User(Long id) {
        this.id = id;
    }

    public User(Long id, String name, String login, String passwordHash, String tipoDeUsuario) {
        this.id = id;
        this.name = name;
        this.login = login;
        this.passwordHash = passwordHash;
        this.tipoDeUsuario = tipoDeUsuario;
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

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getTipoDeUsuario() {
        return tipoDeUsuario;
    }

    public void setTipoDeUsuario(String tipoDeUsuario) {
        this.tipoDeUsuario = tipoDeUsuario;
    }

    @Nullable
    public static User getUser(String login, @NotNull String pass) throws Exception {
        String SQL = "SELECT * FROM teste.users WHERE nm_email_login = ? AND nr_senha_user = ?";
        Object parameters[] = {login, pass.hashCode()};
        ArrayList<Object[]> list = AzureDatabaseConnector.getQuery(SQL, parameters);

        if (list.isEmpty()) {
            return null;
        } else {
            Object row[] = list.get(0);
            User u = new User (
                    new Long((int)row[0])
                    , (String) row[1]
                    , (String) row[2]
                    , (String) row[3]
                    , (String) row[4]
            );

            return u;
        }
    }

    public static ArrayList<User> getUsers() throws Exception {
        String SQL = "SELECT * FROM teste.users";
        ArrayList<User> users = new ArrayList<>();
        ArrayList<Object[]> list = AzureDatabaseConnector.getQuery(SQL, new Object[]{});

        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            User u = new User (
                    new Long((int)row[0])
                    , (String) row[1]
                    , (String) row[2]
                    , (String) row[3]
                    , (String) row[4]
            );

            users.add(u);

        }

        return users;

    }

    public static void addUser(String name, String login, String passwordHash, String tipoDeUsuario) throws Exception {
        String SQL = "INSERT INTO teste.users VALUES (" +
                " ?" +
                ", ?" +
                ", ?" +
                ", ?" +
                ")";
        Object parameters[] = {name, login, passwordHash, tipoDeUsuario};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

    public static void altUser(Long id, String name, String login, String tipoDeUsuario) throws Exception {
        String SQL = "UPDATE teste.users SET " +
                "nm_user = '?'" +
                ", nm_email_login = '?'" +
                ", tp_user = '?'" +
                "WHERE id_user = " + id;
        Object parameters[] = {name, login, tipoDeUsuario};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

    public static void removeUser(Long id) throws Exception {
        String SQL = "DELETE FROM teste.users WHERE id_user = ?";
        Object parameters[] = {id};

        AzureDatabaseConnector.execute(SQL, parameters);
    }

    public static User returnUserID (String login) throws Exception {
        String SQL = "SELECT id_user FROM teste.users WHERE nm_email_login = '" + login + "'";
        ArrayList<Object[]> list = AzureDatabaseConnector.getQuery(SQL, new Object[]{});

        Object row[] = list.get(0);
        User u = new User (
                new Long((int)row[0])
        );

        return u;
    }
}
