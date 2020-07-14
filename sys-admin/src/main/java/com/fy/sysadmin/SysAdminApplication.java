package com.fy.sysadmin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;

@SpringBootApplication
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SysAdminApplication {
    public static void main(String[] args) {
        SpringApplication.run(SysAdminApplication.class, args);
    }

}
