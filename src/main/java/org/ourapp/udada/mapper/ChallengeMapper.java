package org.ourapp.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ourapp.udada.challenge.ChallengeDTO;
import org.ourapp.udada.challenge.ChallengeGetListDTO;
import org.ourapp.udada.challenge.ChallengeGlistDTO;
import org.ourapp.udada.challenge.ChallengeGoalDTO;
import org.ourapp.udada.challenge.ChallengeListDTO;
import org.ourapp.udada.challenge.ChallengeReadDTO;
import org.ourapp.udada.challenge.ChallengeReadGoalDTO;

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
	Long applyCheck(@Param("sEmail") String sEmail,@Param("cNo") Long cNo);
	Boolean challengeCancel(@Param("cNo") Long cNo,@Param("sEmail") String sEmail);
	int[] eNameSearch(String exercise);
	List<ChallengeListDTO> myChlgList(@Param("sEmail") String sEmail);
}
