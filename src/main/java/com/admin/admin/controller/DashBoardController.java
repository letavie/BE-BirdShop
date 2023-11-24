package com.admin.admin.controller;

import com.admin.admin.model.*;
import com.admin.admin.repository.OrderDetailRepository;
import com.admin.admin.repository.OrderItemRepository;
import com.admin.admin.repository.ProductRepository;
import com.admin.admin.service.impl.DashboardServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.TextStyle;
import java.time.temporal.TemporalAdjusters;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

@RestController
@RequestMapping("/api/v1/dashboard")
@CrossOrigin(origins = "http://localhost:3000")
@RequiredArgsConstructor
public class DashBoardController {
    private final DashboardServiceImpl dashboardService;
    @GetMapping("/productsold")
    public int getProductSold(){
        return dashboardService.getProductSold();
    }

    @GetMapping("/budget")
    public float getTotalBudget(){
        return dashboardService.getTotalBudget();
    }

    @GetMapping("/getChartCategory")
    public ResponseEntity<?> getChartCategory(){
        return ResponseEntity.ok(dashboardService.getChartCategory());
    }

    @GetMapping("/week")
    public ResponseEntity<?> getSalesWeek(@RequestParam int year,
                                          @RequestParam int month){
        return ResponseEntity.ok(dashboardService.getSalesWeek(year,month));
    }
}
