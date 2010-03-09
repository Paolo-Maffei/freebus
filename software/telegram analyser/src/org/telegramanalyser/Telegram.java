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
	protected Data dataBytes;
	
	public enum FrameType {
		L_DATA_FRAME,
		L_POLL_DATA_FRAME,
		ACKNOWLEDGE_FRAME
	}

	public enum DataType {
		UDT_DATA_PACKET,
		NDT_NUMBERED_DATA_PACKET,
		UCD_CONTROL_DATA,
		NCD_NUMBERED_CONTROL_DATA
	}
	
	public enum APCIType {
		//                                            Mask,   Value   ValueMask
		A_GROUPVALUE_READ_PDU                        (0x03FF, 0x0000, 0xFFFF),
		A_GROUPVALUE_RESPONSE_PDU                    (0x03C0, 0x0040, 0x003F),
		A_GROUPVALUE_WRITE_PDU                       (0x03C0, 0x0080, 0x003F),
		
		A_INDIVIDUALADDRESS_WRITE_PDU                (0x03FF, 0x00C0, 0xFFFF),
		A_INDIVIDUALADDRESS_READ_PDU                 (0x03FF, 0x01C0, 0xFFFF),
		A_INDIVIDUALADDRESS_RESPONSE_PDU             (0x03FF, 0x0140, 0xFFFF),
		
		A_ADC_READ_PDU                               (0x03C0, 0x0180, 0x003F),
		A_ADC_RESPONSE_PDU                           (0x03C0, 0x01C0, 0x003F),
		
		A_MEMORY_READ_PDU                            (0x03FF, 0x0200, 0x000F),
		A_MEMORY_RESPONSE_PDU                        (0x03FF, 0x0240, 0x000F),
		A_MEMORY_WRITE_PDU                           (0x03FF, 0x0280, 0x000F),
		
		A_USERMEMORY_READ_PDU                        (0x03FF, 0x02C0, 0xFFFF),
		A_USERMEMORY_RESPONSE_PDU                    (0x03FF, 0x02C1, 0xFFFF),
		A_USERMEMORY_WRITE_PDU                       (0x03FF, 0x02C2, 0xFFFF),
		
		A_USERMEMORYBIT_WRITE_PDU                    (0x03FF, 0x02C4, 0xFFFF),
		
		A_USERMANUFACRURERINFO_PDU                   (0x03FF, 0x02C5, 0xFFFF),
		A_USERMANUFACRURERINFO_RESPONSE_PDU          (0x03FF, 0x02C6, 0xFFFF),
		
		A_DEVICEDESCRIPTOR_READ_PDU                  (0x03FF, 0x0300, 0xFFFF),
		A_DEVICEDESCRIPTOR_RESPONSE_PDU              (0x03FF, 0x0340, 0xFFFF),
		A_RESTART_PDU                                (0x03FF, 0x0380, 0xFFFF),
		
		A_OPEN_ROUTING_TABLE_REQ_PDU                 (0x03FF, 0x03C0, 0xFFFF),
		A_READ_ROUTING_TABLE_REQ_PDU                 (0x03FF, 0x03C1, 0xFFFF),
		A_READ_ROUTING_TABLE_RES_PDU                 (0x03FF, 0x03C2, 0xFFFF),
		A_WRITE_ROUTING_TABLE_REQ_PDU                (0x03FF, 0x03C3, 0xFFFF),
		A_READ_ROUTER_MEMORY_REQ_PDU                 (0x03FF, 0x03C8, 0xFFFF),
		A_READ_ROUTER_MEMORY_RES_PDU                 (0x03FF, 0x03C9, 0xFFFF),
		A_WRITE_ROUTER_MEMORY_REQ_PDU                (0x03FF, 0x03CA, 0xFFFF),
		A_READ_ROUTER_STATUS_REQ_PDU                 (0x03FF, 0x03CD, 0xFFFF),
		A_READ_ROUTER_STATUS_RES_PDU                 (0x03FF, 0x03CE, 0xFFFF),
		A_WRITE_ROUTER_STATUS_REQ_PDU                (0x03FF, 0x03CF, 0xFFFF),
		
		A_MEMORYBIT_WRITE_PDU                        (0x03FF, 0x03D0, 0xFFFF),
		
		A_AUTHORIZE_REQUEST_PDU                      (0x03FF, 0x03D1, 0xFFFF),
		A_AUTHORIZE_RESPONSE_PDU                     (0x03FF, 0x03D2, 0xFFFF),
		A_KEY_WRITE_PDU                              (0x03FF, 0x03D3, 0xFFFF),
		A_KEY_RESPONSE_PDU                           (0x03FF, 0x03D4, 0xFFFF),
		
		A_PROPERTYVALUE_READ_PDU                     (0x03FF, 0x03D5, 0xFFFF),
		A_PROPERTYVALUE_RESPONSE_PDU                 (0x03FF, 0x03D6, 0xFFFF),
		A_PROPERTYVALUE_WRITE_PDU                    (0x03FF, 0x03D7, 0xFFFF),
		A_PROPERTYDESCRIPTION_READ_PDU               (0x03FF, 0x03D8, 0xFFFF),
		A_PROPERTYDESCRIPTION_RESPONSE_PDU           (0x03FF, 0x03D9, 0xFFFF),
		
		A_INDIVIDUALADDRESSSERIALNUMBER_READ_PDU     (0x03FF, 0x03DC, 0xFFFF),
		A_INDIVIDUALADDRESSSERIALNUMBER_RESPONSE_PDU (0x03FF, 0x03DD, 0xFFFF),
		A_INDIVIDUALADDRESSSERIALNUMBER_WRITE_PDU    (0x03FF, 0x03DE, 0xFFFF),
		
		A_SERVICEINFORMATION_INDICATION_WRITE_PDU    (0x03FF, 0x03DF, 0xFFFF),
		
		A_DOMAINADDRESS_WRITE_PDU                    (0x03FF, 0x03E0, 0xFFFF),
		A_DOMAINADDRESS_READ_PDU                     (0x03FF, 0x03E1, 0xFFFF),
		A_DOMAINADDRESS_RESPONSE_PDU                 (0x03FF, 0x03E2, 0xFFFF),
		A_DOMAINADDRESSSELECTIVE_READ_PDU            (0x03FF, 0x03E3, 0xFFFF),
		
		A_LINK_READ_PDU                              (0x03FF, 0x03E5, 0xFFFF),
		A_LINK_RESPONSE_PDU                          (0x03FF, 0x03E6, 0xFFFF),
		A_LINK_WRITE_PDU                             (0x03FF, 0x03E7, 0xFFFF),
		
		A_GROUPPROPVALUE_READ_PDU                    (0x03FF, 0x03E8, 0xFFFF),
		A_GROUPPROPVALUE_RESPONSE_PDU                (0x03FF, 0x03E9, 0xFFFF),
		A_GROUPPROPVALUE_WRITE_PDU                   (0x03FF, 0x03EA, 0xFFFF),
		A_GROUPPROPVALUE_INFOREPORT_PDU              (0x03FF, 0x03EB, 0xFFFF);
	
		private int mask;
		private int value;
		private int valueMask;
		
		private APCIType (int mask, int value, int valueMask) {
			this.mask = mask;
			this.value = value;
			this.valueMask = valueMask;
		}
		
		public boolean searchAPCI(int apci) {
			if((apci & this.mask) == this.value)
				return true;
			else
				return false;
		}
		
		public String getApciValueString(int apci) {
			if(apci != 0)
				return Integer.toString(apci & valueMask);
			return "";
		}

		public int getApciValue(int apci) {
			if(apci != 0)
				return (apci & valueMask);
			return 0;
		}
	}

	public Telegram() {
		ctrlByte = this.new Ctrl();
		sourceAdress = this.new SrcAdr();
		destAdress = this.new DestAdr();
		npciByte = this.new Npci();
		tpciApciByte = this.new TpciApci();
		dataBytes = this.new Data();
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
		// new we check how many octets we receive
		int length=npciByte.getOctetLength();
		if(length > 0){
			tpciApciByte.setApci(telegram[7]);
			
			if(length > 1) {
				dataBytes.set(telegram);
			}
		}
		crcByte.set(telegram[7+length]);
		crcByte.checkCRC(telegram);
	}

	class Ctrl {
		private int ctrl;
		private FrameType frameType;
		

		public void set(int i) {
			this.ctrl = i & 0xFF;
			if(this.ctrl == 0xF0)
				frameType=FrameType.L_POLL_DATA_FRAME;
			else if(((ctrl & 0x33) == 0))
				frameType=FrameType.ACKNOWLEDGE_FRAME;
			else
				frameType=FrameType.L_DATA_FRAME;
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
			if(frameType == FrameType.L_POLL_DATA_FRAME) {
				// L_Poll_Data-frame
				switch (i) {
				case 7:
					return "l";
				case 6:
					return "1";
				case 5:
					return "1";
				case 4:
					return "1";
				case 3:
					return "0";
				case 2:
					return "0";
				case 1:
					return "0";
				case 0:
					return "0";
				}
				
			} else if(frameType == FrameType.ACKNOWLEDGE_FRAME) {
				// Acknowledge frame
				switch (i) {
				case 7:
					return "x";
				case 6:
					return "x";
				case 5:
					return "0";
				case 4:
					return "0";
				case 3:
					return "x";
				case 2:
					return "x";
				case 1:
					return "0";
				case 0:
					return "0";
				}
			} else {
				// L_Data-frame
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
			}
			return null;
		}

		public String getBit(int i) {
			return Integer.toString((ctrl >> i) & 0x1);
		}

		public String getBitDescription() {
			String description = new String();
			if(frameType == FrameType.L_POLL_DATA_FRAME)
				description = "L_POLL_DATA_FRAME";
			else if(frameType == FrameType.L_DATA_FRAME)
				description="l=Length\nr=Repeat Flag\np=Priority";
			else if(frameType == FrameType.ACKNOWLEDGE_FRAME)
				description = "x=ACK/NAK/BUSY bits\n";
			return description;
		}
		
		public String getDescription() {
			String description = new String();
			description = "Frame Type\t=\t";
			if(frameType == FrameType.L_DATA_FRAME) {
				description += "L_DATA_FRAME\n";
				description += "Frame Length\t=\t";
				if(getBit(7).equals("0")){
					description += "Long Frame (with more then 15 octets)\n";
				}if(getBit(7).equals("1")) {
					description += "Short Frame (1-15 octets)\n";
				}
				
				description += "Repeat Flag\t=\t";
				if(getBit(5).equals("0")) {
					description += "Repeated Telegram\n";
				} else if(getBit(5).equals("1")) {
					description += "New Telegram\n";
				}
				
				description += "Priority\t=\t";
				int priority=Integer.parseInt(getBit(3)+getBit(2));
				switch (priority) {
				case 0:
					description += "System Priority\n";
					break;
				case 10:
					description += "Urgent Priority\n";
					break;
				case 1:
					description += "Normal Priority\n";
					break;
				case 11:
					description += "Low Priority\n";
					break;
				}
			} else if (frameType == FrameType.ACKNOWLEDGE_FRAME) {
				description += "ACKNOWLEDGE_FRAME\n";
				description += "ACK Type\t=\t";
				if(ctrl == 0xCC)
					description += "ACK";
				else if (ctrl == 0x0C)
					description += "NAK";
				else if (ctrl == 0xC0)
					description += "BUSY";
				else if (ctrl == 0x00)
					description += "NAK + BUSY, handle it as BUSY";
				
			}
			else if (frameType == FrameType.L_POLL_DATA_FRAME) {
				description += "L_POLL_DATA_FRAME\n";
			}
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
		
		public String getDescription() {
			String description = new String();
			description = "Address with short Subnet\t=\t";
			description += (src >> 12);
			description += ".";
			description += ((src >> 8) & 0x0F);
			description += ".";
			description += (src & 0xFF);
			description += "\n";
			description += "Address with long Subnet\t=\t";
			description += (src >> 8);
			description += ".";
			description += (src & 0xFF);
			description += "\n";
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
				if(npciByte.getBit(7).equals("1")){
					return "h";
				}else if(npciByte.getBit(7).equals("0")){
					return "m";
				}
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
		public String getDescription() {
			String description = new String();
			description = "Destination Type\t\t=\t";
			if(npciByte.getBit(7).equals("1")){
				description += "Group Address\n";

				description += "Address with short Subnet\t=\t";
				description += (dst >> 11);
				description += "/";
				description += ((dst >> 8) & 0x07);
				description += "/";
				description += (dst & 0xFF);
				description += "\n";
			}else if(npciByte.getBit(7).equals("0")){
				description += "Physical Address\n";
				description = "Address with short Subnet\t=\t";
				description += (dst >> 12);
				description += ".";
				description += ((dst >> 8) & 0x0F);
				description += ".";
				description += (dst & 0xFF);
				description += "\n";
				description += "Address with long Subnet\t=\t";
				description += (dst >> 8);
				description += ".";
				description += (dst & 0xFF);
				description += "\n";
			}
			
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
			description="d=destination address flag (DAF)\nn=Network Control Field\nl=Length";
			return description;
		}
		
		public String getDescription() {
			String description = new String();
			description = "Destination Address Flag\t=\t";
			if(getBit(7).equals("0")) {
				description += "Unicast\n";
			} else if(getBit(7).equals("1")) {
				description += "Multicast\n";
			}
			description += "Network Control Field\t\t=\t";
			description += (npci >> 4)&0x7;
			if(((npci >> 4)& 0x7)==7) {
				description += " = No Routing Control";
			}else if(((npci >> 4) & 0x7)==0){
				description += " = Telegram rejected";
			}else {
				description += " = value to be decremented at routing by couplers";
			}
			description += "\n";
			
			description += "Length Field\t\t\t=\t";
			description += Integer.toString(getOctetLength());
			
			description += " Octet(s) after the Npci octet\n";
			return description;
		}

		public int getOctetLength() {
			int length=0;
			if(ctrlByte.getBit(7).equals("1")) {
				// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
				length = (npci & 0x0F);
			} else if(ctrlByte.getBit(7).equals("0")) {
				// 16, 17, 18, 19, 20, 22, 25, 29, 34, 40, 52, 64, 128, 192, 255, ESC
				switch (npci & 0x0F) {
				case 0:
					length = 16;
					break;
				case 1:
					length = 17;
					break;
				case 2:
					length = 18;
					break;
				case 3:
					length = 19;
					break;
				case 4:
					length = 20;
					break;
				case 5:
					length = 22;
					break;
				case 6:
					length = 25;
					break;
				case 7:
					length = 29;
					break;
				case 8:
					length = 34;
					break;
				case 9:
					length = 40;
					break;
				case 10:
					length = 52;
					break;
				case 11:
					length = 64;
					break;
				case 12:
					length = 128;
					break;
				case 13:
					length = 192;
					break;
				case 14:
					length = 255;
					break;
				case 15:
					//reserved for future use: length += "ESC";
					break;
				}
			}
			return length;
		}
	}
	
	class TpciApci {
		protected int tpciApci;
		protected DataType dataType;
		protected APCIType apciType;
		protected int value;
		protected String valueString;
		
		public int getTpci() {
			return (tpciApci >> 8) & 0xFC;
		}
		public void setTpci(int i) {
			tpciApci &= (~0xFF00);
			tpciApci |= ((i & 0xFF) << 8);
		
			if((tpciApci >> 14) == 0) {
				dataType = DataType.UDT_DATA_PACKET;
			}else if((tpciApci >> 14) == 1) {
				dataType = DataType.NDT_NUMBERED_DATA_PACKET;
			}else if((tpciApci >> 14) == 2) {
				dataType = DataType.UCD_CONTROL_DATA;
			}else if((tpciApci >> 14) == 3) {
				dataType = DataType.NCD_NUMBERED_CONTROL_DATA;
			}

		}

		public int getApci() {
			return tpciApci & 0x3FF;
		}

		/**
		 * Set the APCI which is always 16-bit wide but only 10-bit are used
		 * @param i 16-bit value of the APCI (combination of TPCI and APCI)
		 */
		public void setApci(int i) {
			tpciApci &= (~0xFF);
			tpciApci |= (i & 0xFF);

			// Check for APCI
			for (APCIType a : APCIType.values()) {
				//System.out.printf("Check for %s is %b\n", a, a.searchAPCI(tpciApci));
				
				if(a.searchAPCI(tpciApci)) {
					apciType=a;
					valueString = a.getApciValueString(tpciApci);
					value = a.getApciValue(tpciApci);
					//System.out.println("Found");
					break;
				}
			}
		}
		
		public String getDefaultBit(int i) {
			if(dataType == DataType.UDT_DATA_PACKET) {
				switch (i) {
				case 15:
					return "0";
				case 14:
					return "0";
				case 13:
					return "X";
				case 12:
					return "X";
				case 11:
					return "X";
				case 10:
					return "X";
				case 9:
					return "A";
				case 8:
					return "A";
				}				
			}else if(dataType == DataType.NDT_NUMBERED_DATA_PACKET) {
				switch (i) {
				case 15:
					return "0";
				case 14:
					return "1";
				case 13:
					return "F";
				case 12:
					return "F";
				case 11:
					return "F";
				case 10:
					return "F";
				case 9:
					return "A";
				case 8:
					return "A";
				}				
			}else if(dataType == DataType.UCD_CONTROL_DATA) {
				switch (i) {
				case 15:
					return "1";
				case 14:
					return "0";
				case 13:
					return "X";
				case 12:
					return "X";
				case 11:
					return "X";
				case 10:
					return "X";
				case 9:
					return "B";
				case 8:
					return "B";
				}				
			}else if(dataType == DataType.NCD_NUMBERED_CONTROL_DATA) {
				switch (i) {
				case 15:
					return "1";
				case 14:
					return "1";
				case 13:
					return "F";
				case 12:
					return "F";
				case 11:
					return "F";
				case 10:
					return "F";
				case 9:
					return "B";
				case 8:
					return "B";
				}				
				
			}
			switch (i) {
			case 7:
				return "A";
			case 6:
				return "A";
			case 5:
				return "A";
			case 4:
				return "A";
			case 3:
				if(npciByte.getOctetLength()>1)
					return "X";
				return "A";
			case 2:
				if(npciByte.getOctetLength()>1)
					return "X";
				return "A";
			case 1:
				if(npciByte.getOctetLength()>1)
					return "X";
				return "A";
			case 0:
				if(npciByte.getOctetLength()>1)
					return "X";
				return "A";
			}
			return null;
		}
		
		public String getBit(int i) {
			return Integer.toString((tpciApci >> i) & 0x1);
		}

		public String getBitDescription() {
			String description = new String();
			if(dataType == DataType.UDT_DATA_PACKET) {
				description = "X=don't Care\nA=APCI\n";
			}else if(dataType == DataType.NDT_NUMBERED_DATA_PACKET) {
				description = "F=Sequence Number of Data Packets\nA=APCI\n";			
			}else if(dataType == DataType.UCD_CONTROL_DATA) {
				description = "X=don't Care\nB=Connection information\n";		
			}else if(dataType == DataType.NCD_NUMBERED_CONTROL_DATA) {
				description = "F=Sequence Number of Data Packets\nB=Acknowledge\n";			
			}
			return description;
		}

		public String getDescription() {
			String description = new String();
			description = "Telegram Structure\t=\t";
			if(dataType == DataType.UDT_DATA_PACKET) {
				description += "Data Packet (UDT)\n";
			}else if(dataType == DataType.NDT_NUMBERED_DATA_PACKET) {
				description += "Numbered Data Packet (NDT)\n";			
				description += "Sequence Number\t\t=\t";
				description += ((tpciApci >> 10) & 0xF);
				description += "\n";
			}else if(dataType == DataType.UCD_CONTROL_DATA) {
				description += "Control Data (UCD)\n";		
				description += "Connection Info\t\t=\t";
				if((tpciApci & 0x300)==0)
					description += "connection-built-up (OPEN)\n";
				else if((tpciApci & 0x300)==0x0100)
					description += "c.-break-down (CLOSE)\n";
				else if((tpciApci & 0x300)==0x0200)
					description += "not used\n";
				else if((tpciApci & 0x300)==0x0300)
					description += "not used\n";
			}else if(dataType == DataType.NCD_NUMBERED_CONTROL_DATA) {
				description += "Numbered Control Data (NCD)\n";			
				description += "Sequence Number\t\t=\t";
				description += ((tpciApci >> 10) & 0xF);
				description += "\n";
				description += "Acknowledge\t\t=\t";
				if((tpciApci & 0x300)==0)
					description += "not used\n";
				else if((tpciApci & 0x300)==0x0100)
					description += "not used\n";
				else if((tpciApci & 0x300)==0x0200)
					description += "acknowledged (ACK)\n";
				else if((tpciApci & 0x300)==0x0300)
					description += "not acknowledged (NAK)\n";
			}
			
			description += "\n";
			
			description += "APCI Type\t\t=\t";
			description += apciType + "\n";
			
			if(npciByte.getOctetLength()<=1) {
				description += "Value\t\t\t=\t";
				description += valueString + " (0x" + Integer.toHexString(value).toUpperCase() + ")\n";
			}

			return description;
		}
	}
	
	class Data {
		protected int data[];
		
		public Data() {
			data = new int[0];
		}
		public void set(int[] telegram) {
			int length=npciByte.getOctetLength()-1;
			data = new int[length];
			for (int i = 0; i < length; i++) {
				data[i] = telegram[7+length-i];
			}
		}

		public int[] get() {
			return data;
		}
		
		public String getBitDescription() {
			if(data.length > 0)
				return "D=Data\n";
			return null;
		}
		
		public String getBit(int position) {
			if(data.length > 0 && (position/8) < data.length)
				return Integer.toString((data[position/8] >> (position%8)) & 0x1);
			else
				return "";
		}
		
		public String getDescription() {
			String description = new String();
			String hexString = new String("");
			
			description = "Value \t=\t";
			for (int i = data.length-1; i >= 0; i--) {
				description += Integer.toString(data[i]) + " ";
				hexString += (Integer.toHexString(data[i]).toUpperCase().length()==1?"0"+Integer.toHexString(data[i]).toUpperCase():Integer.toHexString(data[i]).toUpperCase()) + " ";
			}
			description += "(0x" + hexString +")\n";
			return description;
		}

		public String getDefaultBit(int position) {
			if(data.length > 0 && (position/8) < data.length)
				return "D";
			else
				return null;
		}
	}
	
	class Crc {
		protected int crc;
		protected boolean checksumStatus;
		
		public void set(int i) {
			crc = i & 0xFF;
		}
		public void checkCRC(int[] telegram) {
			int checksum=telegram[0];
			int length = npciByte.getOctetLength();
			for (int i = 1; i < 7+length; i++) {
				checksum = checksum ^ telegram[i];
				
			}
			if(((~checksum) & 0xFF) == crc) {
				checksumStatus = true;
			} else {
				checksumStatus = false;
			}
		}
		public int get() {
			return crc & 0xFF;
		}

		
	}

}
