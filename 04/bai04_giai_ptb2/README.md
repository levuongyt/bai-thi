# bai04_giai_ptb2

## Yêu cầu hệ thống
- Flutter SDK
- Android NDK phiên bản : '28.0.12674087'

## Cài đặt NDK 
1. Mở Android Studio. 
2. đi tới File -> Settings . 
3. Điều hướng đến Languages & Frameworks ->  Android SDK -> SDK Tools.
4. Chọn `NDK (Side by side)` và cài đặt phiên bản `28.0.12674087`. Và chọn `CMake` để cài đặt `CMake` (nếu chưa cài đặt).
5. Cập nhật tệp `local.properties` (project -> android -> local.properties) trong dự án của bạn. Đảm bảo rằng tệp `local.properties` của bạn trỏ đúng đến phiên bản NDK:  ndk.dir=C:\\Users\\levuo\\AppData\\Local\\Android\\Sdk\\ndk\\28.0.12674087 (Thay đường dẫn đến NDK của bạn). Cú pháp: (ndk.dir = đường dẫn đến ndk).

LINK YOUTUBE DEMO KẾT QUẢ BÀI LÀM: https://youtu.be/dhnu1pGYgO4


## Mô tả:
Ứng dụng giải phương trình bậc hai cho phép người dùng nhập các hệ số của phương trình bậc hai ax^2 + bx + c = 0. Sau đó, ứng dụng sẽ sử dụng một hàm viết bằng ngôn ngữ C để giải phương trình và hiển thị kết quả trên màn hình Flutter.

## Cách giải quyết:

1. Viết hàm giải phương trình bậc hai bằng ngôn ngữ C
 - Tạo file solve_quadratic.c để viết hàm tính nghiệm của phương trình bậc 2 và trả về một struct Solution chứa các nghiệm và số lượng nghiệm bằng ngôn ngữ C.
2. Xử lý logic và kết nối bằng file controller
 - Khai báo struct Solution: Tương ứng với struct trong C.
 - Kết nối Flutter với thư viện C bằng Dart FFI.
 - Gọi hàm giải phương trình ở file C để xử lí và xác định số nghiệm trả về để cập nhật kết quả.
3. Tạo giao diện ứng dụng
 - Sử dụng Form và TextFormField để nhập liệu: Người dùng nhập các hệ số a, b và c.
 - Sử dụng Obx để lắng nghe và cập nhật trạng thái kết quả: Hiển thị kết quả giải phương trình.

Prompt AI
 - Tham khảo cách tích hợp thư viện C/C++ qua link: https://viblo.asia/p/tich-hop-thu-vien-cc-vao-mot-du-an-flutter-nhu-the-nao-V3m5WmE7ZO7
 - Tham khảo link:  https://www.youtube.com/watch?v=5atLUFlfmXk
 - Làm thế nào để sử dụng Dart FFI để gọi một hàm C từ Flutter và ánh xạ kết quả trả về?


## Giao diện ứng dụng:

![image](https://github.com/user-attachments/assets/7c9c4d4d-92e8-44ca-8150-8a8b43873f14)

Phương trình có hai nghiệm phân biệt

![image](https://github.com/user-attachments/assets/8047b6f2-ea31-408f-917b-b62a2566f01d)

Phương trình có nghiệm kép

![image](https://github.com/user-attachments/assets/4f32a871-910a-4ccd-9f61-b8f57e707580)

Phương trình vô nghiệm

![image](https://github.com/user-attachments/assets/b9b9671b-b627-4d68-ae7c-7c06987c83f7)
