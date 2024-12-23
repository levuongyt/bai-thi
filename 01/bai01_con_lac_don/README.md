# bai01_con_lac_don

## Mô tả:
Ứng dụng mô phỏng hoạt động của con lắc đơn. Con lắc sẽ dao động và hiển thị các chuyển động lên màn hình.

## Cách giải quyết:

1. Xử lý logic vật lý trong PendulumController
 - Tạo một controller để quản lý các thông số động lực học (góc, vận tốc góc, gia tốc góc).
 - Áp dụng phương trình dao động của con lắc để tính toán vị trí, chuyển động của con lắc.
 - Tạo phương thức để cập nhật các giá trị của con lắc theo thời gian.
 - Tạo Timer để gọi hàm cập nhật góc và vị trí con lắc mỗi 16 miliseconds.
2. Vẽ con lắc bằng CustomPainter
 - Sử dụng Canvas và Paint để vẽ: Dây con lắc, quả lắc (hình tròn màu đỏ), cung tròn để minh họa biên độ dao động, đường thẳng ở trên để tạo trục.
 - Sử dụng các phương thức vẽ của Flutter như drawLine, drawCircle và drawArc.
3. Kết nối với UI và điều khiển trong View
 - Sử dụng Obx để lắng nghe và cập nhật trạng thái góc của con lắc từ PendulumController.
 - Hiển thị con lắc bằng CustomPaint.

Prompt AI:
 - Cách tính vị trí chuyển động của con lắc đơn.
 - Cách sử dụng CustomPainter để vẽ dây và quả lắc trên màn hình.

## Giao diện ứng dụng: 

![image](https://github.com/user-attachments/assets/2f698d8d-1ed6-4ef3-a161-48ce2dadcd15)
