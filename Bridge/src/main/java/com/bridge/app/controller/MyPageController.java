/**
작성자 - 이주연
내용 - MyPageController
시작날짜 - 2016/07/17
수정날짜 - 2016/07/30
변경내용 - 
 */

package com.bridge.app.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.bridge.app.domain.AlbumVO;
import com.bridge.app.domain.ArtistVO;
import com.bridge.app.domain.LikeVO;
import com.bridge.app.domain.MusicVO;
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

	/** Upload_첫페이지 */
	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public String Upload(HttpServletRequest req, Model model) throws Exception {
		logger.info("업로드 시작");
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		model.addAttribute("artistList", artistservice.selectArtist(userNumber));
		logger.info(artistservice.selectArtist(userNumber) + "");
		return "/upload/upload_artist";

	}
	
	/** Upload_아티스트_선택 */
	@RequestMapping(value = "artistRegist", method = RequestMethod.GET)
	public ModelAndView AristRegist(HttpServletRequest req, @RequestParam int artistNumber, Model model)
			throws Exception {
		logger.info("등록된 아티스트 선택");
		ModelAndView mav = new ModelAndView("/upload/upload_album");
		model.addAttribute("artistList", artistservice.selectArtistOne(artistNumber));
		logger.info("값" + artistservice.selectArtistOne(artistNumber) + "");
		return mav;
	}
	
	/** Upload_아티스트_수정 */
	@RequestMapping(value = "artistUpdate", method = RequestMethod.GET)
	public ModelAndView AristUpdate(HttpServletRequest req, @RequestParam int artistNumber, Model view)
			throws Exception {
		logger.info("아티스트 수정");
		logger.info(artistNumber + "");
		ArtistVO artist = artistservice.selectArtistOne(artistNumber);
		view.addAttribute("artist", artist);
		ModelAndView mav = new ModelAndView("/upload/artist_update");
		return mav;
	}
	
	/** Upload_아티스트_수정완료 */
	@RequestMapping(value = "artistUpdateCom", method = RequestMethod.POST)
	public ModelAndView AristUpdateCom(ArtistVO artist, HttpServletRequest req, Model view) throws Exception {
		logger.info("아티스트 수정완료");
		artistservice.update(artist, req);
		ModelAndView mav = new ModelAndView("redirect:/upload");
		return mav;
	}
	
	/** Upload_아티스트_삭제 */
	@RequestMapping(value = "artistDel", method = RequestMethod.GET)
	public String AristDelete(ArtistVO artist) throws Exception {
		logger.info("아티스트 삭제");
		artistservice.remove(artist);
		return "/upload/upload_artist2";

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

	/**
	 * 내 트랙 확인 상세 페이지 / 현재 곡들이 중복되어 출력됨.
	 * @throws Exception
	 */
	@RequestMapping(value = "mytrack_detail", method = RequestMethod.GET)
	public ModelAndView MyTrack_Detail(@RequestParam int albumNumber, Model view) throws Exception {
		view.addAttribute("album", albumservice.MytrackAlbum(albumNumber));
		view.addAttribute("music", musicservice.MytrackMusic(albumNumber));
		logger.info("It is mytrack_datail");
		view.addAttribute("albumNumber", albumNumber);
		ModelAndView mav = new ModelAndView("/upload/mytrack_detail");
		
		return mav;
	}

	
	/** 내 트랙_앨범_수정 */
	@RequestMapping(value = "updateAlbum", method = RequestMethod.POST)
	public String updateAlbum(AlbumVO album, HttpServletRequest req, Model view) throws Exception {
		logger.info("앨범 수정");	
		albumservice.update(album, req);
		logger.info("앨범 등록 완료");
		view.addAttribute("albumNumber", album.getAlbumNumber());
		return "redirect:/mytrack_detail";		
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
	public String PassWordConfirm(HttpServletRequest req, Model view) throws Exception {
		logger.info("It is password_check");
		return "/modify/password_check";
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String Pass_check(UserVO vo, HttpServletRequest req, Model view) throws Exception{
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		String right_pass= userservice.passwordCheck(userNumber);
		if(!right_pass.equals(vo.getUserPassword())){
			req.setAttribute("check","false");
			return "/modify/password_check";
		}else{
			req.setAttribute("check","true");
			List<UserVO> userList = new ArrayList();
			userList = userservice.selectAll(userNumber);
			UserVO user = userList.get(0);
			String[] birth = user.getUserBirthday().split("-");
			user.setYear(birth[0]);
			user.setMonth(birth[1]);
			user.setDay(birth[2]);
			String[] phone = user.getUserPhone().split("-");
			user.setTel1(phone[0]);
			user.setTel2(phone[1]);
			user.setTel3(phone[2]);

			String[] email = user.getUserEmail().split("@");
			user.setUseremail1(email[0]);
			user.setUseremail2("@" + email[1]);

			view.addAttribute("user", user);
			logger.info("It is modify");
			return "/modify/modify";
		}
	}
	
/*	*//** 비밀번호 확인 완료 및 정보 수정 *//*
	@RequestMapping(value = "modify_page", method = RequestMethod.GET)
	public String Modify(HttpServletRequest req, Model view) throws Exception {
		logger.info("modify_page컨트롤러");
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		logger.info("modify_page컨트롤러2");
		List<UserVO> userList = new ArrayList();
		userList = userservice.selectAll(userNumber);
		UserVO user = userList.get(0);
		logger.info("modify_page컨트롤러3");
		String[] birth = user.getUserBirthday().split("-");
		user.setYear(birth[0]);
		user.setMonth(birth[1]);
		user.setDay(birth[2]);
		logger.info("modify_page컨트롤러4");
		String[] phone = user.getUserPhone().split("-");
		user.setTel1(phone[0]);
		user.setTel2(phone[1]);
		user.setTel3(phone[2]);

		String[] email = user.getUserEmail().split("@");
		user.setUseremail1(email[0]);
		user.setUseremail2("@" + email[1]);

		view.addAttribute("user", user);
		logger.info("It is modify");
		return "/modify/modify";
	}*/

	/** 정보 수정 완료 */
	@RequestMapping(value = "modifyComfirm", method = RequestMethod.POST)
	public String ModifyComfirm(UserVO user, HttpServletRequest req, Model view) throws Exception {
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		userservice.update(user, userNumber);
		logger.info("home");
		return "home";
	}

	

	/** 탈퇴 전 비밀번호 확인 이동*/
	@RequestMapping(value = "withdrawal", method = RequestMethod.GET)
	public String PassWordConfirm2(HttpServletRequest req, Model view) throws Exception {
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		view.addAttribute("userPassword", userservice.passwordCheck(userNumber));
		logger.info("It is password_check2");
		return "/modify/password_check2";
	}
	
	/**
	 * 확인 이후 회원 탈퇴 이동
	 * @throws Exception */
	@RequestMapping(value = "withdrawal", method = RequestMethod.POST)
	public String Withdrawal(UserVO user, HttpServletRequest req, Model view) throws Exception {
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		String right_pass= userservice.passwordCheck(userNumber);
		if(!right_pass.equals(user.getUserPassword())){
			req.setAttribute("check","false");
			return "/modify/password_check2";
		}else{
			req.setAttribute("check","true");
			view.addAttribute("user", user);
			logger.info("It is modify");
			return "/modify/withdrawal";
		}
		/*int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");		
		logger.info("It is withdrawal");
		return "/modify/withdrawal";*/
	}
	
	
	/** 탈퇴 동의 */
	@RequestMapping(value = "confirm", method = RequestMethod.GET)
	public String Confirm() {
		logger.info("It is confirm");
		return "/modify/confirm";
	}
	
	/** 탈퇴 완료
	 * @throws Exception */
	@RequestMapping(value = "confirm", method = RequestMethod.POST)
	public String userConfirm(UserVO user, SessionStatus session, HttpServletRequest req) throws Exception {
		int usernumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		logger.info(usernumber+"");
		userservice.remove(usernumber);
		session.setComplete();
		logger.info("It is confirmCom");
		return "home";
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

	/** 결제내역 
	 * @throws Exception */
	@RequestMapping(value = "payment")
	public String Payment(HttpServletRequest req, Model view) throws Exception {
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		view.addAttribute("pay",downservice.searchMyDownload(userNumber));
		logger.info("It is payment");
		return "/payment/payment";
	}
	
	@RequestMapping("delete")
	public String delete(@RequestParam("playlistAll") List<Integer> playlistAll, String pagename, HttpServletRequest req) throws Exception{
		 
		 Map dlist = new HashMap();
	     dlist.put("playListAll", playlistAll);
		 List<MusicVO> musicList = downservice.search_sev(dlist);
		 logger.info(pagename+"딜리트");
		 req.setAttribute("delete", pagename);
		 req.setAttribute("playlistAll", musicList);
		 req.setAttribute("playlistall", dlist);
	      
	      return "/mypage/delete_modal";
	}
	
	@RequestMapping("delete_music")
	public String delete_music(String playlist_numbers, String delete, HttpServletRequest req) throws Exception{
		int usernumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		Map dlist = new HashMap();
		playlist_numbers=playlist_numbers.replace("[", "").replace("]", "");
		String[] playlist = playlist_numbers.split(",");
		List<Integer> music_ns = new ArrayList();
        for(int i=0;i<playlist.length;i++){
           music_ns.add(Integer.parseInt(playlist[i].trim()));
           logger.info(playlist[i].trim()+"delete컨트롤러");
           logger.info(playlist_numbers);
        }
        dlist.put("playListAll", music_ns);
		
		dlist.put("usernumber", usernumber);
		
		if(delete.equals("down")){		
			downservice.remove(dlist);
		}else if(delete.equals("like")){
			likeservice.removeAll(dlist);
			return "redirect:/like_song";
		}else if(delete.equals("myalbum")){
			playservice.removeAll(dlist);
			return "redirect:/my_album";
		}
		
		return "redirect:/download";
	}
}