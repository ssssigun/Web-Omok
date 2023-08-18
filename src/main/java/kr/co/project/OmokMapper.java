package kr.co.project;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OmokMapper {
	//시권
	PlayerVO login(Map map);
	int updateInfo(PlayerVO vo);
	//창준
	int updateVictory(PlayerVO vo);
	//서영
	int dupCheck(Map map);
	int insert(PlayerVO vo);
	//지원
	List<PlayerVO> allList(PlayerVO vo);
	int count(PlayerVO vo);
}
	