#include "stm32f412zx.h"
void delay(int dd);
void EXTI15_10_IRQHandler(void);

int main()
{
	__disable_irq();
	RCC->AHB1ENR |=0x02; // Enable Clock Port B
	RCC->AHB1ENR |=0x4; // Enable Clock Port C PB connected to PC13
	RCC->APB2ENR |=0X4000; // Enable clock to SYSCFG
	GPIOB->MODER |=0x00004000; // Mode Register for PB7

	SYSCFG->EXTICR[3]=0X0020; // Port C for EXT 13 INTERRUPT
	EXTI->IMR |=0x2000; //interupt mask register unmask interrupt
	EXTI->FTSR |=0x2000; // rising edge
	NVIC_EnableIRQ(EXTI15_10_IRQn);
	__enable_irq();
	while(1){}
}

void EXTI15_10_IRQHandler(void)
{
	GPIOB->ODR=0X80; //Turn on LED
	delay(20000);	
	GPIOB->ODR=0X00;
	delay(20000);	
	GPIOB->ODR=0X80; //Turn on LED
	delay(20000);
	GPIOB->ODR=0X00;
	delay(20000);	
	GPIOB->ODR=0X80; //Turn on LED
	delay(20000);	
	GPIOB->ODR=0X00;
	delay(20000);	
	GPIOB->ODR=0X80; //Turn on LED
	delay(20000);	
	GPIOB->ODR=0X00;
	delay(20000);	
	GPIOB->ODR=0X80; //Turn on LED
	delay(20000);	
	GPIOB->ODR=0X00;
	delay(20000);	
	GPIOB->ODR=0X80; //Turn on LED
	delay(20000);	
	GPIOB->ODR=0X00;
	delay(20000);	
	GPIOB->ODR=0X80; //Turn on LED
	delay(20000);	
	GPIOB->ODR=0X00;
	delay(20000);	
	GPIOB->ODR=0X80;
	EXTI->PR =0X2000;
	
}


void delay (int dd) {//De	lay function definition

int i;
	for (;dd>0;dd--)
	{
		for(i=0;i<200;i++);
	}
}
