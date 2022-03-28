package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itwill.helljava.dao.MemberDAO;
import itwill.helljava.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	@Transactional
	public void addMember(Member member) {
		memberDAO.insertMember(member);
	}

	@Override
	@Transactional
	public void modifyMember(Member member) {
		memberDAO.updateMember(member);
	}

	@Override
	public Member getMember(int member_no) {
		return memberDAO.selectMember(member_no);
	}

	@Override
	public List<Member> getMemberList(Map<String, Object> map) {
		return memberDAO.selectMemberList(map);
	}

	
}
