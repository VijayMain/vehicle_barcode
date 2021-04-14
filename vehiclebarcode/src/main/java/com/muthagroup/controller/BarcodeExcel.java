package com.muthagroup.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.itextpdf.text.pdf.BarcodeQRCode;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Servlet implementation class BarcodeExcel
 */
@WebServlet("/BarcodeExcel")
public class BarcodeExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			  
			if(request.getQueryString().equals("list"))
			  {
			  List fileItems = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			  Iterator i = fileItems.iterator(); 
			  BufferedInputStream buff = null; 
			  Document document = new Document(); 
			  ByteArrayOutputStream baos = new ByteArrayOutputStream();	  
			  while ( i.hasNext () ) 
			  { 
				  PdfWriter.getInstance(document, baos);
				  document.open(); 
				  FileItem fi = (FileItem) i.next(); 
				  XSSFWorkbook workbook = new XSSFWorkbook(fi.getInputStream());
				  XSSFSheet sheet = workbook.getSheetAt(0); 
				  Iterator<Row> rowIterator = sheet.iterator();
				  rowIterator.next();
				  while (rowIterator.hasNext()) 
		            {
		                Row row = rowIterator.next();
		                //For each row, iterate through all the columns
		                Iterator<Cell> cellIterator = row.cellIterator();
		                Cell cell = cellIterator.next();
		                DataFormatter formatter = new DataFormatter(); //creating formatter using the default locale
		                
		                String driver_name=formatter.formatCellValue(cell);//1
		                cell = cellIterator.next();
		       			String moblie_no=formatter.formatCellValue(cell);//2
		       			cell = cellIterator.next();
		       			String adhar_pan_card_no=formatter.formatCellValue(cell);//3  
		       			cell = cellIterator.next();
		       			String driving_lic_no=formatter.formatCellValue(cell);//4  
		       			cell = cellIterator.next();
		       			String vehicle_no=formatter.formatCellValue(cell);//5 
		       			cell = cellIterator.next();
		       			String chassis_no=formatter.formatCellValue(cell);//6
		       			cell = cellIterator.next();
		       			String fit_cer_no=formatter.formatCellValue(cell);//7
		       			cell = cellIterator.next();
		       			String fit_cer_exp_date=formatter.formatCellValue(cell);//8
		       			cell = cellIterator.next();
		       			String insur_no=formatter.formatCellValue(cell);//9
		       			cell = cellIterator.next();
		       			String insur_no_exp_date=formatter.formatCellValue(cell);//10
		       			PdfPTable table = new PdfPTable(3);
		       			table.setWidthPercentage(100);
		       			table.setWidths(new float[]{1,(float) 1.50,(float) 1.50});
		       			table.setSpacingAfter(5f);       
		       			BarcodeQRCode qrcode = new BarcodeQRCode("Driver Name: "+driver_name+" | "+"Mobile No: "+moblie_no+" | "+"Adhar/PAN Card no: "+adhar_pan_card_no+" | "+"Driving Licence No: "+driving_lic_no+" | "+"Vehicle No: "+vehicle_no+" | "+"Chassis No: "+chassis_no+" | "+"Fitness Certificate No: "+fit_cer_no+" | "+"Fitness Cetificate Exprire Date: "+fit_cer_exp_date+" | "+"Insurance No: "+insur_no+" | "+"Insurance No Exprire Date: "+insur_no_exp_date, 1, 1, null);
		        		Image qrcodeImage = qrcode.getImage();
		        		qrcodeImage.scaleAbsolute(120,120);
		        		Chunk chunk = new Chunk(qrcodeImage, 0,0);
		        		PdfPCell pdfcell= new PdfPCell();
		        		pdfcell.addElement(chunk);
		        		pdfcell.setRowspan(3);
		       			table.addCell("Driver Name");
		       			table.addCell(driver_name);
		        		table.addCell(pdfcell);
		       			table.addCell("Mobile No");
		       			table.addCell(moblie_no);
		       			table.addCell("Vehicle No"); 
					   	table.addCell(vehicle_no);
		       			document.add(table);    
		            }
			  }
			  
			  document.close();
			  response.setHeader("Expires", "0");
			  response.setHeader("Cache-Control","must-revalidate, post-check=0, pre-check=0");
			  response.setHeader("Pragma", "public");
			  response.setContentType("application/pdf");
			  response.setContentLength(baos.size());
			  ServletOutputStream os = response.getOutputStream();
			  baos.writeTo(os); os.flush(); os.close(); 
			  }
			  if(request.getQueryString().equals("form"))
			  { 
				  BufferedInputStream buff = null; 
				  Document document = new Document(); 
				  ByteArrayOutputStream baos = new ByteArrayOutputStream();	   
					  PdfWriter.getInstance(document, baos);
					  document.open(); 
					        String first_name=request.getParameter("first_name");//1
			                String last_name=request.getParameter("last_name");//1
			                String driver_name=first_name+" "+last_name;
			                String moblie_no=request.getParameter("moblie_no");//2
			                String adhar_pan_card_no=request.getParameter("adhar_pan_card_no");//3
			                String driving_lic_no=request.getParameter("driving_lic_no");//4
			                String vehicle_no=request.getParameter("vehicle_no");//5
			                String chassis_no=request.getParameter("chassis_no");//6
			                String fit_cer_no=request.getParameter("fit_cer_no");//7
			                String fit_cer_exp_date=request.getParameter("fit_cer_exp_date");//8
			                String insur_no=request.getParameter("insur_no");//9
			                String insur_no_exp_date=request.getParameter("insur_no_exp_date");//10	            	
			       			PdfPTable table = new PdfPTable(3);
			       			table.setWidthPercentage(100);
			       			table.setWidths(new float[]{1,(float) 1.50,(float) 1.50});
			       			table.setSpacingAfter(5f);       
			       			BarcodeQRCode qrcode = new BarcodeQRCode("Driver Name: "+driver_name+" | "+"Mobile No: "+moblie_no+" | "+"Adhar/PAN Card no: "+adhar_pan_card_no+" | "+"Driving Licence No: "+driving_lic_no+" | "+"Vehicle No: "+vehicle_no+" | "+"Chassis No: "+chassis_no+" | "+"Fitness Certificate No: "+fit_cer_no+" | "+"Fitness Cetificate Exprire Date: "+fit_cer_exp_date+" | "+"Insurance No: "+insur_no+" | "+"Insurance No Exprire Date: "+insur_no_exp_date, 1, 1, null);
			        		Image qrcodeImage = qrcode.getImage();
			        		qrcodeImage.scaleAbsolute(102,102);
			        		Chunk chunk = new Chunk(qrcodeImage, 0,0);
			        		PdfPCell pdfcell= new PdfPCell();
			        		pdfcell.addElement(chunk);
			        		pdfcell.setRowspan(3);
			       			table.addCell("Driver Name");
			       			table.addCell(driver_name);
			        		table.addCell(pdfcell);
			       			table.addCell("Mobile No");
			       			table.addCell(moblie_no);
			       			table.addCell("Vehicle No"); 
						   	table.addCell(vehicle_no);
			       			document.add(table);    

				  document.close();
				  response.setHeader("Expires", "0");
				  response.setHeader("Cache-Control","must-revalidate, post-check=0, pre-check=0");
				  response.setHeader("Pragma", "public");
				  response.setContentType("application/pdf");
				  response.setContentLength(baos.size());
				  ServletOutputStream os = response.getOutputStream();
				  baos.writeTo(os); os.flush(); os.close(); 
				  } 
			  
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}
