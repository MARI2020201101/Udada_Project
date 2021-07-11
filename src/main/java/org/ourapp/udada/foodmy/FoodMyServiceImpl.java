package org.ourapp.udada.foodmy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ourapp.udada.mapper.FoodMyMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Service
@RequiredArgsConstructor
@Slf4j
public class FoodMyServiceImpl implements FoodMyService{

	private final FoodMyMapper foodMyMapper;
	
	@Override
	public List<FoodMyResultDTO> getList(String day, String mEmail) throws Exception{
		
		return foodMyMapper.select(day, mEmail);
	}

	@Override
	public void modify(FoodMyDTO foodMyDTO) throws Exception {
		foodMyMapper.update(foodMyDTO);
	}

	@Override
	public void delete(Long fmNo) throws Exception{
		foodMyMapper.delete(fmNo);
	}

	@Override
	public FoodMyDayTotalDTO getDayTotal(String day, String mEmail) throws Exception{
				
		return foodMyMapper.selectDayTotal(day, mEmail);
	}
	

	@Override
	public Map<String, Object> getDayTotalWithRecommend(String day, String mEmail) throws Exception {
		//log.info("day.......: "+ day);
		FoodMyDayTotalDTO dayTotalDTO = foodMyMapper.selectDayTotal(day, mEmail);
		FoodMyMemberSpecDTO memberInfo = foodMyMapper.selectMemberInfo(mEmail);
		
		FoodMyRecommendDTO recommendDTO = makeRecommend(dayTotalDTO, memberInfo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("dayTotalDTO", dayTotalDTO);
		map.put("recommendDTO", recommendDTO);
		map.put("day", day);

		return map;
	}

	
	
	private FoodMyRecommendDTO makeRecommend(FoodMyDayTotalDTO dayTotalDTO, FoodMyMemberSpecDTO memberInfo) throws Exception{	
		int recommendKcal = (int) ((memberInfo.getMemberSpecDTO().getMsHeight()-100)*(0.9)*30);
		if(recommendKcal<0) recommendKcal = 1800;
		String message = "";
		FoodMyRecommendDTO recommendDTO = new FoodMyRecommendDTO();
		if(dayTotalDTO==null) {
			message = "오늘 하루를 기록해 보아요! ";
			recommendDTO.setMessage(message);
			recommendDTO.setRecommendKcal(recommendKcal);
			recommendDTO.setImg("message-write.svg");
			return recommendDTO;
		}
		int dayTotalKcal = dayTotalDTO.getDayTotalKcal();
		int tCarbo = dayTotalDTO.getDayTotalCarbo();
		int tProtein = dayTotalDTO.getDayTotalProtein();
		int tFat = dayTotalDTO.getDayTotalFat();
		int tNutrient = 1;
		tNutrient += tCarbo + tProtein + tFat;
		log.info("tProtein:"+ tProtein + "\ntFat:"+tFat);
		log.info("tNutrient:"+ tNutrient);
		int perCarbo = (tCarbo/tNutrient)*100;
		
		double perProtein = (tProtein/(tNutrient*1.0))*100;
		double perFat = (tFat/(tNutrient*1.0))*100;
		double[] recommendNutrient = new double[3];
		
		
		log.info("perProtein:"+ (perProtein) + "\nperFat:"+perFat);
		
		
		double[] VEG = {40,20,40};
		double[] NORMAL = {50,30,20};
		double[] KETO = {10,30,60};
		double[] MEDT = {40,30,30};
		
		String mealType = memberInfo.getMemberDTO().getMMeal();
		if(mealType==null) {
			mealType = "NORMAL";
		}
		switch (mealType) {
        case "VEG" :  recommendNutrient = VEG; break;
        case "NORMAL" :  recommendNutrient = NORMAL; break;
        case "KETO" :  recommendNutrient = KETO; break;
        case "MEDT" :  recommendNutrient = MEDT; break;
        default: recommendNutrient = NORMAL; break;      		 
			}
		
		 if(perProtein<recommendNutrient[1]*0.4) {
				message = "단백질을 좀더 섭취해보아요!";
				recommendDTO.setImg("message-protein.svg");
		}else if(perFat<recommendNutrient[2]*0.2) {
			message = "지방을 좀더 섭취해보아요!";
			recommendDTO.setImg("message-fat.svg");
		}else {
			message = "비타민을 섭취해보아요!";
			recommendDTO.setImg("message-vitamin.svg");
		}
			recommendDTO.setMessage(message);
			recommendDTO.setRecommendKcal(recommendKcal);
			return recommendDTO;
		
	}


}
