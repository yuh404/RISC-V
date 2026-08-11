`timescale 1ns / 1ps


module tb_system_sv();
    // ==========================================
    // 1. KHAI BÁO TÍN HIỆU ĐIỀU KHIỂN & DATA
    // ==========================================
    logic clk_req, clk_com;
    logic rst_req_raw, rst_com_raw; // Reset cho Clock Wizard (Active Low theo thiết lập của bạn)
    logic rst_n_req, rst_n_com;     // Reset cho Logic (Active Low)
    
    logic [31:0] data_in;
    logic [3:0]  addr_in, len_in;
    logic        wr_sig, rd_sig;
    
    // Tín hiệu quan sát đầu ra (Data)
    wire [31:0] req_out, comp_out;

    // ==========================================
    // 2. KHAI BÁO CỜ TRẠNG THÁI (BỔ SUNG)
    // ==========================================
    logic locked_req, locked_com;
    logic locked_0, locked_1;
    logic rempty_0, rempty_1;
    logic wfull_0, wfull_1;

    // 1. Kết nối với Wrapper (DUT)
    design_3_wrapper DUT (
        // ==========================================
        // 1. CLOCK VÀ RESET
        // ==========================================
        .clk_req                 (clk_req),       // Đã sửa: Tên port gốc là clk_req chứ không phải clk_in1_0
        .clk_com                 (clk_com),       // Đã sửa: Tên port gốc là clk_com chứ không phải clk_in1_1
        .reset_clk_req           (rst_req_raw),   // Nối vào biến điều khiển
        .reset_clk_com           (rst_com_raw),   // Nối vào biến điều khiển
        .rst_n_req               (rst_n_req),
        .rst_n_com               (rst_n_com),

        // ==========================================
        // 2. TÍN HIỆU TRẠNG THÁI CLOCK WIZARD
        // ==========================================
        .locked_req              (locked_req),
        .locked_com              (locked_com),
        .locked_0_0              (locked_0),      // [BỔ SUNG]
        .locked_1_0              (locked_1),      // [BỔ SUNG]

        // ==========================================
        // 3. TÍN HIỆU ĐIỀU KHIỂN GIAO DỊCH
        // ==========================================
        .data_input_0            (data_in),
        .addr_input_0            (addr_in),
        .length_input_0          (len_in),
        .wr_input_signal_0       (wr_sig),
        .read_input_signal_0     (rd_sig),

        // ==========================================
        // 4. TRẠNG THÁI CÁC FIFO (FULL / EMPTY)
        // ==========================================
        .rempty_0_0              (rempty_0),      // [BỔ SUNG] Báo trống FIFO 1
        .rempty_1_0              (rempty_1),      // [BỔ SUNG] Báo trống FIFO 2
        .wfull_0_0               (wfull_0),       // [BỔ SUNG] Báo đầy FIFO 1
        .wfull_1_0               (wfull_1),       // [BỔ SUNG] Báo đầy FIFO 2

        // ==========================================
        // 5. DỮ LIỆU ĐẦU RA 
        // ==========================================
        .Request_data_output_0   (req_out),
        .Completer_data_output_0 (comp_out)
    );

    

    // 3. Quy trình Reset hệ thống
    // ==========================================
    // 2. TẠO CLOCK (Clock Generation)
    // ==========================================
    initial begin
        clk_req = 0;
        clk_com = 0;
    end
    
    always #5  clk_req = ~clk_req; // 100MHz (Chu kỳ 10ns)
    always #10 clk_com = ~clk_com; // 50MHz  (Chu kỳ 20ns)

    // ==========================================
    // 3. QUY TRÌNH RESET HỆ THỐNG (System Reset)
    // ==========================================
    initial begin
        // --- BƯỚC 1: KHỞI TẠO VÀ ÉP RESET TẤT CẢ ---
        // Ép reset Clock Wizard (Active High)
        rst_req_raw = 1'b1; 
        rst_com_raw = 1'b1;
        
        // Ép reset Logic hệ thống (Active Low)
        rst_n_req   = 1'b0;   
        rst_n_com   = 1'b0;
        
        // Đặt các tín hiệu điều khiển về 0 an toàn
        wr_sig      = 0;      
        rd_sig      = 0;
        data_in     = 0;     
        addr_in     = 0; 
        len_in      = 0;

        // Giữ trạng thái đóng băng này trong 20ns
        #200;
        
        // --- BƯỚC 2: KHỞI ĐỘNG CLOCK WIZARD ---
        // Nhả reset cho Clock Wizard để nó bắt đầu tạo xung
//        rst_req_raw = 1'b0; 
//        rst_com_raw = 1'b0;
        
        $display("[%0t] Dang doi Clock Wizard Locked...", $time);

        // --- BƯỚC 3: ĐỢI XUNG NHỊP ỔN ĐỊNH ---
        // Chờ đến khi tất cả các Clock Wizard đều báo đã khóa (Locked = 1)
        wait(locked_req == 1'b1 && locked_com == 1'b1 && locked_0 == 1'b1 && locked_1 == 1'b1);
        
        // Ngâm thêm 50ns để đảm bảo xung clock hoàn toàn sạch và ổn định
        #50;
        
        // --- BƯỚC 4: NHẢ RESET CHO LOGIC HỆ THỐNG ---
        // Lúc này có clock rồi mới nhả reset cho các Flip-flop bên trong hoạt động
        rst_n_req   = 1'b1;   
        rst_n_com   = 1'b1;
        
        $display("[%0t] He thong da san sang hoat dong!", $time);
   

        @(posedge clk_req);
        $display("[%0t] Bat dau ghi du lieu...", $time);
        wr_sig  = 1;
        data_in = 32'hABCD_2345;
        len_in  = 3; // Nghĩa là muốn truyền 4 byte (từ 0 đến 3)
        addr_in = 4'h0;
        
        // Kéo dài tín hiệu wr_sig trong vài chu kỳ (tùy thuộc vào thiết kế hand-shake của bạn)
        repeat(3) @(posedge clk_req);
        wr_sig = 0;

        // Đợi dữ liệu chảy qua FIFO và được Completer ghi vào bộ nhớ
        $display("[%0t] Cho du lieu dong bo...", $time);
        #200;

        // --- 6.2. Test kịch bản ĐỌC dữ liệu ---
        @(posedge clk_req);
        $display("[%0t] Bat dau DOC du lieu...", $time);
        rd_sig  = 1;
        len_in  = 3; // Yêu cầu đọc lại đúng 4 byte vừa ghi
        addr_in = 4'h0; // Đọc từ địa chỉ 0
        
        // Kéo dài tín hiệu rd_sig trong vài chu kỳ để chốt lệnh
        repeat(2) @(posedge clk_req);
        rd_sig = 0;

        // Đợi một khoảng thời gian để dữ liệu từ Completer chảy ngược về Requester
        #400; 
        
        $display("[%0t] Hoan tat giao dich! Kiem tra req_out tren Waveform.", $time);
        $finish;
     end
endmodule