package org.ourapp.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ourapp.udada.challenge.ChallengeDTO;
import org.ourapp.udada.challenge.ChallengeGetListDTO;
import org.ourapp.udada.challenge.ChallengeGetMyListDTO;
import org.ourapp.udada.challenge.ChallengeGlistDTO;
import org.ourapp.udada.challenge.ChallengeGoalDTO;
import org.ourapp.udada.challenge.MyChallengeInfoDTO;
import org.ourapp.udada.challenge.MyChallengeSuccessCntMDTO;
import org.ourapp.udada.challenge.MyChallengeTalkDTO;
import org.ourapp.udada.challenge.ChallengeListDTO;
import org.ourapp.udada.challenge.ChallengeReadDTO;
import org.ourapp.udada.challenge.ChallengeReadGoalDTO;
import org.ourapp.udada.challenge.MyChallengeApplyDTO;
import org.ourapp.udada.challenge.MyChallengeEndDTO;
import org.ourapp.udada.challenge.MyChallengeGetMySuccessDayDTO;
import org.ourapp.udada.challenge.MyChallengeGetTalkDTO;
import org.ourapp.udada.challenge.MyChallengeProceedDTO;
import org.ourapp.udada.challenge.MyChallengeSuccessCntDDTO;

public interface ChallengeMapper {

	List<ChallengeListDTO> loadList(ChallengeGetListDTO challengeGetListDTO);
	void register(ChallengeDTO challengeDTO);
	void registerGoal(ChallengeGoalDTO challengeDTO);
	void registerApply(ChallengeDTO challengeDTO);
	List<ChallengeGlistDTO> loadGlist(Long cNo);
	ChallengeReadDTO read(Long cNo);
	List<ChallengeReadGoalDTO> readGoal(Long cNo);
	Boolean challengeApply(@Param("cNo") Long cNo,@Param("sEmail") String sEmail);
	void modify(ChallengeDTO challengeDTO);
	void delGoal(ChallengeDTO challengeDTO);
	void modifyGoal(ChallengeGoalDTO challengeGoalDTO);
	void delete(Long cNo);
	List<ChallengeReadGoalDTO> searchExcs(String eName);
	int applyCheck(@Param("sEmail") String sEmail,@Param("cNo") Long cNo);
	Boolean challengeCancel(@Param("cNo") Long cNo,@Param("sEmail") String sEmail);
	int[] eNameSearch(String exercise);
	List<MyChallengeProceedDTO> proceedList(@Param("sEmail")String sEmail);
	List<MyChallengeApplyDTO> applyList(String sEmail);
	List<MyChallengeEndDTO> endList(String sEmail);
	MyChallengeInfoDTO myChallengeInfo(@Param("cNo")Long cNo);
	List<MyChallengeSuccessCntMDTO> getMemSuccess(MyChallengeInfoDTO myChallengeInfoDTO);
	List<MyChallengeSuccessCntDDTO> getDaySuccess(MyChallengeInfoDTO challengeInfoDTO);
	int getTodaySuccess(MyChallengeInfoDTO myChallengeInfoDTO);
	void talkReg(MyChallengeTalkDTO myChallengeTalkDTO);
	List<MyChallengeGetTalkDTO> getTalk(@Param("cNo")Long cNo);
	List<MyChallengeGetTalkDTO> getTalkReply(@Param("reNo")Long reNo);
	void talkDel(@Param("reNo")int reNo, @Param("checkTalk")int checkTalk);
	void editTalk(@Param("reNo")int reNo, @Param("reContent")String reContent);
	List<MyChallengeGetMySuccessDayDTO> getMySuccessDay(MyChallengeInfoDTO myChallengeInfoDTO);
	int checkMem(@Param("cNo")Long cNo, @Param("mEmail")String mEmail);
	List<ChallengeListDTO> loadMyList(ChallengeGetMyListDTO challengeGetListDTO);
	int getListSize(ChallengeGetListDTO challengeGetListDTO);
	int getMyListSize(ChallengeGetMyListDTO challengeGetListDTO);
	List<ChallengeReadGoalDTO> readSuccessGoal(@Param("cNo") Long cNo);
}
