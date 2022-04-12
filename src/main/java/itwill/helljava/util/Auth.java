package itwill.helljava.util;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
@Target({ TYPE, METHOD })
public @interface Auth {
	public enum Role {
		ALL, ADMIN, TRAINER, USER, USER_PRETRAINER, PRETRAINER_TRAINER, USER_PRETRAINER_ADMIN
	}

	public Role role() default Role.ALL;
}
