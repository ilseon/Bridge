/*
 * 작성자 - 우병수
 * 내용 - 비디오 게시물 DAO
 * 시작날짜 - 2016/07/20
 * 수정날짜 - 2016/07/21
 * 변경내용 - 게시물 10개씩 가져오고 총 게시물 수를 가져온다
 */

package com.bridge.app.persistence;

import java.sql.SQLException;
import java.util.List;

import com.bridge.app.domain.Paging;
import com.bridge.app.domain.VideoVO;
import com.bridge.app.domain.VideoVO;

public interface VideoDAO {
	public List<VideoVO> getVideoList(Paging pg) throws SQLException;//한페이지에 게시물 10개씩가져온다
	public List<VideoVO> getVideoTotal(Paging pg) throws SQLException;//게시물을 총갯수를 가져온다
	public List<VideoVO> getVideoTotal() throws SQLException;
	public List<VideoVO> getChartVideoTotal() throws SQLException;
}
