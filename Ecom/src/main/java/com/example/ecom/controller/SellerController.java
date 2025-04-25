package com.example.ecom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.ecom.model.Product;
import com.example.ecom.model.Seller;
import com.example.ecom.service.ProductRepo;
import com.example.ecom.service.SellerRepo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class SellerController {
	
	@Autowired
	private SellerRepo srepo;
	
	@Autowired
	private ProductRepo prepo;

	@RequestMapping("/seller_login")
	public String seller_login() {
		return "seller_login";
	}
	
	@RequestMapping("/register_seller")
	public String register_seller() {
		return "register_seller";
	}
	
	@RequestMapping("/logout_seller")
	public String logout_seller() {
		return "logout_seller";
	}
	
	@RequestMapping("/seller_add_product")
	public String seller_add_product() {
		return "seller_add_product";
	}
	
	@RequestMapping("/RegisterSeller")
	public String RegisterSeller(@RequestParam("seller_name")String sname,
			@RequestParam("seller_mail")String smail,@RequestParam("seller_password")String spass,
			@RequestParam("seller_re_password")String sconfpass, ModelMap model ) 
	{
		if(spass.equals(sconfpass)==false) {											//passwords don't match
			model.addAttribute("msg", "pfail");			
		}
		else if(srepo.existsByEmail(smail)) {								//email already exists
			model.addAttribute("msg", "mxstfail");
		}
		//else if() {									//email format may not be correct		
		//}
		else {
			Seller s=new Seller(sname, smail, spass);
			srepo.save(s); 			
			model.addAttribute("msg", "success");
		}
		return "register_seller";
	}
	
	@RequestMapping("/slctslrhmprod")
	public String slctslrhmprod(@RequestParam("prod_id")int pid, HttpSession session) {
		Product p=prepo.findById(pid);
		session.setAttribute("prod_edit_quant", p);
		return "editquantsellr";
	}
	
	@RequestMapping("/editsellrproddet")
	public String editsellrproddet(@RequestParam("prod_id")int pid, HttpSession session) {
		Product p=prepo.findById(pid);
		session.setAttribute("prod_edit", p);
		return "selreddet";
	}
	
	@RequestMapping("/selreddet")
	public String selreddet() {
		return "selreddet";		
	}
	
	@RequestMapping("/EdtProductSelr")
	public String EdtProductSelr(@RequestParam("prod_name")String pname, @RequestParam("prod_quant")String pquant,
			@RequestParam("product_price")String pprice,@RequestParam("product_pd")String ppd, 
			HttpServletRequest request,HttpSession session) {
		Product p=(Product)session.getAttribute("prod_edit");
		request.setAttribute("msg", "Success");
		if(ppd.length()!=0) {
			p.setPd(ppd);
		}
		if(pname.length()!=0) {
			p.setName(pname);
		}
		if(pprice.length()!=0) {
			try {
				double price=Double.parseDouble(pprice);
				p.setPrice(price);
			}
			catch(NumberFormatException e) {
				request.setAttribute("msg", "Price must be a numerical value");				
			}
		}
		if(pquant.length()!=0) {
			try {
				int quant=Integer.parseInt(pquant);
				if(quant<1) {
					request.setAttribute("msg", "Quantity must be equal or greater than 1");
				}
				else {
					p.setQuantity(quant);
				}
			}
			catch(NumberFormatException e) {
				request.setAttribute("msg", "Quantity must be a whole number");
			}
		}
		prepo.save(p);
		return "selreddet";		
	}
	
	@RequestMapping("/editquantsellr")
	public String editquantsellr() {
		return "editquantsellr";		
	}
	
	@Transactional
	@RequestMapping("/editaddquantsellr")
	public String editaddquantsellr(@RequestParam("prod_id")int pid, 
			@RequestParam("addprod_quant")String qnt, HttpServletRequest request) {
		int plusqnt=0;
		try {
			plusqnt=Integer.parseInt(qnt);
		}
		catch(NumberFormatException e) {
			request.setAttribute("prod_id", pid);
			request.setAttribute("msg", "Enter quantity as a whole number");
		}
		if(plusqnt<1) {
			request.setAttribute("prod_id", pid);
			request.setAttribute("msg", "Quantity must be a positive number");			
		}
		else {
			int chng=prepo.safeUpdateQuantity(pid, plusqnt);
			if(chng==1) {
				request.setAttribute("prod_id", pid);
				request.setAttribute("msg", "Success");
			}
			else {
				request.setAttribute("prod_id", pid);
				request.setAttribute("msg", "Problem in server. Try agin");				
			}
		}
		return "editquantsellr";		
	}
	
	@RequestMapping("/LoginSeller")
	public String LoginSeller(@RequestParam("seller_mail")String smail,
			@RequestParam("seller_password")String spass, ModelMap model,
			HttpSession session,HttpServletRequest request) 
	{
		Seller seller=srepo.findByEmailAndPassword(smail,spass);
		if(seller!=null) {
			session.setAttribute("seller", seller);			
		    return "redirect:/sellerhome";
		}
		else {
			model.addAttribute("msg", "slfail");
		}
		return "/seller_login";		
	}
	
	@RequestMapping("/RegisterProduct")
	public String RegisterProduct(@RequestParam("prod_name")String pname, @RequestParam("prod_quant")String pquant,
			@RequestParam("product_price")String pprice,@RequestParam("product_pd")String ppd, 
			ModelMap model,HttpSession session) 
	{
		double prod_price=0.0;
		int prod_quantity=1;
		try {
			prod_price=Double.parseDouble(pprice);			
		}
		catch(NumberFormatException E) {
			model.addAttribute("addProdmsg", "Price must be a numerical value");
			return "/seller_add_product";
		}
		try {
			prod_quantity=Integer.parseInt(pquant);			
		}
		catch(NumberFormatException E) {
			model.addAttribute("addProdmsg", "Quantity must be a whole value");
			return "/seller_add_product";
		}
		if(prod_quantity<1) {
			model.addAttribute("addProdmsg", "Quantity must be equal or greater than 1");
			return "/seller_add_product";
		}
		Seller s=(Seller)session.getAttribute("seller");
		Product p=new Product(s, pname, prod_price, ppd, prod_quantity);
		prepo.save(p);
		model.addAttribute("addProdmsg", "Added");
		return "/seller_add_product";
	}
	
	@RequestMapping("/seller_permission_pending")
	public String seller_permission_pending(HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("prod_edit")!=null) {
			session.setAttribute("prod_edit",null);			
		}
		Seller s=(Seller)session.getAttribute("seller");
		List<Product> prod_wo_perm=prepo.findBySeller_IdAndPerm(s.getId(), "NO");
		request.setAttribute("prod_Wo_perm", prod_wo_perm);	
		return "seller_permission_pending";
	}
	
	@RequestMapping("/sellerhome")
	public String sellerhome(HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("prod_edit_quant")!=null) {
			session.setAttribute("prod_edit_quant",null);			
		}
		Seller s=(Seller)session.getAttribute("seller");
		List<Product> prod_w_perm=prepo.findBySeller_IdAndPerm(s.getId(), "YES");
		request.setAttribute("prod_W_perm", prod_w_perm);		
		return "sellerhome";
	}

}
