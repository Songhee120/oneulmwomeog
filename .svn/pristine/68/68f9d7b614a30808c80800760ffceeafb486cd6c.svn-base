package com.astral.app.review;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.review.dao.FilesDAO;
import com.astral.app.review.dao.ReviewDAO;
import com.astral.app.review.vo.FilesVO;
import com.astral.app.review.vo.ReviewVO;

public class ReviewBestViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		
		//리뷰 번호, 음식점 이름, 음식점 주소, 별점
		ReviewDAO r_dao = new ReviewDAO();
		ReviewVO r_vo = new ReviewVO();
		//파일 명(리뷰번호로 접근)
		FilesDAO f_dao = new FilesDAO();
		FilesVO f_vo = new FilesVO();
		
		JSONObject json_in = null;
		JSONArray json = new JSONArray();
		List<ReviewVO> reviewList = r_dao.getBestReviews();
		
		List<String> filenameList = new ArrayList<String>();
		/*HashMap<Integer, List<String>> fileMap = new HashMap<>();
		for(int i=0;i<12;i++) {
			fileMap.put(i, f_dao.getFileName(reviewList.get(i).getReview_no()));
		}*/
		
		for(int i=0;i<reviewList.size();i++) {
			//그냥 json put을 하면 한 개의 필드에 계속 put되기 때문에 계속 새로운 필드를 만들어준다.
			json_in = new JSONObject();
			json_in.put("review_no", reviewList.get(i).getReview_no());
			json_in.put("review_star", reviewList.get(i).getReview_star());
			json_in.put("res_name", reviewList.get(i).getRes_name());
			json_in.put("res_address", reviewList.get(i).getRes_address());
			json_in.put("filename", f_dao.getFileName(reviewList.get(i).getReview_no()));
			
			json.add(json_in);
		}
		
		resp.setContentType("application/x-json; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJSONString());
		return null;
	}

}
