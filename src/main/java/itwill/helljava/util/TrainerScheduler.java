package itwill.helljava.util;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import itwill.helljava.Enum.PayTypeEnum;
import itwill.helljava.dto.Member;
import itwill.helljava.service.MemberService;
import itwill.helljava.service.PayService;

@Component
public class TrainerScheduler {

	private static final Logger LOGGER = LoggerFactory.getLogger(TrainerScheduler.class);

	@Autowired
	private MemberService memberService;

	@Autowired
	private PayService payService;

	@Scheduled(cron = "0 10 6 * * ?") // 일단 매일 아침 6시 10분 실행
	public void autoPayTrainer() throws ParseException {

		List<Member> autoMemberList = memberService.getAutoPayMemberList();

		// 파싱할 패턴
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		for (Member autoMember : autoMemberList) {

			// 트레이너 결제 시작일
			String payStartDate = autoMember.getPayStart().substring(0, 10);

			// 최근 결제일 localDate 타입으로 파싱
			LocalDate lastPayDate = LocalDate.parse(payStartDate, formatter);
			LOGGER.info("결제 시작일 = " + lastPayDate);

			// 최근 결제일로부터 30일 더함
			LocalDate payDate = lastPayDate.plusDays(30);
			LOGGER.info("다음 결제일 = " + payDate);

			// 오늘 날짜
			LocalDate now = LocalDate.now();
			LOGGER.info("오늘 날짜 = " + now);

			// 결제일이 되었을 경우
			if (now.isEqual(payDate)) {

				Map<String, Object> payMap = new HashMap<String, Object>();

				
				payMap.put("payNo", autoMember.getPayNo());
				payMap.put("payStatus", autoMember.getPayStatus());
				

				Map<String, Object> cashMap = new HashMap<String, Object>();

				cashMap.put("cash", 15000);
				cashMap.put("cashType", PayTypeEnum.트레이너신청.getValue());
				cashMap.put("memberNo", autoMember.getMemberNo());

				try {
					if (15000 > autoMember.getMemberCash()) {
						throw new Exception("잔액이 모자랍니다.");
					}
					else {
						payMap.put("payStart", String.valueOf(payDate));
						// 결제 일자 최신화
						payService.modifyPay(payMap);
						
						// 15,000원 캐시 차감
						memberService.modifyMemberCash(cashMap);
					}
				} catch (Exception e) {
					//payStatus 0은 비활성화
					payMap.put("payStatus", 0);
					payService.modifyPay(payMap);
					LOGGER.info(e.getMessage());
				}

			}
		}
	}

}
