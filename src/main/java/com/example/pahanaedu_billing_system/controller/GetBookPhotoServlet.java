package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dto.GetBookPhotoDTO;
import com.example.pahanaedu_billing_system.service.GetBookPhotoService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/GetBookPhotoServlet")
public class GetBookPhotoServlet extends HttpServlet {
    private final GetBookPhotoService service = new GetBookPhotoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookid = request.getParameter("bookid");
        if (bookid == null || bookid.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Book ID is required.");
            return;
        }

        GetBookPhotoDTO photoDTO = service.getBookPhotoById(bookid);

        if (photoDTO == null || photoDTO.getBookphoto() == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found for book.");
            return;
        }

        response.setContentType("image/jpeg");
        OutputStream out = response.getOutputStream();
        out.write(photoDTO.getBookphoto());
        out.flush();
        out.close();
    }
}
