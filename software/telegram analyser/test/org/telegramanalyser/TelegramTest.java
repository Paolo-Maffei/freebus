package org.telegramanalyser;

import static org.junit.Assert.*;

import org.junit.Test;


public class TelegramTest {
	@Test public void testEmptyTelegram() {
		Telegram t = new Telegram();
		assertEquals(0x0, t.ctrlByte.get());
		assertEquals(0x0000, t.sourceAdress.get());
		assertEquals(0x0000, t.destAdress.get());
		assertEquals(0x00, t.npciByte.get());
		assertEquals(0x00, t.tpciApciByte.getTpci());
		assertEquals(0x0000, t.tpciApciByte.getApci());
	}
	@Test public void testTelegramString() {
		Telegram t2 = new Telegram("2E 11 1C 09 01 E1 00 80 27");
		assertEquals(0x2E, t2.ctrlByte.get());
		assertEquals(0x111C, t2.sourceAdress.get());
		assertEquals(0x0901, t2.destAdress.get());
		assertEquals(0xE1, t2.npciByte.get());
		assertEquals(0x00, t2.tpciApciByte.getTpci());
		assertEquals(0x80, t2.tpciApciByte.getApci());
		assertEquals(0x27, t2.crcByte.get());
	}

	@Test public void testSetterAndGetters() {
		Telegram t = new Telegram();
		t.ctrlByte.set(0x2e);
		assertEquals(0x2e, t.ctrlByte.get());
		t.sourceAdress.set(0x1111);
		assertEquals(0x1111, t.sourceAdress.get());
		t.destAdress.set(0x12fe);
		assertEquals(0x12fe, t.destAdress.get());
		t.npciByte.set(0x2e);
		assertEquals(0x2e, t.npciByte.get());
		t.tpciApciByte.setTpci(0x2e);
		assertEquals(0x2c, t.tpciApciByte.getTpci());
		t.tpciApciByte.setApci(0x2e11);
		assertEquals(0x211, t.tpciApciByte.getApci());
		t.crcByte.set(0x5F);
		assertEquals(0x5F, t.crcByte.get());
	}
}
