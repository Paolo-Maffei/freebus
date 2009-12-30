package org.telegramanalyser;

/**
 * @author Matthias Fechner
 *
 */
public class Telegram {

	private int[] telegram;
	protected Ctrl ctrlByte;
	protected SrcAdr sourceAdress;
	protected DestAdr destAdress;
	protected Npci npciByte;
	protected TpciApci tpciApciByte;
	protected Crc crcByte;
	
	public Telegram() {
		ctrlByte = this.new Ctrl();
		sourceAdress = this.new SrcAdr();
		destAdress = this.new DestAdr();
		npciByte = this.new Npci();
		tpciApciByte = this.new TpciApci();
		crcByte = this.new Crc();
		
	}

	public Telegram(String telegramString) {
		// Init all fields
		this();
		
		telegram = new int[25];

		// remove spaces from the string
		telegramString=telegramString.replaceAll("\\s+", "");
		for (int i = 0; i < telegramString.length(); i+=2) {
			telegram[i/2]=Integer.parseInt(telegramString.substring(i, i+2), 16);
		}
		ctrlByte.set(telegram[0]);
		sourceAdress.set(telegram[1], telegram[2]);
		destAdress.set(telegram[3], telegram[4]);
		npciByte.set(telegram[5]);
		tpciApciByte.setTpci(telegram[6]);
		tpciApciByte.setApci(telegram[7]);
		crcByte.set(telegram[8]);
	}

	class Ctrl {
		private int ctrl;
		
		public void set(int i) {
			this.ctrl = i & 0xFF;
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
		public int get() {
			return ctrl & 0xff;
		}
		public String getDefaultBit(int i) {
			switch (i) {
			case 7:
				return "l";
			case 6:
				return "0";
			case 5:
				return "r";
			case 4:
				return "1";
			case 3:
				return "p";
			case 2:
				return "p";
			case 1:
				return "0";
			case 0:
				return "0";
			}
			return null;
		}
	}
	
	class SrcAdr {
		protected int src;
		public int get() {
			return src & 0xFFFF;
		}

		public void set(int high, int low) {
			src = (high << 8 | low) & 0xFFFF;
		}
		public void set(int adr) {
			src = adr & 0xFFFF;
		}

	}
	
	class DestAdr {
		protected int dst;
		public int get() {
			return dst & 0xFFFF;
		}

		public void set(int high, int low) {
			dst = (high << 8 | low) & 0xFFFF;
		}
		public void set(int adr) {
			dst = adr & 0xFFFF;
		}
	
	}
	
	class Npci {
		protected int npci;
		public int get() {
			return npci & 0xFF;
		}	
		public void set(int i) {
			npci = i & 0xFF;
		}
	}
	
	class TpciApci {
		protected int tpci;
		protected int apci;

		public int getTpci() {
			return tpci & 0xFF;
		}
		public void setTpci(int i) {
			tpci = tpci & (~0xFC);
			tpci = tpci | (i & 0xFC);
		}

		public int getApci() {
			return ((tpci & 0x3) << 8) | (apci & 0xFF);
		}

		/**
		 * Set the APCI which is always 16-bit wide but only 10-bit are used
		 * @param i 16-bit value of the APCI (combination of TPCI and APCI)
		 */
		public void setApci(int i) {
			tpci = tpci & (~0x3);
			tpci = tpci | ((i >> 8) & 0x3);
			apci = i & 0xFF;
		}
	}
	
	class Crc {
		protected int crc;
		public void set(int i) {
			crc = i & 0xFF;
		}
		public int get() {
			return crc & 0xFF;
		}

		
	}

}
