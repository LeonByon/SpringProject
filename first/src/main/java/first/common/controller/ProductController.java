package first.common.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import first.common.dao.shop.ProductDAO;
import first.common.dto.ProductDTO;

//@Controller를 붙여야만 스프링에서 관리하는 빈으로 등록됨

@Controller
public class ProductController {

	//dao bean 등록
	@Inject
	ProductDAO productDao;

	@RequestMapping("/shop/product_update.do")
	public String product_update(@ModelAttribute ProductDTO dto, Model model){
		String filename="";
		//업로드한 파일이 존재하면
		if(!dto.getFile1().isEmpty()){
			filename=dto.getFile1().getOriginalFilename();
			//이클립스의 경로
			//String path="C:\\Users\\Kim\\Desktop\\eclipse\\workspace\\spring\\web04\\src\\main\\webapp\\images";
			String path="C:\\Users\\Increpas\\Documents\\jsp_Lesson\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\first\\images\\";
			try {
				//존재하지 않는 디렉토리인 경우 생성
				new File(path).mkdir();
				//임시파일을 지정된 디렉토리로 이동
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//테이블에 update작업
		//이미 다른 정보들은 dto에 저장되어 있기 때문에 이미지만 셋팅해주면 된다
		dto.setPicture_url(filename);
		//dao에 insert처리 요청
		productDao.productUpdate(dto);
		//상품목록 갱신을 위해 컨트롤ㄹ러로 이동
		//컨트롤러로 가는 경우는 redirect를 써야 한다.
		//redirect를 빼면 jsp로 간다
		return "redirect:/shop/product_list.do";
	}

	@RequestMapping("/shop/product_list.do")
	public String productList(Model model){
		System.out.println("product_list 호출...");
		List<ProductDTO> items = productDao.productList();
		//모델에 저장
		model.addAttribute("list",items);
		// /WEB-INF/views/shop/product_list.jsp로 포워딩
		return "shop/product_list";
	}
	//상품의 상세 정보
	@RequestMapping("/shop/product_detail.do")
	public String product_detail(@RequestParam int product_id, Model model){
	// @RequestParam 변수 => request.getParameter("변수")
		// product_code에 상품코드가 저장됨
		// dao에 자료 요청
		ProductDTO dto=productDao.productDetail(product_id);
		//모델에 자료 저장
		model.addAttribute("dto", dto);
		// WEB-INF/views/shop/product_detail.jsp로 포워딩
		return "shop/product_detail";
	}

	@RequestMapping("/shop/product_write.do")
	public String product_write(@ModelAttribute ProductDTO dto, Model model){
		//입력값이 없을 때
		if(dto.getProduct_name() == null){
			return "/shop/Product_write";
		}else{
			//파일 업로드 처리
			String filename="";
			//업로드한 파일이 존재하면
			if(!dto.getFile1().isEmpty()){
				filename=dto.getFile1().getOriginalFilename();
				//이클립스의 경로
				//String path="C:\\Users\\Kim\\Desktop\\eclipse\\workspace\\spring\\web04\\src\\main\\webapp\\images";
				String path="C:\\Users\\Increpas\\Documents\\jsp_Lesson\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\first\\images\\";
				try {
					//존재하지 않는 디렉토리인 경우 생성
					new File(path).mkdir();
					//임시파일을 지정된 디렉토리로 이동
					dto.getFile1().transferTo(new File(path+filename));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			//테이블에 insert작업
			//이미 다른 정보들은 dto에 저장되어 있기 때문에 이미지만 셋팅해주면 된다
			dto.setPicture_url(filename);
			//dao에 insert처리 요청
			productDao.productInsert(dto);
			//상품목록 갱신을 위해 컨트롤ㄹ러로 이동
			//컨트롤러로 가는 경우는 redirect를 써야 한다.
			//redirect를 빼면 jsp로 간다
			return "redirect:/shop/product_list.do";
		}
	}

	@RequestMapping("/shop/product_edit.do")
	public String product_edit(@RequestParam int product_id, Model model){
		//편집 버튼을 누르면 해당되는 상품의 코드값이  product_id에 저장됨
		//원래는 @RequestParam붙여야 정확한 표현이다.
		System.out.println("상품코드 : "+product_id);
		//수정폼으로 이동
		ProductDTO dto=productDao.productDetail(product_id) ;
		model.addAttribute("dto",dto);
		return "shop/product_edit";
	}

	@RequestMapping("/shop/product_delete.do")
	public String product_delete(@RequestParam int product_id){
		//dao에 삭제 요청
		productDao.productDelete(product_id);
		//삭제 완료 후 리스트 갱신
		return "redirect:/shop/product_list.do";
	}
}
