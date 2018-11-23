package com.frog.controller.api.user;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frog.common.Result.ApiResult;
import com.frog.model.Proposal;
import com.frog.service.ProposalService;

@Controller
@RequestMapping("/user/proposal")
public class ProposalController {
	@Autowired
	ProposalService service;
	
	@RequestMapping("/add")
	@ResponseBody
	public ApiResult add(Proposal proposal){
		if (proposal.getMessage()==null||proposal.getMessage().isEmpty()){
			return new ApiResult(3,"添加失败");
		}
		proposal.setTime(new Date());
		service.addProposal(proposal);
		return new ApiResult();
	}
}
