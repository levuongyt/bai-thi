# bai02_memory_face
## Mô tả:
Ứng dụng Memory Face là một ứng dụng trò chơi ghi nhớ, cho phép người dùng lật ảnh và tỉm các ảnh giống nhau.

## Cách hoạt động

1. Ứng dụng hiển thị một lưới các vòng tròn xám, bên dưới mỗi vòng tròn là một hình ảnh nhân vật nổi tiếng.
2. Người chơi bấm vào vòng tròn để lật hình ảnh.
3. Tại một thời điểm, chỉ có thể lật tối đa 2 vòng tròn.
4. Nếu hai hình ảnh khớp nhau, chúng sẽ giữ nguyên trạng thái mở. Ngược lại, chúng sẽ được lật lại sau 1 giây.
5. Trò chơi kết thúc khi tất cả hình ảnh được mở.
   
## Cách giải quyết: 

1. Xử lí logic của ứng dụng trong controller:
 - Khởi tạo ứng dụng : Tạo các cặp ảnh của nhân vật nổi tiếng và trộn chúng ngẫu nhiên.
 - Chọn ảnh: Quản lý trạng thái của ảnh khi người chơi nhấp vào. Chỉ có thể lật 2 ảnh cùng 1 thời điểm. Nếu người chơi đã mở hai ảnh, kiểm tra xem chúng có giống nhau không(dựa vào đường dẫn ảnh). Nếu giống, giữ nguyên; nếu không, lật lại sau 1s.
 - Kiểm tra hoàn thành trò chơi khi tất cả các ảnh đã đuợc mở dựa vào trạng thái isOpen của các ảnh.
2. Tạo model(FaceModel) 
 - Chứa thông tin về trạng thái và đường dẫn của từng ảnh.
3. Tạo giao diện ứng dụng
 - Sử dụng Obx để lắng nghe và cập nhật trạng thái của từng ảnh.
 - Sử dụng GestureDetector để xử lý sự kiện nhấp chuột. Khi người chơi nhấp vào một ảnh, gọi hàm xử lí ở controller để xử lí và cập nhật trạng thái ảnh.
 - Hiển thị ảnh hoặc hình tròn xám tùy theo trạng thái đóng, mở của ảnh.

## Giao diện ứng dụng: 

Khi chạy ứng dụng

![image](https://github.com/user-attachments/assets/49228599-1f85-4edf-8e8e-01f424a31ba8)

Khi chọn ảnh

![image](https://github.com/user-attachments/assets/4d29af7c-8ae2-4036-a52b-7c317f7117c2)

Khi tất cả ảnh được lật

![image](https://github.com/user-attachments/assets/84eb253a-c334-438f-90d1-f1faf9578668)
