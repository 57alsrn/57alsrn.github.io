package com.demo.controller;

import com.demo.service.MainService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


@Controller
public class MainController {
    /**
     *
     * 안쓰는거임!
     *
     *
     *
     */
    @Autowired
    MainService MainService;

    // Set logger
    private final Logger logger = LogManager.getLogger(this.getClass());

    // Get class name for logger
    private final String className = this.getClass().toString();




}
