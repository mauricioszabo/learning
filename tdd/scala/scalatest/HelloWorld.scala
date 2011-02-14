import org.specs._

object HelloWorld extends Specification {
    "'hello world' has 11 characters" in {
        "hello world".size must_== 11
    }

    "'hello world' matches 'h.* w.*'" in {
        "hello world" must be matching("h.* w.*")
    }
}
