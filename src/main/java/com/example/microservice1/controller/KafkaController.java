package com.example.microservice1.controller;

import com.example.microservice1.services.KafkaProducerService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
@AllArgsConstructor
@RestController
public class KafkaController {
        private KafkaProducerService kafkaProducerService;

        @GetMapping("/hello")
        public String hello() {
            return "Hello from Microservice1";
        }
        @PostMapping("/produce")
        public void sendMessageToKafka(@RequestBody String message) {
            kafkaProducerService.sendMessage(message);
        }
    }
