package com.example.ris_lab3_1.servlet;

import java.io.*;

import com.example.ris_lab3_1.service.UserService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "DefaultServlet", urlPatterns = "/index")
public class HelloServlet extends HttpServlet {

    @EJB
    private UserService userService;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String subscriptionId = request.getParameter("subscriptionId");
        if ( subscriptionId!= null && !subscriptionId.isEmpty()) {
            request.setAttribute("users",
                    userService.getUsers(Long.parseLong(subscriptionId)));

        } else  request.setAttribute("users", userService.getUsers());
        request.setAttribute("subscriptions", userService.getSubscriptions());
        request.setAttribute("subscriptionId", subscriptionId);
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}