package com.astral.app.confirm;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.review.dao.ReviewDAO;
import com.astral.app.review.vo.ReviewVO;

public class ReviewConfirmListAction implements Action {
@Override
public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	req.setCharacterEncoding("UTF-8");
	resp.setCharacterEncoding("UTF-8");
	
	ActionForward forward = new ActionForward();
	ReviewDAO r_dao = new ReviewDAO();
	MemberDAO m_dao = new MemberDAO();
	HttpSession session = req.getSession();
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date now = new Date();
	String now_date = format.format(now);
	String mem_id = (String)session.getAttribute("mem_id");
	int mem_no = (Integer)m_dao.getMemberNumber(mem_id);

	
	//파라미터로 넘어온 페이지를 받는다.
	String temp = req.getParameter("page");

	//넘어온 파라미터에 값의 여부에 따라 1페이지를 보여줄지 해당 페이지를 보여줄지 정한다.
	int page = temp == null? 1 : Integer.parseInt(temp);
	
	int pageSize = 5;
	
	int endRow = page * pageSize;
	int startRow = endRow - (pageSize - 1);
	
	int totalCnt = r_dao.getConfirmCnt(mem_no);
	
	int startPage = ((page - 1) / pageSize) * pageSize + 1;
	int endPage = startPage + 4;
	
	int realEndPage = (totalCnt - 1) / pageSize + 1;
	
	endPage = endPage > realEndPage ? realEndPage : endPage;
	
	//검색했을 경우, 셀렉했을 경우 있으므로 같이 보내준다.
	
	 List<ReviewVO> reviewList = r_dao.getReviewConfirm(mem_no, startRow, endRow);
     
     HashMap<String, Object> review = null;
     List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
     
     for(int i=0;i<reviewList.size();i++) {
        review = new HashMap<String, Object>();
        review.put("review_no", reviewList.get(i).getReview_no());
        review.put("res_name", reviewList.get(i).getRes_name());
        review.put("res_address", reviewList.get(i).getRes_address());
        review.put("review_views", reviewList.get(i).getReview_views());
        //review.put("review_date", reviewList.get(i).getReview_date());
        
        if(reviewList.get(i).getReview_date().substring(0, 10).compareTo(now_date.substring(0, 10)) == 0) {
        	reviewList.get(i).setReview_date(reviewList.get(i).getReview_date().substring(11, 16));
		}else {
			reviewList.get(i).setReview_date(reviewList.get(i).getReview_date().substring(0, 10));
		}
        
        review.put("review_date", reviewList.get(i).getReview_date());
        
        list.add(review);
     }
     req.setAttribute("list", list);
	
	//검색 한 이후에 결과를 유치한채 페이지가 변환되어야한다. 그래서 검색결과와 셀렉트를 같이 내보내주어 유지시킨다.
	req.setAttribute("totalCnt", totalCnt);
	req.setAttribute("realEndPage", realEndPage);
	req.setAttribute("nowPage", page);
	req.setAttribute("startPage", startPage);
	req.setAttribute("endPage", endPage);
	forward.setPath("/confirm/confirm.jsp");
	forward.setRedirect(false);
	
	
	return forward;
}




}
