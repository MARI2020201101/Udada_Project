package org.ourapp.udada;

import java.util.List;

import org.ourapp.udada.mapper.HomeMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor

public class HomeServiceImpl implements HomeService{

	private final HomeMapper homeMapper;

	@Override
	public List<HotJournalDTO> getHotJournal() {
		return homeMapper.getHotJournal();
	}

	@Override
	public List<EndSoonChallengeDTO> endSoonChallenge() {
		return homeMapper.endSoonChallenge();
	}

	@Override
	public List<HighRateRecipeDTO> highRateRecipe() {
		return homeMapper.highRateRecipe();
	}

	@Override
	public int getMyExcs(String mEmail) {
		return homeMapper.getMyExcs(mEmail);
	}

	@Override
	public Double getBmi(String mEmail) {
		return homeMapper.getBmi(mEmail);
	}


}
