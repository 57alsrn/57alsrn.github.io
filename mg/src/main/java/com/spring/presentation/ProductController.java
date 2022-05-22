package com.spring.presentation;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.mg.product.ProductService;
import com.spring.mg.product.ProductVo;
import com.spring.mg.reply.ReplyService;
import com.spring.mg.reply.ReplyVo;

@Controller
public class ProductController {
	
	
	
	@Autowired
	private ProductService service;
	
	@Inject
	private ReplyService Rservice;
	
	long time = System.currentTimeMillis();
	SimpleDateFormat dayTime=new SimpleDateFormat("HHmmss");
	String  timeStr = dayTime.format(time);	
	
	Date now = new Date();
	
	String onlyFilename ="";
	String extension="";

	
	@RequestMapping("/pd_form.do")
	String productForm() {
		return "/product/pd_form.jsp";
	}
	
	@RequestMapping("/pd_formOk.do")
	String pdFormOk(ProductVo vo, HttpServletRequest requets, HttpServletResponse response
			, HttpServletRequest request) throws Exception {
		String Path = requets.getSession().getServletContext().getRealPath("/product/files/");
		System.out.println("경로확인: " + Path);
		
		MultipartFile updateFile = vo.getImgFile();
		String fileName = updateFile.getOriginalFilename();
		File f = new File(Path + fileName); 
		String onlyFileName = "";
		String extension = "";
		
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("HHmmss");
		String timeStr = dayTime.format(time);
		
		if(!updateFile.isEmpty()) {	
			if(f.exists()) {
				// 중복 파일이 존재하면
				System.out.println("동일한 파일이 존재하는 경우");
				onlyFileName = fileName.substring(0, fileName.indexOf(".")); // 파일명 받기
				extension = fileName.substring(fileName.indexOf("."));  // 확장자명 받기
				fileName = onlyFileName + "_" + timeStr + extension;  // _시분초를 이용하여 중복을 피한 파일명 생성
				
				updateFile.transferTo(new File(Path + fileName));  // 중복 제거 된 파일명으로 저장
			}else {
				// 중복 파일이 존재하지 않으면
				updateFile.transferTo(new File(Path + fileName));
				System.out.println("fileName: " + fileName);
			}
		
		}
		
		String ext = fileName.substring(fileName.indexOf(".")+1); // Imgtype 받아오기 
		Date now = new Date();  // Rdate 받아오기
		HttpSession session = request.getSession();
		
		String writer = (String) session.getAttribute("session"); // session에 저장된 값을 writer에 저장
		
		String content=request.getParameter("detail");
		content=content.replace("\r\n","<br>"); // textarea(name = detail)에서 받은 줄바꿈을 br로 db에 저장
		
		vo.setImgsize(fileName.length());
		vo.setImgtype(ext);
		vo.setRdate(now);
		vo.setImg(fileName);
		vo.setUserID(writer); // vo에 userID 세팅
		vo.setDetail(content); 
		
		service.insert(vo);
		
		return "/pd_list.do";
	}
	
	
	@RequestMapping("/pd_list.do")
	String pd_list_do(Model model, ProductVo vo) {
		model.addAttribute("li", service.Select(vo));
		return "/product/pd_list.jsp";
	}
	
	@RequestMapping("/pd_detail.do")
	String pd_detail_do(@RequestParam("pcode") int pcode, Model model, ProductVo vo, ReplyVo Rvo) {
		
		model.addAttribute("m", service.detail(vo));
		
		// 댓글 조회
		model.addAttribute("li", Rservice.list(Rvo)); 
		
		System.out.println("로딩"+vo);
		
		return "/product/pd_detail.jsp";
	}
	
	
	@RequestMapping("/pd_modify.do")
	String pd_content_do(Model model, ProductVo vo) {
		model.addAttribute("m", service.modify(vo));
		return "/product/pd_modify.jsp";
	}
	
	@RequestMapping("/pd_delete.do")
	String product_delete(ProductVo vo , HttpServletRequest request) {

		// 1. 삭제할 파일 찾기 와 파일삭제 
		ProductVo img = service.modify(vo);
		
	    String	path=request.getSession().getServletContext().getRealPath("/product/files/");

	    File f = new  File(path + img.getImg() ) ;
		if (f.exists()) {
	      f.delete();  // 파일이 존재하면 삭제하시오.
		}
		
		// 2. 레코드 삭제 
		service.delete(vo);
		
		return "pd_list.do";	
	}
	
	@RequestMapping("/pd_UpdateOK.do")
	String product_UpdateOK(ProductVo  vo, HttpServletRequest request, Model model) throws Exception {
		
	    String	path=request.getSession().getServletContext().getRealPath("/product/files/");
			
		MultipartFile  imgUpdateFile = vo.getImgFile();
		String fileNmae =imgUpdateFile.getOriginalFilename();
		File  f = new File(path+fileNmae);

		if(!imgUpdateFile.isEmpty()) {
			
			ProductVo img = service.modify(vo);				
		    File fDel = new  File(path + img.getImg() ) ;
			if (fDel.exists()) {
				fDel.delete();  // 파일이 존재하면 삭제
			}
			
		  if(f.exists()) {
			// 중복 파일이 존재하면 
			  System.out.println("동일한 파일 존재하는 경우");
			  onlyFilename=fileNmae.substring(0, fileNmae.indexOf("."));
			  extension=fileNmae.substring(fileNmae.indexOf("."));
			  fileNmae =  onlyFilename + "_" + timeStr + extension ;				  
			  imgUpdateFile.transferTo(new File(path+fileNmae));
			  
		  }else{
			  
			  imgUpdateFile.transferTo(new File(path+fileNmae));
			  
		  }	

			vo.setImgsize(fileNmae.length());
			vo.setImgtype(extension);
			vo.setRdate(now);			
			vo.setImg(fileNmae);				
			service.updateFile(vo);
			System.out.println("==> updateFile : " + vo);
			
		} else {		
			
			service.update(vo);
			System.out.println("==> update: " + vo);
			
		}	
		
		return "pd_list.do";		
	}		

}