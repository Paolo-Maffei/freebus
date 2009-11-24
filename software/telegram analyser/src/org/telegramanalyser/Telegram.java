package org.telegramanalyser;

/**
 * @author idefix
 *
 */
/**
 * @author idefix
 *
 */
public class Telegram {

	private int telegram[];
	private int ctrl;
	private int sourceAdress;
	private int destAdress;
	private int npci;
	private int tpci;
	private int apci;
	private int crc;
	
	public Telegram() {

	}

	public Telegram(String telegramString) {
		telegram = new int[25];

		// remove spaces from the string
		telegramString=telegramString.replaceAll("\\s+", "");
		for (int i = 0; i < telegramString.length(); i+=2) {
			this.telegram[i/2]=Integer.parseInt(telegramString.substring(i, i+2), 16);
		}
		setCtrl(telegram[0]);
		setSourceAdress(telegram[1], telegram[2]);
		setDestAdress(telegram[3], telegram[4]);
		setNPCI(telegram[5]);
		setTPCI(telegram[6]);
		setAPCI(telegram[7]);
		setCRC(telegram[8]);
	}

	public void setCRC(int i) {
		crc = i & 0xFF;
	}

	/**
	 * Octet 0, format: hhhp pga1
	 * hhh: hop count
	 * pp: priority
	 * g: group/individual flag
	 * a: ack
	 * 	
	 * @return ctrl The control byte
	 */
	public int getCtrl() {
		return ctrl & 0xff;
	}

	public int getSourceAdress() {
		return sourceAdress & 0xFFFF;
	}

	public int getDestAdress() {
		return destAdress & 0xFFFF;
	}

	public int getNPCI() {
		return npci & 0xFF;
	}	

	public int getTPCI() {
		return tpci & 0xFF;
	}

	public int getAPCI() {
		return ((tpci & 0x3) << 8) | (apci & 0xFF);
	}

	public void setCtrl(int i) {
		ctrl = i & 0xFF;
	}

	public void setSourceAdress(int high, int low) {
		sourceAdress = (high << 8 | low) & 0xFFFF;
	}

	public void setDestAdress(int high, int low) {
		destAdress = (high << 8 | low) & 0xFFFF;
	}

	public void setSourceAdress(int adr) {
		sourceAdress = adr & 0xFFFF;
	}

	public void setDestAdress(int adr) {
		destAdress = adr & 0xFFFF;
	}

	public void setNPCI(int i) {
		npci = i & 0xFF;
	}

	public void setTPCI(int i) {
		tpci = tpci & (~0xFC);
		tpci = tpci | (i & 0xFC);
	}

	
	/**
	 * Set the APCI which is always 16-bit wide but only 10-bit are used
	 * @param i 16-bit value of the APCI (combination of TPCI and APCI)
	 */
	public void setAPCI(int i) {
		tpci = tpci & (~0x3);
		tpci = tpci | ((i >> 8) & 0x3);
		apci = i & 0xFF;
	}

	public int getCRC() {
		return crc & 0xFF;
	}



}
