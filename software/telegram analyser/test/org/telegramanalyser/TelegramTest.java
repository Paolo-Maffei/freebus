package org.telegramanalyser;

import static org.junit.Assert.*;

import org.junit.Test;


public class TelegramTest {
	@Test public void testEmptyTelegram() {
		Telegram t = new Telegram();
		assertEquals(0x0, t.getCtrl());
		assertEquals(0x0000, t.getSourceAdress());
		assertEquals(0x0000, t.getDestAdress());
		assertEquals(0x00, t.getNPCI());
		assertEquals(0x00, t.getTPCI());
		assertEquals(0x0000, t.getAPCI());
	}
	@Test public void testTelegramString() {
		Telegram t2 = new Telegram("2E 11 1C 09 01 E1 00 80 27");
		assertEquals(0x2E, t2.getCtrl());
		assertEquals(0x111C, t2.getSourceAdress());
		assertEquals(0x0901, t2.getDestAdress());
		assertEquals(0xE1, t2.getNPCI());
		assertEquals(0x00, t2.getTPCI());
		assertEquals(0x80, t2.getAPCI());
		assertEquals(0x27, t2.getCRC());
	}

	@Test public void testSetterAndGetters() {
		Telegram t = new Telegram();
		t.setCtrl(0x2e);
		assertEquals(0x2e, t.getCtrl());
		t.setSourceAdress(0x1111);
		assertEquals(0x1111, t.getSourceAdress());
		t.setDestAdress(0x12fe);
		assertEquals(0x12fe, t.getDestAdress());
		t.setNPCI(0x2e);
		assertEquals(0x2e, t.getNPCI());
		t.setTPCI(0x2e);
		assertEquals(0x2c, t.getTPCI());
		t.setAPCI(0x2e11);
		assertEquals(0x211, t.getAPCI());
		t.setCRC(0x5F);
		assertEquals(0x5F, t.getCRC());
	}
}
