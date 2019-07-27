package org.anton.crud_spring_app.controller;

import org.anton.crud_spring_app.domain.Book;
import org.anton.crud_spring_app.repo.BookRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by qanto on 21.07.2019.
 */
@Controller
public class MainController {

    @Autowired
    private BookRepo bookRepo;

    @GetMapping("/")
    public String greeting(Model model) {
        return "greeting";
    }

    @GetMapping("/books")
    public String books(Model model) {
        Iterable<Book> books = bookRepo.findAll();
        model.addAttribute("books", books);
        return "books";
    }

    @PostMapping("/books")
    public String addBook(@RequestParam String title, @RequestParam String author, @RequestParam Double price, Model model) {
        Book book = new Book(title, author, price);
        bookRepo.save(book);

        Iterable<Book> books = bookRepo.findAll();
        model.addAttribute("books", books);

        return "books";
    }

    @PostMapping("delete")
    public String deleteBook(Model model, @RequestParam int id) {
        Book book = bookRepo.findById(id);

        bookRepo.delete(book);

        return "redirect:/books";
    }
}
