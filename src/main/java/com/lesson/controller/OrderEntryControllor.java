package com.lesson.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class OrderEntryControllor {
    Logger logger = Logger.getLogger(OrderEntryControllor.class);

    /**
     * 展示菜品
     *
     * @param model
     * @param mid     菜品id （查询用）
     * @param cid     菜品分类id （查询用）
     * @param request
     * @return
     */
    @RequestMapping(value = "/showMenus")
    public String showMenus(Model model,
                            @RequestParam(value = "mid", required = false) String mid,
                            @RequestParam(value = "cid", required = false) String cid,
                            @RequestParam(value = "useCookie", required = false) String useCookie,
                            HttpServletRequest request,
                            HttpServletResponse response) {
        logger.info("mid = " + mid);
        logger.info("cid = " + cid);
        logger.info("useCookie = " + useCookie);

        return "jsp/menuList.jsp";
    }

}
