package kb04.team02.web.mvc.saving.exception;

public class NoSavingDetailException extends RuntimeException {
    public NoSavingDetailException() {

    }
    public NoSavingDetailException(String message) {
        super(message);
    }
}