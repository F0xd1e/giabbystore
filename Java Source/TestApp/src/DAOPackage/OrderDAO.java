package DAOPackage;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBPackage.DatabaseConnector;
import JavaBeans.OrderBean;
import JavaBeans.UserBean;

public class OrderDAO {

	public OrderDAO(){}
	
	//salva UserBean nel database
	public void doSave(OrderBean order) throws SQLException {

		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("insert into Ordine values (?, ?, ?, ?, ?, ?, ?)");
		state.setInt(1, order.getOrderCode());
		state.setDate(2, order.getOrderDate());
		state.setDate(3, order.getShipmentDate());
		state.setDouble(4, order.getShipmentPrice());
		state.setDouble(5, order.getTotalPrice());;
		state.setString(6, order.getPaymentCode());
		state.setString(7, order.getUsername());
		state.executeUpdate();
		connector.closeConnection();
		
	}
	
	//elimina l'orderBean
	public void doDelete(OrderBean order) throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement deleteRecord = connector.getJdbcConnection()
				.prepareStatement("delete from Ordine where codiceOrdine = ?");
		
		deleteRecord.setInt(1, order.getOrderCode());
		deleteRecord.executeUpdate();
		connector.closeConnection();
	}
	
	public ArrayList<OrderBean> doRetrieveAll_byUser(UserBean user) throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement stateAll = connector.getJdbcConnection()
				.prepareStatement("SELECT * FROM Ordine WHERE utente = ?");
		stateAll.setString(1, user.getUsername());
		ResultSet container = stateAll.executeQuery();
		ArrayList<OrderBean> allBeans = new ArrayList<OrderBean>();
		
		while(container.next()==true) {
			
			//get datas from ArrayList
			int orderCode = container.getInt("codiceOrdine");
			Date orderDate = container.getDate("dataOrdine");
			Date shipmentDate = container.getDate("dataArrivo");
			double shipmentPrice = container.getDouble("prezzoSpedizione");
			double totalPrice = container.getDouble("prezzoTotale");
			String paymentCode = container.getString("codicePagamento");
			String username = container.getString("utente");
			OrderBean orderToReturn = new OrderBean();
			orderToReturn.setOrderCode(orderCode);
			orderToReturn.setOrderDate(orderDate);
			orderToReturn.setShipmentDate(shipmentDate);
			orderToReturn.setShipmentPrice(shipmentPrice);
			orderToReturn.setTotalPrice(totalPrice);
			orderToReturn.setPaymentCode(paymentCode);
			orderToReturn.setUsername(username);
			allBeans.add(orderToReturn);
			
		}
			
		if (allBeans.size()==0) {
			connector.closeConnection();
			return null;
		}
		
		connector.closeConnection();
		return allBeans;
		
	}
	
}
