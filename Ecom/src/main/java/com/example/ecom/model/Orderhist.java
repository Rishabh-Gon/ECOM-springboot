package com.example.ecom.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Orderhist {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String productname;
	
	private Double productprice;
	
	private String productdesc;
	
	private String sellername;
	
	private String custname;
	
	private int selrid;
	
	private int custid;
	
	private int bqty;
	
	private String datetime;
	
	private Double taken;
	
	private Double refunded;
	
	public Orderhist() {
		
	}
	
	public Orderhist(String pname, Double pprice, String pdesc, String sname, String cname, int slrid, int custid, int bqty, Double take, Double refu) {
		this.productname=pname;
		this.productprice=pprice;
		this.productdesc=pdesc;
		this.sellername=sname;
		this.selrid=slrid;
		this.custid=custid;
		this.custname=cname;
		this.bqty=bqty;
		this.taken=take;
		this.refunded=refu;
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		this.datetime=now.format(formatter);
	}

	public int getId() {
		return id;
	}

	public String getProductname() {
		return productname;
	}

	public Double getProductprice() {
		return productprice;
	}

	public String getProductdesc() {
		return productdesc;
	}

	public String getSellername() {
		return sellername;
	}

	public int getSelrid() {
		return selrid;
	}

	public int getCustid() {
		return custid;
	}

	public int getBqty() {
		return bqty;
	}

	public String getDatetime() {
		return datetime;
	}

	public String getCustname() {
		return custname;
	}

	public Double getTaken() {
		return taken;
	}

	public Double getRefunded() {
		return refunded;
	}	

}
