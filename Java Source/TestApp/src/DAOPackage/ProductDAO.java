package DAOPackage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBPackage.DatabaseConnector;
import JavaBeans.ProductBean;

public class ProductDAO {

	/*
	 * Nel caso si debba eliminare un prodotto in base al suo codice, basta istanziare un ProductBean dandogli solo il valore codice prodotto
	 * */
	
	//salva ProductBean nel database
	public void doSave(ProductBean prod) throws SQLException {

		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("insert into Prodotto values (?, ?, ?, ?, ?, ?, ?, ?)");

		state.setString(1, prod.getProductCode());
		state.setString(2, prod.getTitle());
		state.setString(3, prod.getDescription());
		state.setString(4, prod.getTipology());
		state.setDouble(5, prod.getPrice());
		state.setInt(6, prod.getAvailability());
		state.setInt(7, prod.getShipment());
		state.setString(8, prod.getImgPath());
		state.executeUpdate();
		connector.closeConnection();

	}
	
	//salva ProductBean nel database: se esiste gi�, lo sovrascrive
	public void doSaveOrUpdate(ProductBean prod) throws SQLException {

		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("SELECT codiceProdotto FROM Prodotto WHERE codiceProdotto LIKE ?");
		state.setString(1, prod.getProductCode());
		ResultSet result = state.executeQuery();
		if (result.next()==false) {
			//nel caso non esista il record
			PreparedStatement myState = null;
			myState = connector.getJdbcConnection()
					.prepareStatement("insert into Prodotto values (?, ?, ?, ?, ?, ?, ?, ?)");

			myState.setString(1, prod.getProductCode());
			myState.setString(2, prod.getTitle());
			myState.setString(3, prod.getDescription());
			myState.setString(4, prod.getTipology());
			myState.setDouble(5, prod.getPrice());
			myState.setInt(6, prod.getAvailability());
			myState.setInt(7, prod.getShipment());
			myState.setString(8, prod.getImgPath());
			myState.executeUpdate();
		} else {
			//nel caso gi� esista va aggiornato
			PreparedStatement myState = connector.getJdbcConnection()
					.prepareStatement("update Prodotto set codiceProdotto = ? AND titolo = ? AND descrizione = ? AND tipologia = ? AND " +
							"prezzo = ? AND disponibilit� = ? AND spedizione = ? AND imgPath = ?" +
							"where codiceProdotto = ?");
			myState.setString(1, prod.getProductCode());
			myState.setString(2, prod.getTitle());
			myState.setString(3, prod.getDescription());
			myState.setString(4, prod.getTipology());
			myState.setDouble(5, prod.getPrice());
			myState.setInt(6, prod.getAvailability());
			myState.setInt(7, prod.getShipment());
			myState.setString(8, prod.getImgPath());
			myState.setString(9, prod.getProductCode());
			myState.executeUpdate();
		}
		connector.closeConnection();
	}

	//elimina lo ProductBean
	public void doDelete(ProductBean prod) throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement deleteRecord = connector.getJdbcConnection()
				.prepareStatement("delete from Prodotto where codiceProdotto = ?");
		
		deleteRecord.setString(1, prod.getProductCode());
		deleteRecord.executeUpdate();
		connector.closeConnection();
	}
	
	//restituisce tutti gli ProductBean del database
	public ArrayList<ProductBean> doRetrieveAll() throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement stateAll = connector.getJdbcConnection()
				.prepareStatement("SELECT * FROM Prodotto");
		ResultSet container = stateAll.executeQuery();
		ArrayList<ProductBean> allBeans = new ArrayList<ProductBean>();
		
		while(container.next()==true) {
			
			String codiceProdotto = container.getString("codiceProdotto");
			String titolo = container.getString("titolo");
			String descrizione = container.getString("descrizione");
			String tipologia = container.getString("tipologia");
			double prezzo = container.getDouble("prezzo");
			int disp = container.getInt("disponibilit�");
			int spedizione = container.getInt("spedizione");
			String imgPath = container.getString("imgPath");
			ProductBean prod = new ProductBean();
			prod.setProductCode(codiceProdotto);
			prod.setTitle(titolo);
			prod.setDescription(descrizione);
			prod.setTipology(tipologia);
			prod.setPrice(prezzo);
			prod.setAvailability(disp);
			prod.setShipment(spedizione);
			prod.setImgPath(imgPath);
			allBeans.add(prod);
			
		}
			
		if (allBeans.size()==0) {
			connector.closeConnection();
			return null;
		}
		
		connector.closeConnection();
		return allBeans;
		
	}
	
	public ProductBean doRetrieveProductByID(String id) throws SQLException {
		ProductBean prod=null;
		DatabaseConnector conn=new DatabaseConnector();
		conn.startConnection();
		PreparedStatement stateAll = conn.getJdbcConnection()
				.prepareStatement("SELECT * FROM Prodotto WHERE codiceProdotto = ?");
		stateAll.setString(1, id);
		ResultSet container = stateAll.executeQuery();
		if(container.next()!=false) {
			String productCode=container.getString("codiceProdotto"), title=container.getString("titolo"), description=container.getString("descrizione"), tipology=container.getString("tipologia"), imgPath=container.getString("imgPath");
			double price=container.getDouble("prezzo");
			int availability=container.getInt("disponibilità"), shipment=container.getInt("spedizione");
			prod=new ProductBean();
			prod.setProductCode(productCode);
			prod.setTitle(title);
			prod.setDescription(description);
			prod.setTipology(tipology);
			prod.setImgPath(imgPath);
			prod.setPrice(price);
			prod.setAvailability(availability);
			prod.setShipment(shipment);
		}
			
		return prod;
	}
	
}