package com.admin.admin.controller;


import com.admin.admin.model.Product;
import com.admin.admin.repository.ProductCusRepo;
import com.admin.admin.repository.ProductRepository;
import com.admin.admin.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/product")
@CrossOrigin(origins = "http://localhost:3000")
@RequiredArgsConstructor
public class ProductController {
    private final ProductRepository productRepository;
    private final ProductCusRepo productCusRepo;
    private final ProductService productService;
    @GetMapping
    public ResponseEntity<?> getAllProduct(){
        List<Product> products = productRepository.findAll();
        return ResponseEntity.ok(products);
    }
    @GetMapping("/count")
    public ResponseEntity<?> countProduct(){

        return ResponseEntity.ok(productRepository.count());
    }
    @PostMapping("/delete")
    public ResponseEntity<?> deleteProduct(@RequestParam Long id){
        try {
            productRepository.deleteById(id);
            return ResponseEntity.ok("200");
        }catch (Exception e){
            return ResponseEntity.ok(e.getMessage());

        }

    }
    @PostMapping("/add")
    public ResponseEntity<?> addProduct(@RequestBody Product product){
        try {
            product.setIs_post(true);
            product.setIs_customer(false);
            productRepository.save(product);
            return ResponseEntity.ok("Add sucess");
        }catch (Exception e){
            return ResponseEntity.ok(e.getMessage());
        }

    }
    @GetMapping("/seacrhByName")
    public ResponseEntity<?> getProductByName(@RequestParam String q){
        List<Product> products = productRepository.findTop5ByNameContainingIgnoreCase(q);
        return ResponseEntity.ok(products);
    }
    @GetMapping("/getAllOrderByPriceAsc")
    public ResponseEntity<?> getAllOrderByPrice(){
        List<Product> products = productRepository.findByOrderByPriceAsc();
        return ResponseEntity.ok(products);
    }
    @GetMapping("/getAllOrderByPriceDesc")
    public ResponseEntity<?> getAllOrderByPriceDesc(){
        List<Product> products = productRepository.findByOrderByPriceDesc();
        return ResponseEntity.ok(products);
    }
    @GetMapping("/getAllOrderByNameAsc")
    public ResponseEntity<?> getAllOrderByNameAsc(){
        List<Product> products = productCusRepo.findByOrderByNameAsc();
        return ResponseEntity.ok(products);
    }
    @GetMapping("/getAllOrderByNameDesc")
    public ResponseEntity<?> getAllOrderByNameDesc(){
        List<Product> products = productCusRepo.findByOrderByNameDesc();
        return ResponseEntity.ok(products);
    }
    @PostMapping("/changePost")
    public boolean changePost(Long id){
        return productService.setIsPost(id);
    }

    @PutMapping("/update")
    public ResponseEntity<?> updateProduct(@RequestParam Long id,
                                           @RequestBody Product product){
        return ResponseEntity.ok(productService.updateProduct(id,product));
    }
}
