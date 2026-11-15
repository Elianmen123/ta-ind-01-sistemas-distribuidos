package ec.edu.uteq.catalogo;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class ServicioCatalogoApplication {

    @Value("${server.port}")
    private String puerto;

    public static void main(String[] args) {
        SpringApplication.run(ServicioCatalogoApplication.class, args);
    }

    @GetMapping("/info")
    public String info() {
        return "servicio-catalogo respondiendo desde el puerto " + puerto
                + " a las " + LocalDateTime.now();
    }
}
