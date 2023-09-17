package kr.co.practice.persistence;

import java.util.List;

import kr.co.practice.domain.BoardDTO;
import kr.co.practice.domain.Criteria;


public interface IBoardDAO {
	public void create(BoardDTO bDto) throws Exception;
	public BoardDTO read(Integer bno) throws Exception;
	public int update(BoardDTO bDto) throws Exception;
	public int delete(Integer bno) throws Exception;
//	public List<BoardDTO> listAll() throws Exception;
	public List<BoardDTO> listAll(Criteria cri) throws Exception;
	public int getTotalCnt(Criteria cri) throws Exception;
}