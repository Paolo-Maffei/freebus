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

		public String getBit(int i) {
			return Integer.toString((ctrl >> i) & 0x1);
		}

		public String getBitDescription() {
			String description = new String();
			description="l=length (0=short frame, 1=long frame with more then 15 octets\nr=repeat flag\npp=priority";
			return description;
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

		public String getDefaultBit(int i) {
			switch (i) {
			case 15:
				return "h";
			case 14:
				return "h";
			case 13:
				return "h";
			case 12:
				return "h";
			case 11:
				return "m";
			case 10:
				return "m";
			case 9:
				return "m";
			case 8:
				return "m";
			case 7:
				return "l";
			case 6:
				return "l";
			case 5:
				return "l";
			case 4:
				return "l";
			case 3:
				return "l";
			case 2:
				return "l";
			case 1:
				return "l";
			case 0:
				return "l";
			}
			return null;
		}

		public String getBit(int i) {
			return Integer.toString((src >> i) & 0x1);
		}

		public String getBitDescription() {
			String description = new String();
			description="h=Area Address (first part of Subnetwork Address)\nm=Line Adress (second part of Subnetwork Address)\nl=Device Adress";
			return description;
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

		public String getDefaultBit(int i) {
			switch (i) {
			case 15:
				if(npciByte.getBit(7).equals("1")){
					return "0";
				}else if(npciByte.getBit(7).equals("0")){
					return "h";
				}
				return "e";
			case 14:
				return "h";
			case 13:
				return "h";
			case 12:
				return "h";
			case 11:
				return "m";
			case 10:
				return "m";
			case 9:
				return "m";
			case 8:
				return "m";
			case 7:
				return "l";
			case 6:
				return "l";
			case 5:
				return "l";
			case 4:
				return "l";
			case 3:
				return "l";
			case 2:
				return "l";
			case 1:
				return "l";
			case 0:
				return "l";
			}
			return null;
		}

		public String getBit(int i) {
			return Integer.toString((dst >> i) & 0x1);
		}

		public String getBitDescription() {
			String description = new String();
			description="h=Area Address (first part of Subnetwork Address)\nm=Line Adress (second part of Subnetwork Address)\nl=Device Adress";
			return description;
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
		public String getDefaultBit(int i) {
			switch (i) {
			case 7:
				return "d";
			case 6:
				return "n";
			case 5:
				return "n";
			case 4:
				return "n";
			case 3:
				return "l";
			case 2:
				return "l";
			case 1:
				return "l";
			case 0:
				return "l";
			}
			return null;
		}
		public String getBit(int i) {
			return Integer.toString((npci >> i) & 0x1);
		}
		public String getBitDescription() {
			String description = new String();
			description="d=destination address flag (DAF, 0=unicast, 1=multicast)\nn=Network Control Field\nl=Length";
			return description;
		}
	}
	
	class TpciApci {
		protected int tpciApci;

		public int getTpci() {
			return (tpciApci >> 8) & 0xFC;
		}
		public void setTpci(int i) {
			tpciApci &= (~0xFC00);
			tpciApci |= ((i & 0xFC) << 8);
		}

		public int getApci() {
			return tpciApci & 0x3FF;
		}

		/**
		 * Set the APCI which is always 16-bit wide but only 10-bit are used
		 * @param i 16-bit value of the APCI (combination of TPCI and APCI)
		 */
		public void setApci(int i) {
			tpciApci &= (~0x3FF);
			tpciApci |= (i & 0x3FF);
		}
		
		public String getDefaultBit(int i) {
			switch (i) {
			case 15:
				return "t";
			case 14:
				return "t";
			case 13:
				return "t";
			case 12:
				return "t";
			case 11:
				return "t";
			case 10:
				return "t";
			case 9:
				return "a";
			case 8:
				return "a";
			case 7:
				return "d";
			case 6:
				return "d";
			case 5:
				return "d";
			case 4:
				return "d";
			case 3:
				return "d";
			case 2:
				return "d";
			case 1:
				return "d";
			case 0:
				return "d";
			}
			return null;
		}
		
		public String getBit(int i) {
			return Integer.toString((tpciApci >> i) & 0x1);
		}
		public String getBitDescription() {
			String description = new String();
			description="t=TPCI Bit\na=APCI Bit\nd=APCI/Data Bit";
			return description;
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
