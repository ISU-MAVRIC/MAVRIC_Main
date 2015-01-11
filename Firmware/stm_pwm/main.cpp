#include "stm32f4xx.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_tim.h"
#include "misc.h"
#include <stdio.h>

//volatile because it is accessed in an interrupt i believe
//totally a guess though. values are in microseconds (us)
volatile int servo_angle[3] = { 1500, 1500, 1500 };
int pressed = 0;

void RCC_configuration() {
	//TIM1 clock enable
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM1, ENABLE);

	//GPIOB, GPIOC Clock Enable
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA | RCC_AHB1Periph_GPIOC, ENABLE);
}

void NVIC_configuration() {
	//Setting up interrupt controller
	NVIC_InitTypeDef nvic;

	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);

	//Set up TIM1 Interrupts
	nvic.NVIC_IRQChannel = TIM1_UP_TIM10_IRQn;
	nvic.NVIC_IRQChannelPreemptionPriority = 0;
	nvic.NVIC_IRQChannelSubPriority = 1;
	nvic.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&nvic);
}

void GPIO_configuration() {
	GPIO_InitTypeDef gpio;

	//Port A Pin 8, 9, 10 for PWM1/1, 1/2, 1/3
	gpio.GPIO_Pin = GPIO_Pin_8 | GPIO_Pin_9 | GPIO_Pin_10;
	gpio.GPIO_Mode = GPIO_Mode_AF;
	gpio.GPIO_OType = GPIO_OType_PP;
	gpio.GPIO_PuPd = GPIO_PuPd_NOPULL;
	//used to be 100MHz changed to 50 for troubleshooting
	gpio.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOA, &gpio);

	//Alternative Function for PWM1/1
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource8, GPIO_AF_TIM1);
	//Alternative Function for PWM1/2
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource9, GPIO_AF_TIM1);
	//Alternative Function for PWM1/3
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource10, GPIO_AF_TIM1);

	//Port C Pin 13 USER_BUTTON
	gpio.GPIO_Pin = GPIO_Pin_13;
	gpio.GPIO_Mode = GPIO_Mode_IN;
	gpio.GPIO_Speed = GPIO_Speed_50MHz;
	gpio.GPIO_OType = GPIO_OType_PP;
	gpio.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOC, &gpio);

	//Make sure this pin isn't initially set to some indeterminate value
	GPIO_ResetBits(GPIOC, GPIO_Pin_13);
}

void TIM1_configuration() {
	//Timer Output Comparator Struct
	TIM_OCInitTypeDef oc;

	//Time Base Struct gets counters all nice and configured
	TIM_TimeBaseInitTypeDef tb;

	tb.TIM_Prescaler = 15;
	tb.TIM_Period = 20000 - 1;
	tb.TIM_ClockDivision = 0;
	tb.TIM_CounterMode = TIM_CounterMode_Up;
	TIM_TimeBaseInit(TIM1, &tb);

	TIM_ARRPreloadConfig(TIM1, ENABLE);

	oc.TIM_OCMode = TIM_OCMode_PWM1;
	oc.TIM_OutputState = TIM_OutputState_Enable;
	oc.TIM_Pulse = 1500;
	oc.TIM_OCNPolarity = TIM_OCPolarity_High;
	//PWM1/1
	TIM_OC1Init(TIM1, &oc);
	//PWM1/2
	TIM_OC2Init(TIM1, &oc);
	//PWM1/3
	TIM_OC3Init(TIM1, &oc);

	//PWM1/1
	TIM_OC1PreloadConfig(TIM1, TIM_OCPreload_Enable);
	//PWM1/2
	TIM_OC2PreloadConfig(TIM1, TIM_OCPreload_Enable);
	//PWM1/3
	TIM_OC3PreloadConfig(TIM1, TIM_OCPreload_Enable);

	TIM_CtrlPWMOutputs(TIM1, ENABLE);
	//Set up interrupt for the timer
	TIM_ITConfig(TIM1, TIM_IT_Update, ENABLE);

	TIM_Cmd(TIM1, ENABLE);
}

int main() {
	RCC_configuration();
	GPIO_configuration();
	NVIC_configuration();
	TIM1_configuration();
	while (1) {
		pressed = GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_13);
	}
}

extern "C" void TIM1_UP_TIM10_IRQHandler() {
	if (TIM_GetITStatus(TIM1, TIM_IT_Update) != RESET) {
		TIM_ClearITPendingBit(TIM1, TIM_IT_Update);

		int width1 = 1500;
		int width2 = 1500;
		int width3 = 1500;
		if (!pressed) {
			width1 = 1550;
			width2 = 1650;
			width3 = 1750;
		}

		TIM_SetCompare1(TIM1, width1);
		TIM_SetCompare2(TIM1, width2);
		TIM_SetCompare3(TIM1, width3);
	}
}
