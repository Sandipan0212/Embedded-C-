#include "stm32f412zx.h"
void delay(int dd);
int main()
{
RCC->AHB1ENR |=0x02; // Enables Clock

GPIOB->MODER |=0x10004000; // Mode Register for PB7
//GPIOB->ODR=0x80; // Output Data Register for PB7
while(1)
{
GPIOB->ODR=0x4000;

delay(20000);
GPIOB->ODR=0x00;


delay(10000);
}
}
void delay (int dd) { //Delay function definition

int i;
for (;dd>0;dd--)
{
for(i=0;i<200;i++);
}
}
