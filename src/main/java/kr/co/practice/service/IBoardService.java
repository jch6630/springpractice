package kr.co.practice.service;

import java.util.List;

import kr.co.practice.domain.BoardDTO;
import kr.co.practice.domain.Criteria;


public interface IBoardService {
	
	public void register(BoardDTO bDto) throws Exception;
	public BoardDTO read(Integer bno) throws Exception;
	public boolean modify(BoardDTO bDto) throws Exception;
	public boolean remove(Integer bno) throws Exception;
//	public List<BoardDTO> listAll() throws Exception;
	public List<BoardDTO> listAll(Criteria cri) throws Exception;
	public int getTotalCnt(Criteria cri) throws Exception;
}