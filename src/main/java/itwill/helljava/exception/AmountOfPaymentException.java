package itwill.helljava.exception;

public class AmountOfPaymentException extends Exception {

	private static final long serialVersionUID = 1L;

	public AmountOfPaymentException() {

	}

	public AmountOfPaymentException(String message) {
		super(message);
	}
}
