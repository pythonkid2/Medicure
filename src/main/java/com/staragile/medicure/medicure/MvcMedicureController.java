package com.staragile.medicure.medicure;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class MvcMedicureController {

	
	@Autowired
	MedicureService medicureSvc;
	
	@RequestMapping("/")
	public String hello(HttpServletRequest req, HttpServletResponse res){
		List<Medicure> bankingList = medicureSvc.getBanking();
		req.getSession().setAttribute("bankingList", bankingList);
		return "medicure.jsp";
	}
		
	@RequestMapping("/getallDoctors")
	public String getAllAccounts(HttpServletRequest req, HttpServletResponse res) {
		List<Medicure> bankingList = medicureSvc.getBanking();
		req.getSession().setAttribute("bankingList", bankingList);
		return "medicure.jsp";
	}
	
	@RequestMapping("/addDoctor")
	public String addAccounts(HttpServletRequest req, HttpServletResponse res) {
		Medicure doctor = new Medicure();
		doctor.setBankingId(req.getParameter("id"));
		doctor.setCustomerName(req.getParameter("name"));
		doctor.setCustomerAddress(req.getParameter("address"));
		doctor.setContactNumber(req.getParameter("contact"));
		medicureSvc.addAccounts(doctor);
		return getAllAccounts(req,res);
	}
	
	@RequestMapping("/updateDoctor")
	public String updateAccounts(HttpServletRequest req, HttpServletResponse res) {
		Medicure medicure = new Medicure();
		medicure.setBankingId(req.getParameter("id"));
		medicure.setCustomerName(req.getParameter("name"));
		medicure.setCustomerAddress(req.getParameter("address"));
		medicure.setContactNumber(req.getParameter("contact"));
		medicureSvc.updateAccounts(req.getParameter("id"),medicure);
		return getAllAccounts(req,res);
	}
	
	@RequestMapping("/viewDoctor")
	public String viewAccounts(HttpServletRequest req, HttpServletResponse res) {
		Medicure medicure = new Medicure();
		medicure.setBankingId(req.getParameter("id"));
		medicure.setCustomerName(req.getParameter("name"));
		medicure.setCustomerAddress(req.getParameter("address"));
		medicure.setContactNumber(req.getParameter("contact"));
		medicureSvc.viewAccounts(req.getParameter("id"),medicure);
		return getAllAccounts(req,res);
	}
	
	@RequestMapping("/deleteDoctor")
	public String deletebanking(HttpServletRequest req, HttpServletResponse res) {
		medicureSvc.deleteAccounts(req.getParameter("id"));
		return getAllAccounts(req,res);
	}
}
