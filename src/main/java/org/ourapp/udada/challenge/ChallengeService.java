package org.ourapp.udada.challenge;

import java.util.List;

public interface ChallengeService {
	
	List<ChallengeListDTO> loadList(ChallengeGetListDTO challengeGetListDTO);
	void register(ChallengeDTO challengeDTO);
	void registerGoal(ChallengeGoalDTO challengeDTO);
	void registerApply(ChallengeDTO challengeDTO);
	List<ChallengeGlistDTO> loadGlist(Long cNo);
	ChallengeReadDTO read(Long cNo);
	List<ChallengeReadGoalDTO> readGoal(Long cNo);
	Boolean challengeApply(Long cNo, String sEmail);
	void modify(ChallengeDTO challengeDTO);
	void delGoal(ChallengeDTO challengeDTO);
	void modifyGoal(ChallengeGoalDTO challengeGoalDTO);
	void delete(Long cNo);
	List<ChallengeReadGoalDTO> searchExcs(String eName);
	Long applyCheck(String sEmail, Long cNo);
	Boolean challengeCancel(Long cNo, String sEmail);
	int[] eNameSearch(String exercise);
	List<ChallengeListDTO> myChlgList(String sEmail);
}
