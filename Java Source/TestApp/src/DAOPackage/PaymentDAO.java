package DAOPackage;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBPackage.DatabaseConnector;
import JavaBeans.PaymentBean;


public class PaymentDAO {
	
	public void doSave(PaymentBean payment)throws SQLException {
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("insert into Pagamento values (?, ?, ?, ?, ?)");
		state.setString(1, payment.getCardCode());
		state.setString(5, payment.getUserCode());
		state.setString(3, payment.getUserName());
		state.setString(4, payment.getUserSurname());
		state.setDate(2,(Date)payment.getExpiryDate());
		state.executeUpdate();
	}
	
	public void doDelete(PaymentBean payment) throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("delete from Pagamento where codiceCarta = ? ");
		state.setString(1,payment.getCardCode());
		state.executeUpdate();
		connector.closeConnection();
	}
	
	public void doSaveOrUpdate(PaymentBean payment) throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("SELECT codiceCarta FROM Pagamento WHERE codiceCarta LIKE ?");
		state.setString(1, payment.getCardCode());
		ResultSet result = state.executeQuery();
		PreparedStatement state1 = null;
		if(result.next()==false) {
			state1 = connector.getJdbcConnection()
					.prepareStatement("insert into Pagamento values (?, ?, ?, ?, ?)");
			state1.setString(1, payment.getCardCode());
			state1.setString(5, payment.getUserCode());
			state1.setString(3, payment.getUserName());
			state1.setString(4, payment.getUserSurname());
			state1.setDate(2,(Date)payment.getExpiryDate());
			state1.executeUpdate();
		}
		else {
			state1 = connector.getJdbcConnection()
			.prepareStatement("update Prodotto set codiceCarta = ? AND dataScadenza = ? AND nome = ? AND cognome = ? AND utente = ?");
			state1.setString(1, payment.getCardCode());
			state1.setDate(2,(Date)payment.getExpiryDate());
			state1.setString(3, payment.getUserName());		
			state1.setString(4, payment.getUserSurname());
			state1.setString(2, payment.getUserCode());
			
			state1.executeUpdate();
		}
		connector.closeConnection();
	}
	
	public ArrayList<PaymentBean> doRetrieveAll() throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement stateAll = connector.getJdbcConnection()
				.prepareStatement("SELECT * FROM Pagamento");
		ResultSet container = stateAll.executeQuery();
		ArrayList<PaymentBean> allBeans = new ArrayList<PaymentBean>();
		while(container.next()==true) {
			String cardCode, userName, userSurname, userCode;
			Date expiryDate;
			
			PaymentBean payment=new PaymentBean();
			cardCode=container.getString("codiceCarta");
			userName=container.getString("nome");
			userSurname=container.getString("cognome");
			userCode=container.getString("utente");
			expiryDate=container.getDate("dataScadenza");
			payment.setCardCode(cardCode);
			payment.setExpiryDate(expiryDate);
			payment.setUserCode(userCode);
			payment.setUserName(userName);
			payment.setUserSurname(userSurname);
			allBeans.add(payment);
			
		}
		
		if (allBeans.size()==0) {
			connector.closeConnection();
			return null;
		}
		
		connector.closeConnection();
		return allBeans;
		
	}
}
