package kr.co.practice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.practice.domain.BoardDTO;
import kr.co.practice.domain.Criteria;
import kr.co.practice.domain.PageDTO;
import kr.co.practice.service.IBoardService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
public class BoardController {
	
	@Autowired
	private IBoardService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception{
		log.info("sow all list.....................");
		
		model.addAttribute("list", service.listAll(cri));
		
		int total = service.getTotalCnt(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception{
		log.info("register get............");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(BoardDTO bDto, RedirectAttributes rttr) throws Exception{
		log.info("register get............");
		
		service.register(bDto);
		
		rttr.addFlashAttribute("result", bDto.getBno());
		
		return "redirect:/board/list";
	}
	
//	@RequestMapping(value = "/read", method = RequestMethod.GET)
//	public void read(@RequestParam("bno") int bno, Model model) throws Exception {
//		log.info("read..................");
//		model.addAttribute("board", service.read(bno));
//	}
//		
//	@RequestMapping(value = "/modify", method = RequestMethod.GET)
//	public void modifyGET(@RequestParam("bno") int bno , Model model) throws Exception{
//		model.addAttribute("board", service.read(bno));
//	}
	
	@RequestMapping(value = {"/read", "/modify"}, method = RequestMethod.GET)
	public void modifyGet(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		log.info("/red ou /modify....................");
		model.addAttribute("board", service.read(bno));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardDTO bDto, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception{
		log.info("modify post.........." + service.modify(bDto));
		
		if (service.modify(bDto)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String modifyPOST(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception{
		log.info("remove..................");
		
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
}