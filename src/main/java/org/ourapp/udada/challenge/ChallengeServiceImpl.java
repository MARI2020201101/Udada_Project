package org.ourapp.udada.challenge;

import java.util.List;

import org.ourapp.udada.mapper.ChallengeMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor

public class ChallengeServiceImpl implements ChallengeService{

	private final ChallengeMapper challengeMapper;


	@Override
	public void register(ChallengeDTO challengeDTO) {	
		challengeMapper.register(challengeDTO);	
	}

	@Override
	public void registerApply(ChallengeDTO challengeDTO) {
		challengeMapper.registerApply(challengeDTO);		
	}

	@Override
	public List<ChallengeListDTO> loadList(ChallengeGetListDTO challengeGetListDTO) {
		return challengeMapper.loadList(challengeGetListDTO);
	}

	@Override
	public List<ChallengeGlistDTO> loadGlist(Long cNo) {
		return challengeMapper.loadGlist(cNo);
	}

	@Override
	public ChallengeReadDTO read(Long cNo) {
		return challengeMapper.read(cNo);
	}

	@Override
	public List<ChallengeReadGoalDTO> readGoal(Long cNo) {
		return challengeMapper.readGoal(cNo);
	
	}

	@Override
	public Boolean challengeApply(Long cNo, String sEmail) {
		return challengeMapper.challengeApply(cNo, sEmail);
	}

	@Override
	public void modify(ChallengeDTO challengeDTO) {
		challengeMapper.modify(challengeDTO);
	}

	@Override
	public void delGoal(ChallengeDTO challengeDTO) {
		challengeMapper.delGoal(challengeDTO);	
	}

	@Override
	public void modifyGoal(ChallengeGoalDTO challengeGoalDTO) {

		challengeMapper.modifyGoal(challengeGoalDTO);
		
	}

	@Override
	public void delete(Long cNo) {
		challengeMapper.delete(cNo);
	}

	@Override
	public List<ChallengeReadGoalDTO> searchExcs(String eName) {
		
		return challengeMapper.searchExcs(eName);
		
	}

	@Override
	public void registerGoal(ChallengeGoalDTO challengeDTO) {
		
		challengeMapper.registerGoal(challengeDTO);
		
	}

	@Override
	public Long applyCheck(String sEmail, Long cNo) {

		return challengeMapper.applyCheck(sEmail, cNo);
	}

	@Override
	public Boolean challengeCancel(Long cNo, String sEmail) {
		
		return challengeMapper.challengeCancel(cNo, sEmail);
	}

	@Override
	public int[] eNameSearch(String exercise) {
		return challengeMapper.eNameSearch(exercise);
	}

	@Override
	public List<ChallengeListDTO> myChlgList(String sEmail) {

		return challengeMapper.myChlgList(sEmail);
	}

}
