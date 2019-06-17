package DAOPackage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBPackage.DatabaseConnector;
import JavaBeans.CartBean;
import JavaBeans.UserBean;

public class CartDAO {

	//salva CartBean nel database
	public void doSave(CartBean cart) throws SQLException {

		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("insert into Carrello values (?, ?)");

		state.setString(1, cart.getUserCode());
		state.setString(2, cart.getProductCode());
		
		state.executeUpdate();
		connector.closeConnection();

	}

	//elimina il CartBean
	public void doDelete(CartBean cart) throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement deleteRecord = connector.getJdbcConnection()
				.prepareStatement("delete from Prodotto where utente = ? AND prodotto = ?");
		
		deleteRecord.setString(1, cart.getUserCode());
		deleteRecord.setString(2, cart.getProductCode());
		deleteRecord.executeUpdate();
		connector.closeConnection();
	}
	
	//restituisce tutti gli CartBean del database
	public ArrayList<CartBean> doRetrieveAll_byUser(UserBean user) throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement stateAll = connector.getJdbcConnection()
				.prepareStatement("SELECT * FROM Carrello WHERE utente = ?");
		stateAll.setString(1, user.getUsername());
		ResultSet container = stateAll.executeQuery();
		ArrayList<CartBean> allBeans = new ArrayList<CartBean>();
		
		while(container.next()==true) {
			
			String username = container.getString("utente");
			String prodotto = container.getString("prodotto");
			CartBean cartToReturn = new CartBean();
			cartToReturn.setUserCode(username);
			cartToReturn.setProductCode(prodotto);
			allBeans.add(cartToReturn);

		}
			
		if (allBeans.size()==0) {
			connector.closeConnection();
			return null;
		}
		
		connector.closeConnection();
		return allBeans;
		
	}
	
}