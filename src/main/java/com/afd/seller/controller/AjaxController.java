package com.afd.seller.controller;

import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.afd.common.util.CapthaUtils;
import com.afd.service.seller.ISellerLoginService;
import com.afd.service.sms.ISmsService;

@Controller
@RequestMapping("/ajax")
public class AjaxController {
	private static final Logger logger = LoggerFactory
			.getLogger(AjaxController.class);

	private static final String SELLER_REGISTER_VALIDATOR_PREFIX = "afd_seller_register_validator_"; // 卖家注册验证码前缀
	private static final String SELLER_FORGOT_PASSWORD_VALIDATOR_PREFIX = "afd_seller_forgot_password_validator_"; // 卖家忘记密码验证码前缀
	// private static final String SELLER__MODIFY_PASSWORD_VALIDATOR_PREFIX =
	// "afd_seller_modify_password_validator_"; // 卖家修改密码验证码前缀

	@Autowired
	private ISellerLoginService loginService;

	@Autowired
	private ISmsService smsService;

	@Autowired
	private RedisTemplate<String, String> redisTemplate;

	/**
	 * 验证卖家账号是否已被使用
	 * 
	 * @param loginName
	 * @return
	 */
	@RequestMapping("/existLoginName")
	@ResponseBody
	public Boolean existLoginName(@RequestParam("loginName") String loginName) {
		Boolean b = null;

		try {
			b = loginService.existLoginName(loginName);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		return b;
	}

	/**
	 * 验证卖家昵称是否已被使用
	 * 
	 * @param nickname
	 * @return
	 */
	@RequestMapping("/existNickname")
	@ResponseBody
	public Boolean existNickname(@RequestParam("nickname") String nickname) {
		Boolean b = null;
		try {
			b = loginService.existLoginName(nickname);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		return b;
	}

	/**
	 * 发送卖家注册验证码
	 * 
	 * @param mobile
	 * @return
	 */
	@RequestMapping("/register/sendValidator")
	@ResponseBody
	public Boolean registerSendValidator(@RequestParam("mobile") String mobile) {
		Boolean b = null;

		// 获取一个6位数字验证码
		String validator = CapthaUtils.getNumber(6);

		int ret = smsService.sendSms(mobile, "尊敬的客户，您的注册动态验证码为：" + validator
				+ "，请在5分钟内完成注册！");

		if (ret == 0) {
			// 将验证码放入缓存，有效期5分钟
			redisTemplate.opsForValue().set(
					SELLER_REGISTER_VALIDATOR_PREFIX + mobile, validator, 300,
					TimeUnit.SECONDS);

			b = true;
		}

		return b;
	}

	/**
	 * 验证卖家注册验证码
	 * 
	 * @param mobile
	 * @param validator
	 * @return
	 */
	@RequestMapping("/register/checkValidator")
	@ResponseBody
	public Boolean registerCheckValidator(
			@RequestParam("mobile") String mobile,
			@RequestParam("validator") String validator) {

		String cachedValidator = (String) redisTemplate.opsForValue().get(
				SELLER_REGISTER_VALIDATOR_PREFIX + mobile);

		return validator.equals(cachedValidator);
	}

	/**
	 * 发送卖家忘记密码验证码
	 * 
	 * @param mobile
	 * @return
	 */
	@RequestMapping("/forgetPassword/sendValidator")
	@ResponseBody
	public Boolean forgetPasswordSendValidator(
			@RequestParam("mobile") String mobile) {
		Boolean b = null;

		// 获取一个6位数字验证码
		String validator = CapthaUtils.getNumber(6);

		int ret = smsService.sendSms(mobile, "尊敬的客户，您的找回密码动态验证码为：" + validator
				+ "，请在5分钟内完成操作！");

		if (ret == 0) {
			b = true;
			// 将验证码放入缓存，有效期5分钟
			redisTemplate.opsForValue().set(
					SELLER_FORGOT_PASSWORD_VALIDATOR_PREFIX + mobile,
					validator, 300, TimeUnit.SECONDS);
		}

		return b;
	}

	/**
	 * 验证卖家忘记密码验证码
	 * 
	 * @param mobile
	 * @param validator
	 * @return
	 */
	@RequestMapping("/forgetPassword/checkValidator")
	@ResponseBody
	public Boolean forgetPasswordCheckValidator(
			@RequestParam("mobile") String mobile,
			@RequestParam("validator") String validator) {

		String cachedValidator = (String) redisTemplate.opsForValue().get(
				SELLER_FORGOT_PASSWORD_VALIDATOR_PREFIX + mobile);

		return validator.equals(cachedValidator);
	}
}
