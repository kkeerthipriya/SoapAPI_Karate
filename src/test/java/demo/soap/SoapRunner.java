package demo.soap;

/**
 * Created by Kiran Parepalli on 10/12/2017.
 */
import com.intuit.karate.junit4.Karate;
import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@CucumberOptions(features = "classpath:demo/soap/soap.feature")
public class SoapRunner {

}