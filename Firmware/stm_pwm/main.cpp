#include "stm32f4xx.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_tim.h"
#include "misc.h"

//void initRCC(void) {
//	//Enable High Speed Internal Oscillator
//	RCC_HSICmd(ENABLE);
//	while (RCC_GetFlagStatus(RCC_FLAG_HSIRDY) == RESET);
//
//	//Enable PLL
//	RCC_PLLConfig(RCC_PLLSource_HSI, 12, 252, 8, 4);
//	RCC_PLLCmd(ENABLE);
//	while (RCC_GetFlagStatus(RCC_FLAG_PLLRDY) == RESET);
//
//	//Set PLL as System Clock
//	RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);
//
//	//Update State
//	SystemCoreClockUpdate();
//}
//
//	// Setup timer
//	TIM_TimeBaseInitTypeDef timer;
//	timer.TIM_Prescaler = 4200;
//	timer.TIM_CounterMode = TIM_CounterMode_Up;
//	timer.TIM_Period = 16;
//	timer.TIM_ClockDivision = TIM_CKD_DIV1;
//	timer.TIM_RepetitionCounter = 0;
//	TIM_TimeBaseInit(TIM3, &timer);
//	TIM_Cmd(TIM3, ENABLE);
//	TIM_ClearITPendingBit(TIM3, TIM_IT_Update);
//	TIM_ITConfig(TIM3, TIM_IT_Update, ENABLE);

//volatile because it is accessed in an interrupt i believe
//totally a guess though. values are in microseconds (us)
volatile int servo_angle[6] = { 1500, 1500, 1500, 1500, 1500, 1500 };
int pressed = 0;

void RCC_configuration() {
	//TIM2, TIM3 clock enable
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2 | RCC_APB1Periph_TIM3, ENABLE);

	//GPIOA, GPIOB, GPIOC Clock Enable
	RCC_AHB1PeriphClockCmd(
			RCC_AHB1Periph_GPIOA | RCC_AHB1Periph_GPIOB | RCC_AHB1Periph_GPIOC,
			ENABLE);
}

void NVIC_configuration() {
	//Setting up interrupt controller
	NVIC_InitTypeDef nvic;

	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);

	//Set up TIM2 Interrupts
	nvic.NVIC_IRQChannel = TIM2_IRQn;
	nvic.NVIC_IRQChannelPreemptionPriority = 0;
	nvic.NVIC_IRQChannelSubPriority = 1;
	nvic.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&nvic);

	//Set up TIM3 Interrupts
	nvic.NVIC_IRQChannel = TIM3_IRQn;
	nvic.NVIC_IRQChannelPreemptionPriority = 0;
	nvic.NVIC_IRQChannelSubPriority = 1;
	nvic.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&nvic);
}

void gpio_configuration() {
	GPIO_InitTypeDef gpio;

	//Port A Pin 5 PWM2/1 and Port A Pin 6 PWM3/1
	gpio.GPIO_Pin = GPIO_Pin_5;
	gpio.GPIO_Mode = GPIO_Mode_AF;
	gpio.GPIO_OType = GPIO_OType_PP;
	gpio.GPIO_PuPd = GPIO_PuPd_NOPULL;
	gpio.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_Init(GPIOA, &gpio);

	//Connect to TIM2 ... Called "Alternative Function" but not
	//sure what it is doing exactly
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource5, GPIO_AF_TIM2);

	//Port A Pin 6 PWM3/1
	gpio.GPIO_Pin = GPIO_Pin_6;
	gpio.GPIO_Mode = GPIO_Mode_AF;
	gpio.GPIO_OType = GPIO_OType_PP;
	gpio.GPIO_PuPd = GPIO_PuPd_NOPULL;
	gpio.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_Init(GPIOA, &gpio);

	//Connect to TIM2 ... Called "Alternative Function" but not
	//sure what it is doing exactly
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource6, GPIO_AF_TIM3);

	//Port B Pin 3 PWM2/2
	gpio.GPIO_Pin = GPIO_Pin_3;
	gpio.GPIO_Mode = GPIO_Mode_AF;
	gpio.GPIO_OType = GPIO_OType_PP;
	gpio.GPIO_PuPd = GPIO_PuPd_NOPULL;
	gpio.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_Init(GPIOB, &gpio);

	//See Port A GPIO_PinAFConfig
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource3, GPIO_AF_TIM2);

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

void TIM2_configuration() {
	//Timer Output Comparator Struct
	TIM_OCInitTypeDef oc;
	//Time Base Struct gets counters all nice and configured
	TIM_TimeBaseInitTypeDef tb;

	tb.TIM_Prescaler = 15;
	tb.TIM_Period = 20000 - 1;
	tb.TIM_ClockDivision = 0;
	tb.TIM_CounterMode = TIM_CounterMode_Up;
	TIM_TimeBaseInit(TIM2, &tb);

	TIM_ARRPreloadConfig(TIM2, ENABLE);

	oc.TIM_OCMode = TIM_OCMode_PWM1;
	oc.TIM_OutputState = TIM_OutputState_Enable;
	oc.TIM_Pulse = 1500;
	oc.TIM_OCNPolarity = TIM_OCPolarity_High;
	TIM_OC1Init(TIM2, &oc);
	TIM_OC2Init(TIM2, &oc);

	//PWM2/1
	TIM_OC1PreloadConfig(TIM2, TIM_OCPreload_Enable);
	//PWM2/2
	TIM_OC2PreloadConfig(TIM2, TIM_OCPreload_Enable);

	TIM_ITConfig(TIM2, TIM_IT_Update, ENABLE);

	TIM_Cmd(TIM2, ENABLE);
}

//void TIM3_configuration() {
//	//Timer Output Comparator Struct
//	TIM_OCInitTypeDef oc;
//	//Time Base Struct gets counters all nice and configured
//	TIM_TimeBaseInitTypeDef tb;
//
//	tb.TIM_Prescaler = 15;
//	tb.TIM_Period = 20000 - 1;
//	tb.TIM_ClockDivision = 0;
//	tb.TIM_CounterMode = TIM_CounterMode_Up;
//	TIM_TimeBaseInit(TIM3, &tb);
//
//	TIM_ARRPreloadConfig(TIM3, ENABLE);
//
//	oc.TIM_OCMode = TIM_OCMode_PWM1;
//	oc.TIM_OutputState = TIM_OutputState_Enable;
//	oc.TIM_Pulse = 1500;
//	oc.TIM_OCNPolarity = TIM_OCPolarity_High;
//	TIM_OC1Init(TIM3, &oc);
//
//	//PWM3/1
//	TIM_OC1PreloadConfig(TIM3, TIM_OCPreload_Enable);
//
//	TIM_ITConfig(TIM3, TIM_IT_Update, ENABLE);
//
//	TIM_Cmd(TIM3, ENABLE);
//}

int main() {
	RCC_configuration();
	gpio_configuration();
	NVIC_configuration();
	TIM2_configuration();
	while (1) {
		pressed = GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_13);
	}
}

extern "C" void TIM2_IRQHandler() {
	if (TIM_GetITStatus(TIM2, TIM_IT_Update) != RESET) {
		TIM_ClearITPendingBit(TIM2, TIM_IT_Update);

		int width = 1500;
		if (!pressed) {
			width = 1550;
		}

		TIM_SetCompare1(TIM2, width);
	}
}
