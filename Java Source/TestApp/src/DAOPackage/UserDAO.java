package DAOPackage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBPackage.DatabaseConnector;
import JavaBeans.UserBean;

public class UserDAO {

	/*
	 * Nel caso si debba eliminare un utente in base al suo username, basta istanziare uno UserBean dandogli solo il valore username
	 * */
	
	public UserBean doRetrieveByUsername(String userName) throws SQLException {

		UserBean uBean=new UserBean();
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("select * from Utente WHERE username = ?");
		
		state.setString(1, userName);
		
		ResultSet container =state.executeQuery();
		
		if(container.next()==false) {
			uBean= null;
		}
		else {
			String username=container.getString("username"), password=container.getString("password"), name=container.getString("nome"), surname=container.getString("cognome"), address=container.getString("indirizzo"), city=container.getString("citta"), cap=container.getString("cap"), nation=container.getString("nazione"), phone=container.getString("cellulare"), email=container.getString("email");
			boolean isAdmin=container.getBoolean("isAdmin"), canAccess=container.getBoolean("canAccess");
			uBean.setUsername(username);
			uBean.setAddress(address);
			uBean.setAdmin(isAdmin);
			uBean.setCanAccess(canAccess);
			uBean.setCap(cap);
			uBean.setCity(city);
			uBean.setEmail(email);
			uBean.setName(name);
			uBean.setNation(nation);
			uBean.setPassword(password);
			uBean.setPhone(phone);
			uBean.setSurname(surname);
			
		}
		
		connector.closeConnection();
		return uBean;
	}
	
	public void doSave(UserBean usr) throws SQLException {

		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("insert into Utente values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

		state.setString(1, usr.getUsername());
		state.setString(2, usr.getPassword());
		state.setString(3, usr.getName());
		state.setString(4, usr.getSurname());
		state.setString(5, usr.getAddress());
		state.setString(6, usr.getCity());
		state.setString(7, usr.getCap());
		state.setString(8, usr.getNation());
		state.setString(9, usr.getPhone());
		state.setString(10, usr.getEmail());
		state.setBoolean(11, usr.isAdmin());
		state.setBoolean(12, usr.isCanAccess());
		state.executeUpdate();
		connector.closeConnection();

	}
	
	//salva UserBean nel database: se esiste gi�, lo sovrascrive
	public void doSaveOrUpdate(UserBean usr) throws SQLException {

		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("SELECT username FROM Utente WHERE username LIKE ?");
		state.setString(1, usr.getUsername());
		ResultSet result = state.executeQuery();
		if (result.next()==false) {
			//nel caso non esista il record
			PreparedStatement myState = null;
			myState = connector.getJdbcConnection()
					.prepareStatement("insert into Utente values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			myState.setString(1, usr.getUsername());
			myState.setString(2, usr.getPassword());
			myState.setString(3, usr.getName());
			myState.setString(4, usr.getSurname());
			myState.setString(5, usr.getAddress());
			myState.setString(6, usr.getCity());
			myState.setString(7, usr.getCap());
			myState.setString(8, usr.getNation());
			myState.setString(9, usr.getPhone());
			myState.setString(10, usr.getEmail());
			myState.setBoolean(11, usr.isAdmin());
			myState.setBoolean(12, usr.isCanAccess());
			myState.executeUpdate();
		} else {
			//nel caso gi� esista va aggiornato
			PreparedStatement updateQuery = connector.getJdbcConnection()
					.prepareStatement("update Utente set username = ? , nome = ? , cognome = ? , indirizzo = ? , citta = ? , cap = ? , nazione = ? , cellulare = ? , email = ? , isAdmin = ? , canAccess = ? where username = ?");
			updateQuery.setString(1, usr.getUsername());
		
			updateQuery.setString(2, usr.getName());
			updateQuery.setString(3, usr.getSurname());
			updateQuery.setString(4, usr.getAddress());
			updateQuery.setString(5, usr.getCity());
			updateQuery.setString(6, usr.getCap());
			updateQuery.setString(7, usr.getNation());
			updateQuery.setString(8, usr.getPhone());
			updateQuery.setString(9, usr.getEmail());
			updateQuery.setBoolean(10, usr.isAdmin());
			updateQuery.setBoolean(11, usr.isCanAccess());
			updateQuery.setString(12, usr.getUsername());
			updateQuery.executeUpdate();
		}
		connector.closeConnection();
	}

	//elimina lo UserBean
	public void doDelete(UserBean usr) throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement deleteRecord = connector.getJdbcConnection()
				.prepareStatement("delete from Utente where username = ?");
		
		deleteRecord.setString(1, usr.getUsername());
		deleteRecord.executeUpdate();
		connector.closeConnection();
	}
	
	//restituisce tutti gli UserBean del database
	public ArrayList<UserBean> doRetrieveAll() throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement stateAll = connector.getJdbcConnection()
				.prepareStatement("SELECT * FROM Utente");
		ResultSet container = stateAll.executeQuery();
		ArrayList<UserBean> allBeans = new ArrayList<UserBean>();
		
		while(container.next()==true) {
			
			String username = container.getString("username");
			String password = container.getString("password");
			String nome = container.getString("nome");
			String cognome = container.getString("cognome");
			String indirizzo = container.getString("indirizzo");
			String citta = container.getString("citta");
			String cap = container.getString("cap");
			String nazione = container.getString("nazione");
			String cellulare = container.getString("cellulare");
			String email = container.getString("email");
			boolean isAdmin = container.getBoolean("isAdmin");
			boolean canAccess = container.getBoolean("canAccess");
			UserBean user = new UserBean();
			user.setUsername(username);
			user.setPassword(password);
			user.setName(nome);
			user.setSurname(cognome);
			user.setAddress(indirizzo);
			user.setCity(citta);
			user.setCap(cap);
			user.setNation(nazione);
			user.setPhone(cellulare);
			user.setEmail(email);
			user.setAdmin(isAdmin);
			user.setCanAccess(canAccess);
			allBeans.add(user);
			
		}
			
		if (allBeans.size()==0) {
			connector.closeConnection();
			return null;
		}
		
		connector.closeConnection();
		return allBeans;
		
	}

	public String checkUserExistence(String username, String password) throws SQLException, ClassNotFoundException, InstantiationException {

		DatabaseConnector conn = new DatabaseConnector();
		conn.startConnection();
		PreparedStatement state = conn.getJdbcConnection().prepareStatement("SELECT * FROM Utente WHERE username LIKE ? AND password LIKE ?");
		state.setString(1, username);
		state.setString(2, password);

		ResultSet container = state.executeQuery();

		if (container.next() == true)
			return username;
		else
			return null;

	}
	
	
	public boolean checkUserSecurityClearance(String username) throws SQLException {
		
		DatabaseConnector conn = new DatabaseConnector();
		conn.startConnection();
		PreparedStatement state = conn.getJdbcConnection().prepareStatement("SELECT isAdmin FROM Utente WHERE username LIKE ?");
		state.setString(1, username);
		
		ResultSet container = state.executeQuery();
		
		if (container.next() == false)	{
			System.out.println("FATAL ERROR: empty resultset in servlet checkUserSecurityClearance, contact technical support asap.");
			System.exit(-1);
		}
		
		boolean result = container.getBoolean("isAdmin");
		return result;
		
	}
	
	
	public boolean checkUserAccessPermit(String username) throws SQLException {
		
		
		DatabaseConnector conn = new DatabaseConnector();
		conn.startConnection();
		PreparedStatement state = conn.getJdbcConnection().prepareStatement("SELECT canAccess FROM Utente WHERE username LIKE ?");
		state.setString(1, username);
		ResultSet container = state.executeQuery();
		if (container.next() == false)	{
			System.out.println("FATAL ERROR: empty resultset in servlet checkUserAccessPermit, contact technical support asap.");
			System.exit(-1);
		}
		
		
		boolean result = container.getBoolean("canAccess");
		return result;
		
	}

	
}