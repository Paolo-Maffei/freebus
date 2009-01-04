//POVRay-Datei erstellt mit 3d41.ulp v1.05
//E:/freebus/trunk/hardware/Eagle Layouts/controller_avr/Ctrl_AVR_Reg_Rev30.brd
//04.01.2009 22:41:53

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare environment = on;

#local cam_x = 0;
#local cam_y = 252;
#local cam_z = -135;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -5;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 180;

#local pcb_board = on;
#local pcb_parts = on;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 25;
#local lgt1_pos_y = 38;
#local lgt1_pos_z = 31;
#local lgt1_intense = 0.756636;
#local lgt2_pos_x = -25;
#local lgt2_pos_y = 38;
#local lgt2_pos_z = 31;
#local lgt2_intense = 0.756636;
#local lgt3_pos_x = 25;
#local lgt3_pos_y = 38;
#local lgt3_pos_z = -21;
#local lgt3_intense = 0.756636;
#local lgt4_pos_x = -25;
#local lgt4_pos_y = 38;
#local lgt4_pos_z = -21;
#local lgt4_intense = 0.756636;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 67.436600;
#declare pcb_y_size = 58.788600;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(298);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "tools.inc"
#include "user.inc"

global_settings{charset utf8}

#if(environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animationsdaten
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "Keine/zu wenig Animationsdaten vorhanden (mind. 3 Punkte) (Flugpfad)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "Keine/zu wenig Animationsdaten vorhanden (mind. 3 Punkte) (Blickpunktpfad)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//versetzt die Kamera, sodass <0,0,0> über dem Eagle-Nullpunkt ist
	//translate<-33.718300,0,-29.394300>
}
#end

background{col_bgr}


//Axis uncomment to activate
//object{TOOLS_AXIS_XYZ(100,100,100 //texture{ pigment{rgb<1,0,0>} finish{diffuse 0.8 phong 1}}, //texture{ pigment{rgb<1,1,1>} finish{diffuse 0.8 phong 1}})}

light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro CTRL_AVR_REG_REV30(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Platine
prism{-1.500000,0.000000,8
<0.255800,0.130000><0.255800,58.918600>
<0.255800,58.918600><67.692400,58.918600>
<67.692400,58.918600><67.692400,0.130000>
<67.692400,0.130000><0.255800,0.130000>
texture{col_brd}}
}//End union(Platine)
//Bohrungen(real)/Bauteile
//Bohrungen(real)/Platine
cylinder{<3.810000,1,53.975000><3.810000,-5,53.975000>1.400000 texture{col_hls}}
cylinder{<64.135000,1,5.080000><64.135000,-5,5.080000>1.400000 texture{col_hls}}
cylinder{<64.135000,1,53.975000><64.135000,-5,53.975000>1.400000 texture{col_hls}}
cylinder{<3.810000,1,5.080000><3.810000,-5,5.080000>1.400000 texture{col_hls}}
//Bohrungen(real)/Durchkontaktierungen
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Bauteile
union{
//MPD-File
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_ELKO_5MM_10MM("100u, 63V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<32.258000,0.000000,49.022000>}#end		//Elko 5mm Pitch, 10mm Durchmesser, 16mm Hoehe C1 100u, 63V E5-10,5
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<22.606000,0.000000,7.620000>}#end		//ceramic disc capacitator C2 100n C050-025X075
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_DIS_CERAMIC_25MM_44MM("470p",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<62.484000,0.000000,48.641000>}#end		//ceramic disc capacitator C3 470p C025-024X044
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_DIS_CERAMIC_50MM_44MM("100n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<25.400000,0.000000,7.620000>}#end		//ceramic disc capacitator C4 100n C050-024X044
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<13.970000,0.000000,30.226000>}#end		//ceramic disc capacitator C5 100n C050-025X075
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_DIS_ELKO_2MM5_6MM3("100u, 16V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<46.355000,0.000000,30.480000>}#end		//Elko 2,5mm Pitch, 6,3mm Durchmesser, 11,2mm Hoehe C6 100u, 16V E2,5-7
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<13.970000,0.000000,37.846000>}#end		//ceramic disc capacitator C7 100n C050-025X075
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_DIS_CERAMIC_25MM_50MM("33p",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<35.382200,0.000000,32.918400>}#end		//ceramic disc capacitator C8 33p C025-025X050
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_DIS_CERAMIC_25MM_50MM("33p",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<28.397200,0.000000,32.918400>}#end		//ceramic disc capacitator C9 33p C025-025X050
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<44.196000,0.000000,9.906000>}#end		//ceramic disc capacitator C10 100n C050-025X075
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO35_102MM_H("BAT46",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<8.153400,0.000000,48.768000>}#end		//Diode DO35 10mm hor. D1 BAT46 DO35Z10
#ifndef(pack_D2) #declare global_pack_D2=yes; object {DIODE_DIS_DO41_102MM_H("P6KEXXA",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<11.334800,0.000000,10.160000>}#end		//Diode DO35 10mm hor. D2 P6KEXXA C1702-15
#ifndef(pack_D3) #declare global_pack_D3=yes; object {DIODE_DIS_DO35_102MM_H("BAT46",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<13.716000,0.000000,7.112000>}#end		//Diode DO35 10mm hor. D3 BAT46 DO35Z10
#ifndef(pack_D4) #declare global_pack_D4=yes; object {DIODE_DIS_DO35_102MM_H("1N821",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<52.832000,0.000000,36.068000>}#end		//Diode DO35 10mm hor. D4 1N821 DO35Z10
#ifndef(pack_D5) #declare global_pack_D5=yes; object {DIODE_DIS_DO34_076MM_H("8v2",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<44.500800,0.000000,17.881600>}#end		//Diode DO34 7mm hor. D5 8v2 DO34Z7
#ifndef(pack_D6) #declare global_pack_D6=yes; object {DIODE_DIS_DO35_102MM_H("BAT46",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<44.958000,0.000000,20.828000>}#end		//Diode DO35 10mm hor. D6 BAT46 DO35Z10
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_DIS_DIP28("MEGA8-P","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<20.574000,0.000000,31.496000>translate<0,3.000000,0> }#end		//DIP28 300mil IC2 MEGA8-P DIL28-3
#ifndef(pack_IC2) object{SOCKET_DIP28()rotate<0,-90.000000,0> rotate<0,0,0> translate<20.574000,0.000000,31.496000>}#end					//IC-Sockel 28Pin IC2 MEGA8-P
#ifndef(pack_IC3) #declare global_pack_IC3=yes; object {IC_DIS_DIP8("MC34063AP","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<55.880000,0.000000,51.562000>translate<0,3.000000,0> }#end		//DIP8 IC3 MC34063AP DIL08
#ifndef(pack_IC3) object{SOCKET_DIP8()rotate<0,0.000000,0> rotate<0,0,0> translate<55.880000,0.000000,51.562000>}#end					//IC-Sockel 8Pin IC3 MC34063AP
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {PH_2X1J(0,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<35.560000,0.000000,4.318000>}#end		//Jumper 2,54mm Raster 2Pin 1Reihe (jumper.lib) JP1  JP1
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {PH_1X6()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<58.420000,0.000000,36.322000>}#end		//Stiftleiste 2,54mm Raster 6Pin 1Reihe (pinhead.lib) JP2  1X06
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {PH_2X3J(0,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<11.176000,0.000000,54.102000>}#end		//Jumper 2,54mm Raster 3Pin 2Reihen (pinhead.lib) JP3  JP3Q
#ifndef(pack_JP4) #declare global_pack_JP4=yes; object {PH_1X6()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<35.560000,0.000000,20.320000>}#end		//Stiftleiste 2,54mm Raster 6Pin 1Reihe (pinhead.lib) JP4  1X06
#ifndef(pack_L1) #declare global_pack_L1=yes; object {RES_DIS_0207_12MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<55.118000,0.000000,37.338000>}#end		//Diskreter Widerstand 0,3W 12MM Raster L1 220u 0207/12
#ifndef(pack_L2) #declare global_pack_L2=yes; object {L_5MM_S("150mH",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<45.466000,0.000000,40.386000>}#end		//Spule L2 150mH SD12_1000
#ifndef(pack_LED1) #declare global_pack_LED1=yes; object {DIODE_DIS_LED_3MM(Yellow,0.500000,10.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<62.230000,-1.500000,42.545000>}#end		//Diskrete 3MM LED LED1  LED3MM
#ifndef(pack_LED2) #declare global_pack_LED2=yes; object {DIODE_DIS_LED_3MM(Yellow,0.500000,10.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<62.230000,-1.500000,33.020000>}#end		//Diskrete 3MM LED LED2  LED3MM
#ifndef(pack_LED3) #declare global_pack_LED3=yes; object {DIODE_DIS_LED_3MM(Yellow,0.500000,10.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<62.230000,-1.500000,23.495000>}#end		//Diskrete 3MM LED LED3  LED3MM
#ifndef(pack_LED4) #declare global_pack_LED4=yes; object {DIODE_DIS_LED_3MM(Yellow,0.500000,10.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<62.230000,-1.500000,13.970000>}#end		//Diskrete 3MM LED LED4  LED3MM
#ifndef(pack_LED5) #declare global_pack_LED5=yes; object {DIODE_DIS_LED_3MM(Yellow,0.500000,10.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<31.750000,-1.500000,42.545000>}#end		//Diskrete 3MM LED LED5  LED3MM
#ifndef(pack_LED6) #declare global_pack_LED6=yes; object {DIODE_DIS_LED_3MM(Yellow,0.500000,10.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<31.750000,-1.500000,33.020000>}#end		//Diskrete 3MM LED LED6  LED3MM
#ifndef(pack_LED7) #declare global_pack_LED7=yes; object {DIODE_DIS_LED_3MM(Yellow,0.500000,10.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<31.750000,-1.500000,23.495000>}#end		//Diskrete 3MM LED LED7  LED3MM
#ifndef(pack_LED8) #declare global_pack_LED8=yes; object {DIODE_DIS_LED_3MM(Yellow,0.500000,10.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<31.750000,-1.500000,13.970000>}#end		//Diskrete 3MM LED LED8  LED3MM
#ifndef(pack_LED9) #declare global_pack_LED9=yes; object {DIODE_DIS_LED_3MM(Red,0.500000,10.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<26.416000,-1.500000,53.848000>}#end		//Diskrete 3MM LED LED9  LED3MM
#ifndef(pack_Q1) #declare global_pack_Q1=yes; object {TR_TO92_G("BC557",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<29.718000,0.000000,7.874000>}#end		//TO92 gewinckelt stehend Q1 BC557 TO92
#ifndef(pack_Q2) #declare global_pack_Q2=yes; object {TR_TO92_L("BC640",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<54.102000,0.000000,4.826000>}#end		//TO92 gerade stehend Q2 BC640 TO92-BCE
#ifndef(pack_Q3) #declare global_pack_Q3=yes; object {SPC_XTAL_5MM("8,000",3,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<32.054800,0.000000,37.820600>}#end		//Quarz 4,9MM Q3 8,000 QS
#ifndef(pack_Q6) #declare global_pack_Q6=yes; object {TR_TO92_L("BS170",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<54.610000,0.000000,11.684000>}#end		//TO92 gerade stehend Q6 BS170 SOT54E
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_10MM(texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<43.688000,0.000000,53.086000>}#end		//Diskreter Widerstand 0,3W 10MM Raster R1 3R3 0207/10
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_10MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<43.688000,0.000000,48.006000>}#end		//Diskreter Widerstand 0,3W 10MM Raster R2 2k2 0207/10
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Yellow}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<13.716000,0.000000,4.826000>}#end		//Diskreter Widerstand 0,3W 10MM Raster R3 100k 0207/10
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<44.196000,0.000000,2.286000>}#end		//Diskreter Widerstand 0,3W 10MM Raster R4 12R 0207/10
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<43.688000,0.000000,55.626000>}#end		//Diskreter Widerstand 0,3W 10MM Raster R5 1k 0207/10
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<44.196000,0.000000,7.366000>}#end		//Diskreter Widerstand 0,3W 10MM Raster R6 100R 0207/10
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_10MM(texture{pigment{Gray45}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<27.686000,0.000000,2.286000>}#end		//Diskreter Widerstand 0,3W 10MM Raster R7 82k 0207/10
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<13.716000,0.000000,2.286000>}#end		//Diskreter Widerstand 0,3W 10MM Raster R8 47k 0207/10
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<27.686000,0.000000,20.091400>}#end		//Diskreter Widerstand 0,3W 10MM Raster R9 4k7 0207/10
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_DIS_0207_10MM(texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<43.688000,0.000000,50.546000>}#end		//Diskreter Widerstand 0,3W 10MM Raster R10 3k3 0207/10
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_DIS_0207_10MM(texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{Blue}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<44.196000,0.000000,4.826000>}#end		//Diskreter Widerstand 0,3W 10MM Raster R11 5k6 0207/10
#ifndef(pack_R12) #declare global_pack_R12=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<44.196000,0.000000,12.700000>}#end		//Diskreter Widerstand 0,3W 10MM Raster R12 12k 0207/10
#ifndef(pack_R13) #declare global_pack_R13=yes; object {RES_DIS_0207_10MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Yellow}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<44.196000,0.000000,15.240000>}#end		//Diskreter Widerstand 0,3W 10MM Raster R13 220k 0207/10
#ifndef(pack_RN1) #declare global_pack_RN1=yes; object {RES_DIS_SIL_5("1K",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<58.420000,0.000000,21.844000>}#end		//SIL-Netzwerk 5Pin RN1 1K SIL5
#ifndef(pack_RN2) #declare global_pack_RN2=yes; object {RES_DIS_SIL_5("1K",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<39.116000,0.000000,30.480000>}#end		//SIL-Netzwerk 5Pin RN2 1K SIL5
#ifndef(pack_S1) #declare global_pack_S1=yes; object {SWITCH_B3F_10XX1()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<20.320000,-1.500000,53.848000>}#end		//Taster Switch-Omron S1  B3F-10XX
#ifndef(pack_X1) #declare global_pack_X1=yes; object {CON_DIS_WS20G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<7.620000,0.000000,29.210000>}#end		//Wannenstecker 20Pin X1 FB_KOMPAKT ML20
}//End union
#end
#if(pcb_pads_smds=on)
//Lötaugen&SMD/Bauteile
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.100000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<34.798000,0,49.022000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.100000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<29.718000,0,49.022000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<22.606000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<22.606000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<62.484000,0,49.911000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<62.484000,0,47.371000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<25.400000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<25.400000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.970000,0,32.766000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.970000,0,27.686000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<46.355000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.900000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<46.355000,0,31.750000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.970000,0,40.386000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.970000,0,35.306000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<35.382200,0,31.648400> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<35.382200,0,34.188400> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<28.397200,0,31.648400> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<28.397200,0,34.188400> texture{col_thl}}
#ifndef(global_pack_C10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<46.736000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_C10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<41.656000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<3.073400,0,48.768000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<13.233400,0,48.768000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<18.954800,0,10.160000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<3.714800,0,10.160000> texture{col_thl}}
#ifndef(global_pack_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<8.636000,0,7.112000> texture{col_thl}}
#ifndef(global_pack_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<18.796000,0,7.112000> texture{col_thl}}
#ifndef(global_pack_D4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<52.832000,0,30.988000> texture{col_thl}}
#ifndef(global_pack_D4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<52.832000,0,41.148000> texture{col_thl}}
#ifndef(global_pack_D5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.690800,0,17.881600> texture{col_thl}}
#ifndef(global_pack_D5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<48.310800,0,17.881600> texture{col_thl}}
#ifndef(global_pack_D6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<39.878000,0,20.828000> texture{col_thl}}
#ifndef(global_pack_D6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<50.038000,0,20.828000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<24.384000,0,14.986000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<24.384000,0,17.526000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<24.384000,0,20.066000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<24.384000,0,22.606000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<24.384000,0,25.146000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<24.384000,0,27.686000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<24.384000,0,30.226000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<24.384000,0,32.766000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<24.384000,0,35.306000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<24.384000,0,37.846000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<24.384000,0,40.386000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<24.384000,0,42.926000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<24.384000,0,45.466000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<24.384000,0,48.006000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<16.764000,0,48.006000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<16.764000,0,45.466000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<16.764000,0,42.926000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<16.764000,0,40.386000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<16.764000,0,37.846000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<16.764000,0,35.306000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<16.764000,0,32.766000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<16.764000,0,30.226000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<16.764000,0,27.686000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<16.764000,0,25.146000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<16.764000,0,22.606000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<16.764000,0,20.066000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<16.764000,0,17.526000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<16.764000,0,14.986000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<52.070000,0,47.752000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<54.610000,0,47.752000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<57.150000,0,47.752000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<59.690000,0,47.752000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<59.690000,0,55.372000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<57.150000,0,55.372000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<54.610000,0,55.372000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<52.070000,0,55.372000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<35.560000,0,5.588000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<35.560000,0,3.048000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.420000,0,42.672000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.420000,0,40.132000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.420000,0,37.592000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.420000,0,35.052000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.420000,0,32.512000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.420000,0,29.972000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<8.636000,0,52.832000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<8.636000,0,55.372000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<11.176000,0,52.832000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<11.176000,0,55.372000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<13.716000,0,52.832000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<13.716000,0,55.372000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_L1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.118000,0,43.688000> texture{col_thl}}
#ifndef(global_pack_L1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.118000,0,30.988000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<47.966000,0,40.386000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<42.966000,0,40.386000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<60.960000,0,42.545000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<63.500000,0,42.545000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<60.960000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<63.500000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_LED3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<60.960000,0,23.495000> texture{col_thl}}
#ifndef(global_pack_LED3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<63.500000,0,23.495000> texture{col_thl}}
#ifndef(global_pack_LED4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<60.960000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_LED4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<63.500000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_LED5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<30.480000,0,42.545000> texture{col_thl}}
#ifndef(global_pack_LED5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<33.020000,0,42.545000> texture{col_thl}}
#ifndef(global_pack_LED6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<30.480000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_LED6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<33.020000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_LED7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<30.480000,0,23.495000> texture{col_thl}}
#ifndef(global_pack_LED7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<33.020000,0,23.495000> texture{col_thl}}
#ifndef(global_pack_LED8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<30.480000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_LED8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<33.020000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_LED9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<26.416000,0,55.118000> texture{col_thl}}
#ifndef(global_pack_LED9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<26.416000,0,52.578000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<29.718000,0,9.144000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<27.813000,0,7.874000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<29.718000,0,6.604000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<54.102000,0,7.366000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<54.102000,0,4.826000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<54.102000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_Q3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<29.514800,0,37.820600> texture{col_thl}}
#ifndef(global_pack_Q3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<34.594800,0,37.820600> texture{col_thl}}
#ifndef(global_pack_Q6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<54.610000,0,10.414000> texture{col_thl}}
#ifndef(global_pack_Q6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<52.705000,0,11.684000> texture{col_thl}}
#ifndef(global_pack_Q6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<54.610000,0,12.954000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<48.768000,0,53.086000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<38.608000,0,53.086000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<38.608000,0,48.006000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<48.768000,0,48.006000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<18.796000,0,4.826000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<8.636000,0,4.826000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<39.116000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<49.276000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<38.608000,0,55.626000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<48.768000,0,55.626000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<49.276000,0,7.366000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<39.116000,0,7.366000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<32.766000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<22.606000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<8.636000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<18.796000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<27.686000,0,25.171400> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<27.686000,0,15.011400> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<38.608000,0,50.546000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<48.768000,0,50.546000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<49.276000,0,4.826000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<39.116000,0,4.826000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<49.276000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<39.116000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<39.116000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<49.276000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_RN1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<58.420000,0,16.764000> texture{col_thl}}
#ifndef(global_pack_RN1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<58.420000,0,19.304000> texture{col_thl}}
#ifndef(global_pack_RN1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<58.420000,0,21.844000> texture{col_thl}}
#ifndef(global_pack_RN1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<58.420000,0,24.384000> texture{col_thl}}
#ifndef(global_pack_RN1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<58.420000,0,26.924000> texture{col_thl}}
#ifndef(global_pack_RN2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<39.116000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_RN2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<39.116000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_RN2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<39.116000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_RN2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<39.116000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_RN2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<39.116000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<17.068800,0,51.587400> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<23.571200,0,51.587400> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<17.068800,0,56.108600> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<23.571200,0,56.108600> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,0+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,17.780000> texture{col_thl}}
//Lötaugen/Durchkontaktierungen
object{TOOLS_PCB_VIA(1.350000,0.900000,1,16,2,0) translate<30.226000,0,11.938000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<27.940000,0,45.466000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<11.557000,0,21.463000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<60.071000,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<45.720000,0,15.240000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<30.734000,0,20.447000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<50.038000,0,24.130000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<50.038000,0,34.925000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<12.700000,0,46.736000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<20.066000,0,14.986000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<19.939000,0,25.146000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<19.939000,0,27.590700> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<31.750000,0,27.940000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<41.783000,0,27.940000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<43.180000,0,34.417000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.350000,0.900000,1,16,2,0) translate<43.180000,0,24.130000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<21.240800,0,29.083000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<21.240700,0,23.558500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.350000,0.900000,1,16,2,0) translate<26.416000,0,13.208000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<30.353000,0,25.527000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.350000,0.900000,1,16,2,0) translate<39.116000,0,22.860000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<3.556000,0,38.608000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<3.556000,0,43.688000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<5.842000,0,51.054000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<28.194000,0,29.083000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.350000,0.900000,1,16,2,0) translate<21.082000,0,46.736000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,2,0) translate<18.891300,0,36.576000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signale
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.841500,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.841600,-1.535000,13.144400>}
box{<0,0,-0.203200><27.495600,0.035000,0.203200> rotate<0,89.993852,0> translate<1.841500,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.841500,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.841600,-1.535000,46.545400>}
box{<0,0,-0.203200><5.905400,0.035000,0.203200> rotate<0,-89.993090,0> translate<1.841500,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.286000,0.000000,16.954500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.286000,0.000000,44.958000>}
box{<0,0,-0.203200><28.003500,0.035000,0.203200> rotate<0,90.000000,0> translate<2.286000,0.000000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.841600,-1.535000,46.545400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,47.752000>}
box{<0,0,-0.203200><1.706249,0.035000,0.203200> rotate<0,-45.001779,0> translate<1.841600,-1.535000,46.545400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,48.768000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,90.000000,0> translate<3.048000,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.073400,-1.535000,48.768000>}
box{<0,0,-0.203200><0.025400,0.035000,0.203200> rotate<0,0.000000,0> translate<3.048000,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,0.000000,17.208500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,0.000000,27.178000>}
box{<0,0,-0.203200><9.969500,0.035000,0.203200> rotate<0,90.000000,0> translate<3.556000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,-1.535000,38.608000>}
box{<0,0,-0.203200><17.018000,0.035000,0.203200> rotate<0,90.000000,0> translate<3.556000,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,0.000000,43.688000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,90.000000,0> translate<3.556000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,-1.535000,44.704000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,90.000000,0> translate<3.556000,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.841600,-1.535000,13.144400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.714800,-1.535000,11.271300>}
box{<0,0,-0.203200><2.649034,0.035000,0.203200> rotate<0,44.995501,0> translate<1.841600,-1.535000,13.144400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.714800,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.714800,-1.535000,11.271300>}
box{<0,0,-0.203200><1.111300,0.035000,0.203200> rotate<0,90.000000,0> translate<3.714800,-1.535000,11.271300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,-1.535000,20.320000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<3.556000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,0.000000,26.416000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,90.000000,0> translate<4.826000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,-1.535000,30.988000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,90.000000,0> translate<4.826000,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,0.000000,36.576000>}
box{<0,0,-0.203200><5.588000,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.826000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.286000,0.000000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.207000,0.000000,47.879000>}
box{<0,0,-0.203200><4.130918,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.286000,0.000000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.207000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.207000,0.000000,50.419000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<5.207000,0.000000,50.419000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.588000,0.000000,29.210000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.556000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.588000,-1.535000,31.750000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.826000,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.286000,0.000000,16.954500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.778500,0.000000,13.462000>}
box{<0,0,-0.203200><4.939141,0.035000,0.203200> rotate<0,44.997030,0> translate<2.286000,0.000000,16.954500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,0.000000,17.208500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.778500,0.000000,14.986000>}
box{<0,0,-0.203200><3.143090,0.035000,0.203200> rotate<0,44.997030,0> translate<3.556000,0.000000,17.208500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,0.000000,35.560000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<4.826000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.207000,0.000000,50.419000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,0.000000,51.054000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.207000,0.000000,50.419000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.969000,-1.535000,47.117000>}
box{<0,0,-0.203200><3.412497,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.556000,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.969000,-1.535000,47.117000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.969000,-1.535000,49.149000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,90.000000,0> translate<5.969000,-1.535000,49.149000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.096000,0.000000,16.002000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<4.826000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,20.320000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.826000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,25.400000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<4.826000,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,27.940000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.826000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,35.560000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.842000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.841500,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,40.640000>}
box{<0,0,-0.203200><4.508500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.841500,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.969000,-1.535000,49.149000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,-1.535000,50.038000>}
box{<0,0,-0.203200><1.257236,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.969000,-1.535000,49.149000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.366000,0.000000,44.704000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.826000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.366000,0.000000,54.102000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.366000,0.000000,44.704000>}
box{<0,0,-0.203200><9.398000,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.366000,0.000000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.714800,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,10.160000>}
box{<0,0,-0.203200><3.905200,0.035000,0.203200> rotate<0,0.000000,0> translate<3.714800,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,24.130000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.350000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.588000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,0.000000,29.210000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.588000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,29.210000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<6.350000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,34.290000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.350000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,39.370000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.350000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,41.402000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,90.000000,0> translate<7.620000,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,-1.535000,16.256000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<6.350000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,4.826000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<8.636000,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,9.144000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<7.620000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,9.144000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,90.000000,0> translate<8.636000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,0.000000,52.832000>}
box{<0,0,-0.203200><9.652000,0.035000,0.203200> rotate<0,90.000000,0> translate<8.636000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.366000,0.000000,54.102000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,0.000000,55.372000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.366000,0.000000,54.102000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,7.112000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.636000,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,7.112000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<8.636000,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,27.940000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<7.620000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,-1.535000,42.926000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.620000,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,33.020000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.890000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,-1.535000,36.576000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.890000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,-1.535000,39.116000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.890000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,0.000000,41.910000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<8.636000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,0.000000,54.102000>}
box{<0,0,-0.203200><10.414000,0.035000,0.203200> rotate<0,90.000000,0> translate<9.906000,0.000000,54.102000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.414000,-1.535000,4.826000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.636000,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.668000,-1.535000,29.210000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.620000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.668000,0.000000,42.926000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<9.906000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.668000,0.000000,57.404000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.636000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.176000,0.000000,31.496000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<9.652000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.176000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.176000,0.000000,31.496000>}
box{<0,0,-0.203200><5.588000,0.035000,0.203200> rotate<0,90.000000,0> translate<11.176000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.176000,0.000000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.176000,0.000000,52.832000>}
box{<0,0,-0.203200><7.874000,0.035000,0.203200> rotate<0,90.000000,0> translate<11.176000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,0.000000,54.102000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.176000,0.000000,55.372000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.906000,0.000000,54.102000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.588000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,-1.535000,31.750000>}
box{<0,0,-0.203200><5.842000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.588000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,-1.535000,34.290000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.620000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,27.432000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.684000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.668000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,28.194000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<10.668000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,30.480000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.890000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,31.496000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<11.430000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,34.036000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<11.430000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.176000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.938000,0.000000,25.146000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<11.176000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.176000,0.000000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.938000,0.000000,44.196000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<11.176000,0.000000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.065000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.065000,0.000000,38.481000>}
box{<0,0,-0.203200><7.620000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.065000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.192000,-1.535000,22.860000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.890000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.192000,-1.535000,24.130000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.620000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.446000,-1.535000,25.400000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.890000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,26.416000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<11.684000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.065000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,30.226000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,44.997030,0> translate<12.065000,0.000000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,-1.535000,51.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.954000,-1.535000,51.054000>}
box{<0,0,-0.203200><7.112000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.842000,-1.535000,51.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.208000,-1.535000,28.956000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<11.684000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.096000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.462000,0.000000,16.002000>}
box{<0,0,-0.203200><7.366000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.096000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.192000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,-1.535000,22.606000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<12.192000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,-1.535000,40.640000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.890000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.954000,-1.535000,51.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,-1.535000,51.816000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.954000,-1.535000,51.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,-1.535000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,-1.535000,52.832000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,90.000000,0> translate<13.716000,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.446000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,-1.535000,23.876000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<12.446000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,0.000000,27.686000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.970000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,0.000000,30.226000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.700000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,-1.535000,32.766000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.716000,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.065000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,0.000000,40.386000>}
box{<0,0,-0.203200><2.694077,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.065000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,-1.535000,40.386000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<13.716000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233400,0.000000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.097000,0.000000,48.768000>}
box{<0,0,-0.304800><0.863600,0.035000,0.304800> rotate<0,0.000000,0> translate<13.233400,0.000000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,-1.535000,17.780000>}
box{<0,0,-0.203200><5.334000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.890000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,0.000000,20.320000>}
box{<0,0,-0.203200><5.334000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.890000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,-1.535000,50.038000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.605000,-1.535000,50.038000>}
box{<0,0,-0.203200><7.747000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.858000,-1.535000,50.038000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,0.000000,41.910000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.906000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,-1.535000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,-1.535000,46.228000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<14.732000,-1.535000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,-1.535000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,-1.535000,55.372000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.716000,-1.535000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.097000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.859000,0.000000,49.530000>}
box{<0,0,-0.304800><1.077631,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.097000,0.000000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.462000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.986000,0.000000,17.526000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.462000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.192000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.986000,-1.535000,20.066000>}
box{<0,0,-0.203200><3.951313,0.035000,0.203200> rotate<0,44.997030,0> translate<12.192000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,18.796000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.224000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,0.000000,21.336000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.224000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,-1.535000,46.228000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,46.736000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.732000,-1.535000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,-1.535000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.494000,-1.535000,44.196000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<14.732000,-1.535000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.414000,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,-1.535000,10.160000>}
box{<0,0,-0.203200><7.543415,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.414000,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.256000,0.000000,40.386000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<14.732000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.605000,-1.535000,50.038000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.637000,-1.535000,48.006000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,44.997030,0> translate<14.605000,-1.535000,50.038000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.778500,0.000000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,14.986000>}
box{<0,0,-0.203200><10.985500,0.035000,0.203200> rotate<0,0.000000,0> translate<5.778500,0.000000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.986000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,17.526000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<14.986000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.986000,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,20.066000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<14.986000,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,22.606000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.716000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.938000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,25.146000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.938000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,30.226000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.970000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,32.766000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.970000,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,35.306000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.970000,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.256000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,40.386000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.256000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,42.926000>}
box{<0,0,-0.203200><7.620000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.144000,-1.535000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.668000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,42.926000>}
box{<0,0,-0.203200><6.096000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.668000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.637000,-1.535000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,48.006000>}
box{<0,0,-0.203200><0.127000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.637000,-1.535000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,-1.535000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.068800,-1.535000,53.035200>}
box{<0,0,-0.203200><3.304734,0.035000,0.203200> rotate<0,44.997030,0> translate<14.732000,-1.535000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.068800,-1.535000,51.587400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.068800,-1.535000,53.035200>}
box{<0,0,-0.203200><1.447800,0.035000,0.203200> rotate<0,90.000000,0> translate<17.068800,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.068800,0.000000,51.587400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,0.000000,51.587400>}
box{<0,0,-0.203200><0.177800,0.035000,0.203200> rotate<0,0.000000,0> translate<17.068800,0.000000,51.587400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,0.000000,51.587400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.272000,0.000000,51.562000>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,44.997030,0> translate<17.246600,0.000000,51.587400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.272000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.297400,0.000000,51.587400>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.272000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,0.000000,35.306000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.764000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,0.000000,37.846000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.764000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,-1.535000,39.116000>}
box{<0,0,-0.203200><8.128000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.906000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.938000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,0.000000,44.196000>}
box{<0,0,-0.203200><6.096000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.938000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.494000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,-1.535000,44.196000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.494000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,-1.535000,45.466000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.764000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,-1.535000,46.736000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.240000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,21.336000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.240000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,27.686000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.764000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.208000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.542000,-1.535000,28.956000>}
box{<0,0,-0.203200><5.334000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.208000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.764300,0.000000,21.812300>}
box{<0,0,-0.203200><0.673590,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.288000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.764300,0.000000,27.209800>}
box{<0,0,-0.203200><0.673519,0.035000,0.203200> rotate<0,44.991015,0> translate<18.288000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.764300,0.000000,21.812300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.764300,0.000000,27.209800>}
box{<0,0,-0.203200><5.397500,0.035000,0.203200> rotate<0,90.000000,0> translate<18.764300,0.000000,27.209800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,-1.535000,7.112000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,90.000000,0> translate<18.796000,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,-1.535000,22.606000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.764000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.891300,-1.535000,36.576000>}
box{<0,0,-0.203200><8.985300,0.035000,0.203200> rotate<0,0.000000,0> translate<9.906000,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.923000,-1.535000,23.876000>}
box{<0,0,-0.203200><4.953000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.970000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.954800,-1.535000,10.160000>}
box{<0,0,-0.203200><3.206800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.748000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,31.496000>}
box{<0,0,-0.203200><7.366000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.684000,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,34.036000>}
box{<0,0,-0.203200><7.366000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.684000,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,0.000000,38.862000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.034000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,40.132000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.034000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,0.000000,43.180000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<18.034000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,43.180000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<18.034000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,0.000000,43.180000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,90.000000,0> translate<19.050000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,43.180000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,90.000000,0> translate<19.050000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.177000,-1.535000,22.225000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,44.997030,0> translate<18.796000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.923000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.240500,-1.535000,23.558500>}
box{<0,0,-0.203200><0.449013,0.035000,0.203200> rotate<0,44.997030,0> translate<18.923000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,0.000000,34.036000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<18.034000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,44.196000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<18.034000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,48.006000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.034000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,0.000000,30.226000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.764000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.939000,-1.535000,25.146000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.764000,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.939000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.939000,0.000000,27.590700>}
box{<0,0,-0.203200><2.444700,0.035000,0.203200> rotate<0,90.000000,0> translate<19.939000,0.000000,27.590700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,-1.535000,35.052000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.050000,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.891300,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,0.000000,37.687200>}
box{<0,0,-0.203200><1.616999,0.035000,0.203200> rotate<0,-43.405925,0> translate<18.891300,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,-1.535000,44.196000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.304000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,-1.535000,44.196000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,90.000000,0> translate<20.066000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,0.000000,37.687200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,0.000000,45.720000>}
box{<0,0,-0.203200><8.032800,0.035000,0.203200> rotate<0,90.000000,0> translate<20.066000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.954800,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,0.000000,10.160000>}
box{<0,0,-0.203200><1.365200,0.035000,0.203200> rotate<0,0.000000,0> translate<18.954800,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,0.000000,4.572000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.828000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,0.000000,9.652000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<20.320000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,-1.535000,20.066000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.764000,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,-1.535000,33.528000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.050000,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,-1.535000,41.910000>}
box{<0,0,-0.203200><8.382000,0.035000,0.203200> rotate<0,90.000000,0> translate<21.082000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,0.000000,46.736000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.066000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.240500,-1.535000,23.558500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.240700,-1.535000,23.558500>}
box{<0,0,-0.203200><2.000200,0.035000,0.203200> rotate<0,0.000000,0> translate<19.240500,-1.535000,23.558500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.209000,-1.535000,29.083000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.240800,-1.535000,29.083000>}
box{<0,0,-0.203200><0.031800,0.035000,0.203200> rotate<0,0.000000,0> translate<21.209000,-1.535000,29.083000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.240700,0.000000,23.558500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.240800,0.000000,29.083000>}
box{<0,0,-0.203200><5.524500,0.035000,0.203200> rotate<0,-89.993023,0> translate<21.240700,0.000000,23.558500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.778500,0.000000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336000,0.000000,13.462000>}
box{<0,0,-0.203200><15.557500,0.035000,0.203200> rotate<0,0.000000,0> translate<5.778500,0.000000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336000,-1.535000,18.796000>}
box{<0,0,-0.203200><6.096000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.240000,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336000,0.000000,20.066000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.764000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336000,-1.535000,26.416000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.700000,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.939000,-1.535000,27.590700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.431300,-1.535000,27.590800>}
box{<0,0,-0.203200><1.492300,0.035000,0.203200> rotate<0,-0.003839,0> translate<19.939000,-1.535000,27.590700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,3.810000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<20.828000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.177000,-1.535000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,-1.535000,22.225000>}
box{<0,0,-0.203200><2.667000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.177000,-1.535000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.240800,-1.535000,29.083000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,-1.535000,29.083000>}
box{<0,0,-0.203200><0.857200,0.035000,0.203200> rotate<0,0.000000,0> translate<21.240800,-1.535000,29.083000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.542000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,-1.535000,32.512000>}
box{<0,0,-0.203200><5.028943,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.542000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,-1.535000,39.624000>}
box{<0,0,-0.203200><7.112000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.098000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,-1.535000,42.926000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.082000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,-1.535000,29.083000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.225000,-1.535000,28.956000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<22.098000,-1.535000,29.083000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,13.970000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.352000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,16.256000>}
box{<0,0,-0.203200><14.478000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.874000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,17.145000>}
box{<0,0,-0.203200><0.889000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.352000,-1.535000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,21.336000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.082000,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,-1.535000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,22.733000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.844000,-1.535000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,22.733000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,23.368000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.352000,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,0.000000,32.766000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.812000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.383700,0.000000,22.066300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.383700,0.000000,26.955700>}
box{<0,0,-0.203200><4.889400,0.035000,0.203200> rotate<0,90.000000,0> translate<22.383700,0.000000,26.955700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,2.286000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.796000,-1.535000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,5.080000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.606000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,0.000000,6.350000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.606000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,7.112000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.796000,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,10.160000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.606000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,0.000000,18.796000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<21.336000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336000,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,20.066000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.336000,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336000,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,25.146000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<21.336000,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.431300,-1.535000,27.590800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,26.416000>}
box{<0,0,-0.203200><1.661347,0.035000,0.203200> rotate<0,44.999469,0> translate<21.431300,-1.535000,27.590800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.733000,-1.535000,17.526000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.352000,-1.535000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336000,0.000000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,0.000000,14.986000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.336000,0.000000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,40.386000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.098000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.987000,-1.535000,23.876000>}
box{<0,0,-0.203200><0.813197,0.035000,0.203200> rotate<0,-38.657257,0> translate<22.352000,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.383700,0.000000,22.066300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,0.000000,21.336000>}
box{<0,0,-0.203200><1.032800,0.035000,0.203200> rotate<0,44.997030,0> translate<22.383700,0.000000,22.066300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.383700,0.000000,26.955700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,0.000000,27.686000>}
box{<0,0,-0.203200><1.032800,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.383700,0.000000,26.955700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.297400,0.000000,51.587400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.571200,0.000000,51.587400>}
box{<0,0,-0.203200><6.273800,0.035000,0.203200> rotate<0,0.000000,0> translate<17.297400,0.000000,51.587400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.068800,-1.535000,56.108600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.571200,-1.535000,56.108600>}
box{<0,0,-0.203200><6.502400,0.035000,0.203200> rotate<0,0.000000,0> translate<17.068800,-1.535000,56.108600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.571200,-1.535000,55.930800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.571200,-1.535000,56.108600>}
box{<0,0,-0.203200><0.177800,0.035000,0.203200> rotate<0,90.000000,0> translate<23.571200,-1.535000,56.108600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.571200,-1.535000,56.108600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.596600,-1.535000,56.108600>}
box{<0,0,-0.203200><0.025400,0.035000,0.203200> rotate<0,0.000000,0> translate<23.571200,-1.535000,56.108600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.571200,-1.535000,55.930800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,-1.535000,55.880000>}
box{<0,0,-0.203200><0.071842,0.035000,0.203200> rotate<0,44.997030,0> translate<23.571200,-1.535000,55.930800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,-1.535000,55.880000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.622000,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.596600,-1.535000,56.108600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,-1.535000,56.134000>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.596600,-1.535000,56.108600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,7.874000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.606000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,11.938000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,44.997030,0> translate<22.352000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,13.335000>}
box{<0,0,-0.203200><1.651000,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.384000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,14.986000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.860000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.733000,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,17.526000>}
box{<0,0,-0.203200><1.651000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.733000,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,20.066000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.606000,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,25.146000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.606000,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,27.686000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.114000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,32.766000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.352000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,40.386000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.860000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,42.926000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.098000,-1.535000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,48.006000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.304000,-1.535000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.571200,0.000000,51.587400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.120600,0.000000,51.587400>}
box{<0,0,-0.203200><1.549400,0.035000,0.203200> rotate<0,0.000000,0> translate<23.571200,0.000000,51.587400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,0.000000,3.810000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.590000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,0.000000,5.080000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<25.400000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,-1.535000,7.112000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.606000,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,0.000000,10.160000>}
box{<0,0,-0.203200><2.159000,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.400000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,0.000000,12.319000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<24.384000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,18.796000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.606000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,21.336000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.114000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,25.146000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,26.416000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.606000,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,34.036000>}
box{<0,0,-0.203200><6.350000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.304000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,48.006000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,-1.535000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,52.578000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,44.997030,0> translate<23.622000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.908000,0.000000,22.606000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.225000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.908000,-1.535000,28.956000>}
box{<0,0,-0.203200><3.683000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.225000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.908000,-1.535000,32.766000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.908000,0.000000,45.466000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.859000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.908000,0.000000,49.530000>}
box{<0,0,-0.304800><11.049000,0.035000,0.304800> rotate<0,0.000000,0> translate<14.859000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.120600,0.000000,51.587400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.908000,0.000000,50.800000>}
box{<0,0,-0.203200><1.113552,0.035000,0.203200> rotate<0,44.997030,0> translate<25.120600,0.000000,51.587400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,0.000000,30.226000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,-1.535000,40.386000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,13.208000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.416000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,18.034000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<25.654000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,30.480000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.162000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,33.274000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<25.654000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,33.274000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,90.000000,0> translate<26.416000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,-1.535000,40.132000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<26.162000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,-1.535000,48.768000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.654000,-1.535000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,-1.535000,52.578000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.654000,-1.535000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,-1.535000,52.578000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,90.000000,0> translate<26.416000,-1.535000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,20.066000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,-1.535000,55.118000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.924000,-1.535000,55.626000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.416000,-1.535000,55.118000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,-1.535000,21.336000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.352000,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,-1.535000,26.670000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.654000,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,-1.535000,27.940000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.654000,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.908000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,-1.535000,30.226000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.908000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,30.226000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.162000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.908000,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,-1.535000,31.496000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<25.908000,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.908000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,44.196000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<25.908000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,17.526000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.432000,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,19.304000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<26.670000,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,-1.535000,14.986000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,-1.535000,15.011400>}
box{<0,0,-0.203200><0.025400,0.035000,0.203200> rotate<0,90.000000,0> translate<27.686000,-1.535000,15.011400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,0.000000,25.171400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,0.000000,25.146000>}
box{<0,0,-0.203200><0.025400,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.686000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.813000,0.000000,7.874000>}
box{<0,0,-0.203200><3.683000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.130000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,11.938000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,31.496000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.178000,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.965400,-1.535000,31.521400>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.940000,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,-1.535000,4.318000>}
box{<0,0,-0.203200><3.951313,0.035000,0.203200> rotate<0,44.997030,0> translate<25.400000,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,0.000000,25.171400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,25.679400>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.686000,0.000000,25.171400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,25.679400>}
box{<0,0,-0.203200><3.403600,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.194000,0.000000,25.679400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,29.083000>}
box{<0,0,-0.203200><1.529283,0.035000,0.203200> rotate<0,48.363269,0> translate<27.178000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.965400,-1.535000,31.521400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.397200,-1.535000,31.648400>}
box{<0,0,-0.203200><0.450089,0.035000,0.203200> rotate<0,-16.388459,0> translate<27.965400,-1.535000,31.521400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.397200,0.000000,34.188400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.422600,0.000000,34.061400>}
box{<0,0,-0.203200><0.129515,0.035000,0.203200> rotate<0,78.684874,0> translate<28.397200,0.000000,34.188400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,-1.535000,16.510000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<27.432000,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.422600,0.000000,34.061400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,0.000000,34.036000>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,44.997030,0> translate<28.422600,0.000000,34.061400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,0.000000,35.560000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,90.000000,0> translate<28.448000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,10.668000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<27.940000,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,17.780000>}
box{<0,0,-0.203200><5.028943,0.035000,0.203200> rotate<0,44.997030,0> translate<25.654000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,17.780000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,90.000000,0> translate<29.210000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,-1.535000,29.083000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,29.083000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.194000,-1.535000,29.083000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,37.846000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.908000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,50.800000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.908000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,29.083000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.337000,-1.535000,29.210000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.210000,-1.535000,29.083000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,19.050000>}
box{<0,0,-0.203200><3.232892,0.035000,0.203200> rotate<0,44.997030,0> translate<27.178000,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,37.820600>}
box{<0,0,-0.203200><0.255267,0.035000,0.203200> rotate<0,5.710216,0> translate<29.210000,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,37.846000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.210000,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.489400,0.000000,36.601400>}
box{<0,0,-0.203200><1.472762,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.448000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.489400,0.000000,36.601400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.489400,0.000000,37.820600>}
box{<0,0,-0.203200><1.219200,0.035000,0.203200> rotate<0,90.000000,0> translate<29.489400,0.000000,37.820600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.489400,-1.535000,37.947600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.489400,-1.535000,37.846000>}
box{<0,0,-0.203200><0.101600,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.489400,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,37.820600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.489400,-1.535000,37.947600>}
box{<0,0,-0.203200><0.129515,0.035000,0.203200> rotate<0,-78.684874,0> translate<29.464000,-1.535000,37.820600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.489400,-1.535000,37.947600>}
box{<0,0,-0.203200><0.104727,0.035000,0.203200> rotate<0,-75.958743,0> translate<29.464000,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.514800,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.514800,-1.535000,37.820600>}
box{<0,0,-0.203200><0.025400,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.514800,-1.535000,37.820600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.489400,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.514800,-1.535000,37.846000>}
box{<0,0,-0.203200><0.025400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.489400,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.591000,-1.535000,13.208000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.416000,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,3.810000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.400000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,6.604000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,90.000000,0> translate<29.718000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,-1.535000,49.022000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.718000,-1.535000,49.022000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,50.292000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<29.210000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,50.292000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<29.718000,0.000000,50.292000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.987000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,-1.535000,23.876000>}
box{<0,0,-0.203200><6.985000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.987000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.908000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.972000,0.000000,45.466000>}
box{<0,0,-0.304800><5.747364,0.035000,0.304800> rotate<0,44.997030,0> translate<25.908000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,11.938000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<29.210000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.591000,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,-1.535000,13.970000>}
box{<0,0,-0.203200><0.991902,0.035000,0.203200> rotate<0,-50.191116,0> translate<29.591000,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,-1.535000,42.926000>}
box{<0,0,-0.203200><5.842000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,-1.535000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,-1.535000,51.308000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.718000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.353000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.353000,0.000000,29.083000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.353000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,13.970000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.226000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,23.368000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<29.972000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,23.495000>}
box{<0,0,-0.203200><0.127000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.480000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,30.226000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.178000,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,33.020000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.480000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,33.528000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.480000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,41.910000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.480000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,42.545000>}
box{<0,0,-0.203200><0.127000,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.480000,-1.535000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,42.672000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<30.226000,-1.535000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.734000,0.000000,9.144000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.718000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.734000,0.000000,44.196000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.178000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.353000,-1.535000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.115000,-1.535000,25.527000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.353000,-1.535000,25.527000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.242000,-1.535000,41.148000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<30.480000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.353000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.496000,0.000000,30.226000>}
box{<0,0,-0.203200><1.616446,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.353000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.734000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,10.160000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.734000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.908000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,16.764000>}
box{<0,0,-0.203200><8.261836,0.035000,0.203200> rotate<0,44.997030,0> translate<25.908000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,16.764000>}
box{<0,0,-0.203200><6.604000,0.035000,0.203200> rotate<0,90.000000,0> translate<31.750000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,25.908000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,90.000000,0> translate<31.750000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,27.940000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.178000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,34.798000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.480000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.734000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,43.180000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<30.734000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,43.180000>}
box{<0,0,-0.203200><8.382000,0.035000,0.203200> rotate<0,90.000000,0> translate<31.750000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,6.604000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.718000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,-1.535000,21.590000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,44.997030,0> translate<30.480000,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,20.828000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<31.750000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,20.828000>}
box{<0,0,-0.203200><6.858000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.020000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,23.495000>}
box{<0,0,-0.203200><0.127000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.020000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.115000,-1.535000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,23.622000>}
box{<0,0,-0.203200><2.694077,0.035000,0.203200> rotate<0,44.997030,0> translate<31.115000,-1.535000,25.527000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,29.210000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.750000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,0.000000,3.810000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.718000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.766000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.369300,0.000000,1.682800>}
box{<0,0,-0.203200><0.853124,0.035000,0.203200> rotate<0,44.992282,0> translate<32.766000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,-1.535000,35.306000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,27.940000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.750000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.242000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,-1.535000,41.148000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.242000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,0.000000,3.048000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<33.274000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,-1.535000,46.736000>}
box{<0,0,-0.203200><12.954000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.082000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.163000,0.000000,33.020000>}
box{<0,0,-0.203200><1.143000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.020000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.163000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,32.893000>}
box{<0,0,-0.203200><0.401609,0.035000,0.203200> rotate<0,18.433732,0> translate<34.163000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,36.322000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.528000,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,37.592000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<34.544000,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.594800,0.000000,37.820600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.594800,0.000000,36.525200>}
box{<0,0,-0.203200><1.295400,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.594800,0.000000,36.525200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.594800,-1.535000,37.642800>}
box{<0,0,-0.203200><0.071842,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.544000,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.594800,-1.535000,37.642800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.594800,-1.535000,37.820600>}
box{<0,0,-0.203200><0.177800,0.035000,0.203200> rotate<0,90.000000,0> translate<34.594800,-1.535000,37.820600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,-1.535000,47.498000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.036000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.798000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.798000,0.000000,47.498000>}
box{<0,0,-0.304800><1.524000,0.035000,0.304800> rotate<0,-90.000000,0> translate<34.798000,0.000000,47.498000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,-1.535000,47.498000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,-1.535000,49.022000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,90.000000,0> translate<34.798000,-1.535000,49.022000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,52.832000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,90.000000,0> translate<34.798000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.306000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.306000,0.000000,34.036000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.306000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.594800,0.000000,36.525200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.306000,0.000000,35.814000>}
box{<0,0,-0.203200><1.005789,0.035000,0.203200> rotate<0,44.997030,0> translate<34.594800,0.000000,36.525200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.306000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.331400,0.000000,34.061400>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.306000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.397200,0.000000,31.648400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.382200,0.000000,31.648400>}
box{<0,0,-0.203200><6.985000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.397200,0.000000,31.648400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.331400,0.000000,34.061400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.382200,0.000000,34.188400>}
box{<0,0,-0.203200><0.136783,0.035000,0.203200> rotate<0,-68.194090,0> translate<35.331400,0.000000,34.061400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,0.000000,3.048000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.036000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,0.000000,8.382000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.560000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,0.000000,10.160000>}
box{<0,0,-0.203200><5.028943,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.004000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,0.000000,13.970000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.560000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,16.510000>}
box{<0,0,-0.203200><7.112000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.448000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,19.050000>}
box{<0,0,-0.203200><6.096000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.464000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,21.590000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.258000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,26.670000>}
box{<0,0,-0.203200><8.382000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.178000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.798000,0.000000,47.498000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.687000,0.000000,46.609000>}
box{<0,0,-0.304800><1.257236,0.035000,0.304800> rotate<0,44.997030,0> translate<34.798000,0.000000,47.498000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,-1.535000,43.180000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.782000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,-1.535000,51.308000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,-1.535000,51.308000>}
box{<0,0,-0.203200><5.588000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.226000,-1.535000,51.308000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,-1.535000,30.226000>}
box{<0,0,-0.203200><5.842000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.480000,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,0.000000,54.356000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.798000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.496000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.576000,0.000000,30.226000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.496000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.369300,0.000000,1.682800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,0.000000,1.682800>}
box{<0,0,-0.203200><3.460700,0.035000,0.203200> rotate<0,0.000000,0> translate<33.369300,0.000000,1.682800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.576000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,0.000000,30.480000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.576000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.084000,-1.535000,4.318000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.194000,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.084000,0.000000,32.893000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.544000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.084000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.211000,0.000000,33.020000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.084000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,-1.535000,10.668000>}
box{<0,0,-0.203200><8.128000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.210000,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.382200,0.000000,31.648400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.363400,0.000000,31.648400>}
box{<0,0,-0.203200><1.981200,0.035000,0.203200> rotate<0,0.000000,0> translate<35.382200,0.000000,31.648400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,0.000000,1.682800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,2.286000>}
box{<0,0,-0.203200><0.971851,0.035000,0.203200> rotate<0,-38.362642,0> translate<36.830000,0.000000,1.682800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,2.794000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.592000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,-1.535000,11.938000>}
box{<0,0,-0.203200><7.366000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.226000,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.363400,0.000000,31.648400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,31.750000>}
box{<0,0,-0.203200><0.250161,0.035000,0.203200> rotate<0,-23.960908,0> translate<37.363400,0.000000,31.648400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.719000,0.000000,10.541000>}
box{<0,0,-0.203200><3.053287,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.560000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.719000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.719000,0.000000,21.463000>}
box{<0,0,-0.203200><10.922000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.719000,0.000000,21.463000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.719000,0.000000,42.545000>}
box{<0,0,-0.203200><4.699000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.020000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.846000,-1.535000,13.970000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.560000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.846000,-1.535000,31.750000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.322000,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,-1.535000,51.308000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.846000,-1.535000,49.276000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,44.997030,0> translate<35.814000,-1.535000,51.308000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,0.000000,3.556000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.592000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,0.000000,15.748000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.608000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,0.000000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,0.000000,50.546000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.608000,0.000000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.924000,-1.535000,55.626000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,55.626000>}
box{<0,0,-0.203200><11.684000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.924000,-1.535000,55.626000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.084000,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,2.286000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,44.997030,0> translate<37.084000,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,7.366000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<39.116000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.846000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,12.700000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<37.846000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,15.240000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<38.608000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.719000,0.000000,21.463000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,22.860000>}
box{<0,0,-0.203200><1.975656,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.719000,0.000000,21.463000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,22.860000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.862000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,25.400000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<39.116000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,27.940000>}
box{<0,0,-0.203200><5.334000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.782000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,30.480000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.830000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.211000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,33.020000>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,0.000000,0> translate<37.211000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,40.132000>}
box{<0,0,-0.203200><12.700000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.416000,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.719000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,41.148000>}
box{<0,0,-0.203200><1.975656,0.035000,0.203200> rotate<0,44.997030,0> translate<37.719000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,41.148000>}
box{<0,0,-0.203200><5.588000,0.035000,0.203200> rotate<0,90.000000,0> translate<39.116000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.668000,0.000000,57.404000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,57.404000>}
box{<0,0,-0.203200><28.448000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.668000,0.000000,57.404000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,-1.535000,8.636000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,44.997030,0> translate<37.338000,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,9.906000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,44.997030,0> translate<37.592000,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,20.828000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.608000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,0.000000,50.546000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,51.816000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.608000,0.000000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.386000,-1.535000,13.970000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.116000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.513000,0.000000,29.210000>}
box{<0,0,-0.203200><7.493000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.020000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,31.750000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<37.592000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.846000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,31.750000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<37.846000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.972000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.894000,0.000000,45.466000>}
box{<0,0,-0.304800><10.922000,0.035000,0.304800> rotate<0,0.000000,0> translate<29.972000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,57.404000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,0.000000,55.626000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,44.997030,0> translate<39.116000,0.000000,57.404000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,-1.535000,22.860000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.116000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,0.000000,32.258000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.640000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,0.000000,32.258000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,-90.000000,0> translate<41.148000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.656000,-1.535000,9.906000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.624000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.656000,0.000000,35.814000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.148000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.513000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.783000,0.000000,27.940000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<40.513000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.690800,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.808400,0.000000,17.881600>}
box{<0,0,-0.203200><1.117600,0.035000,0.203200> rotate<0,0.000000,0> translate<40.690800,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.783000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.037000,-1.535000,27.686000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<41.783000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164000,0.000000,7.366000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.116000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164000,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164000,-1.535000,19.304000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.164000,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164000,-1.535000,21.844000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<41.148000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.418000,-1.535000,33.274000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.894000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.878000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.926000,0.000000,20.828000>}
box{<0,0,-0.304800><3.048000,0.035000,0.304800> rotate<0,0.000000,0> translate<39.878000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.926000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.926000,0.000000,40.386000>}
box{<0,0,-0.304800><3.048000,0.035000,0.304800> rotate<0,-90.000000,0> translate<42.926000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.894000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.926000,0.000000,43.434000>}
box{<0,0,-0.304800><2.873682,0.035000,0.304800> rotate<0,44.997030,0> translate<40.894000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.926000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.966000,0.000000,40.386000>}
box{<0,0,-0.304800><0.040000,0.035000,0.304800> rotate<0,0.000000,0> translate<42.926000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,8.382000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.164000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.808400,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,16.510000>}
box{<0,0,-0.203200><1.939735,0.035000,0.203200> rotate<0,44.997030,0> translate<41.808400,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,16.510000>}
box{<0,0,-0.203200><8.128000,0.035000,0.203200> rotate<0,90.000000,0> translate<43.180000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,-1.535000,20.320000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.180000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,24.130000>}
box{<0,0,-0.203200><7.620000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.560000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,29.337000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.180000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,-1.535000,34.417000>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.180000,-1.535000,34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,-1.535000,36.322000>}
box{<0,0,-0.203200><5.570655,0.035000,0.203200> rotate<0,43.149542,0> translate<39.116000,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,-1.535000,53.086000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.608000,-1.535000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.307000,0.000000,24.130000>}
box{<0,0,-0.203200><0.127000,0.035000,0.203200> rotate<0,0.000000,0> translate<43.180000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.196000,-1.535000,19.304000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<43.180000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.307000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.831000,0.000000,25.654000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.307000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.831000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.831000,0.000000,25.654000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,-90.000000,0> translate<44.831000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.831000,0.000000,27.686000>}
box{<0,0,-0.203200><2.334867,0.035000,0.203200> rotate<0,44.997030,0> translate<43.180000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164000,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.958000,-1.535000,16.510000>}
box{<0,0,-0.203200><3.951313,0.035000,0.203200> rotate<0,44.997030,0> translate<42.164000,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.656000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.958000,0.000000,35.814000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<41.656000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.958000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.466000,0.000000,35.306000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<44.958000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.466000,0.000000,32.639000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.466000,0.000000,35.306000>}
box{<0,0,-0.203200><2.667000,0.035000,0.203200> rotate<0,90.000000,0> translate<45.466000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.846000,-1.535000,49.276000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.228000,-1.535000,49.276000>}
box{<0,0,-0.203200><8.382000,0.035000,0.203200> rotate<0,0.000000,0> translate<37.846000,-1.535000,49.276000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.337000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.355000,-1.535000,29.210000>}
box{<0,0,-0.203200><17.018000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.337000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.466000,0.000000,32.639000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.355000,0.000000,31.750000>}
box{<0,0,-0.203200><1.257236,0.035000,0.203200> rotate<0,44.997030,0> translate<45.466000,0.000000,32.639000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.687000,0.000000,46.609000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.355000,0.000000,46.609000>}
box{<0,0,-0.304800><10.668000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.687000,0.000000,46.609000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.355000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.990000,-1.535000,29.210000>}
box{<0,0,-0.304800><0.635000,0.035000,0.304800> rotate<0,0.000000,0> translate<46.355000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.990000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.371000,-1.535000,28.829000>}
box{<0,0,-0.304800><0.538815,0.035000,0.304800> rotate<0,44.997030,0> translate<46.990000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.228000,-1.535000,49.276000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,-1.535000,48.006000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<46.228000,-1.535000,49.276000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,0.000000,54.356000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,54.356000>}
box{<0,0,-0.203200><11.176000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.322000,0.000000,54.356000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,-1.535000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,-1.535000,57.404000>}
box{<0,0,-0.203200><6.106574,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.180000,-1.535000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.926000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.752000,0.000000,25.654000>}
box{<0,0,-0.304800><6.824995,0.035000,0.304800> rotate<0,-44.997030,0> translate<42.926000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.752000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.752000,0.000000,25.654000>}
box{<0,0,-0.304800><0.762000,0.035000,0.304800> rotate<0,-90.000000,0> translate<47.752000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.752000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.006000,0.000000,40.386000>}
box{<0,0,-0.304800><13.972309,0.035000,0.304800> rotate<0,-88.952502,0> translate<47.752000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.966000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.006000,0.000000,40.386000>}
box{<0,0,-0.304800><0.040000,0.035000,0.304800> rotate<0,0.000000,0> translate<47.966000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.006000,0.000000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.006000,0.000000,40.386000>}
box{<0,0,-0.304800><4.572000,0.035000,0.304800> rotate<0,-90.000000,0> translate<48.006000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.355000,0.000000,46.609000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.006000,0.000000,44.958000>}
box{<0,0,-0.304800><2.334867,0.035000,0.304800> rotate<0,44.997030,0> translate<46.355000,0.000000,46.609000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.736000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.514000,0.000000,9.906000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.736000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,-1.535000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,-1.535000,48.006000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<47.498000,-1.535000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,0.000000,48.006000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<48.768000,0.000000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,-1.535000,50.546000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.768000,-1.535000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,54.356000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,0.000000,53.086000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<47.498000,0.000000,54.356000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,0.000000,55.626000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,0.000000,55.626000>}
box{<0,0,-0.203200><7.874000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.894000,0.000000,55.626000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.022000,-1.535000,50.546000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<48.768000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,0.000000,55.626000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.022000,0.000000,55.626000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.768000,0.000000,55.626000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.514000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,0.000000,10.668000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.514000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,0.000000,12.700000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,90.000000,0> translate<49.276000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,0.000000,15.240000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<49.276000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,0.000000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,0.000000,48.006000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.768000,0.000000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.310800,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.631600,0.000000,17.881600>}
box{<0,0,-0.203200><1.320800,0.035000,0.203200> rotate<0,0.000000,0> translate<48.310800,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,-1.535000,55.626000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784000,-1.535000,55.372000>}
box{<0,0,-0.203200><1.047269,0.035000,0.203200> rotate<0,14.035317,0> translate<48.768000,-1.535000,55.626000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.631600,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,0.000000,18.288000>}
box{<0,0,-0.203200><0.574736,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.631600,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.196000,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,-1.535000,19.304000>}
box{<0,0,-0.203200><5.842000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.196000,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,0.000000,20.828000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<50.038000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,-1.535000,43.180000>}
box{<0,0,-0.203200><14.224000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.814000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,11.684000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<49.276000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.355000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,31.750000>}
box{<0,0,-0.203200><3.937000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.355000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.022000,-1.535000,50.546000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.546000,-1.535000,50.546000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.022000,-1.535000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.546000,-1.535000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.546000,-1.535000,50.546000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,90.000000,0> translate<50.546000,-1.535000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784000,-1.535000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.546000,-1.535000,54.610000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<49.784000,-1.535000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.546000,-1.535000,50.546000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.546000,-1.535000,54.610000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,90.000000,0> translate<50.546000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,-1.535000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,-1.535000,40.386000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.800000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,-1.535000,42.418000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<50.038000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.054000,-1.535000,30.988000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<50.292000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,0.000000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.054000,0.000000,49.784000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.276000,0.000000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.308000,-1.535000,18.034000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<50.038000,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,-1.535000,57.404000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.308000,-1.535000,57.404000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<47.498000,-1.535000,57.404000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,0.000000,43.942000>}
box{<0,0,-0.203200><3.951313,0.035000,0.203200> rotate<0,44.997030,0> translate<48.768000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,0.000000,43.942000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,90.000000,0> translate<51.562000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.546000,-1.535000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.816000,-1.535000,45.212000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<50.546000,-1.535000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,-1.535000,39.116000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<50.800000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,-1.535000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,-1.535000,47.752000>}
box{<0,0,-0.203200><7.620000,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.070000,-1.535000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,-1.535000,56.642000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,-1.535000,55.880000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.070000,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.308000,-1.535000,57.404000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,-1.535000,56.642000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<51.308000,-1.535000,57.404000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,-1.535000,44.196000>}
box{<0,0,-0.203200><32.258000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.066000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,-1.535000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,-1.535000,55.626000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.070000,-1.535000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,-1.535000,55.626000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<52.070000,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.705000,-1.535000,11.684000>}
box{<0,0,-0.203200><2.413000,0.035000,0.203200> rotate<0,0.000000,0> translate<50.292000,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.054000,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,-1.535000,30.988000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<51.054000,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,0.000000,30.988000>}
box{<0,0,-0.203200><16.256000,0.035000,0.203200> rotate<0,90.000000,0> translate<52.832000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,0.000000,38.354000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<51.562000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,0.000000,38.354000>}
box{<0,0,-0.203200><7.366000,0.035000,0.203200> rotate<0,90.000000,0> translate<52.832000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,0.000000,42.926000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,90.000000,0> translate<52.832000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.386000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,13.970000>}
box{<0,0,-0.203200><13.208000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.386000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,26.670000>}
box{<0,0,-0.203200><18.034000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.560000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,0.000000,43.688000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.832000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.371000,-1.535000,28.829000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.975000,-1.535000,28.829000>}
box{<0,0,-0.304800><6.604000,0.035000,0.304800> rotate<0,0.000000,0> translate<47.371000,-1.535000,28.829000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.102000,-1.535000,2.286000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.276000,-1.535000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.102000,-1.535000,4.826000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.276000,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.102000,-1.535000,7.366000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.276000,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.102000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.102000,0.000000,28.956000>}
box{<0,0,-0.203200><13.462000,0.035000,0.203200> rotate<0,90.000000,0> translate<54.102000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.102000,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.356000,-1.535000,5.080000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.102000,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,0.000000,12.954000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,44.997030,0> translate<52.832000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,-1.535000,12.954000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<53.594000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.037000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,-1.535000,27.686000>}
box{<0,0,-0.203200><12.573000,0.035000,0.203200> rotate<0,0.000000,0> translate<42.037000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,0.000000,47.752000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,90.000000,0> translate<54.610000,0.000000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,-1.535000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,-1.535000,55.372000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.070000,-1.535000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.864000,-1.535000,39.116000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.070000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.975000,-1.535000,28.829000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.118000,-1.535000,29.972000>}
box{<0,0,-0.304800><1.616446,0.035000,0.304800> rotate<0,-44.997030,0> translate<53.975000,-1.535000,28.829000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.102000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.118000,0.000000,29.972000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.102000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.118000,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.118000,-1.535000,29.972000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,-90.000000,0> translate<55.118000,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.118000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.118000,0.000000,30.988000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,90.000000,0> translate<55.118000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.118000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.118000,0.000000,40.894000>}
box{<0,0,-0.304800><9.906000,0.035000,0.304800> rotate<0,90.000000,0> translate<55.118000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.118000,0.000000,43.688000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<53.594000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.118000,0.000000,45.212000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<54.610000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.118000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.118000,0.000000,45.212000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,90.000000,0> translate<55.118000,0.000000,45.212000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.418000,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.626000,-1.535000,33.274000>}
box{<0,0,-0.203200><13.208000,0.035000,0.203200> rotate<0,0.000000,0> translate<42.418000,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.626000,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.626000,-1.535000,36.068000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,-90.000000,0> translate<55.626000,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.864000,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.626000,-1.535000,38.354000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<54.864000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.134000,0.000000,10.414000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<54.610000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,0.000000,3.556000>}
box{<0,0,-0.203200><18.034000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.354000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.102000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,0.000000,4.826000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,0.000000,0> translate<54.102000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.958000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,-1.535000,16.510000>}
box{<0,0,-0.203200><11.430000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.958000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,-1.535000,29.464000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.610000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,-1.535000,30.734000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<56.388000,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.626000,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,-1.535000,32.512000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<55.626000,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,-1.535000,40.132000>}
box{<0,0,-0.203200><5.747364,0.035000,0.203200> rotate<0,44.997030,0> translate<52.324000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.642000,-1.535000,16.764000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.388000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.626000,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.642000,-1.535000,35.052000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<55.626000,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.642000,0.000000,53.086000>}
box{<0,0,-0.203200><7.874000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.768000,0.000000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.896000,-1.535000,31.242000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.388000,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.118000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.896000,0.000000,42.672000>}
box{<0,0,-0.304800><2.514472,0.035000,0.304800> rotate<0,-44.997030,0> translate<55.118000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,5.588000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.388000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.134000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,9.398000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<56.134000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,9.398000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,90.000000,0> translate<57.150000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,23.114000>}
box{<0,0,-0.203200><5.028943,0.035000,0.203200> rotate<0,44.997030,0> translate<53.594000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,49.276000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,90.000000,0> translate<57.150000,-1.535000,49.276000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.642000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,53.594000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.642000,0.000000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,53.594000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,55.372000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,90.000000,0> translate<57.150000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.816000,-1.535000,45.212000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.404000,-1.535000,45.212000>}
box{<0,0,-0.203200><5.588000,0.035000,0.203200> rotate<0,0.000000,0> translate<51.816000,-1.535000,45.212000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.166000,0.000000,5.334000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.388000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.102000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.166000,0.000000,11.430000>}
box{<0,0,-0.203200><5.747364,0.035000,0.203200> rotate<0,44.997030,0> translate<54.102000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.166000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.166000,0.000000,11.430000>}
box{<0,0,-0.203200><6.096000,0.035000,0.203200> rotate<0,90.000000,0> translate<58.166000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,49.276000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.166000,-1.535000,50.292000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<57.150000,-1.535000,49.276000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.642000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,16.764000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<56.642000,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,32.512000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<56.388000,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.642000,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,35.052000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<56.642000,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,40.132000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<56.388000,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.896000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.420000,0.000000,42.672000>}
box{<0,0,-0.304800><1.524000,0.035000,0.304800> rotate<0,0.000000,0> translate<56.896000,0.000000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.404000,-1.535000,45.212000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,44.196000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<57.404000,-1.535000,45.212000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,44.196000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,90.000000,0> translate<58.420000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,0.000000,51.816000>}
box{<0,0,-0.203200><18.542000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.878000,0.000000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.054000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.182000,0.000000,49.784000>}
box{<0,0,-0.203200><8.128000,0.035000,0.203200> rotate<0,0.000000,0> translate<51.054000,0.000000,49.784000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,24.384000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<58.420000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.436000,0.000000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,47.752000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<59.436000,0.000000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.436000,0.000000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,48.006000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.436000,0.000000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,49.276000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,48.006000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,-90.000000,0> translate<59.690000,0.000000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.182000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,49.276000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<59.182000,0.000000,49.784000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,0.000000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,53.086000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<58.420000,0.000000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,55.372000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,90.000000,0> translate<59.690000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.944000,-1.535000,23.114000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,0.000000,0> translate<57.150000,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,-1.535000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.071000,-1.535000,47.371000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,44.997030,0> translate<59.690000,-1.535000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.308000,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,-1.535000,18.034000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<51.308000,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,0.000000,26.924000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<58.420000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.896000,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,-1.535000,31.242000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<56.896000,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,-1.535000,37.592000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<58.420000,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,-1.535000,40.132000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<58.420000,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.944000,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.325000,-1.535000,23.495000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.944000,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.706000,-1.535000,8.636000>}
box{<0,0,-0.203200><21.336000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.370000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,13.970000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,-90.000000,0> translate<60.960000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,17.272000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<60.198000,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.325000,-1.535000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,23.495000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.325000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,32.004000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.198000,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.706000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,33.020000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.706000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.706000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,33.274000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.706000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,33.274000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,-90.000000,0> translate<60.960000,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,36.830000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<60.198000,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,36.830000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,90.000000,0> translate<60.960000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,40.894000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.198000,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,-1.535000,42.545000>}
box{<0,0,-0.203200><1.651000,0.035000,0.203200> rotate<0,90.000000,0> translate<60.960000,-1.535000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.166000,-1.535000,50.292000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.103000,-1.535000,50.292000>}
box{<0,0,-0.203200><3.937000,0.035000,0.203200> rotate<0,0.000000,0> translate<58.166000,-1.535000,50.292000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,0.000000,28.956000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.198000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,0.000000,41.275000>}
box{<0,0,-0.203200><12.319000,0.035000,0.203200> rotate<0,90.000000,0> translate<62.230000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.071000,-1.535000,47.371000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.484000,-1.535000,47.371000>}
box{<0,0,-0.203200><2.413000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.071000,-1.535000,47.371000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.103000,-1.535000,50.292000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.484000,-1.535000,49.911000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,44.997030,0> translate<62.103000,-1.535000,50.292000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.738000,-1.535000,19.304000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,0.000000,0> translate<58.420000,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.992000,-1.535000,21.844000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,0.000000,0> translate<58.420000,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,-1.535000,13.970000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,-90.000000,0> translate<63.500000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.738000,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,-1.535000,18.542000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<62.738000,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.992000,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,-1.535000,22.352000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<62.992000,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,-1.535000,23.495000>}
box{<0,0,-0.203200><1.143000,0.035000,0.203200> rotate<0,90.000000,0> translate<63.500000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,0.000000,28.194000>}
box{<0,0,-0.203200><5.388154,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.690000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,0.000000,33.020000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,90.000000,0> translate<63.500000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,0.000000,42.545000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<62.230000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.754000,-1.535000,29.972000>}
box{<0,0,-0.203200><5.334000,0.035000,0.203200> rotate<0,0.000000,0> translate<58.420000,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.706000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.024000,-1.535000,12.954000>}
box{<0,0,-0.203200><6.106574,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.706000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.754000,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.024000,-1.535000,28.702000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<63.754000,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.024000,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.024000,-1.535000,28.702000>}
box{<0,0,-0.203200><15.748000,0.035000,0.203200> rotate<0,90.000000,0> translate<65.024000,-1.535000,28.702000> }
//Text
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<2.417600,0.000000,1.409700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<2.417600,0.000000,2.909500>}
box{<0,0,-0.139700><1.499800,0.035000,0.139700> rotate<0,90.000000,0> translate<2.417600,0.000000,2.909500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<1.917700,0.000000,2.909500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<2.917600,0.000000,2.909500>}
box{<0,0,-0.139700><0.999900,0.035000,0.139700> rotate<0,0.000000,0> translate<1.917700,0.000000,2.909500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.304700,0.000000,2.909500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.804700,0.000000,2.909500>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<3.804700,0.000000,2.909500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.804700,0.000000,2.909500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.554800,0.000000,2.659600>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,-44.997030,0> translate<3.554800,0.000000,2.659600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.554800,0.000000,2.659600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.554800,0.000000,1.659600>}
box{<0,0,-0.139700><1.000000,0.035000,0.139700> rotate<0,-90.000000,0> translate<3.554800,0.000000,1.659600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.554800,0.000000,1.659600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.804700,0.000000,1.409700>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,44.997030,0> translate<3.554800,0.000000,1.659600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.804700,0.000000,1.409700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.304700,0.000000,1.409700>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<3.804700,0.000000,1.409700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.304700,0.000000,1.409700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.554700,0.000000,1.659600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,-44.985569,0> translate<4.304700,0.000000,1.409700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.554700,0.000000,1.659600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.554700,0.000000,2.659600>}
box{<0,0,-0.139700><1.000000,0.035000,0.139700> rotate<0,90.000000,0> translate<4.554700,0.000000,2.659600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.554700,0.000000,2.659600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.304700,0.000000,2.909500>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,44.985569,0> translate<4.304700,0.000000,2.909500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.191900,0.000000,1.409700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.191900,0.000000,2.909500>}
box{<0,0,-0.139700><1.499800,0.035000,0.139700> rotate<0,90.000000,0> translate<5.191900,0.000000,2.909500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.191900,0.000000,2.909500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.941800,0.000000,2.909500>}
box{<0,0,-0.139700><0.749900,0.035000,0.139700> rotate<0,0.000000,0> translate<5.191900,0.000000,2.909500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.941800,0.000000,2.909500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<6.191800,0.000000,2.659600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,44.985569,0> translate<5.941800,0.000000,2.909500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<6.191800,0.000000,2.659600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<6.191800,0.000000,2.159600>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,-90.000000,0> translate<6.191800,0.000000,2.159600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<6.191800,0.000000,2.159600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.941800,0.000000,1.909600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,-44.997030,0> translate<5.941800,0.000000,1.909600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.941800,0.000000,1.909600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.191900,0.000000,1.909600>}
box{<0,0,-0.139700><0.749900,0.035000,0.139700> rotate<0,0.000000,0> translate<5.191900,0.000000,1.909600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<6.184900,-1.535000,1.409700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<6.184900,-1.535000,2.909500>}
box{<0,0,-0.139700><1.499800,0.035000,0.139700> rotate<0,90.000000,0> translate<6.184900,-1.535000,2.909500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<6.184900,-1.535000,2.909500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.435000,-1.535000,2.909500>}
box{<0,0,-0.139700><0.749900,0.035000,0.139700> rotate<0,0.000000,0> translate<5.435000,-1.535000,2.909500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.435000,-1.535000,2.909500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.185000,-1.535000,2.659600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,-44.985569,0> translate<5.185000,-1.535000,2.659600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.185000,-1.535000,2.659600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.185000,-1.535000,2.409600>}
box{<0,0,-0.139700><0.250000,0.035000,0.139700> rotate<0,-90.000000,0> translate<5.185000,-1.535000,2.409600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.185000,-1.535000,2.409600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.435000,-1.535000,2.159600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,44.997030,0> translate<5.185000,-1.535000,2.409600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.435000,-1.535000,2.159600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.185000,-1.535000,1.909600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,-44.997030,0> translate<5.185000,-1.535000,1.909600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.185000,-1.535000,1.909600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.185000,-1.535000,1.659600>}
box{<0,0,-0.139700><0.250000,0.035000,0.139700> rotate<0,-90.000000,0> translate<5.185000,-1.535000,1.659600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.185000,-1.535000,1.659600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.435000,-1.535000,1.409700>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,44.985569,0> translate<5.185000,-1.535000,1.659600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.435000,-1.535000,1.409700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<6.184900,-1.535000,1.409700>}
box{<0,0,-0.139700><0.749900,0.035000,0.139700> rotate<0,0.000000,0> translate<5.435000,-1.535000,1.409700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<6.184900,-1.535000,2.159600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<5.435000,-1.535000,2.159600>}
box{<0,0,-0.139700><0.749900,0.035000,0.139700> rotate<0,0.000000,0> translate<5.435000,-1.535000,2.159600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.797900,-1.535000,2.909500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.297900,-1.535000,2.909500>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<3.797900,-1.535000,2.909500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.297900,-1.535000,2.909500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.547800,-1.535000,2.659600>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,44.997030,0> translate<4.297900,-1.535000,2.909500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.547800,-1.535000,2.659600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.547800,-1.535000,1.659600>}
box{<0,0,-0.139700><1.000000,0.035000,0.139700> rotate<0,-90.000000,0> translate<4.547800,-1.535000,1.659600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.547800,-1.535000,1.659600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.297900,-1.535000,1.409700>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,-44.997030,0> translate<4.297900,-1.535000,1.409700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<4.297900,-1.535000,1.409700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.797900,-1.535000,1.409700>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<3.797900,-1.535000,1.409700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.797900,-1.535000,1.409700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.547900,-1.535000,1.659600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,44.985569,0> translate<3.547900,-1.535000,1.659600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.547900,-1.535000,1.659600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.547900,-1.535000,2.659600>}
box{<0,0,-0.139700><1.000000,0.035000,0.139700> rotate<0,90.000000,0> translate<3.547900,-1.535000,2.659600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.547900,-1.535000,2.659600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<3.797900,-1.535000,2.909500>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,-44.985569,0> translate<3.547900,-1.535000,2.659600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<2.410800,-1.535000,1.409700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<2.410800,-1.535000,2.909500>}
box{<0,0,-0.139700><1.499800,0.035000,0.139700> rotate<0,90.000000,0> translate<2.410800,-1.535000,2.909500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<2.910700,-1.535000,2.909500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<1.910800,-1.535000,2.909500>}
box{<0,0,-0.139700><0.999900,0.035000,0.139700> rotate<0,0.000000,0> translate<1.910800,-1.535000,2.909500> }
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygone
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.508000,0.000000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.744400,0.000000,0.223500>}
box{<0,0,-0.203200><57.236408,0.035000,0.203200> rotate<0,0.030530,0> translate<0.508000,0.000000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.508000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.508000,0.000000,0.254000>}
box{<0,0,-0.203200><58.166000,0.035000,0.203200> rotate<0,-90.000000,0> translate<0.508000,0.000000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.508000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.564000,0.000000,58.420000>}
box{<0,0,-0.203200><67.056000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.508000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.558800,-1.535000,0.301600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.558800,-1.535000,58.421600>}
box{<0,0,-0.203200><58.120000,0.035000,0.203200> rotate<0,90.000000,0> translate<0.558800,-1.535000,58.421600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.558800,-1.535000,0.301600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.064800,-1.535000,0.301600>}
box{<0,0,-0.203200><9.506000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.558800,-1.535000,0.301600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.558800,-1.535000,58.421600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.460800,-1.535000,58.421600>}
box{<0,0,-0.203200><66.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.558800,-1.535000,58.421600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.064800,-1.535000,0.301600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.202100,-1.535000,0.355700>}
box{<0,0,-0.203200><7.137505,0.035000,0.203200> rotate<0,-0.434259,0> translate<10.064800,-1.535000,0.301600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.202100,-1.535000,0.355700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.460800,-1.535000,0.555600>}
box{<0,0,-0.203200><50.259098,0.035000,0.203200> rotate<0,-0.227873,0> translate<17.202100,-1.535000,0.355700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.673300,0.000000,0.259100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.744400,0.000000,0.223500>}
box{<0,0,-0.203200><0.079515,0.035000,0.203200> rotate<0,26.595521,0> translate<57.673300,0.000000,0.259100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.673300,0.000000,0.259100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.437000,0.000000,0.190500>}
box{<0,0,-0.203200><9.763941,0.035000,0.203200> rotate<0,0.402528,0> translate<57.673300,0.000000,0.259100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.437000,0.000000,0.190500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.564000,0.000000,24.511000>}
box{<0,0,-0.203200><24.320832,0.035000,0.203200> rotate<0,-89.694888,0> translate<67.437000,0.000000,0.190500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.460800,-1.535000,58.421600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.460800,-1.535000,0.555600>}
box{<0,0,-0.203200><57.866000,0.035000,0.203200> rotate<0,-90.000000,0> translate<67.460800,-1.535000,0.555600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.564000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.564000,0.000000,58.420000>}
box{<0,0,-0.203200><33.909000,0.035000,0.203200> rotate<0,90.000000,0> translate<67.564000,0.000000,58.420000> }
texture{col_pol}
}
#end
union{
cylinder{<34.798000,0.038000,49.022000><34.798000,-1.538000,49.022000>0.550000}
cylinder{<29.718000,0.038000,49.022000><29.718000,-1.538000,49.022000>0.550000}
cylinder{<22.606000,0.038000,10.160000><22.606000,-1.538000,10.160000>0.500000}
cylinder{<22.606000,0.038000,5.080000><22.606000,-1.538000,5.080000>0.500000}
cylinder{<62.484000,0.038000,49.911000><62.484000,-1.538000,49.911000>0.450000}
cylinder{<62.484000,0.038000,47.371000><62.484000,-1.538000,47.371000>0.450000}
cylinder{<25.400000,0.038000,5.080000><25.400000,-1.538000,5.080000>0.500000}
cylinder{<25.400000,0.038000,10.160000><25.400000,-1.538000,10.160000>0.500000}
cylinder{<13.970000,0.038000,32.766000><13.970000,-1.538000,32.766000>0.500000}
cylinder{<13.970000,0.038000,27.686000><13.970000,-1.538000,27.686000>0.500000}
cylinder{<46.355000,0.038000,29.210000><46.355000,-1.538000,29.210000>0.450000}
cylinder{<46.355000,0.038000,31.750000><46.355000,-1.538000,31.750000>0.450000}
cylinder{<13.970000,0.038000,40.386000><13.970000,-1.538000,40.386000>0.500000}
cylinder{<13.970000,0.038000,35.306000><13.970000,-1.538000,35.306000>0.500000}
cylinder{<35.382200,0.038000,31.648400><35.382200,-1.538000,31.648400>0.450000}
cylinder{<35.382200,0.038000,34.188400><35.382200,-1.538000,34.188400>0.450000}
cylinder{<28.397200,0.038000,31.648400><28.397200,-1.538000,31.648400>0.450000}
cylinder{<28.397200,0.038000,34.188400><28.397200,-1.538000,34.188400>0.450000}
cylinder{<46.736000,0.038000,9.906000><46.736000,-1.538000,9.906000>0.500000}
cylinder{<41.656000,0.038000,9.906000><41.656000,-1.538000,9.906000>0.500000}
cylinder{<3.073400,0.038000,48.768000><3.073400,-1.538000,48.768000>0.500000}
cylinder{<13.233400,0.038000,48.768000><13.233400,-1.538000,48.768000>0.500000}
cylinder{<18.954800,0.038000,10.160000><18.954800,-1.538000,10.160000>0.700000}
cylinder{<3.714800,0.038000,10.160000><3.714800,-1.538000,10.160000>0.700000}
cylinder{<8.636000,0.038000,7.112000><8.636000,-1.538000,7.112000>0.500000}
cylinder{<18.796000,0.038000,7.112000><18.796000,-1.538000,7.112000>0.500000}
cylinder{<52.832000,0.038000,30.988000><52.832000,-1.538000,30.988000>0.500000}
cylinder{<52.832000,0.038000,41.148000><52.832000,-1.538000,41.148000>0.500000}
cylinder{<40.690800,0.038000,17.881600><40.690800,-1.538000,17.881600>0.500000}
cylinder{<48.310800,0.038000,17.881600><48.310800,-1.538000,17.881600>0.500000}
cylinder{<39.878000,0.038000,20.828000><39.878000,-1.538000,20.828000>0.500000}
cylinder{<50.038000,0.038000,20.828000><50.038000,-1.538000,20.828000>0.500000}
cylinder{<24.384000,0.038000,14.986000><24.384000,-1.538000,14.986000>0.450000}
cylinder{<24.384000,0.038000,17.526000><24.384000,-1.538000,17.526000>0.450000}
cylinder{<24.384000,0.038000,20.066000><24.384000,-1.538000,20.066000>0.450000}
cylinder{<24.384000,0.038000,22.606000><24.384000,-1.538000,22.606000>0.450000}
cylinder{<24.384000,0.038000,25.146000><24.384000,-1.538000,25.146000>0.450000}
cylinder{<24.384000,0.038000,27.686000><24.384000,-1.538000,27.686000>0.450000}
cylinder{<24.384000,0.038000,30.226000><24.384000,-1.538000,30.226000>0.450000}
cylinder{<24.384000,0.038000,32.766000><24.384000,-1.538000,32.766000>0.450000}
cylinder{<24.384000,0.038000,35.306000><24.384000,-1.538000,35.306000>0.450000}
cylinder{<24.384000,0.038000,37.846000><24.384000,-1.538000,37.846000>0.450000}
cylinder{<24.384000,0.038000,40.386000><24.384000,-1.538000,40.386000>0.450000}
cylinder{<24.384000,0.038000,42.926000><24.384000,-1.538000,42.926000>0.450000}
cylinder{<24.384000,0.038000,45.466000><24.384000,-1.538000,45.466000>0.450000}
cylinder{<24.384000,0.038000,48.006000><24.384000,-1.538000,48.006000>0.450000}
cylinder{<16.764000,0.038000,48.006000><16.764000,-1.538000,48.006000>0.450000}
cylinder{<16.764000,0.038000,45.466000><16.764000,-1.538000,45.466000>0.450000}
cylinder{<16.764000,0.038000,42.926000><16.764000,-1.538000,42.926000>0.450000}
cylinder{<16.764000,0.038000,40.386000><16.764000,-1.538000,40.386000>0.450000}
cylinder{<16.764000,0.038000,37.846000><16.764000,-1.538000,37.846000>0.450000}
cylinder{<16.764000,0.038000,35.306000><16.764000,-1.538000,35.306000>0.450000}
cylinder{<16.764000,0.038000,32.766000><16.764000,-1.538000,32.766000>0.450000}
cylinder{<16.764000,0.038000,30.226000><16.764000,-1.538000,30.226000>0.450000}
cylinder{<16.764000,0.038000,27.686000><16.764000,-1.538000,27.686000>0.450000}
cylinder{<16.764000,0.038000,25.146000><16.764000,-1.538000,25.146000>0.450000}
cylinder{<16.764000,0.038000,22.606000><16.764000,-1.538000,22.606000>0.450000}
cylinder{<16.764000,0.038000,20.066000><16.764000,-1.538000,20.066000>0.450000}
cylinder{<16.764000,0.038000,17.526000><16.764000,-1.538000,17.526000>0.450000}
cylinder{<16.764000,0.038000,14.986000><16.764000,-1.538000,14.986000>0.450000}
cylinder{<52.070000,0.038000,47.752000><52.070000,-1.538000,47.752000>0.450000}
cylinder{<54.610000,0.038000,47.752000><54.610000,-1.538000,47.752000>0.450000}
cylinder{<57.150000,0.038000,47.752000><57.150000,-1.538000,47.752000>0.450000}
cylinder{<59.690000,0.038000,47.752000><59.690000,-1.538000,47.752000>0.450000}
cylinder{<59.690000,0.038000,55.372000><59.690000,-1.538000,55.372000>0.450000}
cylinder{<57.150000,0.038000,55.372000><57.150000,-1.538000,55.372000>0.450000}
cylinder{<54.610000,0.038000,55.372000><54.610000,-1.538000,55.372000>0.450000}
cylinder{<52.070000,0.038000,55.372000><52.070000,-1.538000,55.372000>0.450000}
cylinder{<35.560000,0.038000,5.588000><35.560000,-1.538000,5.588000>0.500000}
cylinder{<35.560000,0.038000,3.048000><35.560000,-1.538000,3.048000>0.500000}
cylinder{<58.420000,0.038000,42.672000><58.420000,-1.538000,42.672000>0.500000}
cylinder{<58.420000,0.038000,40.132000><58.420000,-1.538000,40.132000>0.500000}
cylinder{<58.420000,0.038000,37.592000><58.420000,-1.538000,37.592000>0.500000}
cylinder{<58.420000,0.038000,35.052000><58.420000,-1.538000,35.052000>0.500000}
cylinder{<58.420000,0.038000,32.512000><58.420000,-1.538000,32.512000>0.500000}
cylinder{<58.420000,0.038000,29.972000><58.420000,-1.538000,29.972000>0.500000}
cylinder{<8.636000,0.038000,52.832000><8.636000,-1.538000,52.832000>0.500000}
cylinder{<8.636000,0.038000,55.372000><8.636000,-1.538000,55.372000>0.500000}
cylinder{<11.176000,0.038000,52.832000><11.176000,-1.538000,52.832000>0.500000}
cylinder{<11.176000,0.038000,55.372000><11.176000,-1.538000,55.372000>0.500000}
cylinder{<13.716000,0.038000,52.832000><13.716000,-1.538000,52.832000>0.500000}
cylinder{<13.716000,0.038000,55.372000><13.716000,-1.538000,55.372000>0.500000}
cylinder{<35.560000,0.038000,26.670000><35.560000,-1.538000,26.670000>0.500000}
cylinder{<35.560000,0.038000,24.130000><35.560000,-1.538000,24.130000>0.500000}
cylinder{<35.560000,0.038000,21.590000><35.560000,-1.538000,21.590000>0.500000}
cylinder{<35.560000,0.038000,19.050000><35.560000,-1.538000,19.050000>0.500000}
cylinder{<35.560000,0.038000,16.510000><35.560000,-1.538000,16.510000>0.500000}
cylinder{<35.560000,0.038000,13.970000><35.560000,-1.538000,13.970000>0.500000}
cylinder{<55.118000,0.038000,43.688000><55.118000,-1.538000,43.688000>0.500000}
cylinder{<55.118000,0.038000,30.988000><55.118000,-1.538000,30.988000>0.500000}
cylinder{<47.966000,0.038000,40.386000><47.966000,-1.538000,40.386000>0.550000}
cylinder{<42.966000,0.038000,40.386000><42.966000,-1.538000,40.386000>0.550000}
cylinder{<60.960000,0.038000,42.545000><60.960000,-1.538000,42.545000>0.450000}
cylinder{<63.500000,0.038000,42.545000><63.500000,-1.538000,42.545000>0.450000}
cylinder{<60.960000,0.038000,33.020000><60.960000,-1.538000,33.020000>0.450000}
cylinder{<63.500000,0.038000,33.020000><63.500000,-1.538000,33.020000>0.450000}
cylinder{<60.960000,0.038000,23.495000><60.960000,-1.538000,23.495000>0.450000}
cylinder{<63.500000,0.038000,23.495000><63.500000,-1.538000,23.495000>0.450000}
cylinder{<60.960000,0.038000,13.970000><60.960000,-1.538000,13.970000>0.450000}
cylinder{<63.500000,0.038000,13.970000><63.500000,-1.538000,13.970000>0.450000}
cylinder{<30.480000,0.038000,42.545000><30.480000,-1.538000,42.545000>0.450000}
cylinder{<33.020000,0.038000,42.545000><33.020000,-1.538000,42.545000>0.450000}
cylinder{<30.480000,0.038000,33.020000><30.480000,-1.538000,33.020000>0.450000}
cylinder{<33.020000,0.038000,33.020000><33.020000,-1.538000,33.020000>0.450000}
cylinder{<30.480000,0.038000,23.495000><30.480000,-1.538000,23.495000>0.450000}
cylinder{<33.020000,0.038000,23.495000><33.020000,-1.538000,23.495000>0.450000}
cylinder{<30.480000,0.038000,13.970000><30.480000,-1.538000,13.970000>0.450000}
cylinder{<33.020000,0.038000,13.970000><33.020000,-1.538000,13.970000>0.450000}
cylinder{<26.416000,0.038000,55.118000><26.416000,-1.538000,55.118000>0.450000}
cylinder{<26.416000,0.038000,52.578000><26.416000,-1.538000,52.578000>0.450000}
cylinder{<29.718000,0.038000,9.144000><29.718000,-1.538000,9.144000>0.450000}
cylinder{<27.813000,0.038000,7.874000><27.813000,-1.538000,7.874000>0.450000}
cylinder{<29.718000,0.038000,6.604000><29.718000,-1.538000,6.604000>0.450000}
cylinder{<54.102000,0.038000,7.366000><54.102000,-1.538000,7.366000>0.450000}
cylinder{<54.102000,0.038000,4.826000><54.102000,-1.538000,4.826000>0.450000}
cylinder{<54.102000,0.038000,2.286000><54.102000,-1.538000,2.286000>0.450000}
cylinder{<29.514800,0.038000,37.820600><29.514800,-1.538000,37.820600>0.500000}
cylinder{<34.594800,0.038000,37.820600><34.594800,-1.538000,37.820600>0.500000}
cylinder{<54.610000,0.038000,10.414000><54.610000,-1.538000,10.414000>0.450000}
cylinder{<52.705000,0.038000,11.684000><52.705000,-1.538000,11.684000>0.450000}
cylinder{<54.610000,0.038000,12.954000><54.610000,-1.538000,12.954000>0.450000}
cylinder{<48.768000,0.038000,53.086000><48.768000,-1.538000,53.086000>0.500000}
cylinder{<38.608000,0.038000,53.086000><38.608000,-1.538000,53.086000>0.500000}
cylinder{<38.608000,0.038000,48.006000><38.608000,-1.538000,48.006000>0.500000}
cylinder{<48.768000,0.038000,48.006000><48.768000,-1.538000,48.006000>0.500000}
cylinder{<18.796000,0.038000,4.826000><18.796000,-1.538000,4.826000>0.500000}
cylinder{<8.636000,0.038000,4.826000><8.636000,-1.538000,4.826000>0.500000}
cylinder{<39.116000,0.038000,2.286000><39.116000,-1.538000,2.286000>0.500000}
cylinder{<49.276000,0.038000,2.286000><49.276000,-1.538000,2.286000>0.500000}
cylinder{<38.608000,0.038000,55.626000><38.608000,-1.538000,55.626000>0.500000}
cylinder{<48.768000,0.038000,55.626000><48.768000,-1.538000,55.626000>0.500000}
cylinder{<49.276000,0.038000,7.366000><49.276000,-1.538000,7.366000>0.500000}
cylinder{<39.116000,0.038000,7.366000><39.116000,-1.538000,7.366000>0.500000}
cylinder{<32.766000,0.038000,2.286000><32.766000,-1.538000,2.286000>0.500000}
cylinder{<22.606000,0.038000,2.286000><22.606000,-1.538000,2.286000>0.500000}
cylinder{<8.636000,0.038000,2.286000><8.636000,-1.538000,2.286000>0.500000}
cylinder{<18.796000,0.038000,2.286000><18.796000,-1.538000,2.286000>0.500000}
cylinder{<27.686000,0.038000,25.171400><27.686000,-1.538000,25.171400>0.500000}
cylinder{<27.686000,0.038000,15.011400><27.686000,-1.538000,15.011400>0.500000}
cylinder{<38.608000,0.038000,50.546000><38.608000,-1.538000,50.546000>0.500000}
cylinder{<48.768000,0.038000,50.546000><48.768000,-1.538000,50.546000>0.500000}
cylinder{<49.276000,0.038000,4.826000><49.276000,-1.538000,4.826000>0.500000}
cylinder{<39.116000,0.038000,4.826000><39.116000,-1.538000,4.826000>0.500000}
cylinder{<49.276000,0.038000,12.700000><49.276000,-1.538000,12.700000>0.500000}
cylinder{<39.116000,0.038000,12.700000><39.116000,-1.538000,12.700000>0.500000}
cylinder{<39.116000,0.038000,15.240000><39.116000,-1.538000,15.240000>0.500000}
cylinder{<49.276000,0.038000,15.240000><49.276000,-1.538000,15.240000>0.500000}
cylinder{<58.420000,0.038000,16.764000><58.420000,-1.538000,16.764000>0.450000}
cylinder{<58.420000,0.038000,19.304000><58.420000,-1.538000,19.304000>0.450000}
cylinder{<58.420000,0.038000,21.844000><58.420000,-1.538000,21.844000>0.450000}
cylinder{<58.420000,0.038000,24.384000><58.420000,-1.538000,24.384000>0.450000}
cylinder{<58.420000,0.038000,26.924000><58.420000,-1.538000,26.924000>0.450000}
cylinder{<39.116000,0.038000,25.400000><39.116000,-1.538000,25.400000>0.450000}
cylinder{<39.116000,0.038000,27.940000><39.116000,-1.538000,27.940000>0.450000}
cylinder{<39.116000,0.038000,30.480000><39.116000,-1.538000,30.480000>0.450000}
cylinder{<39.116000,0.038000,33.020000><39.116000,-1.538000,33.020000>0.450000}
cylinder{<39.116000,0.038000,35.560000><39.116000,-1.538000,35.560000>0.450000}
cylinder{<17.068800,0.038000,51.587400><17.068800,-1.538000,51.587400>0.500000}
cylinder{<23.571200,0.038000,51.587400><23.571200,-1.538000,51.587400>0.500000}
cylinder{<17.068800,0.038000,56.108600><17.068800,-1.538000,56.108600>0.500000}
cylinder{<23.571200,0.038000,56.108600><23.571200,-1.538000,56.108600>0.500000}
cylinder{<6.350000,0.038000,40.640000><6.350000,-1.538000,40.640000>0.500000}
cylinder{<8.890000,0.038000,40.640000><8.890000,-1.538000,40.640000>0.500000}
cylinder{<6.350000,0.038000,38.100000><6.350000,-1.538000,38.100000>0.500000}
cylinder{<8.890000,0.038000,38.100000><8.890000,-1.538000,38.100000>0.500000}
cylinder{<6.350000,0.038000,35.560000><6.350000,-1.538000,35.560000>0.500000}
cylinder{<8.890000,0.038000,35.560000><8.890000,-1.538000,35.560000>0.500000}
cylinder{<6.350000,0.038000,33.020000><6.350000,-1.538000,33.020000>0.500000}
cylinder{<8.890000,0.038000,33.020000><8.890000,-1.538000,33.020000>0.500000}
cylinder{<6.350000,0.038000,30.480000><6.350000,-1.538000,30.480000>0.500000}
cylinder{<8.890000,0.038000,30.480000><8.890000,-1.538000,30.480000>0.500000}
cylinder{<6.350000,0.038000,27.940000><6.350000,-1.538000,27.940000>0.500000}
cylinder{<8.890000,0.038000,27.940000><8.890000,-1.538000,27.940000>0.500000}
cylinder{<6.350000,0.038000,25.400000><6.350000,-1.538000,25.400000>0.500000}
cylinder{<8.890000,0.038000,25.400000><8.890000,-1.538000,25.400000>0.500000}
cylinder{<6.350000,0.038000,22.860000><6.350000,-1.538000,22.860000>0.500000}
cylinder{<8.890000,0.038000,22.860000><8.890000,-1.538000,22.860000>0.500000}
cylinder{<6.350000,0.038000,20.320000><6.350000,-1.538000,20.320000>0.500000}
cylinder{<8.890000,0.038000,20.320000><8.890000,-1.538000,20.320000>0.500000}
cylinder{<6.350000,0.038000,17.780000><6.350000,-1.538000,17.780000>0.500000}
cylinder{<8.890000,0.038000,17.780000><8.890000,-1.538000,17.780000>0.500000}
//Bohrungen(schnell)/Durchkontaktierungen
cylinder{<30.226000,0.038000,11.938000><30.226000,-1.538000,11.938000>0.450000 }
cylinder{<27.940000,0.038000,45.466000><27.940000,-1.538000,45.466000>0.400000 }
cylinder{<11.557000,0.038000,21.463000><11.557000,-1.538000,21.463000>0.400000 }
cylinder{<60.071000,0.038000,11.430000><60.071000,-1.538000,11.430000>0.400000 }
cylinder{<45.720000,0.038000,15.240000><45.720000,-1.538000,15.240000>0.400000 }
cylinder{<30.734000,0.038000,20.447000><30.734000,-1.538000,20.447000>0.400000 }
cylinder{<50.038000,0.038000,24.130000><50.038000,-1.538000,24.130000>0.400000 }
cylinder{<50.038000,0.038000,34.925000><50.038000,-1.538000,34.925000>0.400000 }
cylinder{<12.700000,0.038000,46.736000><12.700000,-1.538000,46.736000>0.400000 }
cylinder{<20.066000,0.038000,14.986000><20.066000,-1.538000,14.986000>0.400000 }
cylinder{<19.939000,0.038000,25.146000><19.939000,-1.538000,25.146000>0.400000 }
cylinder{<19.939000,0.038000,27.590700><19.939000,-1.538000,27.590700>0.400000 }
cylinder{<31.750000,0.038000,27.940000><31.750000,-1.538000,27.940000>0.400000 }
cylinder{<41.783000,0.038000,27.940000><41.783000,-1.538000,27.940000>0.400000 }
cylinder{<43.180000,0.038000,34.417000><43.180000,-1.538000,34.417000>0.400000 }
cylinder{<43.180000,0.038000,24.130000><43.180000,-1.538000,24.130000>0.450000 }
cylinder{<21.240800,0.038000,29.083000><21.240800,-1.538000,29.083000>0.400000 }
cylinder{<21.240700,0.038000,23.558500><21.240700,-1.538000,23.558500>0.400000 }
cylinder{<26.416000,0.038000,13.208000><26.416000,-1.538000,13.208000>0.450000 }
cylinder{<30.353000,0.038000,25.527000><30.353000,-1.538000,25.527000>0.400000 }
cylinder{<39.116000,0.038000,22.860000><39.116000,-1.538000,22.860000>0.450000 }
cylinder{<3.556000,0.038000,38.608000><3.556000,-1.538000,38.608000>0.400000 }
cylinder{<3.556000,0.038000,43.688000><3.556000,-1.538000,43.688000>0.400000 }
cylinder{<5.842000,0.038000,51.054000><5.842000,-1.538000,51.054000>0.400000 }
cylinder{<28.194000,0.038000,29.083000><28.194000,-1.538000,29.083000>0.400000 }
cylinder{<21.082000,0.038000,46.736000><21.082000,-1.538000,46.736000>0.450000 }
cylinder{<18.891300,0.038000,36.576000><18.891300,-1.538000,36.576000>0.400000 }
//Bohrungen(schnell)/Platine
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Bestückungsdruck
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.651300,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.651300,0.000000,55.990100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.651300,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.651300,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.774100,0.000000,55.867300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<27.651300,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.774100,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.897000,0.000000,55.990100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<27.774100,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.897000,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.019900,0.000000,55.867300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<27.897000,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.019900,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.142700,0.000000,55.990100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.019900,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.142700,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.142700,0.000000,56.358700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<28.142700,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.399700,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.399700,0.000000,55.990100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.399700,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.399700,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.522500,0.000000,55.867300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<28.399700,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.522500,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.645400,0.000000,55.990100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<28.522500,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.645400,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.768300,0.000000,55.867300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<28.645400,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.768300,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.891100,0.000000,55.990100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.768300,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.891100,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.891100,0.000000,56.358700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<28.891100,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.148100,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.148100,0.000000,55.990100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.148100,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.148100,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.270900,0.000000,55.867300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<29.148100,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.270900,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.393800,0.000000,55.990100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<29.270900,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.393800,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516700,0.000000,55.867300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<29.393800,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516700,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.639500,0.000000,55.990100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.516700,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.639500,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.639500,0.000000,56.358700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<29.639500,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.896500,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.896500,0.000000,55.990100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<29.896500,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.896500,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.019300,0.000000,55.990100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.896500,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.019300,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.019300,0.000000,55.867300>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.019300,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.019300,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.896500,0.000000,55.867300>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.896500,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.393500,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.393500,0.000000,56.481600>}
box{<0,0,-0.038100><0.614300,0.036000,0.038100> rotate<0,90.000000,0> translate<30.393500,0.000000,56.481600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.393500,0.000000,56.481600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.516400,0.000000,56.604500>}
box{<0,0,-0.038100><0.173807,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.393500,0.000000,56.481600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.270700,0.000000,56.235900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.516400,0.000000,56.235900>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<30.270700,0.000000,56.235900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.769600,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.769600,0.000000,56.358700>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<30.769600,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.769600,0.000000,56.113000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.015300,0.000000,56.358700>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.769600,0.000000,56.113000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.015300,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.138200,0.000000,56.358700>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<31.015300,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.761800,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.516000,0.000000,55.867300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<31.516000,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.516000,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.393200,0.000000,55.990100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<31.393200,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.393200,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.393200,0.000000,56.235900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<31.393200,0.000000,56.235900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.393200,0.000000,56.235900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.516000,0.000000,56.358700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.393200,0.000000,56.235900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.516000,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.761800,0.000000,56.358700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<31.516000,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.761800,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884600,0.000000,56.235900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<31.761800,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884600,0.000000,56.235900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884600,0.000000,56.113000>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.884600,0.000000,56.113000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884600,0.000000,56.113000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.393200,0.000000,56.113000>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<31.393200,0.000000,56.113000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.510200,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.264400,0.000000,55.867300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<32.264400,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.264400,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.141600,0.000000,55.990100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<32.141600,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.141600,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.141600,0.000000,56.235900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<32.141600,0.000000,56.235900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.141600,0.000000,56.235900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.264400,0.000000,56.358700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.141600,0.000000,56.235900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.264400,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.510200,0.000000,56.358700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<32.264400,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.510200,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.633000,0.000000,56.235900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<32.510200,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.633000,0.000000,56.235900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.633000,0.000000,56.113000>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.633000,0.000000,56.113000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.633000,0.000000,56.113000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.141600,0.000000,56.113000>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<32.141600,0.000000,56.113000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.890000,0.000000,56.604500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.890000,0.000000,55.867300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.890000,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.890000,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.258600,0.000000,55.867300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<32.890000,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.258600,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.381400,0.000000,55.990100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.258600,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.381400,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.381400,0.000000,56.235900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<33.381400,0.000000,56.235900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.381400,0.000000,56.235900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.258600,0.000000,56.358700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<33.258600,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.258600,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.890000,0.000000,56.358700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<32.890000,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.638400,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.638400,0.000000,55.990100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.638400,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.638400,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.761200,0.000000,55.867300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<33.638400,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.761200,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.129800,0.000000,55.867300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.761200,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.129800,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.129800,0.000000,56.358700>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<34.129800,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.386800,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.755400,0.000000,55.867300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.386800,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.755400,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.878200,0.000000,55.990100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.755400,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.878200,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.755400,0.000000,56.113000>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<34.755400,0.000000,56.113000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.755400,0.000000,56.113000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.509600,0.000000,56.113000>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<34.509600,0.000000,56.113000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.509600,0.000000,56.113000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.386800,0.000000,56.235900>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<34.386800,0.000000,56.235900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.386800,0.000000,56.235900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.509600,0.000000,56.358700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.386800,0.000000,56.235900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.509600,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.878200,0.000000,56.358700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.509600,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.135200,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.135200,0.000000,55.990100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<35.135200,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.135200,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.258000,0.000000,55.990100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<35.135200,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.258000,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.258000,0.000000,55.867300>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.258000,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.258000,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.135200,0.000000,55.867300>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<35.135200,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.632200,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.878000,0.000000,55.867300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<35.632200,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.878000,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.000800,0.000000,55.990100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.878000,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.000800,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.000800,0.000000,56.235900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<36.000800,0.000000,56.235900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.000800,0.000000,56.235900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.878000,0.000000,56.358700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<35.878000,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.878000,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.632200,0.000000,56.358700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<35.632200,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.632200,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.509400,0.000000,56.235900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.509400,0.000000,56.235900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.509400,0.000000,56.235900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.509400,0.000000,55.990100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.509400,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.509400,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.632200,0.000000,55.867300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<35.509400,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.257800,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.257800,0.000000,56.358700>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<36.257800,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.257800,0.000000,56.113000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.503500,0.000000,56.358700>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.257800,0.000000,56.113000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.503500,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.626400,0.000000,56.358700>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<36.503500,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.127100,0.000000,55.621600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.250000,0.000000,55.621600>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<37.127100,0.000000,55.621600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.250000,0.000000,55.621600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.372800,0.000000,55.744500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<37.250000,0.000000,55.621600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.372800,0.000000,55.744500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.372800,0.000000,56.358700>}
box{<0,0,-0.038100><0.614200,0.036000,0.038100> rotate<0,90.000000,0> translate<37.372800,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.372800,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.004200,0.000000,56.358700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<37.004200,0.000000,56.358700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.004200,0.000000,56.358700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.881400,0.000000,56.235900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.881400,0.000000,56.235900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.881400,0.000000,56.235900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.881400,0.000000,55.990100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.881400,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.881400,0.000000,55.990100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.004200,0.000000,55.867300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<36.881400,0.000000,55.990100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.004200,0.000000,55.867300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.372800,0.000000,55.867300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<37.004200,0.000000,55.867300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,8.666100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,8.509400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<64.807300,0.000000,8.509400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,8.509400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,8.195800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<64.807300,0.000000,8.195800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,8.195800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,8.039100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<64.807300,0.000000,8.195800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,8.039100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,8.039100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<64.964100,0.000000,8.039100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,8.039100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,8.195800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<65.591200,0.000000,8.039100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,8.195800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,8.509400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<65.747900,0.000000,8.509400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,8.509400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,8.666100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<65.591200,0.000000,8.666100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,9.131300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,9.131300>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<64.964100,0.000000,9.131300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,9.131300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,9.288100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<65.591200,0.000000,9.131300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,8.974600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,9.288100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<65.120900,0.000000,9.288100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,9.598200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,9.598200>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<65.120900,0.000000,9.598200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,9.598200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,9.911700>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<65.120900,0.000000,9.911700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,9.911700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,10.068500>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<65.120900,0.000000,10.068500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,10.377700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,10.534400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<64.807300,0.000000,10.534400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,10.534400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,10.534400>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<64.807300,0.000000,10.534400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,10.377700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,10.691200>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<65.747900,0.000000,10.691200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,11.936800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,11.936800>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<65.120900,0.000000,11.936800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,11.936800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,12.250300>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<64.807300,0.000000,12.250300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,12.250300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,12.563800>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<64.807300,0.000000,12.250300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,12.563800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,12.563800>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<65.120900,0.000000,12.563800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.277600,0.000000,11.936800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.277600,0.000000,12.563800>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<65.277600,0.000000,12.563800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,12.872300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,12.872300>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<64.807300,0.000000,12.872300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,12.872300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,13.185800>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<65.434400,0.000000,12.872300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,13.185800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,13.499300>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<65.434400,0.000000,13.499300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,13.499300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,13.499300>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<64.807300,0.000000,13.499300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,13.807800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,13.807800>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<64.807300,0.000000,13.807800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,13.807800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,14.278100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<64.807300,0.000000,14.278100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,14.278100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,14.434800>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<64.807300,0.000000,14.278100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,14.434800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.277600,0.000000,14.434800>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<64.964100,0.000000,14.434800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.277600,0.000000,14.434800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,14.278100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<65.277600,0.000000,14.434800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,14.278100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,13.807800>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.434400,0.000000,13.807800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,14.121300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,14.434800>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<65.434400,0.000000,14.121300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.061400,0.000000,14.743300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,15.056800>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<65.747900,0.000000,15.056800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,15.056800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,15.056800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<65.591200,0.000000,15.056800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,15.056800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,14.900000>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.591200,0.000000,14.900000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,14.900000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,14.900000>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<65.591200,0.000000,14.900000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,14.900000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,15.056800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<65.747900,0.000000,15.056800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,16.302400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,16.302400>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<64.807300,0.000000,16.302400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,16.302400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,16.772700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<64.807300,0.000000,16.772700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,16.772700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,16.929400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<64.807300,0.000000,16.772700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,16.929400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.277600,0.000000,16.929400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<64.964100,0.000000,16.929400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.277600,0.000000,16.929400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,16.772700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<65.277600,0.000000,16.929400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,16.772700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,16.302400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.434400,0.000000,16.302400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,16.615900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,16.929400>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<65.434400,0.000000,16.615900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,17.708200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,17.394600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.747900,0.000000,17.394600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,17.394600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,17.237900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<65.591200,0.000000,17.237900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,17.237900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.277600,0.000000,17.237900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<65.277600,0.000000,17.237900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.277600,0.000000,17.237900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,17.394600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<65.120900,0.000000,17.394600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,17.394600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,17.708200>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<65.120900,0.000000,17.708200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,17.708200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.277600,0.000000,17.864900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<65.120900,0.000000,17.708200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.277600,0.000000,17.864900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,17.864900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<65.277600,0.000000,17.864900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,17.864900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,17.237900>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.434400,0.000000,17.237900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,18.173400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,18.486900>}
box{<0,0,-0.038100><0.701007,0.036000,0.038100> rotate<0,-26.563298,0> translate<65.120900,0.000000,18.173400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,18.486900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,18.800400>}
box{<0,0,-0.038100><0.701007,0.036000,0.038100> rotate<0,26.563298,0> translate<65.120900,0.000000,18.800400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,19.108900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,19.108900>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<65.591200,0.000000,19.108900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,19.108900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,19.265600>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<65.591200,0.000000,19.265600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,19.265600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,19.265600>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<65.591200,0.000000,19.265600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,19.265600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,19.108900>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.747900,0.000000,19.108900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,20.512100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,20.668800>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<64.807300,0.000000,20.668800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,20.668800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,20.982400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<64.807300,0.000000,20.982400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,20.982400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,21.139100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<64.807300,0.000000,20.982400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,21.139100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,21.139100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<64.964100,0.000000,21.139100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.120900,0.000000,21.139100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.277600,0.000000,20.982400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<65.120900,0.000000,21.139100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.277600,0.000000,20.982400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.277600,0.000000,20.825600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.277600,0.000000,20.825600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.277600,0.000000,20.982400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,21.139100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<65.277600,0.000000,20.982400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.434400,0.000000,21.139100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,21.139100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<65.434400,0.000000,21.139100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,21.139100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,20.982400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<65.591200,0.000000,21.139100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,20.982400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,20.668800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.747900,0.000000,20.668800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,20.668800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,20.512100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<65.591200,0.000000,20.512100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,21.447600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,21.447600>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<65.591200,0.000000,21.447600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,21.447600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,21.604300>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<65.591200,0.000000,21.604300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,21.604300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,21.604300>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<65.591200,0.000000,21.604300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,21.604300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,21.447600>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.747900,0.000000,21.447600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,21.915300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,21.915300>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<64.964100,0.000000,21.915300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,21.915300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,22.072000>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<64.807300,0.000000,22.072000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,22.072000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,22.385600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<64.807300,0.000000,22.385600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,22.385600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,22.542300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<64.807300,0.000000,22.385600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,22.542300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,22.542300>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<64.964100,0.000000,22.542300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,22.542300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,22.385600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<65.591200,0.000000,22.542300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,22.385600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,22.072000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.747900,0.000000,22.072000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,22.072000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,21.915300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<65.591200,0.000000,21.915300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,21.915300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,22.542300>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<64.964100,0.000000,22.542300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,22.850800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,22.850800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<64.964100,0.000000,22.850800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,22.850800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,23.007500>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<64.807300,0.000000,23.007500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,23.007500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,23.321100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<64.807300,0.000000,23.321100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.807300,0.000000,23.321100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,23.477800>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<64.807300,0.000000,23.321100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,23.477800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,23.477800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<64.964100,0.000000,23.477800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,23.477800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,23.321100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<65.591200,0.000000,23.477800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,23.321100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,23.007500>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.747900,0.000000,23.007500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.747900,0.000000,23.007500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,22.850800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<65.591200,0.000000,22.850800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.591200,0.000000,22.850800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.964100,0.000000,23.477800>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<64.964100,0.000000,23.477800> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,0.000000,49.022000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.147000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,0.000000,50.165000>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.147000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,50.165000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.512000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,47.879000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.512000,0.000000,47.879000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,0.000000,47.879000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.512000,0.000000,47.879000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,0.000000,49.022000>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.147000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,49.022000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.115000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.068000,0.000000,47.371000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.068000,0.000000,48.133000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.068000,0.000000,48.133000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,47.752000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,47.752000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.687000,0.000000,47.752000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,49.022000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.607000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,49.022000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.401000,0.000000,49.022000> }
difference{
cylinder{<32.258000,0,49.022000><32.258000,0.036000,49.022000>5.156200 translate<0,0.000000,0>}
cylinder{<32.258000,-0.1,49.022000><32.258000,0.135000,49.022000>5.003800 translate<0,0.000000,0>}}
box{<-0.317500,0,-1.143000><0.317500,0.036000,1.143000> rotate<0,-180.000000,0> translate<31.686500,0.000000,49.022000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.241000,0.000000,7.924800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.606000,0.000000,7.924800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<22.606000,0.000000,7.924800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.606000,0.000000,7.924800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<21.971000,0.000000,7.924800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<21.971000,0.000000,7.924800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,7.924800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,9.144000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<22.606000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.241000,0.000000,7.289800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.606000,0.000000,7.289800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<22.606000,0.000000,7.289800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.606000,0.000000,7.289800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<21.971000,0.000000,7.289800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<21.971000,0.000000,7.289800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,7.289800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,6.096000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.606000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,11.303000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.590000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,4.191000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.336000,0.000000,4.191000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,3.937000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.590000,0.000000,3.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,4.191000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,11.049000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.876000,0.000000,11.049000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.622000,0.000000,4.191000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<21.590000,0.000000,4.191000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<21.590000,0.000000,11.049000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.622000,0.000000,11.049000>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.849000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.119000,0.000000,50.800000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.849000,0.000000,50.800000> }
object{ARC(0.508000,0.152400,0.000000,90.000000,0.036000) translate<63.119000,0.000000,50.292000>}
object{ARC(0.508000,0.152400,90.000000,180.000000,0.036000) translate<61.849000,0.000000,50.292000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,50.292000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.627000,0.000000,50.292000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.849000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.119000,0.000000,46.482000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.849000,0.000000,46.482000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.341000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.341000,0.000000,50.292000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,90.000000,0> translate<61.341000,0.000000,50.292000> }
object{ARC(0.508000,0.152400,270.000000,360.000000,0.036000) translate<63.119000,0.000000,46.990000>}
object{ARC(0.508000,0.152400,180.000000,270.000000,0.036000) translate<61.849000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<63.246000,0.000000,48.945800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<61.722000,0.000000,48.945800>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,0.000000,0> translate<61.722000,0.000000,48.945800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<63.246000,0.000000,48.310800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<61.722000,0.000000,48.310800>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,0.000000,0> translate<61.722000,0.000000,48.310800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,47.371000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,48.310800>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,90.000000,0> translate<62.484000,0.000000,48.310800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,49.911000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,48.945800>}
box{<0,0,-0.076200><0.965200,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.484000,0.000000,48.945800> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,5.461000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.765000,0.000000,5.461000> }
object{ARC(0.508000,0.152400,180.000000,270.000000,0.036000) translate<24.765000,0.000000,5.969000>}
object{ARC(0.508000,0.152400,270.000000,360.000000,0.036000) translate<26.035000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,9.271000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,5.969000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.257000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,9.779000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.765000,0.000000,9.779000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,9.271000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,5.969000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.543000,0.000000,5.969000> }
object{ARC(0.508000,0.152400,90.000000,180.000000,0.036000) translate<24.765000,0.000000,9.271000>}
object{ARC(0.508000,0.152400,0.000000,90.000000,0.036000) translate<26.035000,0.000000,9.271000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<24.638000,0.000000,7.315200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<25.400000,0.000000,7.315200>}
box{<0,0,-0.152400><0.762000,0.036000,0.152400> rotate<0,0.000000,0> translate<24.638000,0.000000,7.315200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<25.400000,0.000000,7.315200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<26.162000,0.000000,7.315200>}
box{<0,0,-0.152400><0.762000,0.036000,0.152400> rotate<0,0.000000,0> translate<25.400000,0.000000,7.315200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<24.638000,0.000000,7.950200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<25.400000,0.000000,7.950200>}
box{<0,0,-0.152400><0.762000,0.036000,0.152400> rotate<0,0.000000,0> translate<24.638000,0.000000,7.950200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<25.400000,0.000000,7.950200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<26.162000,0.000000,7.950200>}
box{<0,0,-0.152400><0.762000,0.036000,0.152400> rotate<0,0.000000,0> translate<25.400000,0.000000,7.950200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,7.950200>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.400000,0.000000,7.950200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,7.315200>}
box{<0,0,-0.076200><0.965200,0.036000,0.076200> rotate<0,90.000000,0> translate<25.400000,0.000000,7.315200> }
box{<-0.190500,0,-0.381000><0.190500,0.036000,0.381000> rotate<0,-90.000000,0> translate<25.400000,0.000000,9.969500>}
box{<-0.190500,0,-0.381000><0.190500,0.036000,0.381000> rotate<0,-90.000000,0> translate<25.400000,0.000000,5.270500>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<14.605000,0.000000,30.530800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.970000,0.000000,30.530800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<13.970000,0.000000,30.530800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.970000,0.000000,30.530800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.335000,0.000000,30.530800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<13.335000,0.000000,30.530800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,30.530800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,31.750000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<13.970000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<14.605000,0.000000,29.895800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.970000,0.000000,29.895800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<13.970000,0.000000,29.895800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.970000,0.000000,29.895800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.335000,0.000000,29.895800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<13.335000,0.000000,29.895800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,29.895800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,28.702000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.970000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,0.000000,33.909000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.954000,0.000000,33.909000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,26.797000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.700000,0.000000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,0.000000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,26.543000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.954000,0.000000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,33.655000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.240000,0.000000,33.655000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<14.986000,0.000000,26.797000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<12.954000,0.000000,26.797000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<12.954000,0.000000,33.655000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<14.986000,0.000000,33.655000>}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,28.194000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.355000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.974000,0.000000,27.813000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.974000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,29.718000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.355000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,29.718000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.355000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,30.226000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.625000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,30.226000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.085000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,29.718000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.085000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,29.718000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.085000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,32.131000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.355000,0.000000,32.131000> }
difference{
cylinder{<46.355000,0,30.480000><46.355000,0.036000,30.480000>3.505200 translate<0,0.000000,0>}
cylinder{<46.355000,-0.1,30.480000><46.355000,0.135000,30.480000>3.352800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-90.000000,0> translate<46.355000,0.000000,30.988000>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<14.605000,0.000000,38.150800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.970000,0.000000,38.150800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<13.970000,0.000000,38.150800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.970000,0.000000,38.150800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.335000,0.000000,38.150800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<13.335000,0.000000,38.150800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,38.150800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,39.370000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<13.970000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<14.605000,0.000000,37.515800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.970000,0.000000,37.515800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<13.970000,0.000000,37.515800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.970000,0.000000,37.515800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.335000,0.000000,37.515800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<13.335000,0.000000,37.515800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,37.515800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,36.322000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.970000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,0.000000,41.529000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.954000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,34.417000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.700000,0.000000,34.417000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,34.163000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.954000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,41.275000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.240000,0.000000,41.275000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<14.986000,0.000000,34.417000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<12.954000,0.000000,34.417000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<12.954000,0.000000,41.275000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<14.986000,0.000000,41.275000>}
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.112200,0.000000,30.759400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.112200,0.000000,35.077400>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.112200,0.000000,35.077400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.652200,0.000000,35.077400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.652200,0.000000,30.759400>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.652200,0.000000,30.759400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.366200,0.000000,35.331400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.398200,0.000000,35.331400>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.366200,0.000000,35.331400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.366200,0.000000,30.505400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.398200,0.000000,30.505400>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.366200,0.000000,30.505400> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<34.366200,0.000000,35.077400>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<34.366200,0.000000,30.759400>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<36.398200,0.000000,35.077400>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<36.398200,0.000000,30.759400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.382200,0.000000,33.680400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.382200,0.000000,33.299400>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.382200,0.000000,33.299400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.382200,0.000000,33.299400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.382200,0.000000,33.172400>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.382200,0.000000,33.172400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.382200,0.000000,33.172400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.620200,0.000000,33.172400>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<34.620200,0.000000,33.172400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.382200,0.000000,33.172400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.144200,0.000000,33.172400>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<35.382200,0.000000,33.172400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.620200,0.000000,32.664400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.382200,0.000000,32.664400>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<34.620200,0.000000,32.664400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.382200,0.000000,32.664400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.144200,0.000000,32.664400>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<35.382200,0.000000,32.664400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.382200,0.000000,32.664400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.382200,0.000000,32.537400>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.382200,0.000000,32.537400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.382200,0.000000,32.537400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.382200,0.000000,32.156400>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.382200,0.000000,32.156400> }
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.127200,0.000000,30.759400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.127200,0.000000,35.077400>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.127200,0.000000,35.077400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.667200,0.000000,35.077400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.667200,0.000000,30.759400>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.667200,0.000000,30.759400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.381200,0.000000,35.331400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.413200,0.000000,35.331400>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.381200,0.000000,35.331400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.381200,0.000000,30.505400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.413200,0.000000,30.505400>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.381200,0.000000,30.505400> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<27.381200,0.000000,35.077400>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<27.381200,0.000000,30.759400>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<29.413200,0.000000,35.077400>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<29.413200,0.000000,30.759400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.397200,0.000000,33.680400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.397200,0.000000,33.299400>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.397200,0.000000,33.299400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.397200,0.000000,33.299400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.397200,0.000000,33.172400>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.397200,0.000000,33.172400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.397200,0.000000,33.172400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.635200,0.000000,33.172400>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<27.635200,0.000000,33.172400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.397200,0.000000,33.172400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.159200,0.000000,33.172400>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.397200,0.000000,33.172400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.635200,0.000000,32.664400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.397200,0.000000,32.664400>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<27.635200,0.000000,32.664400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.397200,0.000000,32.664400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.159200,0.000000,32.664400>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.397200,0.000000,32.664400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.397200,0.000000,32.664400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.397200,0.000000,32.537400>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.397200,0.000000,32.537400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.397200,0.000000,32.537400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.397200,0.000000,32.156400>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.397200,0.000000,32.156400> }
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.500800,0.000000,9.271000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.500800,0.000000,9.906000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<44.500800,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.500800,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.500800,0.000000,10.541000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<44.500800,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.500800,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,9.906000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<44.500800,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.865800,0.000000,9.271000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.865800,0.000000,9.906000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<43.865800,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.865800,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.865800,0.000000,10.541000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<43.865800,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.865800,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,9.906000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<42.672000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,10.922000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.879000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,11.176000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.767000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,8.890000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.513000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,8.636000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.767000,0.000000,8.636000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<40.767000,0.000000,8.890000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<40.767000,0.000000,10.922000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<47.625000,0.000000,10.922000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<47.625000,0.000000,8.890000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<3.073400,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<3.962400,0.000000,48.768000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<3.073400,0.000000,48.768000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<13.233400,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<12.344400,0.000000,48.768000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<12.344400,0.000000,48.768000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.788400,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.153400,0.000000,48.768000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.153400,0.000000,48.768000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.137400,0.000000,48.133000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.137400,0.000000,49.403000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.137400,0.000000,49.403000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.137400,0.000000,49.403000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.153400,0.000000,48.768000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,32.003271,0> translate<7.137400,0.000000,49.403000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.153400,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.629400,0.000000,48.768000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.629400,0.000000,48.768000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.153400,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.137400,0.000000,48.133000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-32.003271,0> translate<7.137400,0.000000,48.133000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.153400,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.153400,0.000000,49.403000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.153400,0.000000,49.403000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.899400,0.000000,48.133000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.153400,0.000000,48.133000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.899400,0.000000,48.133000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.153400,0.000000,48.133000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.153400,0.000000,48.768000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.153400,0.000000,48.768000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<6.121400,0.000000,48.006000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<10.185400,0.000000,48.006000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<10.185400,0.000000,49.530000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<6.121400,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.867400,0.000000,48.006000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.867400,0.000000,49.530000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.867400,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.439400,0.000000,48.006000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.439400,0.000000,49.530000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.439400,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.185400,0.000000,47.752000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.121400,0.000000,47.752000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.121400,0.000000,47.752000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.185400,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.121400,0.000000,49.784000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.121400,0.000000,49.784000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-180.000000,0> translate<9.804400,0.000000,48.768000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-180.000000,0> translate<4.914900,0.000000,48.768000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-180.000000,0> translate<11.391900,0.000000,48.768000>}
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.762800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.762800,0.000000,11.938000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.762800,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.906800,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.762800,0.000000,11.938000>}
box{<0,0,-0.076200><9.144000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.762800,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.906800,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.906800,0.000000,8.382000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.906800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.762800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.906800,0.000000,8.382000>}
box{<0,0,-0.076200><9.144000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.762800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.558800 translate<18.954800,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.558800 translate<17.430800,0.000000,10.160000>}
box{<0,0,-0.558800><1.524000,0.036000,0.558800> rotate<0,0.000000,0> translate<17.430800,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.558800 translate<3.714800,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.558800 translate<5.238800,0.000000,10.160000>}
box{<0,0,-0.558800><1.524000,0.036000,0.558800> rotate<0,0.000000,0> translate<3.714800,0.000000,10.160000> }
box{<-0.254000,0,-1.778000><0.254000,0.036000,1.778000> rotate<0,-0.000000,0> translate<7.778800,0.000000,10.160000>}
box{<-0.685800,0,-0.533400><0.685800,0.036000,0.533400> rotate<0,-0.000000,0> translate<16.592600,0.000000,10.160000>}
box{<-0.685800,0,-0.533400><0.685800,0.036000,0.533400> rotate<0,-0.000000,0> translate<6.077000,0.000000,10.160000>}
//D3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<8.636000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<9.525000,0.000000,7.112000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<8.636000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<18.796000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<17.907000,0.000000,7.112000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<17.907000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,7.112000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.716000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,7.747000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.700000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,7.112000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,32.003271,0> translate<12.700000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.192000,0.000000,7.112000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.192000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,6.477000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-32.003271,0> translate<12.700000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,7.747000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.716000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.462000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,6.477000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.462000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,7.112000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.716000,0.000000,7.112000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<11.684000,0.000000,6.350000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<15.748000,0.000000,6.350000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<15.748000,0.000000,7.874000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<11.684000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,7.874000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.430000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,7.874000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.002000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.748000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,6.096000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.684000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.748000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,8.128000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.684000,0.000000,8.128000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-180.000000,0> translate<15.367000,0.000000,7.112000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-180.000000,0> translate<10.477500,0.000000,7.112000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-180.000000,0> translate<16.954500,0.000000,7.112000>}
//D4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<52.832000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<52.832000,0.000000,31.877000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<52.832000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<52.832000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<52.832000,0.000000,40.259000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<52.832000,0.000000,40.259000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,36.068000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.832000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.197000,0.000000,35.052000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.197000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.197000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,36.068000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<52.197000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,34.544000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.832000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,35.052000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<52.832000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.197000,0.000000,36.068000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.197000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,36.068000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.467000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,36.068000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.832000,0.000000,36.068000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<53.594000,0.000000,34.036000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<53.594000,0.000000,38.100000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<52.070000,0.000000,38.100000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<52.070000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,33.782000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.070000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,38.354000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.070000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,34.036000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.848000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,34.036000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.816000,0.000000,34.036000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<52.832000,0.000000,37.719000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-270.000000,0> translate<52.832000,0.000000,32.829500>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-270.000000,0> translate<52.832000,0.000000,39.306500>}
//D5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.024800,0.000000,18.770600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.976800,0.000000,18.770600>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.976800,0.000000,18.770600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.976800,0.000000,16.992600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.024800,0.000000,16.992600>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.976800,0.000000,16.992600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.976800,0.000000,18.770600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.976800,0.000000,16.992600>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.976800,0.000000,16.992600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.024800,0.000000,16.992600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.024800,0.000000,18.770600>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.024800,0.000000,18.770600> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<40.690800,0.000000,17.881600>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<41.579800,0.000000,17.881600>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<40.690800,0.000000,17.881600> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<48.310800,0.000000,17.881600>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<47.421800,0.000000,17.881600>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<47.421800,0.000000,17.881600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.008800,0.000000,17.881600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.627800,0.000000,17.881600>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.627800,0.000000,17.881600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.611800,0.000000,17.373600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.611800,0.000000,18.389600>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.611800,0.000000,18.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.611800,0.000000,18.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.627800,0.000000,17.881600>}
box{<0,0,-0.076200><1.135923,0.036000,0.076200> rotate<0,26.563298,0> translate<43.611800,0.000000,18.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.627800,0.000000,17.881600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.230800,0.000000,17.881600>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.230800,0.000000,17.881600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.627800,0.000000,17.881600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.611800,0.000000,17.373600>}
box{<0,0,-0.076200><1.135923,0.036000,0.076200> rotate<0,-26.563298,0> translate<43.611800,0.000000,17.373600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.627800,0.000000,17.881600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.627800,0.000000,18.389600>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.627800,0.000000,18.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.373800,0.000000,17.373600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.627800,0.000000,17.373600>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.373800,0.000000,17.373600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.627800,0.000000,17.373600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.627800,0.000000,17.881600>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.627800,0.000000,17.881600> }
box{<-0.190500,0,-0.889000><0.190500,0.036000,0.889000> rotate<0,-180.000000,0> translate<45.453300,0.000000,17.881600>}
box{<-0.698500,0,-0.254000><0.698500,0.036000,0.254000> rotate<0,-180.000000,0> translate<42.278300,0.000000,17.881600>}
box{<-0.698500,0,-0.254000><0.698500,0.036000,0.254000> rotate<0,-180.000000,0> translate<46.723300,0.000000,17.881600>}
//D6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<39.878000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<40.767000,0.000000,20.828000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<39.878000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<50.038000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<49.149000,0.000000,20.828000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<49.149000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,20.828000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.958000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,20.193000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,21.463000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.942000,0.000000,21.463000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,21.463000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,20.828000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,32.003271,0> translate<43.942000,0.000000,21.463000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.434000,0.000000,20.828000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.434000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,20.193000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-32.003271,0> translate<43.942000,0.000000,20.193000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,21.463000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.958000,0.000000,21.463000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,20.193000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,20.193000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.704000,0.000000,20.193000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,20.193000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,20.828000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.958000,0.000000,20.828000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.926000,0.000000,20.066000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<46.990000,0.000000,20.066000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<46.990000,0.000000,21.590000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.926000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,21.590000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.672000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,21.590000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.244000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,19.812000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.926000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,21.844000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.926000,0.000000,21.844000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-180.000000,0> translate<46.609000,0.000000,20.828000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-180.000000,0> translate<41.719500,0.000000,20.828000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-180.000000,0> translate<48.196500,0.000000,20.828000>}
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.209000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,0.000000,12.954000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.209000,0.000000,12.954000> }
object{ARC(0.635000,0.152400,0.000000,180.000000,0.036000) translate<20.574000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,0.000000,50.038000>}
box{<0,0,-0.076200><37.084000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.368000,0.000000,50.038000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,0.000000,12.954000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,50.038000>}
box{<0,0,-0.076200><37.084000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.780000,0.000000,50.038000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,50.038000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,0.000000,50.038000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,50.038000> }
//IC3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,54.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,54.483000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.800000,0.000000,54.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,48.641000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,48.641000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.800000,0.000000,48.641000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,54.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,48.641000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.960000,0.000000,48.641000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,54.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,52.578000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.800000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,48.641000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,50.546000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.800000,0.000000,50.546000> }
object{ARC(1.016000,0.152400,270.000000,450.000000,0.036000) translate<50.800000,0.000000,51.562000>}
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.576000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,4.064000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<36.576000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.576000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,4.572000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.576000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,4.064000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.290000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,4.572000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<34.290000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,6.604000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.290000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,6.858000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,6.604000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.290000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,1.778000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<34.290000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,4.064000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.290000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.576000,0.000000,1.778000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.544000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.576000,0.000000,1.778000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.576000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,4.064000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.830000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,6.604000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.830000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.576000,0.000000,6.858000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,6.604000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<36.576000,0.000000,6.858000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.576000,0.000000,6.858000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,6.858000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.544000,0.000000,6.858000> }
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-180.000000,0> translate<35.560000,0.000000,3.048000>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-180.000000,0> translate<35.560000,0.000000,5.588000>}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,34.417000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,34.417000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,33.782000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,33.782000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,34.417000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<57.150000,0.000000,34.417000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,33.147000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,31.877000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,31.242000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,31.242000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,31.877000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<57.150000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,33.147000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.150000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,33.782000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.150000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,38.227000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,36.957000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,36.957000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,36.957000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,36.322000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,36.322000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,36.957000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<57.150000,0.000000,36.957000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,36.957000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,38.227000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.150000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,38.862000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.150000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,36.322000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,35.687000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.150000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,35.687000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.150000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,43.307000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,42.037000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,42.037000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,42.037000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,41.402000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,41.402000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,42.037000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<57.150000,0.000000,42.037000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,40.767000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,40.767000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,39.497000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,38.862000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,38.862000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,39.497000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<57.150000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,40.767000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.150000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,40.767000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,41.402000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.150000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,43.942000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,43.307000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,43.942000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,43.307000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.150000,0.000000,43.307000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,42.037000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,43.307000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.150000,0.000000,43.307000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,29.337000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,28.702000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,28.702000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,29.337000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<57.150000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,31.242000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,30.607000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.150000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,30.607000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.150000,0.000000,30.607000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,32.512000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,35.052000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,37.592000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,40.132000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,42.672000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,29.972000>}
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,51.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,56.261000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.366000,0.000000,56.261000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,56.261000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,44.997030,0> translate<9.525000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,56.261000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,56.642000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.906000,0.000000,56.261000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,56.642000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.287000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,56.261000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,56.642000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,44.997030,0> translate<12.065000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,56.261000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,56.642000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.446000,0.000000,56.261000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,56.642000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.827000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,56.261000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,56.642000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,44.997030,0> translate<14.605000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,56.261000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,51.943000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.986000,0.000000,51.943000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,51.943000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.605000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,51.562000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.827000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,51.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,51.562000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,44.997030,0> translate<12.446000,0.000000,51.943000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,51.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,51.562000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.065000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,51.562000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.287000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,51.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,51.562000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,44.997030,0> translate<9.906000,0.000000,51.943000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,51.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,0.000000,51.562000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.525000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,56.261000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,56.642000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.366000,0.000000,56.261000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,0.000000,56.642000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.747000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,51.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,51.562000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,44.997030,0> translate<7.366000,0.000000,51.943000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,0.000000,51.562000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.747000,0.000000,51.562000> }
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-0.000000,0> translate<8.636000,0.000000,55.372000>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-0.000000,0> translate<11.176000,0.000000,55.372000>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-0.000000,0> translate<13.716000,0.000000,55.372000>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-0.000000,0> translate<8.636000,0.000000,52.832000>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-0.000000,0> translate<11.176000,0.000000,52.832000>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-0.000000,0> translate<13.716000,0.000000,52.832000>}
//JP4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,18.415000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.830000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,17.780000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.195000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,17.780000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.925000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,18.415000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.290000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,17.145000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.195000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,15.875000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.830000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,15.240000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.195000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,15.240000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.925000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,15.875000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.290000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,17.145000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.290000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,17.780000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.290000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,22.225000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.195000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,20.955000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.830000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,20.320000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.195000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,20.320000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.925000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,20.955000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.290000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,22.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.290000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,22.860000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.290000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,20.320000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.195000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,19.685000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.290000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,19.685000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.290000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,26.035000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.830000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,25.400000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.195000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,25.400000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.925000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,26.035000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.290000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,24.765000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.195000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,23.495000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.830000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,22.860000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.195000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,22.860000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.925000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,23.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.290000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,24.765000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.290000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,25.400000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.290000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,27.940000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.925000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,27.940000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.195000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,27.305000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.290000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,27.305000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.290000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,13.335000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.830000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,12.700000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.195000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,12.700000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.925000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,13.335000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.290000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,15.240000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.195000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,14.605000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.290000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,14.605000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.290000,0.000000,14.605000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<35.560000,0.000000,16.510000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<35.560000,0.000000,19.050000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<35.560000,0.000000,21.590000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<35.560000,0.000000,24.130000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<35.560000,0.000000,26.670000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<35.560000,0.000000,13.970000>}
//L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.118000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.118000,0.000000,32.004000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<55.118000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.118000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.118000,0.000000,42.672000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<55.118000,0.000000,42.672000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<56.007000,0.000000,40.259000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<54.229000,0.000000,40.259000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<54.229000,0.000000,34.417000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<56.007000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,40.513000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,40.513000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.229000,0.000000,40.513000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.261000,0.000000,40.259000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.261000,0.000000,39.878000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.261000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.261000,0.000000,39.878000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.134000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,40.259000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,39.878000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.975000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.102000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,39.878000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<53.975000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.261000,0.000000,34.798000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<56.134000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,0.000000,39.751000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.134000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.102000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,34.798000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.975000,0.000000,34.798000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.102000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.102000,0.000000,39.751000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.102000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.261000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.261000,0.000000,34.798000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.261000,0.000000,34.798000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,34.798000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.975000,0.000000,34.798000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,34.163000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.229000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.118000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.118000,0.000000,33.274000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<55.118000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.118000,0.000000,41.783000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.118000,0.000000,41.402000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<55.118000,0.000000,41.402000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<55.118000,0.000000,33.731200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<55.118000,0.000000,40.944800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<55.118000,0.000000,32.461200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<55.118000,0.000000,42.214800>}
//L2 silk screen
difference{
cylinder{<45.466000,0,40.386000><45.466000,0.036000,40.386000>6.251600 translate<0,0.000000,0>}
cylinder{<45.466000,-0.1,40.386000><45.466000,0.135000,40.386000>6.048400 translate<0,0.000000,0>}}
difference{
cylinder{<45.466000,0,40.386000><45.466000,0.036000,40.386000>5.551600 translate<0,0.000000,0>}
cylinder{<45.466000,-0.1,40.386000><45.466000,0.135000,40.386000>5.348400 translate<0,0.000000,0>}}
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.804800,-1.536000,43.815000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.804800,-1.536000,41.275000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.804800,-1.536000,41.275000> }
object{ARC(1.524000,0.152400,180.000000,219.803646,0.036000) translate<62.230000,-1.536000,42.545000>}
object{ARC(1.524000,0.152400,138.370207,180.003760,0.036000) translate<62.230000,-1.536000,42.545100>}
object{ARC(1.524000,0.152400,319.398705,360.000000,0.036000) translate<62.230000,-1.536000,42.545000>}
object{ARC(1.524000,0.152400,0.000000,39.803646,0.036000) translate<62.230000,-1.536000,42.545000>}
object{ARC(1.524000,0.152400,270.000000,324.461885,0.036000) translate<62.230000,-1.536000,42.545000>}
object{ARC(1.524000,0.152400,216.869898,270.000000,0.036000) translate<62.230000,-1.536000,42.545000>}
object{ARC(1.524000,0.152400,37.873005,90.000000,0.036000) translate<62.230000,-1.536000,42.545000>}
object{ARC(1.524000,0.152400,90.000000,142.126995,0.036000) translate<62.230000,-1.536000,42.545000>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<62.230000,-1.536000,42.545000>}
object{ARC(1.016000,0.152400,180.000000,270.000000,0.036000) translate<62.230000,-1.536000,42.545000>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<62.230000,-1.536000,42.545000>}
object{ARC(1.016000,0.152400,0.000000,90.000000,0.036000) translate<62.230000,-1.536000,42.545000>}
object{ARC(2.032000,0.254000,270.000000,320.192985,0.036000) translate<62.230000,-1.536000,42.545000>}
object{ARC(2.032000,0.254000,208.070828,269.997180,0.036000) translate<62.230100,-1.536000,42.545000>}
object{ARC(2.032000,0.254000,40.237352,90.000000,0.036000) translate<62.230000,-1.536000,42.545000>}
object{ARC(2.032000,0.254000,89.997180,150.253020,0.036000) translate<62.229900,-1.536000,42.545000>}
object{ARC(2.032000,0.254000,180.000000,208.301711,0.036000) translate<62.230000,-1.536000,42.545000>}
object{ARC(2.032000,0.254000,148.394530,180.002820,0.036000) translate<62.230000,-1.536000,42.545100>}
//LED2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.804800,-1.536000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.804800,-1.536000,31.750000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.804800,-1.536000,31.750000> }
object{ARC(1.524000,0.152400,180.000000,219.803646,0.036000) translate<62.230000,-1.536000,33.020000>}
object{ARC(1.524000,0.152400,138.370207,180.003760,0.036000) translate<62.230000,-1.536000,33.020100>}
object{ARC(1.524000,0.152400,319.398705,360.000000,0.036000) translate<62.230000,-1.536000,33.020000>}
object{ARC(1.524000,0.152400,0.000000,39.803646,0.036000) translate<62.230000,-1.536000,33.020000>}
object{ARC(1.524000,0.152400,270.000000,324.461885,0.036000) translate<62.230000,-1.536000,33.020000>}
object{ARC(1.524000,0.152400,216.869898,270.000000,0.036000) translate<62.230000,-1.536000,33.020000>}
object{ARC(1.524000,0.152400,37.873005,90.000000,0.036000) translate<62.230000,-1.536000,33.020000>}
object{ARC(1.524000,0.152400,90.000000,142.126995,0.036000) translate<62.230000,-1.536000,33.020000>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<62.230000,-1.536000,33.020000>}
object{ARC(1.016000,0.152400,180.000000,270.000000,0.036000) translate<62.230000,-1.536000,33.020000>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<62.230000,-1.536000,33.020000>}
object{ARC(1.016000,0.152400,0.000000,90.000000,0.036000) translate<62.230000,-1.536000,33.020000>}
object{ARC(2.032000,0.254000,270.000000,320.192985,0.036000) translate<62.230000,-1.536000,33.020000>}
object{ARC(2.032000,0.254000,208.070828,269.997180,0.036000) translate<62.230100,-1.536000,33.020000>}
object{ARC(2.032000,0.254000,40.237352,90.000000,0.036000) translate<62.230000,-1.536000,33.020000>}
object{ARC(2.032000,0.254000,89.997180,150.253020,0.036000) translate<62.229900,-1.536000,33.020000>}
object{ARC(2.032000,0.254000,180.000000,208.301711,0.036000) translate<62.230000,-1.536000,33.020000>}
object{ARC(2.032000,0.254000,148.394530,180.002820,0.036000) translate<62.230000,-1.536000,33.020100>}
//LED3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.804800,-1.536000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.804800,-1.536000,22.225000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.804800,-1.536000,22.225000> }
object{ARC(1.524000,0.152400,180.000000,219.803646,0.036000) translate<62.230000,-1.536000,23.495000>}
object{ARC(1.524000,0.152400,138.370207,180.003760,0.036000) translate<62.230000,-1.536000,23.495100>}
object{ARC(1.524000,0.152400,319.398705,360.000000,0.036000) translate<62.230000,-1.536000,23.495000>}
object{ARC(1.524000,0.152400,0.000000,39.803646,0.036000) translate<62.230000,-1.536000,23.495000>}
object{ARC(1.524000,0.152400,270.000000,324.461885,0.036000) translate<62.230000,-1.536000,23.495000>}
object{ARC(1.524000,0.152400,216.869898,270.000000,0.036000) translate<62.230000,-1.536000,23.495000>}
object{ARC(1.524000,0.152400,37.873005,90.000000,0.036000) translate<62.230000,-1.536000,23.495000>}
object{ARC(1.524000,0.152400,90.000000,142.126995,0.036000) translate<62.230000,-1.536000,23.495000>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<62.230000,-1.536000,23.495000>}
object{ARC(1.016000,0.152400,180.000000,270.000000,0.036000) translate<62.230000,-1.536000,23.495000>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<62.230000,-1.536000,23.495000>}
object{ARC(1.016000,0.152400,0.000000,90.000000,0.036000) translate<62.230000,-1.536000,23.495000>}
object{ARC(2.032000,0.254000,270.000000,320.192985,0.036000) translate<62.230000,-1.536000,23.495000>}
object{ARC(2.032000,0.254000,208.070828,269.997180,0.036000) translate<62.230100,-1.536000,23.495000>}
object{ARC(2.032000,0.254000,40.237352,90.000000,0.036000) translate<62.230000,-1.536000,23.495000>}
object{ARC(2.032000,0.254000,89.997180,150.253020,0.036000) translate<62.229900,-1.536000,23.495000>}
object{ARC(2.032000,0.254000,180.000000,208.301711,0.036000) translate<62.230000,-1.536000,23.495000>}
object{ARC(2.032000,0.254000,148.394530,180.002820,0.036000) translate<62.230000,-1.536000,23.495100>}
//LED4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.804800,-1.536000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.804800,-1.536000,12.700000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.804800,-1.536000,12.700000> }
object{ARC(1.524000,0.152400,180.000000,219.803646,0.036000) translate<62.230000,-1.536000,13.970000>}
object{ARC(1.524000,0.152400,138.370207,180.003760,0.036000) translate<62.230000,-1.536000,13.970100>}
object{ARC(1.524000,0.152400,319.398705,360.000000,0.036000) translate<62.230000,-1.536000,13.970000>}
object{ARC(1.524000,0.152400,0.000000,39.803646,0.036000) translate<62.230000,-1.536000,13.970000>}
object{ARC(1.524000,0.152400,270.000000,324.461885,0.036000) translate<62.230000,-1.536000,13.970000>}
object{ARC(1.524000,0.152400,216.869898,270.000000,0.036000) translate<62.230000,-1.536000,13.970000>}
object{ARC(1.524000,0.152400,37.873005,90.000000,0.036000) translate<62.230000,-1.536000,13.970000>}
object{ARC(1.524000,0.152400,90.000000,142.126995,0.036000) translate<62.230000,-1.536000,13.970000>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<62.230000,-1.536000,13.970000>}
object{ARC(1.016000,0.152400,180.000000,270.000000,0.036000) translate<62.230000,-1.536000,13.970000>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<62.230000,-1.536000,13.970000>}
object{ARC(1.016000,0.152400,0.000000,90.000000,0.036000) translate<62.230000,-1.536000,13.970000>}
object{ARC(2.032000,0.254000,270.000000,320.192985,0.036000) translate<62.230000,-1.536000,13.970000>}
object{ARC(2.032000,0.254000,208.070828,269.997180,0.036000) translate<62.230100,-1.536000,13.970000>}
object{ARC(2.032000,0.254000,40.237352,90.000000,0.036000) translate<62.230000,-1.536000,13.970000>}
object{ARC(2.032000,0.254000,89.997180,150.253020,0.036000) translate<62.229900,-1.536000,13.970000>}
object{ARC(2.032000,0.254000,180.000000,208.301711,0.036000) translate<62.230000,-1.536000,13.970000>}
object{ARC(2.032000,0.254000,148.394530,180.002820,0.036000) translate<62.230000,-1.536000,13.970100>}
//LED5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.324800,-1.536000,43.815000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.324800,-1.536000,41.275000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<33.324800,-1.536000,41.275000> }
object{ARC(1.524000,0.152400,180.000000,219.803646,0.036000) translate<31.750000,-1.536000,42.545000>}
object{ARC(1.524000,0.152400,138.370207,180.003760,0.036000) translate<31.750000,-1.536000,42.545100>}
object{ARC(1.524000,0.152400,319.398705,360.000000,0.036000) translate<31.750000,-1.536000,42.545000>}
object{ARC(1.524000,0.152400,0.000000,39.803646,0.036000) translate<31.750000,-1.536000,42.545000>}
object{ARC(1.524000,0.152400,270.000000,324.461885,0.036000) translate<31.750000,-1.536000,42.545000>}
object{ARC(1.524000,0.152400,216.869898,270.000000,0.036000) translate<31.750000,-1.536000,42.545000>}
object{ARC(1.524000,0.152400,37.873005,90.000000,0.036000) translate<31.750000,-1.536000,42.545000>}
object{ARC(1.524000,0.152400,90.000000,142.126995,0.036000) translate<31.750000,-1.536000,42.545000>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<31.750000,-1.536000,42.545000>}
object{ARC(1.016000,0.152400,180.000000,270.000000,0.036000) translate<31.750000,-1.536000,42.545000>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<31.750000,-1.536000,42.545000>}
object{ARC(1.016000,0.152400,0.000000,90.000000,0.036000) translate<31.750000,-1.536000,42.545000>}
object{ARC(2.032000,0.254000,270.000000,320.192985,0.036000) translate<31.750000,-1.536000,42.545000>}
object{ARC(2.032000,0.254000,208.070828,269.997180,0.036000) translate<31.750100,-1.536000,42.545000>}
object{ARC(2.032000,0.254000,40.237352,90.000000,0.036000) translate<31.750000,-1.536000,42.545000>}
object{ARC(2.032000,0.254000,89.997180,150.253020,0.036000) translate<31.749900,-1.536000,42.545000>}
object{ARC(2.032000,0.254000,180.000000,208.301711,0.036000) translate<31.750000,-1.536000,42.545000>}
object{ARC(2.032000,0.254000,148.394530,180.002820,0.036000) translate<31.750000,-1.536000,42.545100>}
//LED6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.324800,-1.536000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.324800,-1.536000,31.750000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<33.324800,-1.536000,31.750000> }
object{ARC(1.524000,0.152400,180.000000,219.803646,0.036000) translate<31.750000,-1.536000,33.020000>}
object{ARC(1.524000,0.152400,138.370207,180.003760,0.036000) translate<31.750000,-1.536000,33.020100>}
object{ARC(1.524000,0.152400,319.398705,360.000000,0.036000) translate<31.750000,-1.536000,33.020000>}
object{ARC(1.524000,0.152400,0.000000,39.803646,0.036000) translate<31.750000,-1.536000,33.020000>}
object{ARC(1.524000,0.152400,270.000000,324.461885,0.036000) translate<31.750000,-1.536000,33.020000>}
object{ARC(1.524000,0.152400,216.869898,270.000000,0.036000) translate<31.750000,-1.536000,33.020000>}
object{ARC(1.524000,0.152400,37.873005,90.000000,0.036000) translate<31.750000,-1.536000,33.020000>}
object{ARC(1.524000,0.152400,90.000000,142.126995,0.036000) translate<31.750000,-1.536000,33.020000>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<31.750000,-1.536000,33.020000>}
object{ARC(1.016000,0.152400,180.000000,270.000000,0.036000) translate<31.750000,-1.536000,33.020000>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<31.750000,-1.536000,33.020000>}
object{ARC(1.016000,0.152400,0.000000,90.000000,0.036000) translate<31.750000,-1.536000,33.020000>}
object{ARC(2.032000,0.254000,270.000000,320.192985,0.036000) translate<31.750000,-1.536000,33.020000>}
object{ARC(2.032000,0.254000,208.070828,269.997180,0.036000) translate<31.750100,-1.536000,33.020000>}
object{ARC(2.032000,0.254000,40.237352,90.000000,0.036000) translate<31.750000,-1.536000,33.020000>}
object{ARC(2.032000,0.254000,89.997180,150.253020,0.036000) translate<31.749900,-1.536000,33.020000>}
object{ARC(2.032000,0.254000,180.000000,208.301711,0.036000) translate<31.750000,-1.536000,33.020000>}
object{ARC(2.032000,0.254000,148.394530,180.002820,0.036000) translate<31.750000,-1.536000,33.020100>}
//LED7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.324800,-1.536000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.324800,-1.536000,22.225000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<33.324800,-1.536000,22.225000> }
object{ARC(1.524000,0.152400,180.000000,219.803646,0.036000) translate<31.750000,-1.536000,23.495000>}
object{ARC(1.524000,0.152400,138.370207,180.003760,0.036000) translate<31.750000,-1.536000,23.495100>}
object{ARC(1.524000,0.152400,319.398705,360.000000,0.036000) translate<31.750000,-1.536000,23.495000>}
object{ARC(1.524000,0.152400,0.000000,39.803646,0.036000) translate<31.750000,-1.536000,23.495000>}
object{ARC(1.524000,0.152400,270.000000,324.461885,0.036000) translate<31.750000,-1.536000,23.495000>}
object{ARC(1.524000,0.152400,216.869898,270.000000,0.036000) translate<31.750000,-1.536000,23.495000>}
object{ARC(1.524000,0.152400,37.873005,90.000000,0.036000) translate<31.750000,-1.536000,23.495000>}
object{ARC(1.524000,0.152400,90.000000,142.126995,0.036000) translate<31.750000,-1.536000,23.495000>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<31.750000,-1.536000,23.495000>}
object{ARC(1.016000,0.152400,180.000000,270.000000,0.036000) translate<31.750000,-1.536000,23.495000>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<31.750000,-1.536000,23.495000>}
object{ARC(1.016000,0.152400,0.000000,90.000000,0.036000) translate<31.750000,-1.536000,23.495000>}
object{ARC(2.032000,0.254000,270.000000,320.192985,0.036000) translate<31.750000,-1.536000,23.495000>}
object{ARC(2.032000,0.254000,208.070828,269.997180,0.036000) translate<31.750100,-1.536000,23.495000>}
object{ARC(2.032000,0.254000,40.237352,90.000000,0.036000) translate<31.750000,-1.536000,23.495000>}
object{ARC(2.032000,0.254000,89.997180,150.253020,0.036000) translate<31.749900,-1.536000,23.495000>}
object{ARC(2.032000,0.254000,180.000000,208.301711,0.036000) translate<31.750000,-1.536000,23.495000>}
object{ARC(2.032000,0.254000,148.394530,180.002820,0.036000) translate<31.750000,-1.536000,23.495100>}
//LED8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.324800,-1.536000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.324800,-1.536000,12.700000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<33.324800,-1.536000,12.700000> }
object{ARC(1.524000,0.152400,180.000000,219.803646,0.036000) translate<31.750000,-1.536000,13.970000>}
object{ARC(1.524000,0.152400,138.370207,180.003760,0.036000) translate<31.750000,-1.536000,13.970100>}
object{ARC(1.524000,0.152400,319.398705,360.000000,0.036000) translate<31.750000,-1.536000,13.970000>}
object{ARC(1.524000,0.152400,0.000000,39.803646,0.036000) translate<31.750000,-1.536000,13.970000>}
object{ARC(1.524000,0.152400,270.000000,324.461885,0.036000) translate<31.750000,-1.536000,13.970000>}
object{ARC(1.524000,0.152400,216.869898,270.000000,0.036000) translate<31.750000,-1.536000,13.970000>}
object{ARC(1.524000,0.152400,37.873005,90.000000,0.036000) translate<31.750000,-1.536000,13.970000>}
object{ARC(1.524000,0.152400,90.000000,142.126995,0.036000) translate<31.750000,-1.536000,13.970000>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<31.750000,-1.536000,13.970000>}
object{ARC(1.016000,0.152400,180.000000,270.000000,0.036000) translate<31.750000,-1.536000,13.970000>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<31.750000,-1.536000,13.970000>}
object{ARC(1.016000,0.152400,0.000000,90.000000,0.036000) translate<31.750000,-1.536000,13.970000>}
object{ARC(2.032000,0.254000,270.000000,320.192985,0.036000) translate<31.750000,-1.536000,13.970000>}
object{ARC(2.032000,0.254000,208.070828,269.997180,0.036000) translate<31.750100,-1.536000,13.970000>}
object{ARC(2.032000,0.254000,40.237352,90.000000,0.036000) translate<31.750000,-1.536000,13.970000>}
object{ARC(2.032000,0.254000,89.997180,150.253020,0.036000) translate<31.749900,-1.536000,13.970000>}
object{ARC(2.032000,0.254000,180.000000,208.301711,0.036000) translate<31.750000,-1.536000,13.970000>}
object{ARC(2.032000,0.254000,148.394530,180.002820,0.036000) translate<31.750000,-1.536000,13.970100>}
//LED9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.686000,-1.536000,52.273200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.146000,-1.536000,52.273200>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,0.000000,0> translate<25.146000,-1.536000,52.273200> }
object{ARC(1.524000,0.152400,90.000000,129.803646,0.036000) translate<26.416000,-1.536000,53.848000>}
object{ARC(1.524000,0.152400,48.370207,90.003760,0.036000) translate<26.416100,-1.536000,53.848000>}
object{ARC(1.524000,0.152400,229.398705,270.000000,0.036000) translate<26.416000,-1.536000,53.848000>}
object{ARC(1.524000,0.152400,270.000000,309.803646,0.036000) translate<26.416000,-1.536000,53.848000>}
object{ARC(1.524000,0.152400,180.000000,234.461885,0.036000) translate<26.416000,-1.536000,53.848000>}
object{ARC(1.524000,0.152400,126.869898,180.000000,0.036000) translate<26.416000,-1.536000,53.848000>}
object{ARC(1.524000,0.152400,307.873005,360.000000,0.036000) translate<26.416000,-1.536000,53.848000>}
object{ARC(1.524000,0.152400,0.000000,52.126995,0.036000) translate<26.416000,-1.536000,53.848000>}
object{ARC(0.635000,0.152400,90.000000,180.000000,0.036000) translate<26.416000,-1.536000,53.848000>}
object{ARC(1.016000,0.152400,90.000000,180.000000,0.036000) translate<26.416000,-1.536000,53.848000>}
object{ARC(0.635000,0.152400,270.000000,360.000000,0.036000) translate<26.416000,-1.536000,53.848000>}
object{ARC(1.016000,0.152400,270.000000,360.000000,0.036000) translate<26.416000,-1.536000,53.848000>}
object{ARC(2.032000,0.254000,180.000000,230.192985,0.036000) translate<26.416000,-1.536000,53.848000>}
object{ARC(2.032000,0.254000,118.070828,179.997180,0.036000) translate<26.416000,-1.536000,53.847900>}
object{ARC(2.032000,0.254000,310.237352,360.000000,0.036000) translate<26.416000,-1.536000,53.848000>}
object{ARC(2.032000,0.254000,359.997180,420.253020,0.036000) translate<26.416000,-1.536000,53.848100>}
object{ARC(2.032000,0.254000,90.000000,118.301711,0.036000) translate<26.416000,-1.536000,53.848000>}
object{ARC(2.032000,0.254000,58.394530,90.002820,0.036000) translate<26.416100,-1.536000,53.848000>}
//Q1 silk screen
object{ARC(2.667000,0.152400,197.146796,308.245791,0.036000) translate<29.718000,0.000000,7.874000>}
object{ARC(2.666900,0.152400,51.752879,162.852571,0.036000) translate<29.718000,0.000000,7.874500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.369000,0.000000,5.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.369000,0.000000,9.969000>}
box{<0,0,-0.076200><4.190000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.369000,0.000000,9.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,5.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,7.588000>}
box{<0,0,-0.076200><1.968000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.972000,0.000000,7.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,5.219000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,5.620000>}
box{<0,0,-0.076200><0.401000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.972000,0.000000,5.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,7.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,8.160000>}
box{<0,0,-0.076200><0.572000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.972000,0.000000,8.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,10.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,10.529000>}
box{<0,0,-0.076200><0.401000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.972000,0.000000,10.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,8.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,10.128000>}
box{<0,0,-0.076200><1.968000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.972000,0.000000,10.128000> }
object{ARC(2.667000,0.152400,162.853204,197.146796,0.036000) translate<29.718000,0.000000,7.874000>}
//Q2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.753000,0.000000,2.731000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.753000,0.000000,6.921000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.753000,0.000000,6.921000> }
object{ARC(2.667000,0.127000,115.208327,244.791673,0.036000) translate<54.102000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.229000,0.000000,5.962000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.229000,0.000000,3.690000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,-90.000000,0> translate<54.229000,0.000000,3.690000> }
object{ARC(2.667000,0.127000,244.791673,295.208327,0.036000) translate<54.102000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.229000,0.000000,3.422000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.229000,0.000000,2.162000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,-90.000000,0> translate<54.229000,0.000000,2.162000> }
object{ARC(2.667000,0.127000,295.210271,308.248808,0.036000) translate<54.101900,0.000000,4.825500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.229000,0.000000,3.690000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.229000,0.000000,3.422000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,-90.000000,0> translate<54.229000,0.000000,3.422000> }
object{ARC(2.667000,0.127000,64.791673,115.208327,0.036000) translate<54.102000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.229000,0.000000,7.490000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.229000,0.000000,6.230000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,-90.000000,0> translate<54.229000,0.000000,6.230000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.229000,0.000000,6.230000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.229000,0.000000,5.962000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,-90.000000,0> translate<54.229000,0.000000,5.962000> }
object{ARC(2.667000,0.127000,51.751192,65.360649,0.036000) translate<54.101900,0.000000,4.826500>}
//Q3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.625800,0.000000,35.534600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,35.534600>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.625800,0.000000,35.534600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,40.106600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.625800,0.000000,40.106600>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.625800,0.000000,40.106600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.625800,0.000000,36.042600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<35.483800,0.000000,36.042600>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<28.625800,0.000000,36.042600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<35.483800,0.000000,39.598600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.625800,0.000000,39.598600>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<28.625800,0.000000,39.598600> }
object{ARC(1.778000,0.050800,270.000000,450.000000,0.036000) translate<35.483800,0.000000,37.820600>}
object{ARC(2.286000,0.152400,270.000000,450.000000,0.036000) translate<35.483800,0.000000,37.820600>}
object{ARC(2.286000,0.152400,90.000000,270.000000,0.036000) translate<28.625800,0.000000,37.820600>}
object{ARC(1.778000,0.050800,90.000000,270.000000,0.036000) translate<28.625800,0.000000,37.820600>}
//Q6 silk screen
object{ARC(2.413000,0.152400,156.318141,203.681859,0.036000) translate<54.610000,0.000000,11.684000>}
object{ARC(2.413000,0.152400,203.681859,317.463881,0.036000) translate<54.610000,0.000000,11.684300>}
object{ARC(2.413000,0.152400,42.536119,156.318141,0.036000) translate<54.610000,0.000000,11.683700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,10.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,13.315000>}
box{<0,0,-0.076200><3.262000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.388000,0.000000,13.315000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.608000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,53.086000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<38.608000,0.000000,53.086000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.768000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<47.752000,0.000000,53.086000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<47.752000,0.000000,53.086000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<46.609000,0.000000,52.197000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<46.609000,0.000000,53.975000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<40.767000,0.000000,53.975000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<40.767000,0.000000,52.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,53.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,52.197000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.863000,0.000000,52.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,51.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,51.943000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.228000,0.000000,51.943000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,51.943000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.101000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,54.229000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.228000,0.000000,54.229000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,54.102000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,54.229000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.101000,0.000000,54.102000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,51.943000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.148000,0.000000,51.943000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,52.070000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,54.102000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,54.229000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.148000,0.000000,54.229000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,54.102000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,54.102000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,54.102000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,51.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,51.943000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.767000,0.000000,51.943000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,54.229000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.767000,0.000000,54.229000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,53.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,52.197000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.513000,0.000000,52.197000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<40.081200,0.000000,53.086000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<47.294800,0.000000,53.086000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.768000,0.000000,48.006000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<47.752000,0.000000,48.006000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<47.752000,0.000000,48.006000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.608000,0.000000,48.006000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,48.006000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<38.608000,0.000000,48.006000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<40.767000,0.000000,48.895000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<40.767000,0.000000,47.117000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<46.609000,0.000000,47.117000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<46.609000,0.000000,48.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,47.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,48.895000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.513000,0.000000,48.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,49.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,49.149000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.767000,0.000000,49.149000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,49.149000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.148000,0.000000,49.149000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,46.863000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,46.863000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.767000,0.000000,46.863000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,46.863000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.148000,0.000000,46.863000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,49.149000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.101000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,49.022000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,46.863000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.101000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,46.990000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,49.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,49.149000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.228000,0.000000,49.149000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,46.863000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,46.863000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.228000,0.000000,46.863000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,47.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,48.895000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.863000,0.000000,48.895000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<47.294800,0.000000,48.006000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<40.081200,0.000000,48.006000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.636000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<9.652000,0.000000,4.826000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<8.636000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<18.796000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.780000,0.000000,4.826000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<17.780000,0.000000,4.826000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<16.637000,0.000000,3.937000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<16.637000,0.000000,5.715000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<10.795000,0.000000,5.715000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<10.795000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,3.937000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.891000,0.000000,3.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,3.683000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.256000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,3.683000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<16.129000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,5.969000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.256000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,5.969000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.129000,0.000000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,3.683000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.176000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,3.810000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.303000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,5.969000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<11.176000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,5.842000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.303000,0.000000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,3.683000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,5.969000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,3.937000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.541000,0.000000,3.937000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<10.109200,0.000000,4.826000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<17.322800,0.000000,4.826000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.276000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,0.000000,2.286000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<48.260000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.116000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.132000,0.000000,2.286000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<39.116000,0.000000,2.286000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<41.275000,0.000000,3.175000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<41.275000,0.000000,1.397000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<47.117000,0.000000,1.397000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<47.117000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,1.397000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,3.175000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.021000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,3.429000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,3.429000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.656000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,1.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,1.143000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,1.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,1.143000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,1.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,3.429000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.609000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,3.302000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.783000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,1.143000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.609000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,1.270000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.783000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,3.429000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,1.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,1.143000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,1.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,1.397000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,3.175000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.371000,0.000000,3.175000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<47.802800,0.000000,2.286000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<40.589200,0.000000,2.286000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.768000,0.000000,55.626000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<47.752000,0.000000,55.626000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<47.752000,0.000000,55.626000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.608000,0.000000,55.626000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,55.626000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<38.608000,0.000000,55.626000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<40.767000,0.000000,56.515000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<40.767000,0.000000,54.737000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<46.609000,0.000000,54.737000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<46.609000,0.000000,56.515000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,54.737000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,56.515000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.513000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,56.769000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,56.769000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.767000,0.000000,56.769000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,56.769000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.148000,0.000000,56.769000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,54.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,54.483000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.767000,0.000000,54.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,54.483000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.148000,0.000000,54.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,56.769000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.101000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,56.642000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,54.483000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.101000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,54.610000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,56.769000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,56.769000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.228000,0.000000,56.769000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,54.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,54.483000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.228000,0.000000,54.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,54.737000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,56.515000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.863000,0.000000,56.515000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<47.294800,0.000000,55.626000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<40.081200,0.000000,55.626000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.116000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.132000,0.000000,7.366000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<39.116000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.276000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,0.000000,7.366000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<48.260000,0.000000,7.366000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<47.117000,0.000000,6.477000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<47.117000,0.000000,8.255000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<41.275000,0.000000,8.255000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<41.275000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,6.477000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.371000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,6.223000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,6.223000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.609000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,8.509000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,8.509000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.609000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,6.223000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,6.350000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.783000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,8.509000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.656000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,8.382000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.783000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,6.223000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,8.509000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,6.477000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.021000,0.000000,6.477000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<40.589200,0.000000,7.366000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<47.802800,0.000000,7.366000>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.606000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.622000,0.000000,2.286000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<22.606000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.766000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,2.286000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<31.750000,0.000000,2.286000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<30.607000,0.000000,1.397000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<30.607000,0.000000,3.175000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<24.765000,0.000000,3.175000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<24.765000,0.000000,1.397000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,1.397000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.861000,0.000000,1.397000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,1.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,1.143000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.226000,0.000000,1.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.099000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,1.143000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<30.099000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,3.429000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.226000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.099000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,3.429000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.099000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,1.143000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.146000,0.000000,1.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.099000,0.000000,1.270000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.273000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,3.429000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<25.146000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.099000,0.000000,3.302000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.273000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,1.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,1.143000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.765000,0.000000,1.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,3.429000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.765000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,1.397000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.511000,0.000000,1.397000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<24.079200,0.000000,2.286000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<31.292800,0.000000,2.286000>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<18.796000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.780000,0.000000,2.286000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<17.780000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.636000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<9.652000,0.000000,2.286000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<8.636000,0.000000,2.286000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<10.795000,0.000000,3.175000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<10.795000,0.000000,1.397000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<16.637000,0.000000,1.397000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<16.637000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,1.397000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,3.175000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.541000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,3.429000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,3.429000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<11.176000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,1.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,1.143000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,1.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,1.143000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.176000,0.000000,1.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,3.429000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.129000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,3.302000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.303000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,1.143000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<16.129000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,1.270000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.303000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,3.429000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.256000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,1.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,1.143000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.256000,0.000000,1.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,1.397000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,3.175000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.891000,0.000000,3.175000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<17.322800,0.000000,2.286000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<10.109200,0.000000,2.286000>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.686000,0.000000,15.011400>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.686000,0.000000,16.027400>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<27.686000,0.000000,16.027400> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.686000,0.000000,25.171400>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.686000,0.000000,24.155400>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<27.686000,0.000000,24.155400> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<28.575000,0.000000,23.012400>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<26.797000,0.000000,23.012400>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<26.797000,0.000000,17.170400>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<28.575000,0.000000,17.170400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,23.266400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,23.266400>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.797000,0.000000,23.266400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,0.000000,23.012400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,0.000000,22.631400>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.829000,0.000000,22.631400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.702000,0.000000,22.504400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,0.000000,22.631400>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.702000,0.000000,22.504400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,23.012400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,22.631400>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.543000,0.000000,22.631400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,22.504400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,22.631400>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<26.543000,0.000000,22.631400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.702000,0.000000,17.678400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,0.000000,17.551400>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<28.702000,0.000000,17.678400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.702000,0.000000,17.678400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.702000,0.000000,22.504400>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.702000,0.000000,22.504400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,17.678400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,17.551400>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.543000,0.000000,17.551400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,17.678400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,22.504400>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.670000,0.000000,22.504400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,0.000000,17.170400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,0.000000,17.551400>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.829000,0.000000,17.551400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,17.170400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,17.551400>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.543000,0.000000,17.551400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,16.916400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,16.916400>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.797000,0.000000,16.916400> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<27.686000,0.000000,16.484600>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<27.686000,0.000000,23.698200>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.768000,0.000000,50.546000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<47.752000,0.000000,50.546000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<47.752000,0.000000,50.546000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.608000,0.000000,50.546000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,50.546000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<38.608000,0.000000,50.546000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<40.767000,0.000000,51.435000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<40.767000,0.000000,49.657000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<46.609000,0.000000,49.657000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<46.609000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,49.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,51.435000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.513000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,51.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,51.689000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.767000,0.000000,51.689000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,51.689000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.148000,0.000000,51.689000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,49.403000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,49.403000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.767000,0.000000,49.403000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,49.403000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.148000,0.000000,49.403000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,51.689000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.101000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,51.562000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,49.403000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.101000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,49.530000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,51.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,51.689000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.228000,0.000000,51.689000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,49.403000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,49.403000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.228000,0.000000,49.403000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,49.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,51.435000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.863000,0.000000,51.435000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<47.294800,0.000000,50.546000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<40.081200,0.000000,50.546000>}
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.116000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.132000,0.000000,4.826000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<39.116000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.276000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,0.000000,4.826000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<48.260000,0.000000,4.826000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<47.117000,0.000000,3.937000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<47.117000,0.000000,5.715000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<41.275000,0.000000,5.715000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<41.275000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,3.937000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.371000,0.000000,3.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,3.683000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,3.683000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.609000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,5.969000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,5.969000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.609000,0.000000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,3.683000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,3.810000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.783000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,5.969000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.656000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,5.842000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.783000,0.000000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,3.683000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,5.969000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,3.937000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.021000,0.000000,3.937000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<40.589200,0.000000,4.826000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<47.802800,0.000000,4.826000>}
//R12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.116000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.132000,0.000000,12.700000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<39.116000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.276000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,0.000000,12.700000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<48.260000,0.000000,12.700000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<47.117000,0.000000,11.811000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<47.117000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<41.275000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<41.275000,0.000000,11.811000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,11.811000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.371000,0.000000,11.811000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,11.557000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,11.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,11.557000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.609000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,13.843000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,13.843000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.609000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,11.557000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,11.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,11.684000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.783000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,13.843000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.656000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,13.716000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.783000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,11.557000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,11.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,13.843000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,11.811000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.021000,0.000000,11.811000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<40.589200,0.000000,12.700000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<47.802800,0.000000,12.700000>}
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.276000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,0.000000,15.240000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<48.260000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.116000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.132000,0.000000,15.240000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<39.116000,0.000000,15.240000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<41.275000,0.000000,16.129000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<41.275000,0.000000,14.351000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<47.117000,0.000000,14.351000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<47.117000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,16.129000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.021000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,16.383000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,16.383000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.656000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,14.097000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,14.097000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,16.383000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.609000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,16.256000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.783000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,14.097000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.609000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,14.224000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.783000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,16.383000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,14.097000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,16.129000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.371000,0.000000,16.129000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<47.802800,0.000000,15.240000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<40.589200,0.000000,15.240000>}
//RN1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.404000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.404000,0.000000,16.002000>}
box{<0,0,-0.076200><11.684000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.404000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.658000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.658000,0.000000,17.526000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.658000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.658000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,17.526000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.658000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,16.002000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.182000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.658000,0.000000,16.002000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.658000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.531000,0.000000,17.653000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.309000,0.000000,17.653000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.531000,0.000000,17.653000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.309000,0.000000,17.653000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.309000,0.000000,15.875000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.309000,0.000000,15.875000> }
object{ARC(0.508000,0.152400,180.000000,270.000000,0.036000) translate<57.912000,0.000000,16.002000>}
object{ARC(0.508000,0.152400,90.000000,180.000000,0.036000) translate<57.912000,0.000000,27.686000>}
object{ARC(0.508000,0.152400,0.000000,90.000000,0.036000) translate<58.928000,0.000000,27.686000>}
object{ARC(0.508000,0.152400,270.000000,360.000000,0.036000) translate<58.928000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,28.194000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.912000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.436000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.436000,0.000000,16.002000>}
box{<0,0,-0.076200><11.684000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.436000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,15.494000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.912000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.531000,0.000000,17.653000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.531000,0.000000,15.875000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.531000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.531000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.309000,0.000000,15.875000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.531000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,20.701000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.420000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,22.987000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.420000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,22.987000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.039000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,22.987000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.039000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.801000,0.000000,22.987000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.420000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.801000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.801000,0.000000,20.701000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.801000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.801000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,20.701000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.420000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,20.701000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.039000,0.000000,20.701000> }
//RN2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,24.638000>}
box{<0,0,-0.076200><11.684000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.100000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,0.000000,26.162000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.354000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,26.162000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.354000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,24.638000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.878000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,0.000000,24.638000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.354000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,26.289000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.227000,0.000000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,24.511000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.005000,0.000000,24.511000> }
object{ARC(0.508000,0.152400,180.000000,270.000000,0.036000) translate<38.608000,0.000000,24.638000>}
object{ARC(0.508000,0.152400,90.000000,180.000000,0.036000) translate<38.608000,0.000000,36.322000>}
object{ARC(0.508000,0.152400,0.000000,90.000000,0.036000) translate<39.624000,0.000000,36.322000>}
object{ARC(0.508000,0.152400,270.000000,360.000000,0.036000) translate<39.624000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,36.830000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.608000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.132000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.132000,0.000000,24.638000>}
box{<0,0,-0.076200><11.684000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.132000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,24.130000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.608000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,24.511000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.227000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,24.511000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.227000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,29.337000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.116000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,31.623000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.116000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,31.623000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.735000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,31.623000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.735000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,31.623000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.116000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,29.337000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.497000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,29.337000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.116000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,29.337000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.735000,0.000000,29.337000> }
//S1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,-1.536000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,-1.536000,54.610000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.368000,-1.536000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,-1.536000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,-1.536000,53.086000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.622000,-1.536000,53.086000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,-1.536000,53.086000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,-1.536000,53.086000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.368000,-1.536000,53.086000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,-1.536000,52.832000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,-1.536000,51.308000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.368000,-1.536000,51.308000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,-1.536000,53.086000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,-1.536000,53.086000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.018000,-1.536000,53.086000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,-1.536000,53.086000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,-1.536000,54.610000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.018000,-1.536000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,-1.536000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,-1.536000,54.610000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.018000,-1.536000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,-1.536000,51.308000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,-1.536000,50.800000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.860000,-1.536000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,-1.536000,56.896000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,-1.536000,56.388000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<22.860000,-1.536000,56.896000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,-1.536000,56.388000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,-1.536000,54.864000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.368000,-1.536000,54.864000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,-1.536000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,-1.536000,51.308000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<17.272000,-1.536000,51.308000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,-1.536000,51.308000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,-1.536000,52.832000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.272000,-1.536000,52.832000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,-1.536000,56.896000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,-1.536000,56.388000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.272000,-1.536000,56.388000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,-1.536000,56.388000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,-1.536000,54.864000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.272000,-1.536000,54.864000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.050000,-1.536000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.050000,-1.536000,55.118000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<19.050000,-1.536000,55.118000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<21.590000,-1.536000,55.118000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.050000,-1.536000,55.118000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<19.050000,-1.536000,55.118000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<21.590000,-1.536000,55.118000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<21.590000,-1.536000,52.578000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,-90.000000,0> translate<21.590000,-1.536000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.050000,-1.536000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<21.590000,-1.536000,52.578000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<19.050000,-1.536000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.050000,-1.536000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.050000,-1.536000,51.054000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,90.000000,0> translate<19.050000,-1.536000,51.054000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<21.590000,-1.536000,51.054000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.050000,-1.536000,51.054000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<19.050000,-1.536000,51.054000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<21.590000,-1.536000,51.054000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<21.590000,-1.536000,50.800000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,-90.000000,0> translate<21.590000,-1.536000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<21.463000,-1.536000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.050000,-1.536000,56.642000>}
box{<0,0,-0.025400><2.413000,0.036000,0.025400> rotate<0,0.000000,0> translate<19.050000,-1.536000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<21.463000,-1.536000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<21.463000,-1.536000,56.896000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,90.000000,0> translate<21.463000,-1.536000,56.896000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.050000,-1.536000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.050000,-1.536000,56.896000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,90.000000,0> translate<19.050000,-1.536000,56.896000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,-1.536000,56.896000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,-1.536000,56.896000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.479000,-1.536000,56.896000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,-1.536000,56.896000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,-1.536000,56.896000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,-1.536000,56.896000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,-1.536000,56.896000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,-1.536000,56.896000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.161000,-1.536000,56.896000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,-1.536000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,-1.536000,50.800000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,-1.536000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,-1.536000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,-1.536000,50.800000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.479000,-1.536000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,-1.536000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,-1.536000,50.800000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.590000,-1.536000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,-1.536000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,-1.536000,50.800000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.050000,-1.536000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,-1.536000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,-1.536000,50.800000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.161000,-1.536000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,-1.536000,56.896000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,-1.536000,56.896000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.050000,-1.536000,56.896000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,-1.536000,56.896000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,-1.536000,56.896000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.463000,-1.536000,56.896000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,-1.536000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,-1.536000,54.864000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.368000,-1.536000,54.864000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,-1.536000,53.086000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.368000,-1.536000,52.832000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.368000,-1.536000,52.832000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,-1.536000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,-1.536000,54.864000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.272000,-1.536000,54.864000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,-1.536000,53.086000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,-1.536000,52.832000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.272000,-1.536000,52.832000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,-1.536000,56.007000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,-1.536000,56.007000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.050000,-1.536000,56.007000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,-1.536000,51.562000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,-1.536000,51.562000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.050000,-1.536000,51.562000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,-1.536000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,-1.536000,53.340000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.907000,-1.536000,53.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,-1.536000,54.356000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,-1.536000,55.118000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.907000,-1.536000,55.118000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,-1.536000,53.340000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,-1.536000,54.229000>}
box{<0,0,-0.076200><0.924574,0.036000,0.076200> rotate<0,-74.049717,0> translate<17.907000,-1.536000,53.340000> }
difference{
cylinder{<20.320000,0,53.848000><20.320000,0.036000,53.848000>1.854200 translate<0,-1.536000,0>}
cylinder{<20.320000,-0.1,53.848000><20.320000,0.135000,53.848000>1.701800 translate<0,-1.536000,0>}}
difference{
cylinder{<18.161000,0,56.007000><18.161000,0.036000,56.007000>0.584200 translate<0,-1.536000,0>}
cylinder{<18.161000,-0.1,56.007000><18.161000,0.135000,56.007000>0.431800 translate<0,-1.536000,0>}}
difference{
cylinder{<22.479000,0,55.880000><22.479000,0.036000,55.880000>0.584200 translate<0,-1.536000,0>}
cylinder{<22.479000,-0.1,55.880000><22.479000,0.135000,55.880000>0.431800 translate<0,-1.536000,0>}}
difference{
cylinder{<22.479000,0,51.689000><22.479000,0.036000,51.689000>0.584200 translate<0,-1.536000,0>}
cylinder{<22.479000,-0.1,51.689000><22.479000,0.135000,51.689000>0.431800 translate<0,-1.536000,0>}}
difference{
cylinder{<18.161000,0,51.689000><18.161000,0.036000,51.689000>0.584200 translate<0,-1.536000,0>}
cylinder{<18.161000,-0.1,51.689000><18.161000,0.135000,51.689000>0.431800 translate<0,-1.536000,0>}}
difference{
cylinder{<20.320000,0,53.848000><20.320000,0.036000,53.848000>0.660400 translate<0,-1.536000,0>}
cylinder{<20.320000,-0.1,53.848000><20.320000,0.135000,53.848000>0.609600 translate<0,-1.536000,0>}}
difference{
cylinder{<20.320000,0,53.848000><20.320000,0.036000,53.848000>0.330200 translate<0,-1.536000,0>}
cylinder{<20.320000,-0.1,53.848000><20.320000,0.135000,53.848000>0.177800 translate<0,-1.536000,0>}}
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,13.970000>}
box{<0,0,-0.076200><30.480000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.795000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,13.970000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,44.450000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,44.450000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.065000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,17.399000>}
box{<0,0,-0.076200><4.699000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.175000,0.000000,17.399000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,12.700000>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.175000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,45.720000>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.175000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,18.288000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<4.445000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,31.242000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.207000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,31.242000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,36.068000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<4.445000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,27.178000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,27.178000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.191000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,13.970000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.065000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,15.240000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.319000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,15.240000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.065000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,12.700000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.065000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,29.845000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.319000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,28.575000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.065000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,15.240000>}
box{<0,0,-0.076200><13.335000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.065000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,29.845000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.065000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,44.450000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.319000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,44.450000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.065000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,43.180000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.065000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,29.845000>}
box{<0,0,-0.076200><13.335000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.065000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,27.178000>}
box{<0,0,-0.076200><6.477000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.175000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,31.242000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.175000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,19.812000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.191000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,27.178000>}
box{<0,0,-0.076200><7.366000,0.036000,0.076200> rotate<0,90.000000,0> translate<4.445000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,18.288000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.191000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,19.812000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<4.445000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,20.320000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,36.867464,0> translate<3.175000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,17.399000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-36.867464,0> translate<3.175000,0.000000,17.399000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,18.288000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.683000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,27.178000>}
box{<0,0,-0.025400><7.366000,0.036000,0.025400> rotate<0,90.000000,0> translate<4.191000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,27.178000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.175000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,13.716000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,-90.000000,0> translate<4.191000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.049000,0.000000,13.716000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<4.191000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.049000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.049000,0.000000,44.704000>}
box{<0,0,-0.025400><30.988000,0.036000,0.025400> rotate<0,90.000000,0> translate<11.049000,0.000000,44.704000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.049000,0.000000,44.704000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,44.704000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<4.191000,0.000000,44.704000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,44.704000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,37.592000>}
box{<0,0,-0.025400><7.112000,0.036000,0.025400> rotate<0,-90.000000,0> translate<4.191000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,31.242000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.191000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,31.242000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.175000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,19.812000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.683000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,20.320000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.683000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,18.288000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.683000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,19.812000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.683000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,41.402000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.175000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,41.402000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.175000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,39.878000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.302000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,39.878000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.175000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,38.481000>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.175000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,37.592000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.683000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,36.068000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.683000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,31.242000>}
box{<0,0,-0.025400><4.826000,0.036000,0.025400> rotate<0,-90.000000,0> translate<4.191000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,37.592000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.191000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,44.450000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<4.445000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,36.068000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.191000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,37.592000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<4.445000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,37.592000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.683000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,38.100000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.683000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,38.100000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,36.867464,0> translate<3.175000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,35.179000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-36.867464,0> translate<3.175000,0.000000,35.179000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,35.179000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,31.242000>}
box{<0,0,-0.076200><3.937000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.175000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,36.068000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.683000,0.000000,36.068000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  CTRL_AVR_REG_REV30(-33.974100,0,-29.524300,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
