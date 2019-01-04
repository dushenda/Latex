#include <stdio.h>
#include "system.h"
#include "sys/alt_irq.h"
#include "sys/alt_alarm.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_timer_regs.h"
#include "unistd.h"
#include "alt_types.h"

typedef struct
{
		unsigned long int DATA;
		unsigned long int DIRECTION;
		unsigned long int INTERRUPT_MASK;
		unsigned long int EDGE_CAPTURE;
}PIO_STR;

typedef struct		//定时器寄存器
{
		unsigned long int STATUS;
		unsigned long int CONTROL;
		unsigned long int PERIOD_L;
		unsigned long int PERIOD_H;
		unsigned long int SNAP_L;
		unsigned long int SNAP_H;
}TIMER_STR;

#define SEG_ONE             ((PIO_STR*)SEG_ONE_BASE)
#define SEG_TWO             ((PIO_STR*)SEG_TWO_BASE)
#define SEG_THREE           ((PIO_STR*)SEG_THREE_BASE)
#define SEG_FOUR            ((PIO_STR*)SEG_FOUR_BASE)
#define TIMER               ((TIMER_STR*)TIMER_BASE)   //指向定时器结构体
#define KEY_RIGHT           ((PIO_STR*)KEY_RIGHT_BASE)

unsigned char table[] = {0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};	
unsigned char second = 0;	
unsigned char minute = 0;	
unsigned char hour = 0;		

alt_u8 led8 = 0x02;     // 0000 0010
alt_u8 dir = 0;        // 0000 0000
volatile int i;

void ISR_Timer(void *context,alt_u32 id)  //定时器中断服务函数
{
		second++;
		TIMER->STATUS &= 0x00;  //清中断标志位
}
//显示函数
void display(unsigned char hour,unsigned char min,unsigned char sec)
{
		unsigned char ge,shi;
		ge = sec%10;
		shi = sec/10;

		SEG_ONE -> DATA = 0xff;
		SEG_ONE -> DATA = table[ge];
		usleep(1000);

		SEG_TWO -> DATA = 0xff;
		SEG_TWO -> DATA = table[shi];
		usleep(1000);

		ge = min%10;
		shi = min/10;

		SEG_THREE -> DATA = 0xff;
		SEG_THREE -> DATA = table[ge];
		usleep(1000);

		SEG_FOUR -> DATA = 0xff;
		SEG_FOUR -> DATA = table[shi];
		usleep(1000);

}

int main(void)  //主函数
{
		//注册中断
		alt_irq_register(TIMER_IRQ,(void*)TIMER_BASE,ISR_Timer); 
		//初始化中断周期,周期为一秒
		TIMER -> PERIOD_L = 50000000&0xffff; 
		TIMER -> PERIOD_H = 50000000>>16;
		TIMER -> CONTROL = 0x07;  //启动定时器并开中断

while(1)
    {
//seg
		if(second > 59)
			{
				second = 0;
				minute++;
			}
		if(minute > 59)
			{
				minute = 0;
				hour++;
			}
		if(hour>23)
			{
				hour = 0;
			}

		display(hour,minute,second);

		/*if(KEY_LEFT -> DATA == 0)  //按键控制
		{
				usleep(20000);
				hour++;
		}*/
		if(KEY_RIGHT -> DATA == 0)
		{
				usleep(20000);
				minute++;
        }

//led
		//led=1000 0000/0000 0001时候,这个if语句都会执行
		if (led8 & 0x81) 
		{
		      dir = (dir ^ 0x01); //1
	    }
	    if (dir) //1
	    {
		      led8 = led8 >> 1;   //LED右移动显示 
		 }
		else
		{
		      led8 = led8 << 1;   //LED左移动显示
		}

		IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE,led8);  //赋值

		 i = 0;
		    while (i<250000)  //延时
		         i++;
    }
		return 0;
}
