package kr.co.project;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
			throws Exception {
		HttpSession sess = req.getSession();
		if(sess.getAttribute("loginSess")==null) {
//			미 로그인
			res.setContentType("text/html;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.print("<script>");
			out.print("alert('로그인 후 사용 가능합니다.');");
			out.print("history.back();");
			out.print("</script>");
			return false;
		}else {
//		로그인
			return true;
		}
	}
}
	