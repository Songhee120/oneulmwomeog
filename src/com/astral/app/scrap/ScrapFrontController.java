package com.astral.app.scrap;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.astral.action.ActionForward;

public class ScrapFrontController extends HttpServlet {
   private static final long serialVersionUID = 1L;
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doProcess(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doProcess(req, resp);
   }
   
   protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String requestURI = req.getRequestURI();
      // /astral
      String contextPath = req.getContextPath();
      // /member/MemberLoginOk.me
      String command = requestURI.substring(contextPath.length());

      ActionForward forward = null;
      
      
      switch(command) {
         //찜추가 및 삭제
         case "/scrap/ScrapOk.sc":            
            try {
               forward = new ScrapOkAction().execute(req, resp);
            } catch (Exception e) {
               e.printStackTrace();
            }
            break;
            
         case "/scrap/ScrapViewFirstOk.sc":
            try {
               forward = new ScrapViewFirstOkAction().execute(req, resp);
            } catch (Exception e) {
               e.printStackTrace();
            }
            break;      
            
         case "/scrap/ScrapViewOk.sc":
            try {
               forward = new ScrapViewOkAction().execute(req, resp);
            } catch (Exception e) {
               e.printStackTrace();
            }
            break;                 
            
         case "/scrap/ScrapDeleteOk.sc":
            try {
               forward = new ScrapDeleteOkAction().execute(req, resp);
            } catch (Exception e) {
               e.printStackTrace();
            }
            break;                  
         default:
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/error/error.jsp");
      }

      
      
      if (forward != null) {
         if (forward.isRedirect()) {
            resp.sendRedirect(forward.getPath());
         } else {
            RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
            dispatcher.forward(req, resp);
         }
      }
   }
}