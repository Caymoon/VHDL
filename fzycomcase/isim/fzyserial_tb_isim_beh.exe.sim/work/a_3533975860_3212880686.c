/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/VHDL/VHDL/fzycomcase/count4.vhd";
extern char *IEEE_P_3499444699;

char *ieee_p_3499444699_sub_2213602152_3536714472(char *, char *, int , int );


static void work_a_3533975860_3212880686_p_0(char *t0)
{
    char t15[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    int t13;
    int t14;
    unsigned int t16;

LAB0:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t11 = (t4 == (unsigned char)2);
    if (t11 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 2952);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 4612);
    t6 = (t0 + 3032);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 4U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1648U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((int *)t1) = 0;
    goto LAB3;

LAB5:    xsi_set_current_line(49, ng0);
    t5 = (t0 + 1648U);
    t6 = *((char **)t5);
    t13 = *((int *)t6);
    t14 = (t13 + 1);
    t5 = (t0 + 1648U);
    t7 = *((char **)t5);
    t5 = (t7 + 0);
    *((int *)t5) = t14;
    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1648U);
    t2 = *((char **)t1);
    t13 = *((int *)t2);
    t1 = ieee_p_3499444699_sub_2213602152_3536714472(IEEE_P_3499444699, t15, t13, 4);
    t5 = (t15 + 12U);
    t16 = *((unsigned int *)t5);
    t16 = (t16 * 1U);
    t3 = (4U != t16);
    if (t3 == 1)
        goto LAB10;

LAB11:    t6 = (t0 + 3032);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 4U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB3;

LAB7:    t1 = (t0 + 992U);
    t12 = xsi_signal_has_event(t1);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_size_not_matching(4U, t16, 0);
    goto LAB11;

}


extern void work_a_3533975860_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3533975860_3212880686_p_0};
	xsi_register_didat("work_a_3533975860_3212880686", "isim/fzyserial_tb_isim_beh.exe.sim/work/a_3533975860_3212880686.didat");
	xsi_register_executes(pe);
}
