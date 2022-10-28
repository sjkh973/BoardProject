package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ActionForward;
import domain.Board;
import repository.BoardDao;

public class BoardModifyService implements BoardService {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
	    Board board = Board.builder() 
			  .title(title) 
			  .content(content)
			  .boardNo(boardNo) 
			  .build();
		
		int result = BoardDao.getInstance().updateBoard(board);
		
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.println("<script>");
			out.println("alert('수정 성공')");
			out.println("location.href='" + request.getContextPath() + "/board/detail.do?boardNo=" + boardNo + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('수정 실패')");
			out.println("hisotry.back()");
			out.println("</script>");
		}
		out.close();
		
		return null;
	}

}
