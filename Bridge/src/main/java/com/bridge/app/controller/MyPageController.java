/**
작성자 - 이주연
내용 - MyPageController
시작날짜 - 2016/07/17
수정날짜 - 2016/07/30
변경내용 - 
 */

package com.bridge.app.controller;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.bridge.app.domain.ArtistVO;
import com.bridge.app.domain.LikeVO;
import com.bridge.app.domain.UserVO;
import com.bridge.app.service.AlbumService;
import com.bridge.app.service.ArtistService;
import com.bridge.app.service.DownloadService;
import com.bridge.app.service.LikeService;
import com.bridge.app.service.MusicService;
import com.bridge.app.service.PlaylistService;
import com.bridge.app.service.UserService;

@Controller
public class MyPageController {

	@Inject
	private ArtistService artistservice;
	@Inject
	private AlbumService albumservice;
	@Inject
	private MusicService musicservice;
	@Inject
	private PlaylistService playservice;
	@Inject
	private LikeService likeservice;
	@Inject
	private DownloadService downservice;
	@Inject
	private UserService userservice;

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	/**Upload_첫페이지 */
	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public String Upload(HttpServletRequest req, Model model) throws Exception {
		logger.info("업로드 시작");
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");			
		model.addAttribute("artistList", artistservice.selectArtist(userNumber));
		logger.info(artistservice.selectArtist(userNumber)+"");
		if(artistservice.selectArtist(userNumber) == null){
			return "/upload/upload_artist";
		}else{		
			return "/upload/upload_artist";
		}
	}
	
	/**Upload_아티스트_등록 */
	@RequestMapping(value = "artistRegist", method = RequestMethod.GET)
	public ModelAndView AristRegist(HttpServletRequest req, @RequestParam int artistNumber, Model model) throws Exception {		
		logger.info("등록된 아티스트 선택");
		ModelAndView mav = new ModelAndView("/upload/upload_album");
		model.addAttribute("artistList", artistservice.selectArtistOne(artistNumber));
		logger.info("값"+artistservice.selectArtistOne(artistNumber)+"");
		return mav;
	}
	
	
	/**Upload_아티스트_수정 */
	@RequestMapping(value = "artistUpdate", method = RequestMethod.GET)
	public ModelAndView AristUpdate(HttpServletRequest req, @RequestParam int artistNumber, Model view) throws Exception {		
		logger.info("아티스트 수정");
		logger.info(artistNumber+"");
		artistservice.selectArtistOne(artistNumber);
		ModelAndView mav = new ModelAndView("/upload/artist_update");		
		return mav;
	}
	
	/**Upload_아티스트_수정완료 */
	@RequestMapping(value = "artistUpdateCom", method = RequestMethod.POST)
	public ModelAndView AristUpdateCom(HttpServletRequest req, Model view) throws Exception {
		logger.info("아티스트 수정완료");
		artistservice.update(req);
		ModelAndView mav = new ModelAndView("redirect:/upload");		
		return mav;
	}
	
	/**Upload_아티스트_삭제 */
	@RequestMapping(value = "artistDel", method = RequestMethod.GET)
	public String AristDelete(HttpServletRequest req, @RequestParam int artistNumber) throws Exception {
		logger.info("아티스트 삭제");
		logger.info(artistNumber+"");
		artistservice.remove(artistNumber);
		return "redirect:/upload";
	}

	/**Upload_아티스트_등록 */	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String Upload_Artist(HttpServletRequest req, Model model) throws Exception {
		logger.info("아티스트 등록  페이지");
		artistservice.regist(req);
		return "redirect:/upload";
	}

	/**Upload_앨범_등록 */
	@RequestMapping(value = "upload2", method = RequestMethod.POST)
    public String Upload_Album(HttpServletRequest req, Model view) throws Exception {       
       logger.info("앨범 등록 페이지");
       albumservice.regist(req, view);
       logger.info("앨범 등록 완료");
       return "/upload/upload_music";
    }
	
	/**Upload_뮤직_등록 */
	@RequestMapping(value = "upload3", method = RequestMethod.POST)
	public String Upload_Music(HttpServletRequest req, Model view) throws Exception {
		logger.info("뮤직 등록 페이지");
		musicservice.regist(req);
		logger.info("뮤직 등록 완료");
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		view.addAttribute("albumList", albumservice.searchMytrack(userNumber, 4));
		return "/upload/mytrack";
	}

	/**Upload 후 내 트랙 확인 
	 * @throws Exception */
	@RequestMapping(value = "mytrack", method = RequestMethod.GET)
	public String MyTrack_(HttpServletRequest req, Model view) throws Exception {
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		view.addAttribute("albumList", albumservice.searchMytrack(userNumber, 4));
		logger.info("It is mytrack");
		return "/upload/mytrack";
	}

	/**내 트랙 확인 상세 페이지 
	 * @throws Exception */
	@RequestMapping(value = "mytrack_detail", method = RequestMethod.GET)
	public ModelAndView MyTrack_Detail(@RequestParam int albumNumber, Model view) throws Exception {		
		view.addAttribute("albumList",albumservice.MytrackAlbum(albumNumber));
		view.addAttribute("musicList",musicservice.MytrackMusic(albumNumber));
		logger.info("It is mytrack_datail");
		ModelAndView mav = new ModelAndView("/upload/mytrack_detail");
		return mav;
	}

	/**내 트랙_뮤직_삭제 */
	@RequestMapping(value = "mytrackDel", method = RequestMethod.GET)
	public String MyTrackDelete(HttpServletRequest req, @RequestParam int musicNumber) throws Exception {
		logger.info("내 트랙 삭제");
		logger.info(musicNumber+"");
		musicservice.remove(musicNumber);
		return "redirect:/upload";
	}
	/** 비밀번호 확인 */
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String PassWordConfirm(HttpServletRequest req, Model view)  throws Exception{
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");	
		//view.addAttribute("userpw",userservice.passwordCheck(userNumber));
		logger.info("It is password_check");
		return "/modify/password_check";
	}
	/** 비밀번호 확인 완료 및 정보 수정 */
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String Modify(HttpServletRequest req, Model view) throws Exception {
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");	
		//userservice.selectAll(userNumber);
		view.addAttribute("userList",userservice.selectAll(userNumber));
		logger.info("It is modify");
		return "/modify/modify";
	}

	/**회원 탈퇴 */
	@RequestMapping(value = "withdrawal", method = RequestMethod.GET)
	public String PassWordWithdrawal() {

		logger.info("It is password_check2");
		return "/modify/password_check2";
	}

	/**회원 탈퇴2 */
	@RequestMapping(value = "withdrawal", method = RequestMethod.POST)
	public String Withdrawal() {
		logger.info("It is withdrawal");
		return "/modify/withdrawal";
	}

	
	@RequestMapping(value = "confirm")
	public String Confirm() {

		logger.info("It is confirm");
		return "/modify/confirm";
	}
	/** 좋아하는 곡 */
	@RequestMapping(value = "like_song")
	public String LikeSong(HttpServletRequest req, Model view) throws Exception {
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		view.addAttribute("MylikeList", likeservice.searchMusic(userNumber, 10));
		logger.info("It is like_song");
		return "/mypage/like_song";
	}
	
	/** 좋아하는 곡 삭제*/
	@RequestMapping(value = "like_song_del", method = RequestMethod.POST)
	public String LikeSongDelete(@RequestParam("musicNumber") int musicNumber, HttpServletRequest req, Model view) throws Exception {
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		
		LikeVO List = new LikeVO();
		List.setMusicNumber(musicNumber);
		List.setUserNumber(userNumber);
		likeservice.regist(List);
		
		return "redirect:/like_song";
	}
	
	/** 내 앨범 */	
	@RequestMapping(value = "my_album")
	public String myAlbum(HttpServletRequest req, Model view) throws Exception {
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		view.addAttribute("MyalbumList", playservice.searchAlbum(userNumber, 10));
		logger.info("It is myalbum");
		return "/mypage/myalbum";
	}
	
	/** 다운로드함 */
	@RequestMapping(value = "download")
	public String Download(HttpServletRequest req, Model view) throws Exception {
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		view.addAttribute("DownloadList", downservice.searchList(userNumber, 10));
		logger.info("It is download");
		return "/mypage/download";
	}

	/** 결제내역  */
	@RequestMapping(value = "payment")
	public String Payment() {

		logger.info("It is payment");
		return "/payment/payment";
	}
}