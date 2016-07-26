package com.longtime.app.document;

import java.io.File;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:com.longtime.context.xml" })
public class TestDocument2PDF {

	@Resource
	private Document2PDF document2PDF;
	
	@Test
	public void testExcel2PDF() {
		try {
			document2PDF.execute(new File("F:/Users/liming/Documents/Downloads/请为我们打分_统计结果.xlsx"), new File("F:/Users/liming/Documents/Downloads/请为我们打分_统计结果.pdf"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
