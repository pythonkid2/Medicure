package com.staragile.Banking.Banking;

import static org.junit.Assert.assertEquals;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class BankingApplicationTests {

	@Test
	public void contextLoads() {
		System.out.println("testing started");
		String str=("test string");
		assertEquals("test string", str);
		System.out.println("test ok");
	}

}
