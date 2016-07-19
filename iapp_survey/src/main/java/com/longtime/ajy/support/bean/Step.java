package com.longtime.ajy.support.bean;

/**
 * 
 * Step step = Step.from();
 * step.doit(1); //完成第一步
 * 
 * step.doit(2);//完成第二步
 * 
 * boolean b = step.isDo(2);// 是否完成第2步
 * 从 1 开始
 */
public class Step {
	private int value = 0;

	private Step(int value) {
		if (value < 0) {
			value = 0;
		}
		this.value = value;
	}

	public static Step from() {
		return new Step(0);
	}

	public static Step from(int value) {
		return new Step(value);
	}

	public Step doit(int stepNum) {
		if (stepNum < 1) {
			return this;
		}
		this.value = this.value | (1 << (stepNum - 1));
		return this;
	}
	
	public boolean isDo(int stepNum) {
		if (stepNum < 1) {
			return true;
		}
		return (this.value & (1 << (stepNum - 1))) > 0;

	}

	public boolean idDoAll(int totalStep) {
		if (totalStep < 1) {
			return true;
		}
		return this.value == (1 << totalStep) - 1;

	}

	public int value() {
		return this.value;
	}

	public static void main(String[] args) {
		System.out.println(1 << 8);
//		Step step = Step.from();
//		step.doit(1);
//		step.doit(2);
//		step.doit(3);
//		step.doit(4);
//		System.out.println(step.value());

//		step.doit(1);
//		System.out.println(step.value());
//
//		System.out.println(true == step.isDo(1));
//		System.out.println(false == step.isDo(2));
//		System.out.println(step.idDoAll(3) == false);
//
//		step.doit(3);
//		System.out.println(step.value());
//		System.out.println(true == step.isDo(3));
//		System.out.println(false == step.isDo(2));
//
//		System.out.println(step.idDoAll(3) == false);
//
//		step.doit(2);
//		System.out.println(step.value());
//
//		System.out.println(step.idDoAll(3) == true);

	}
}
