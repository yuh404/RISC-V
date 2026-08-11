`timescale 1ns / 1ps

module FIFO_test();

    // Khai báo các tín hiệu
    logic rclk, wclk, rinc, wfull, rempty;
    logic rrst_n, wrst_n, rst_clk_req, rst_clk_com;
    logic locked0, locked1;
    logic [7:0] rdata, wdata, wrdata_from_slave, rdata_to_master;
    logic [3:0] length;
    logic RD, rd_out, wr_out, winc;
    logic ready, rempty_input;
    logic  wfull_from_slave, rinc_from_masster, rempty_2;


    

    // 2. Kết nối với Wrapper (DUT)
    design_FIFO_test_wrapper uv (
        .RD_0           (RD),
        .READY_0        (ready),
        .clk_100MHz     (wclk),
        .clk_50MHz_1    (rclk),
        .locked_0       (locked0),
        .locked_1       (locked1),
        .rdata_0        (rdata),
        .rempty_0       (rempty),
        .reset_rtl_0    (rst_clk_req),
        .reset_rtl_0_0  (rst_clk_com),
        .length_0       (length),
        .rd_out_0       (rd_out),
        .wr_out_0       (wr_out),
        .rrst_n_0       (rrst_n),
        .wdata_0        (wdata),
        .wfull_0        (wfull),
        .winc_0         (winc),  // Nối với dây wire từ module STOP_WRINC
        .wrst_n_0       (wrst_n),
        .wdata_1        (wrdata_from_slave),
        .wfull_1        (wfull_from_slave),
        .rinc_0         (rinc_from_masster),
        .rempty_1       (rempty_2),
        .rdata_1        (rdata_to_master)
    );
    
    // 3. Tạo Xung nhịp (Clock Generation)
    initial wclk = 0;
    always #5 wclk = ~wclk;

    initial rclk = 0;
    always #10 rclk = ~rclk; 
    
    // 4. Quy trình Reset và Khởi tạo
    initial begin
        rst_clk_req = 1; 
        rst_clk_com = 1;
        wrst_n = 0;
        rrst_n = 0;
        winc = 0;
        
        wdata = 0;
        wrdata_from_slave = 0;
        rinc_from_masster = 0;
        RD=0;
        length = 4'h00;
        rempty_input = 1;
        
        $display("[%0t] Dang doi Clock Locked...", $time);
        wait(locked0 == 1'b1 && locked1 == 1'b1);
        
        #50;
        wrst_n = 1;
        rrst_n = 1;
        $display("[%0t] He thong san sang", $time);
    end

    // =========================================================
    // KỊCH BẢN 1: MASTER GHI -> SLAVE ĐỌC
    // =========================================================

    // Luồng giám sát và cấp Length (Gộp chung cho cả 2 chiều)
    initial begin
        length = 4'h00; 
        wait(wrst_n == 1'b1); 
        
        // --- Cấp Length cho chiều Master -> Slave ---
        @(posedge rclk);
        length = 4'h0F;
        wait(ready == 1'b1);
        @(posedge rclk);
        length = 4'h00; 
        
        // --- Đợi chiều Master -> Slave đọc xong ---
        wait(RD == 1'b1);
        wait(RD == 1'b0);
        #100; // Nghỉ ngơi một chút giữa 2 pha
        
        // --- Cấp Length cho chiều Slave -> Master ---
        @(posedge rclk);
        length = 4'h04;
        wait(ready == 1'b1);
        @(posedge rclk);
        length = 4'h00; 
    end

    // 5. Luồng MASTER GHI (vào FIFO 1)
    initial begin
        wait(wrst_n == 1'b1); 
        @(posedge wclk);
     
        $display("[%0t] [MASTER->SLAVE] Bat dau ghi 16 mau...", $time);
        for (int i = 0; i < 16; i++) begin
            @(posedge wclk);
            winc = 1;         
            wdata = 8'hA0 + i;  
        end
        @(posedge wclk);
        winc = 0; 
    end

    // 6. Luồng SLAVE ĐỌC (từ FIFO 1)
    initial begin
        RD = 0;
        wait(rrst_n == 1'b1); 
        
        #50;
        
        $display("[%0t] [MASTER->SLAVE] Slave bat dau doc...", $time);
        while (rempty == 1'b0) begin
            @(posedge rclk);
            RD = 1'b1;
        end
        @(posedge rclk);
        RD = 1'b0;
        $display("[%0t] [MASTER->SLAVE] Slave doc hoan tat!", $time);
    end

    // =========================================================
    // KỊCH BẢN 2: SLAVE GHI -> MASTER ĐỌC (Bắt đầu sau Kịch bản 1)
    // =========================================================

    // 8. Luồng SLAVE GHI (vào FIFO 2)
    initial begin
        // Chờ kịch bản 1 xong hẳn
        wait(RD == 1'b1);
        wait(RD == 1'b0);
        #150; // Chờ tín hiệu length của pha 2 được nạp xong
        
        $display("[%0t] [SLAVE->MASTER] Slave bat dau ghi 4 mau...", $time);
        for (int i = 0; i < 4; i++) begin
            @(posedge rclk);
            // LƯU Ý: Bạn cần cấp tín hiệu GHI cho FIFO 2 ở đây
            // Tôi giả sử bạn có dây điều khiển Ghi cho FIFO 2, ví dụ: winc_from_slave
            // Vì bạn chưa khai báo trong Wrapper, tôi chỉ gán Data:
            wrdata_from_slave = 8'hC0 + i;  
        end
    end
    
    // 9. Luồng MASTER ĐỌC (từ FIFO 2)
    initial begin
        rinc_from_masster = 0;
        
        // Chờ kịch bản 1 xong hẳn
        wait(RD == 1'b1);
        wait(RD == 1'b0);
        
        // Đợi đến khi FIFO 2 thực sự có dữ liệu
        wait(rempty_2 == 1'b0);
        $display("[%0t] [SLAVE->MASTER] Master bat dau doc...", $time);
        
        while (rempty_2 == 1'b0) begin
            @(posedge wclk); // Master đọc bằng xung wclk (nhanh hơn)
            rinc_from_masster = 1'b1;
        end
        
        @(posedge wclk);
        rinc_from_masster = 1'b0;
        $display("[%0t] [SLAVE->MASTER] Master doc hoan tat! TEST END.", $time);
        
        #200;
        $finish;
    end
    endmodule