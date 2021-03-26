package com.astral.app.review;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.HistoryDAO;
import com.astral.app.member.vo.HistoryVO;
import com.astral.app.review.dao.FilesDAO;
import com.astral.app.review.dao.ReviewDAO;
import com.astral.app.review.vo.FilesVO;
import com.astral.app.review.vo.ReviewVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		ActionForward forward = null;
		
		ReviewDAO r_dao = new ReviewDAO();
		FilesDAO f_dao = new FilesDAO();
		
		HistoryDAO h_dao = new HistoryDAO();
		HistoryVO h_vo = null;
		
		MultipartRequest multi = null;
		
		String saveFolder = "C:\\web_1530_YR\\project\\workspace\\astral\\WebContent\\upload";
		int fileSize = 5 * 1024 * 1024;
		
		try {
			ReviewVO r_vo = new ReviewVO();
			multi = new MultipartRequest(req, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println("들어옴1");
			
			int review_no = Integer.parseInt(multi.getParameter("review_no"));
			System.out.println("들어옴2");
			int history_no = Integer.parseInt(multi.getParameter("history_no"));
			System.out.println("들어옴3");
			h_vo = h_dao.selectHistory(history_no);
			System.out.println("들어옴4");
			
			
			for (FilesVO file : f_dao.getDetail(review_no)) {
				File f = new File(saveFolder, file.getFile_name());
				System.out.println("들어옴5");
				
				if(f.exists()) {
					f.delete();
				}
			}
			//만약 아직 남아 있으면 삭제
			f_dao.deleteFiles(review_no);
			//후 다시 insert
			f_dao.insertFiles(review_no, multi);
			
			//수정된값 다시 집어느
			r_vo.setReview_no(review_no);
			r_vo.setMem_no(r_dao.memberSeq((String)session.getAttribute("mem_id")));
			r_vo.setReview_content(multi.getParameter("review_content"));
			r_vo.setReview_star(Integer.parseInt(multi.getParameter("star_grade")));
			r_vo.setRes_name(h_vo.getRes_name());
			r_vo.setRes_address(h_vo.getRes_address());
			r_vo.setRes_url(h_vo.getRes_url());
			r_vo.setReview_done(Integer.parseInt(multi.getParameter("success")));
			
			r_dao.modifyReview(r_vo);
			
			forward = new ActionForward();
			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/review/ReviewShowOk.re?review_no=" + review_no);
			
		} catch (Exception e) {
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("alert('게시글 수정 실패. 다시 시도해주세요.')");
			out.println("</script>");
			out.close();
		}
		
		return forward;
	}
}
