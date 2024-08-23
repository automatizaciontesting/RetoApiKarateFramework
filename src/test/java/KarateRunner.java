
import com.intuit.karate.junit5.Karate;

public class KarateRunner {
    @Karate.Test
    Karate testUsers() {

        return Karate.run("features/crud.feature").tags("@updateBooking").relativeTo(getClass());
    }
}
