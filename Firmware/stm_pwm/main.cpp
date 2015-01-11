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
//void initMCO(void){
//	GPIO_InitTypeDef gpio;
//	gpio.GPIO_Pin = GPIO_Pin_8;
//	gpio.GPIO_Mode = GPIO_Mode_AF;
//	gpio.GPIO_OType = GPIO_OType_PP;
//	gpio.GPIO_PuPd = GPIO_PuPd_UP;
//	gpio.GPIO_Speed = GPIO_Speed_100MHz;
//	GPIO_Init(GPIOA, &gpio);
//
//	GPIO_PinAFConfig(GPIOA, GPIO_PinSource8, GPIO_AF_MCO);
//
//	RCC_MCO1Config(RCC_MCO1Source_PLLCLK, RCC_MCO1Div_4);
//}
//
//int main(void) {
//	// Setup clocks
//	initRCC();
//
//	// Enable peripheral clocks
//	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
//	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);
//	RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC, ENABLE);
//
//	// Setup MCO
//	initMCO();
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
//
//	// Setup NVIC
//	NVIC_InitTypeDef nvic;
//	nvic.NVIC_IRQChannel = TIM2_IRQn;
//	nvic.NVIC_IRQChannelPreemptionPriority = 0;
//	nvic.NVIC_IRQChannelSubPriority = 1;
//	nvic.NVIC_IRQChannelCmd = ENABLE;
//	NVIC_Init(&nvic);
//
//	// Init ESC
//	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);
//
//	/* Main loop */
//	while(1) {
//		/* Empty loop */
//	}
//}

//void initialize_timer(int period)
//{
//	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);
//
//	TIM_TimeBaseInitTypeDef timer;
//	timer.TIM_Prescaler = 40000;
//	timer.TIM_CounterMode = TIM_CounterMode_Up;
//	timer.TIM_Period = period;
//	timer.TIM_ClockDivision = TIM_CKD_DIV1;
//	timer.TIM_RepetitionCounter = 0;
//
//	TIM_TimeBaseInit(TIM2, &timer);
//	TIM_Cmd(TIM2, ENABLE);
//}
//
//
//void initialize_pwm_channel()
//{
//	TIM_OCInitTypeDef output = {0,};
//	output.TIM_OCMode = TIM_OCMode_PWM1;
//	output.TIM_Pulse = 400;
//	output.TIM_OutputState = TIM_OutputState_Enable;
//	output.TIM_OCPolarity = TIM_OCPolarity_High;
//
//	TIM_OC1Init(TIM2, &output);
//	TIM_OC1PreloadConfig(TIM2, TIM_OCPreload_Enable);
//
//	GPIO_PinAFConfig(GPIOA, GPIO_PinSource5, GPIO_AF_TIM2);
//}
//
//void initialize_led()
//{
//	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
//
//	GPIO_InitTypeDef gpio;
//	gpio.GPIO_Pin = GPIO_Pin_5;
//	gpio.GPIO_Mode = GPIO_Mode_AF;
//	gpio.GPIO_Speed = GPIO_Speed_50MHz;
//
//	GPIO_Init(GPIOA, &gpio);
//}

volatile int servo_angle[6] = { 1500, 1500, 1500, 1500, 1500, 1500 }; // +/- 90.0 degrees
int pressed = 0;

void RCC_configuration() {
	//TIM2 clock enable
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);

	//GPIOA Clock Enable
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
}

void NVIC_configuration() {
	NVIC_InitTypeDef nvic;

	nvic.NVIC_IRQChannel = TIM2_IRQn;
	nvic.NVIC_IRQChannelPreemptionPriority = 0;
	nvic.NVIC_IRQChannelSubPriority = 1;
	nvic.NVIC_IRQChannelCmd = ENABLE;

	NVIC_Init(&nvic);
}

void gpio_configuration() {
	GPIO_InitTypeDef gpio;

	gpio.GPIO_Pin = GPIO_Pin_5;
	gpio.GPIO_Mode = GPIO_Mode_AF;
	gpio.GPIO_OType = GPIO_OType_PP;
	gpio.GPIO_PuPd = GPIO_PuPd_NOPULL;
	gpio.GPIO_Speed = GPIO_Speed_100MHz;

	GPIO_Init(GPIOA, &gpio);
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource5, GPIO_AF_TIM2);

	gpio.GPIO_Pin = GPIO_Pin_13;
	gpio.GPIO_Mode = GPIO_Mode_IN;
	gpio.GPIO_Speed = GPIO_Speed_50MHz;
	gpio.GPIO_OType = GPIO_OType_PP;
	gpio.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(GPIOC, &gpio);
	GPIO_ResetBits(GPIOC, GPIO_Pin_13);
}

void TIM2_configuration() {
	TIM_OCInitTypeDef oc;
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
	TIM_OC1PreloadConfig(TIM2, TIM_OCPreload_Enable);

	TIM_ITConfig(TIM2, TIM_IT_Update, ENABLE);

	TIM_Cmd(TIM2, ENABLE);
}

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
		if(!pressed)
		{
			width = 1550;
		}

		TIM_SetCompare1(TIM2, width);
	}
}
