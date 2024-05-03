package com.example.ris_lab3_1.servlet;

import com.example.ris_lab3_1.entity.Subscription;
import com.example.ris_lab3_1.entity.User1;
import com.example.ris_lab3_1.service.UserService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name = "update", urlPatterns = "/update")
public class UpdateServlet extends HttpServlet {

    @EJB
    private UserService userService;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            User1 user1 = userService.getUser(Long.parseLong(id));
            request.setAttribute("user1", user1);
            request.setAttribute("subscriptionId", user1.getSubscription().getId());
        }

        request.setAttribute("subscriptions", userService.getSubscriptions());
        getServletContext().getRequestDispatcher("/update.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User1 user1 = User1.builder()
                .firstName(req.getParameter("first"))
                .lastName(req.getParameter("last"))
                .age(Double.parseDouble(req.getParameter("age")))
                .subscription(
                        Subscription
                                .builder()
                                .id(Long.parseLong(req.getParameter("subscription")))
                                .build()
                )
                .build();

        String id = req.getParameter("id");
        if (id != null && !id.isEmpty()) {
            user1.setId(Long.parseLong(id));
            userService.updateUser(user1);
        } else {
            userService.addUser(user1);
        }

        resp.sendRedirect("/RIS_Lab3_1-1.0-SNAPSHOT/index");
    }

}