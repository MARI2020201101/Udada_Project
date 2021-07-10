package org.ourapp.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ourapp.udada.EndSoonChallengeDTO;
import org.ourapp.udada.HighRateRecipeDTO;
import org.ourapp.udada.HotJournalDTO;
import org.ourapp.udada.challenge.ChallengeDTO;
import org.ourapp.udada.challenge.ChallengeGetListDTO;
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

public interface HomeMapper {

	List<HotJournalDTO> getHotJournal();

	List<EndSoonChallengeDTO> endSoonChallenge();

	List<HighRateRecipeDTO> highRateRecipe();

	int getMyExcs(@Param("mEmail") String mEmail);

	Double getBmi(@Param("mEmail") String mEmail);

}
