package DAOPackage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import DBPackage.DatabaseConnector;

import JavaBeans.ReferenceBean;

public class ReferenceDAO {
	
	public void doSave(ReferenceBean reference)throws SQLException {
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("insert into Riferimento values (?, ?, ?)");
		state.setInt(1,reference.getOrderCode());
		state.setInt(2,reference.getProductCode());
		state.setInt(3,reference.getQuantity());
		state.executeUpdate();
		connector.closeConnection();
		
	}
	
	public void doDelete(ReferenceBean reference) throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement deleteRecord = connector.getJdbcConnection()
				.prepareStatement("delete from Riferimento where codice = ? AND prodotto = ?");
		deleteRecord.setInt(1,reference.getOrderCode());
		deleteRecord.setInt(2,reference.getProductCode());
		deleteRecord.executeUpdate();
		
		connector.closeConnection();
	}
	
	public ArrayList<ReferenceBean> doRetrieveAll() throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement stateAll = connector.getJdbcConnection()
				.prepareStatement("SELECT * FROM Riferimento");
		ResultSet container = stateAll.executeQuery();
		ArrayList<ReferenceBean> allBeans = new ArrayList<ReferenceBean>();
		while(container.next()==true) {
			int orderCode;
			int productCode;
			int quantity;
			
			orderCode=container.getInt("codice");
			productCode=container.getInt("prodotto");
			quantity=container.getInt("quantita");
			
			ReferenceBean ref=new ReferenceBean();
			ref.setOrderCode(orderCode);
			ref.setProductCode(productCode);
			ref.setQuantity(quantity);
			allBeans.add(ref);
		}
		
		if (allBeans.size()==0) {
			connector.closeConnection();
			return null;
		}
		
		connector.closeConnection();
		return allBeans;
		
		
	}
	
	public ArrayList<ReferenceBean> doRetrieveByOrderCode(int order) throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement stateAll = connector.getJdbcConnection()
				.prepareStatement("SELECT * FROM Riferimento where codice = ?");
		stateAll.setInt(1, order);
		ResultSet container = stateAll.executeQuery();
		ArrayList<ReferenceBean> allBeans = new ArrayList<ReferenceBean>();
		while(container.next()==true) {
			int orderCode;
			int productCode;
			int quantity;
			
			orderCode=container.getInt("codice");
			productCode=container.getInt("prodotto");
			quantity=container.getInt("quantita");
			
			ReferenceBean ref=new ReferenceBean();
			ref.setOrderCode(orderCode);
			ref.setProductCode(productCode);
			ref.setQuantity(quantity);
			allBeans.add(ref);
		}
		
		if (allBeans.size()==0) {
			connector.closeConnection();
			return null;
		}
		
		connector.closeConnection();
		return allBeans;
	}

}
