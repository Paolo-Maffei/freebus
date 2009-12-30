package org.telegramanalyser;

import static org.junit.Assert.*;

import org.junit.Assume;
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
	
	@Test public void testGetCtrlBits() {
		Telegram t = new Telegram("2E 11 1C 09 01 E1 00 80 27");
		assertEquals("l", t.ctrlByte.getDefaultBit(7));
		assertEquals("0", t.ctrlByte.getDefaultBit(6));
		assertEquals("r", t.ctrlByte.getDefaultBit(5));
		assertEquals("1", t.ctrlByte.getDefaultBit(4));
		assertEquals("p", t.ctrlByte.getDefaultBit(3));
		assertEquals("p", t.ctrlByte.getDefaultBit(2));
		assertEquals("0", t.ctrlByte.getDefaultBit(1));
		assertEquals("0", t.ctrlByte.getDefaultBit(0));
		assertEquals("0", t.ctrlByte.getBit(7));
		assertEquals("0", t.ctrlByte.getBit(6));
		assertEquals("1", t.ctrlByte.getBit(5));
		assertEquals("0", t.ctrlByte.getBit(4));
		assertEquals("1", t.ctrlByte.getBit(3));
		assertEquals("1", t.ctrlByte.getBit(2));
		assertEquals("1", t.ctrlByte.getBit(1));
		assertEquals("0", t.ctrlByte.getBit(0));
	}

	@Test public void testSrcAddressBits() {
		Telegram t = new Telegram("2E 11 1C 09 01 E1 00 80 27");
		assertEquals("h", t.sourceAdress.getDefaultBit(15));
		assertEquals("h", t.sourceAdress.getDefaultBit(14));
		assertEquals("h", t.sourceAdress.getDefaultBit(13));
		assertEquals("h", t.sourceAdress.getDefaultBit(12));
		assertEquals("m", t.sourceAdress.getDefaultBit(11));
		assertEquals("m", t.sourceAdress.getDefaultBit(10));
		assertEquals("m", t.sourceAdress.getDefaultBit(9));
		assertEquals("m", t.sourceAdress.getDefaultBit(8));
		assertEquals("l", t.sourceAdress.getDefaultBit(7));
		assertEquals("l", t.sourceAdress.getDefaultBit(6));
		assertEquals("l", t.sourceAdress.getDefaultBit(5));
		assertEquals("l", t.sourceAdress.getDefaultBit(4));
		assertEquals("l", t.sourceAdress.getDefaultBit(3));
		assertEquals("l", t.sourceAdress.getDefaultBit(2));
		assertEquals("l", t.sourceAdress.getDefaultBit(2));
		assertEquals("l", t.sourceAdress.getDefaultBit(0));
		assertEquals("0", t.sourceAdress.getBit(15));
		assertEquals("0", t.sourceAdress.getBit(14));
		assertEquals("0", t.sourceAdress.getBit(13));
		assertEquals("1", t.sourceAdress.getBit(12));
		assertEquals("0", t.sourceAdress.getBit(11));
		assertEquals("0", t.sourceAdress.getBit(10));
		assertEquals("0", t.sourceAdress.getBit(9));
		assertEquals("1", t.sourceAdress.getBit(8));
		assertEquals("0", t.sourceAdress.getBit(7));
		assertEquals("0", t.sourceAdress.getBit(6));
		assertEquals("0", t.sourceAdress.getBit(5));
		assertEquals("1", t.sourceAdress.getBit(4));
		assertEquals("1", t.sourceAdress.getBit(3));
		assertEquals("1", t.sourceAdress.getBit(2));
		assertEquals("0", t.sourceAdress.getBit(1));
		assertEquals("0", t.sourceAdress.getBit(0));
	}

	@Test public void testDestAddressBits_UNI() {
		Telegram t = new Telegram("2E 11 1C 09 01 E1 00 80 27");
		assertEquals("0", t.destAdress.getDefaultBit(15));
		assertEquals("h", t.destAdress.getDefaultBit(14));
		assertEquals("h", t.destAdress.getDefaultBit(13));
		assertEquals("h", t.destAdress.getDefaultBit(12));
		assertEquals("m", t.destAdress.getDefaultBit(11));
		assertEquals("m", t.destAdress.getDefaultBit(10));
		assertEquals("m", t.destAdress.getDefaultBit(9));
		assertEquals("m", t.destAdress.getDefaultBit(8));
		assertEquals("l", t.destAdress.getDefaultBit(7));
		assertEquals("l", t.destAdress.getDefaultBit(6));
		assertEquals("l", t.destAdress.getDefaultBit(5));
		assertEquals("l", t.destAdress.getDefaultBit(4));
		assertEquals("l", t.destAdress.getDefaultBit(3));
		assertEquals("l", t.destAdress.getDefaultBit(2));
		assertEquals("l", t.destAdress.getDefaultBit(2));
		assertEquals("l", t.destAdress.getDefaultBit(0));
		assertEquals("0", t.destAdress.getBit(15));
		assertEquals("0", t.destAdress.getBit(14));
		assertEquals("0", t.destAdress.getBit(13));
		assertEquals("0", t.destAdress.getBit(12));
		assertEquals("1", t.destAdress.getBit(11));
		assertEquals("0", t.destAdress.getBit(10));
		assertEquals("0", t.destAdress.getBit(9));
		assertEquals("1", t.destAdress.getBit(8));
		assertEquals("0", t.destAdress.getBit(7));
		assertEquals("0", t.destAdress.getBit(6));
		assertEquals("0", t.destAdress.getBit(5));
		assertEquals("0", t.destAdress.getBit(4));
		assertEquals("0", t.destAdress.getBit(3));
		assertEquals("0", t.destAdress.getBit(2));
		assertEquals("0", t.destAdress.getBit(1));
		assertEquals("1", t.destAdress.getBit(0));
	}

	@Test public void testDestAddressBits_MULTI() {
		Telegram t = new Telegram("2E 11 1C 09 01 61 00 80 27");
		assertEquals("h", t.destAdress.getDefaultBit(15));
		assertEquals("h", t.destAdress.getDefaultBit(14));
		assertEquals("h", t.destAdress.getDefaultBit(13));
		assertEquals("h", t.destAdress.getDefaultBit(12));
		assertEquals("m", t.destAdress.getDefaultBit(11));
		assertEquals("m", t.destAdress.getDefaultBit(10));
		assertEquals("m", t.destAdress.getDefaultBit(9));
		assertEquals("m", t.destAdress.getDefaultBit(8));
		assertEquals("l", t.destAdress.getDefaultBit(7));
		assertEquals("l", t.destAdress.getDefaultBit(6));
		assertEquals("l", t.destAdress.getDefaultBit(5));
		assertEquals("l", t.destAdress.getDefaultBit(4));
		assertEquals("l", t.destAdress.getDefaultBit(3));
		assertEquals("l", t.destAdress.getDefaultBit(2));
		assertEquals("l", t.destAdress.getDefaultBit(2));
		assertEquals("l", t.destAdress.getDefaultBit(0));
		assertEquals("0", t.destAdress.getBit(15));
		assertEquals("0", t.destAdress.getBit(14));
		assertEquals("0", t.destAdress.getBit(13));
		assertEquals("0", t.destAdress.getBit(12));
		assertEquals("1", t.destAdress.getBit(11));
		assertEquals("0", t.destAdress.getBit(10));
		assertEquals("0", t.destAdress.getBit(9));
		assertEquals("1", t.destAdress.getBit(8));
		assertEquals("0", t.destAdress.getBit(7));
		assertEquals("0", t.destAdress.getBit(6));
		assertEquals("0", t.destAdress.getBit(5));
		assertEquals("0", t.destAdress.getBit(4));
		assertEquals("0", t.destAdress.getBit(3));
		assertEquals("0", t.destAdress.getBit(2));
		assertEquals("0", t.destAdress.getBit(1));
		assertEquals("1", t.destAdress.getBit(0));
	}

	@Test public void testNpciBits() {
		Telegram t = new Telegram("2E 11 1C 09 01 E1 00 80 27");
		assertEquals("d", t.npciByte.getDefaultBit(7));
		assertEquals("n", t.npciByte.getDefaultBit(6));
		assertEquals("n", t.npciByte.getDefaultBit(5));
		assertEquals("n", t.npciByte.getDefaultBit(4));
		assertEquals("l", t.npciByte.getDefaultBit(3));
		assertEquals("l", t.npciByte.getDefaultBit(2));
		assertEquals("l", t.npciByte.getDefaultBit(1));
		assertEquals("l", t.npciByte.getDefaultBit(0));
		assertEquals("1", t.npciByte.getBit(7));
		assertEquals("1", t.npciByte.getBit(6));
		assertEquals("1", t.npciByte.getBit(5));
		assertEquals("0", t.npciByte.getBit(4));
		assertEquals("0", t.npciByte.getBit(3));
		assertEquals("0", t.npciByte.getBit(2));
		assertEquals("0", t.npciByte.getBit(1));
		assertEquals("1", t.npciByte.getBit(0));
	}
	
	@Test public void testTpciApciBits() {
		Telegram t = new Telegram("2E 11 1C 09 01 E1 00 80 27");
		assertEquals("t", t.tpciApciByte.getDefaultBit(15));
		assertEquals("t", t.tpciApciByte.getDefaultBit(14));
		assertEquals("t", t.tpciApciByte.getDefaultBit(13));
		assertEquals("t", t.tpciApciByte.getDefaultBit(12));
		assertEquals("t", t.tpciApciByte.getDefaultBit(11));
		assertEquals("t", t.tpciApciByte.getDefaultBit(10));
		assertEquals("a", t.tpciApciByte.getDefaultBit(9));
		assertEquals("a", t.tpciApciByte.getDefaultBit(8));
		assertEquals("d", t.tpciApciByte.getDefaultBit(7));
		assertEquals("d", t.tpciApciByte.getDefaultBit(6));
		assertEquals("d", t.tpciApciByte.getDefaultBit(5));
		assertEquals("d", t.tpciApciByte.getDefaultBit(4));
		assertEquals("d", t.tpciApciByte.getDefaultBit(3));
		assertEquals("d", t.tpciApciByte.getDefaultBit(2));
		assertEquals("d", t.tpciApciByte.getDefaultBit(2));
		assertEquals("d", t.tpciApciByte.getDefaultBit(0));
		assertEquals("0", t.tpciApciByte.getBit(15));
		assertEquals("0", t.tpciApciByte.getBit(14));
		assertEquals("0", t.tpciApciByte.getBit(13));
		assertEquals("0", t.tpciApciByte.getBit(12));
		assertEquals("0", t.tpciApciByte.getBit(11));
		assertEquals("0", t.tpciApciByte.getBit(10));
		assertEquals("0", t.tpciApciByte.getBit(9));
		assertEquals("0", t.tpciApciByte.getBit(8));
		assertEquals("1", t.tpciApciByte.getBit(7));
		assertEquals("0", t.tpciApciByte.getBit(6));
		assertEquals("0", t.tpciApciByte.getBit(5));
		assertEquals("0", t.tpciApciByte.getBit(4));
		assertEquals("0", t.tpciApciByte.getBit(3));
		assertEquals("0", t.tpciApciByte.getBit(2));
		assertEquals("0", t.tpciApciByte.getBit(1));
		assertEquals("0", t.tpciApciByte.getBit(0));
	}
	
	@Test public void testBitDescriptions() {
		Telegram t = new Telegram("2E 11 1C 09 01 E1 00 80 27");
		assertEquals("l=length (0=short frame, 1=long frame with more then 15 octets\nr=repeat flag\npp=priority", 
				t.ctrlByte.getBitDescription());
		assertEquals("h=Area Address (first part of Subnetwork Address)\nm=Line Adress (second part of Subnetwork Address)\nl=Device Adress", 
				t.sourceAdress.getBitDescription());
		assertEquals("h=Area Address (first part of Subnetwork Address)\nm=Line Adress (second part of Subnetwork Address)\nl=Device Adress",
				t.destAdress.getBitDescription());
		assertEquals("d=destination address flag (DAF, 0=unicast, 1=multicast)\nn=Network Control Field\nl=Length",
				t.npciByte.getBitDescription());
		assertEquals("t=TPCI Bit\na=APCI Bit\nd=APCI/Data Bit", 
				t.tpciApciByte.getBitDescription());
	}
	
}
