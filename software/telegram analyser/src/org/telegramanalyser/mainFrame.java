package org.telegramanalyser;
import javax.swing.BorderFactory;
import javax.swing.GroupLayout;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;
import javax.swing.LayoutStyle;
import javax.swing.SwingConstants;

import javax.swing.WindowConstants;
import javax.swing.border.BevelBorder;
import javax.swing.SwingUtilities;


/**
* This code was edited or generated using CloudGarden's Jigloo
* SWT/Swing GUI Builder, which is free for non-commercial
* use. If Jigloo is being used commercially (ie, by a corporation,
* company or business for any purpose whatever) then you
* should purchase a license for each developer using Jigloo.
* Please visit www.cloudgarden.com for details.
* Use of Jigloo implies acceptance of these licensing terms.
* A COMMERCIAL LICENSE HAS NOT BEEN PURCHASED FOR
* THIS MACHINE, SO JIGLOO OR THIS CODE CANNOT BE USED
* LEGALLY FOR ANY CORPORATE OR COMMERCIAL PURPOSE.
*/
public class mainFrame extends javax.swing.JFrame {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4188163317137143564L;
	private JLabel hexStringLabel;
	private JTextField hexStringTextField;
	private JLabel jLabel53;
	private JLabel jLabel52;
	private JLabel jLabel51;
	private JLabel jLabel50;
	private JLabel jLabel49;
	private JLabel jLabel48;
	private JLabel jLabel47;
	private JLabel jLabel46;
	private JLabel jLabel45;
	private JLabel jLabel44;
	private JLabel jLabel43;
	private JLabel jLabel42;
	private JLabel jLabel41;
	private JLabel jLabel40;
	private JLabel jLabel39;
	private JLabel jLabel38;
	private JLabel jLabel37;
	private JLabel jLabel36;
	private JLabel jLabel35;
	private JLabel jLabel34;
	private JLabel jLabel33;
	private JLabel jLabel32;
	private JLabel jLabel31;
	private JLabel jLabel30;
	private JLabel jLabel29;
	private JLabel jLabel28;
	private JPanel jPanel2;
	private JLabel crcLabel;
	private JTabbedPane jTabbedPane1;
	private JPanel jPanel1;
	private JLabel jLabel26;
	private JLabel jLabel25;
	private JLabel jLabel24;
	private JLabel jLabel23;
	private JLabel jLabel22;
	private JLabel jLabel21;
	private JLabel jLabel20;
	private JLabel jLabel19;
	private JLabel jLabel18;
	private JLabel jLabel17;
	private JMenuBar jMenuBar1;
	private JLabel ctrlLabel7;
	private JLabel jLabel16;
	private JLabel jLabel15;
	private JLabel jLabel14;
	private JLabel jLabel13;
	private JLabel jLabel12;
	private JLabel jLabel11;
	private JLabel jLabel10;
	private JLabel jLabel9;
	private JLabel jLabel8;
	private JLabel jLabel5;
	private JLabel jLabel7;
	private JLabel jLabel6;
	private JLabel jLabel4;
	private JLabel jLabel3;
	private JLabel jLabel2;
	private JLabel jLabel1;
	private JLabel statusLabel;
	private JMenuItem jMenuItem1;
	private JMenu jMenu1;
	private JLabel crcLabel2;

	/**
	* Auto-generated main method to display this JFrame
	*/
	public static void main(String[] args) {
		SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				mainFrame inst = new mainFrame();
				inst.setLocationRelativeTo(null);
				inst.setVisible(true);
			}
		});
	}
	
	public mainFrame() {
		super();
		initGUI();
	}
	
	private void initGUI() {
		try {
			GroupLayout thisLayout = new GroupLayout((JComponent)getContentPane());
			getContentPane().setLayout(thisLayout);
			setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
			{
				jTabbedPane1 = new JTabbedPane();
				{
					jPanel1 = new JPanel();
					jTabbedPane1.addTab("Octet 0: CTRL", null, jPanel1, null);
					GroupLayout jPanel1Layout = new GroupLayout((JComponent)jPanel1);
					jPanel1.setLayout(jPanel1Layout);
					{
						jLabel26 = new JLabel();
						jLabel26.setText("jLabel26");
						jLabel26.setHorizontalAlignment(SwingConstants.LEFT);
						jLabel26.setVerticalAlignment(SwingConstants.TOP);
						jLabel26.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel25 = new JLabel();
					}
					{
						jLabel24 = new JLabel();
					}
					{
						jLabel23 = new JLabel();
						jLabel23.setText("    01=High, 11=Low");
					}
					{
						jLabel22 = new JLabel();
						jLabel22.setText("BB=Priority, 00=System, 10=Alarm");
					}
					{
						jLabel21 = new JLabel();
					}
					{
						jLabel20 = new JLabel();
						jLabel20.setText("A=0 Repetition, A=1 No Repetition");
					}
					{
						jLabel19 = new JLabel();
					}
					{
						jLabel18 = new JLabel();
					}
					{
						jLabel10 = new JLabel();
						jLabel10.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel11 = new JLabel();
						jLabel11.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel9 = new JLabel();
						jLabel9.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel8 = new JLabel();
						jLabel8.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel13 = new JLabel();
						jLabel13.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel12 = new JLabel();
						jLabel12.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel14 = new JLabel();
						jLabel14.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel15 = new JLabel();
						jLabel15.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel5 = new JLabel();
						jLabel5.setText("0");
						jLabel5.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel4 = new JLabel();
						jLabel4.setText("0");
						jLabel4.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel6 = new JLabel();
						jLabel6.setText("B");
						jLabel6.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel7 = new JLabel();
						jLabel7.setText("B");
						jLabel7.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel2 = new JLabel();
						jLabel2.setText("1");
						jLabel2.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel3 = new JLabel();
						jLabel3.setText("A");
						jLabel3.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel1 = new JLabel();
						jLabel1.setText("0");
						jLabel1.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						ctrlLabel7 = new JLabel();
						ctrlLabel7.setText("1");
						ctrlLabel7.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel17 = new JLabel();
						jLabel17.setText("LSB");
					}
					{
						jLabel16 = new JLabel();
						jLabel16.setText("MSB");
					}
					jPanel1Layout.setHorizontalGroup(jPanel1Layout.createParallelGroup()
						.addComponent(jLabel26, GroupLayout.Alignment.LEADING, 0, 519, Short.MAX_VALUE)
						.addGroup(jPanel1Layout.createSequentialGroup()
						    .addGroup(jPanel1Layout.createParallelGroup()
						        .addComponent(jLabel16, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 27, GroupLayout.PREFERRED_SIZE)
						        .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
						            .addComponent(jLabel17, GroupLayout.PREFERRED_SIZE, 21, GroupLayout.PREFERRED_SIZE)
						            .addGap(6)))
						    .addGroup(jPanel1Layout.createParallelGroup()
						        .addComponent(jLabel5, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel4, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel6, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel7, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel2, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel3, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel1, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addComponent(ctrlLabel7, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE))
						    .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
						    .addGroup(jPanel1Layout.createParallelGroup()
						        .addComponent(jLabel10, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel11, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel9, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel8, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel13, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel12, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel14, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel15, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE))
						    .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
						    .addGroup(jPanel1Layout.createParallelGroup()
						        .addGroup(jPanel1Layout.createSequentialGroup()
						            .addComponent(jLabel25, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE))
						        .addGroup(jPanel1Layout.createSequentialGroup()
						            .addComponent(jLabel24, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE))
						        .addGroup(jPanel1Layout.createSequentialGroup()
						            .addComponent(jLabel23, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE))
						        .addGroup(jPanel1Layout.createSequentialGroup()
						            .addComponent(jLabel22, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE))
						        .addGroup(jPanel1Layout.createSequentialGroup()
						            .addComponent(jLabel21, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE))
						        .addGroup(jPanel1Layout.createSequentialGroup()
						            .addComponent(jLabel20, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE))
						        .addGroup(jPanel1Layout.createSequentialGroup()
						            .addComponent(jLabel19, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE))
						        .addGroup(jPanel1Layout.createSequentialGroup()
						            .addComponent(jLabel18, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE)))
						    .addGap(0, 224, Short.MAX_VALUE)));
					jPanel1Layout.setVerticalGroup(jPanel1Layout.createSequentialGroup()
						.addGroup(jPanel1Layout.createParallelGroup()
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
						        .addComponent(jLabel18, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel15, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
						        .addComponent(ctrlLabel7, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel16, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)))
						.addGroup(jPanel1Layout.createParallelGroup()
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
						        .addComponent(jLabel19, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel14, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						    .addComponent(jLabel1, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						.addGroup(jPanel1Layout.createParallelGroup()
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
						        .addComponent(jLabel20, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel3, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						    .addComponent(jLabel12, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						.addGroup(jPanel1Layout.createParallelGroup()
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
						        .addComponent(jLabel21, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel13, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						    .addComponent(jLabel2, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						.addGroup(jPanel1Layout.createParallelGroup()
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
						        .addComponent(jLabel22, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel7, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						    .addComponent(jLabel8, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						.addGroup(jPanel1Layout.createParallelGroup()
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
						        .addComponent(jLabel23, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel6, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						    .addComponent(jLabel9, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						.addGroup(jPanel1Layout.createParallelGroup()
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
						        .addComponent(jLabel24, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel11, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						    .addComponent(jLabel4, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						.addGroup(jPanel1Layout.createParallelGroup()
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
						        .addComponent(jLabel25, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel10, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
						        .addComponent(jLabel5, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						        .addComponent(jLabel17, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)))
						.addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
						.addComponent(jLabel26, 0, 85, Short.MAX_VALUE));
				}
				{
					jPanel2 = new JPanel();
					jTabbedPane1.addTab("Octet 0: CTRL", null, jPanel2, null);
					GroupLayout jPanel2Layout1 = new GroupLayout((JComponent)jPanel2);
					jPanel2.setLayout(jPanel2Layout1);
					{
						jLabel28 = new JLabel();
					}
					{
						jLabel29 = new JLabel();
					}
					{
						jLabel30 = new JLabel();
						jLabel30.setText("    01=High, 11=Low");
					}
					{
						jLabel31 = new JLabel();
						jLabel31.setText("BB=Priority, 00=System, 10=Alarm");
					}
					{
						jLabel32 = new JLabel();
					}
					{
						jLabel33 = new JLabel();
						jLabel33.setText("A=0 Repetition, A=1 No Repetition");
					}
					{
						jLabel34 = new JLabel();
					}
					{
						jLabel35 = new JLabel();
					}
					{
						jLabel36 = new JLabel();
						jLabel36.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel37 = new JLabel();
						jLabel37.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel38 = new JLabel();
						jLabel38.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel39 = new JLabel();
						jLabel39.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel40 = new JLabel();
						jLabel40.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel41 = new JLabel();
						jLabel41.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel42 = new JLabel();
						jLabel42.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel43 = new JLabel();
						jLabel43.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
					}
					{
						jLabel44 = new JLabel();
						jLabel44.setText("0");
						jLabel44.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel45 = new JLabel();
						jLabel45.setText("0");
						jLabel45.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel46 = new JLabel();
						jLabel46.setText("B");
						jLabel46.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel47 = new JLabel();
						jLabel47.setText("B");
						jLabel47.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel48 = new JLabel();
						jLabel48.setText("1");
						jLabel48.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel49 = new JLabel();
						jLabel49.setText("A");
						jLabel49.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel50 = new JLabel();
						jLabel50.setText("0");
						jLabel50.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel51 = new JLabel();
						jLabel51.setText("1");
						jLabel51.setBorder(BorderFactory.createEtchedBorder(BevelBorder.LOWERED));
					}
					{
						jLabel52 = new JLabel();
						jLabel52.setText("LSB");
						jLabel52.setFont(new java.awt.Font("Dialog",0,8));
					}
					{
						jLabel53 = new JLabel();
						jLabel53.setText("MSB");
						jLabel53.setFont(new java.awt.Font("Dialog",0,8));
					}
				jPanel2Layout1.setHorizontalGroup(jPanel2Layout1.createSequentialGroup()
						.addContainerGap(19, 19)
						.addGroup(jPanel2Layout1.createParallelGroup()
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel2Layout1.createSequentialGroup()
						        .addComponent(jLabel53, GroupLayout.PREFERRED_SIZE, 27, GroupLayout.PREFERRED_SIZE)
						        .addGap(11))
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel2Layout1.createSequentialGroup()
						        .addGroup(jPanel2Layout1.createParallelGroup()
						            .addGroup(GroupLayout.Alignment.LEADING, jPanel2Layout1.createSequentialGroup()
						                .addPreferredGap(jLabel43, jLabel50, LayoutStyle.ComponentPlacement.INDENT)
						                .addComponent(jLabel50, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE))
						            .addGroup(GroupLayout.Alignment.LEADING, jPanel2Layout1.createSequentialGroup()
						                .addComponent(jLabel43, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						                .addGap(12))
						            .addGroup(GroupLayout.Alignment.LEADING, jPanel2Layout1.createSequentialGroup()
						                .addComponent(jLabel51, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						                .addGap(12)))
						        .addComponent(jLabel49, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)))
						.addComponent(jLabel48, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						.addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
						.addComponent(jLabel47, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						.addGroup(jPanel2Layout1.createParallelGroup()
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel2Layout1.createSequentialGroup()
						        .addComponent(jLabel46, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addGap(12))
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel2Layout1.createSequentialGroup()
						        .addPreferredGap(jLabel46, jLabel45, LayoutStyle.ComponentPlacement.INDENT)
						        .addComponent(jLabel45, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)))
						.addGroup(jPanel2Layout1.createParallelGroup()
						    .addGroup(GroupLayout.Alignment.LEADING, jPanel2Layout1.createSequentialGroup()
						        .addComponent(jLabel44, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						        .addGap(0, 8, Short.MAX_VALUE))
						    .addGroup(jPanel2Layout1.createSequentialGroup()
						        .addGap(0, 0, Short.MAX_VALUE)
						        .addComponent(jLabel52, GroupLayout.PREFERRED_SIZE, 21, GroupLayout.PREFERRED_SIZE)))
						.addGap(138)
						.addGroup(jPanel2Layout1.createParallelGroup()
						    .addComponent(jLabel36, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel37, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel38, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel39, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel40, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel41, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel42, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE))
						.addGap(37)
						.addGroup(jPanel2Layout1.createParallelGroup()
						    .addComponent(jLabel28, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel29, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel30, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel31, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel32, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel33, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel34, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel35, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 230, GroupLayout.PREFERRED_SIZE))
						.addContainerGap(18, 18));
				jPanel2Layout1.setVerticalGroup(jPanel2Layout1.createSequentialGroup()
						.addGroup(jPanel2Layout1.createParallelGroup(GroupLayout.Alignment.BASELINE)
						    .addComponent(jLabel52, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel53, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE))
						.addGroup(jPanel2Layout1.createParallelGroup(GroupLayout.Alignment.BASELINE)
						    .addComponent(jLabel44, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel45, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel46, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel47, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel51, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel50, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel49, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel48, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						.addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
						.addComponent(jLabel43, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						.addGap(99)
						.addComponent(jLabel35, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						.addComponent(jLabel34, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						.addGroup(jPanel2Layout1.createParallelGroup()
						    .addComponent(jLabel33, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel42, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						.addGroup(jPanel2Layout1.createParallelGroup(GroupLayout.Alignment.BASELINE)
						    .addComponent(jLabel32, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel41, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						.addGroup(jPanel2Layout1.createParallelGroup()
						    .addComponent(jLabel31, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel40, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						.addGroup(jPanel2Layout1.createParallelGroup()
						    .addComponent(jLabel30, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel39, GroupLayout.Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						.addGroup(jPanel2Layout1.createParallelGroup(GroupLayout.Alignment.BASELINE)
						    .addComponent(jLabel29, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel38, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						.addGroup(jPanel2Layout1.createParallelGroup(GroupLayout.Alignment.BASELINE)
						    .addComponent(jLabel28, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
						    .addComponent(jLabel37, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE))
						.addComponent(jLabel36, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE));
				}
			}
			{
				jMenuBar1 = new JMenuBar();
				setJMenuBar(jMenuBar1);
				{
					jMenu1 = new JMenu();
					jMenuBar1.add(jMenu1);
					jMenu1.setText("File");
					{
						jMenuItem1 = new JMenuItem();
						jMenu1.add(jMenuItem1);
						jMenuItem1.setText("Close");
					}
				}
			}
			{
				hexStringLabel = new JLabel();
				hexStringLabel.setText("Telegram:");
			}
			{
				hexStringTextField = new JTextField();
			}
			{
				crcLabel = new JLabel();
				crcLabel.setText("OK");
			}
			{
				crcLabel2 = new JLabel();
				crcLabel2.setText("CRC:");
			}
			{
				statusLabel = new JLabel();
			}
			thisLayout.setVerticalGroup(thisLayout.createSequentialGroup()
				.addContainerGap()
				.addGroup(thisLayout.createParallelGroup(GroupLayout.Alignment.BASELINE)
				    .addComponent(hexStringTextField, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
				    .addComponent(hexStringLabel, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
				    .addComponent(crcLabel2, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
				    .addComponent(crcLabel, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE))
				.addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
				.addComponent(jTabbedPane1, GroupLayout.PREFERRED_SIZE, 312, GroupLayout.PREFERRED_SIZE)
				.addGap(48)
				.addComponent(statusLabel, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE));
			thisLayout.setHorizontalGroup(thisLayout.createSequentialGroup()
				.addContainerGap()
				.addGroup(thisLayout.createParallelGroup()
				    .addGroup(thisLayout.createSequentialGroup()
				        .addComponent(jTabbedPane1, GroupLayout.PREFERRED_SIZE, 576, GroupLayout.PREFERRED_SIZE)
				        .addGap(0, 0, Short.MAX_VALUE))
				    .addGroup(GroupLayout.Alignment.LEADING, thisLayout.createSequentialGroup()
				        .addComponent(hexStringLabel, GroupLayout.PREFERRED_SIZE, 64, GroupLayout.PREFERRED_SIZE)
				        .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
				        .addComponent(hexStringTextField, GroupLayout.PREFERRED_SIZE, 371, GroupLayout.PREFERRED_SIZE)
				        .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
				        .addComponent(crcLabel2, GroupLayout.PREFERRED_SIZE, 43, GroupLayout.PREFERRED_SIZE)
				        .addComponent(crcLabel, GroupLayout.PREFERRED_SIZE, 43, GroupLayout.PREFERRED_SIZE)
				        .addGap(0, 31, Short.MAX_VALUE))
				    .addGroup(GroupLayout.Alignment.LEADING, thisLayout.createSequentialGroup()
				        .addComponent(statusLabel, GroupLayout.PREFERRED_SIZE, 544, GroupLayout.PREFERRED_SIZE)
				        .addGap(0, 32, Short.MAX_VALUE)))
				.addContainerGap(66, 66));
			pack();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
