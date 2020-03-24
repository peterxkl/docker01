package xiekunlong;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @RequestMapping("/user/find")
    @ResponseBody
    public Object findUser() {
        Map<String, String> map = new HashMap<>();
        map.put("name", "dillon");
        map.put("age", "22");
        return map;
    }
}