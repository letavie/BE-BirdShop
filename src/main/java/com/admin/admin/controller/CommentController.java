package com.admin.admin.controller;

import com.admin.admin.model.Comment;
import com.admin.admin.service.impl.CommentServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/comment")
@CrossOrigin(origins = "http://localhost:3000")
@RequiredArgsConstructor
public class CommentController {
    private final CommentServiceImpl commentService;
    @GetMapping
    public ResponseEntity<?> getCommentByProduct(@RequestParam Long id){
        return ResponseEntity.ok(commentService.getCommentByProduct(id));
    }
    @GetMapping("getAll")
    public ResponseEntity<?> getAll(){
        return ResponseEntity.ok(commentService.getAll());
    }
    @PostMapping("/add")
    public ResponseEntity<?> addComment(@RequestBody Comment comment){
        return ResponseEntity.ok(commentService.addComment(comment));
    }
    @PutMapping()
    public ResponseEntity<?> deleteComment(@RequestParam Long id){
        return ResponseEntity.ok(commentService.deleteComment(id));
    }
}
