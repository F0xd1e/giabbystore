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
				.prepareStatement("insert into Riferimento values (?, ?)");
		state.setInt(1,reference.getOrderCode());
		state.setInt(2,reference.getProductCode());
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
	
	public void doSaveOrUpdate(ReferenceBean reference) throws SQLException{
		
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement myState = connector.getJdbcConnection()
				.prepareStatement("delete from Riferimento where codice = ? AND prodotto = ?");
		ResultSet all=myState.executeQuery();
		PreparedStatement state = null;
		if(all.next()==false) {
			state = connector.getJdbcConnection()
					.prepareStatement("insert into Riferimento values (?, ?)");
			state.setInt(1,reference.getOrderCode());
			state.setInt(2,reference.getProductCode());
			state.executeUpdate();
		}
		else {
			state=connector.getJdbcConnection()
					.prepareStatement("update Prodotto set codice = ? AND prodotto = ?");
			state.setInt(1,reference.getOrderCode());
			state.setInt(2,reference.getProductCode());
			state.executeUpdate();
		}
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
			
			orderCode=container.getInt("codice");
			productCode=container.getInt("product");
			
			ReferenceBean ref=new ReferenceBean();
			ref.setOrderCode(orderCode);
			ref.setProductCode(productCode);
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
