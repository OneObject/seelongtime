package com.longtime.app.ixin.mgr.vote.service.impl;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.longtime.app.ixin.mgr.vote.service.VoteActivityService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:com.longtime.context.xml" })
public class TestVoteActivityServiceImpl {

	@Resource(name = "voteActivityService")
	VoteActivityService voteActivityService;
	
	@Test
	public void TestDoSendNotify() {
		String id = "cc76cfd46d2a4436afa4bcb39a1c088a";
		voteActivityService.doSendNotify(id);
	}
	
}
